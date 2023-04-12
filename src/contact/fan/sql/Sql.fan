using sql

class Sql : ParamMedia
{
  const static Log log := Sql#.pod.log

  private Str sql

  new make(Str sql, Str:Obj data := [:])
  : super.make(data)
  {
    this.sql = sql
  }

  new fromUri(Uri uri)
  : this.make(uri.toFile.readAllStr)
  {}

  Statement prepare(SqlConn connection)
  {
     if (log.isDebug) log.debug("${sql}Params:${data}")
     return connection.sql(sql).prepare
  }

  Row[] query(SqlConn connection)
  {
    prepare(connection).query(data)
  }

  Void queryEach(SqlConn connection, |Row| f)
  {
    prepare(connection).queryEach(data, f)
  }

  Obj execute(SqlConn connection)
  {
    prepare(connection).execute(data)
  }

  Int[] insert(SqlConn connection)
  {
    (Int[]) execute(connection)
  }

  Int update(SqlConn connection)
  {
    (Int) execute(connection)
  }

  override Media printOn(Media media)
  {
    super.printOn(media.print("sql", sql))
  }
}
