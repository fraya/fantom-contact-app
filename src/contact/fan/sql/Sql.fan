using sql

const mixin Sql : Media
{
  abstract Str sql()
  abstract protected [Str:Obj] params()

  protected Statement prepare(SqlConn connection)
  {
    connection.sql(sql).prepare
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
}

const class StrSql : Sql
{
  override const Str sql
  override protected const [Str:Obj] params

  new make(Str sql, [Str:Obj] params := [:])
  {
    this.sql    = sql
    this.params = params
  }

  override This write(Str name, Obj val)
  {
    StrSql(sql, params.dup[name] = val)
  }
}

const class UriSql : Sql
{
  const Uri uri
  override protected const [Str:Obj] params

  override Str sql()
  {
    uri.toFile.readAllStr
  }

  new make(Uri uri, [Str:Obj] params := [:])
  {
    this.uri    = uri
    this.params = params
  }

  override This write(Str name, Obj val)
  {
    UriSql(uri, params.dup[name] = val)
  }
}
