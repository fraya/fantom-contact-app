using sql

const class Sql : Media
{
  const static Log log := Sql#.pod.log

  const Str sql
  const Str:Obj params

  new make(Str sql, Str:Obj params := [:])
  {
    this.sql = sql
    this.params = params
  }

  new fromUri(Uri uri)
  : this.make(uri.toFile.readAllStr)
  {}

  override This printAttr(Str name, Obj val)
  {
    Sql(sql, params.dup[name] = val)
  }

  Statement prepare(SqlConn connection)
  {
     if (log.isDebug) log.debug("${sql} ${params}")
     return connection.sql(sql).prepare
  }

  Row[] query(SqlConn connection)
  {
    prepare(connection).query(params)
  }

  Void queryEach(SqlConn connection, |Row| f)
  {
    prepare(connection).queryEach(params, f)
  }

  Obj execute(SqlConn connection)
  {
    prepare(connection).execute(params)
  }

  Int[] insert(SqlConn connection)
  {
    (Int[]) execute(connection)
  }

  Int update(SqlConn connection)
  {
    (Int) execute(connection)
  }

  override Str toStr()
  {
    "${sql} ${params}"
  }
}
