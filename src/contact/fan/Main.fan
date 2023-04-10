using util
using web
using webmod
using wisp
using mustache

class Main : AbstractMain
{
  @Opt { help = "http port"; aliases = ["p"] }
  Int port := 8080

  @Opt { help = "Show debug information"; aliases = ["d"] }
  Bool debug

  @Arg { help = "File store" }
  File? sqlite

  once ContactRepo repo()
  {
    ContactDbRepo
    {
      it.database = Sqlite(sqlite)
      it.sqls     = DefSqls(DefFiles(`fan://contact/res/sql/sqlite/`))
    }
  }

  once Mustaches mustaches()
  {
    FileMustaches(
      DefFiles(`fan://contact/web/`))
  }

  once WebMod contactsMod()
  {
    ContactsMod
    {
      it.repo     = this.repo
      it.template = this.mustaches[`contacts.mustache`]
    }
  }

  once WebMod newContactMod()
  {
    NewContactMod
    {
      it.repo     = this.repo
      it.template = this.mustaches[`new.mustache`]
    }
  }

  once WebMod userContactMod()
  {
    UserContactMod
    {
      it.repo     = this.repo
      it.template = this.mustaches[`show.mustache`]
    }
  }

  once WebMod editContactMod()
  {
    EditContactMod
    {
      it.repo     = this.repo
      it.template = this.mustaches[`edit.mustache`]
    }
  }

  once WebMod deleteContactMod()
  {
    DeleteContactMod
    {
      it.repo = this.repo
    }
  }

  override Int run()
  {
    if (debug)
      log.level = LogLevel.debug

    logDir := homeDir + `logs/`
    if (!logDir.exists) logDir.create

    if (log.isDebug) log.debug("Logging directory: ${logDir}")

    sysLogger := FileLogger { dir = logDir; filename = "sys.log" }
    Log.addHandler |rec| { sysLogger.writeLogRec(rec) }

    pipeline := PipelineMod
    {
      steps = [
        RouteMod
        {
          routes = [
            "index"    : IndexMod(),
            "contacts" : RouteMod
            {
              routes = [
                "index" : contactsMod,
                "new"   : newContactMod,
                "view"  : userContactMod,
                "edit"  : editContactMod,
                "delete": deleteContactMod,
              ]
            },
          ]
        }
      ]

      after = [
        LogMod { dir = logDir; filename = "web.log" }
      ]
    }

    wisp := WispService
    {
      it.httpPort = this.port
      it.root = pipeline
    }

    if (log.isDebug)
    {
      log.debug("Database: ${repo}")
      log.debug("Templates: ${mustaches}")
    }

    return runServices([
      wisp,
      repo,
    ])
  }
}
