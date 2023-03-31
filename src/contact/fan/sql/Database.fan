using sql

**
**
**
const mixin Database
{
  abstract SqlConn connection()
}

const class DefDatabase : Database
{
  const Str jdbc
  const Str? usr
  const Str? pass

  new make(Str jdbc, Str? usr := null, Str? pass := null)
  {
    this.jdbc = jdbc
    this.usr  = usr
    this.pass = pass
  }

  override SqlConn connection()
  {
    SqlConn.open(jdbc, usr, pass)
  }
}

const class Sqlite : DefDatabase
{
  new make(File file)
  : super.make("jdbc:sqlite:${file}")
  {}
}
