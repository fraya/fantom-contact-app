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

  once ContactBook contacts()
  {
    ContactBookDatabase
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
      it.contacts = this.contacts
      it.template = this.mustaches[`contacts.mustache`]
    }
  }

  once WebMod newContactMod()
  {
    NewContactMod
    {
      it.contacts = this.contacts
      it.template = this.mustaches[`new.mustache`]
    }
  }

  once WebMod userContactMod()
  {
    UserContactMod
    {
      it.contacts = this.contacts
      it.template = this.mustaches[`show.mustache`]
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
                "view"  : userContactMod
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
      log.debug("Database: ${contacts}")
      log.debug("Templates: ${mustaches}")
    }

    return runServices([
      wisp,
      contacts,
    ])
  }
}
