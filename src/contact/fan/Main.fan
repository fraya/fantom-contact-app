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
      it.database = Sqlite.file(sqlite)
      it.sqls     = DefSqls(DefFiles(`fan://contact/res/sql/sqlite/`))
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
                "index" : ContactsMod(),
                "new"   : NewContactMod(),
                "view"  : UserContactMod(),
                "edit"  : EditContactMod(),
                "delete": DeleteContactMod(),
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
    }

    return runServices([
      wisp,
      FileMustaches(DefFiles(`fan://contact/web/`)),
      repo,
    ])
  }
}
