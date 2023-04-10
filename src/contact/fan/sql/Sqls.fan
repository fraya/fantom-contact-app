using concurrent

const mixin Sqls : Service
{
  abstract Sql sql(Uri sql)
}

const class DefSqls : Sqls
{
  const Files files

  new make(Files files) { this.files = files }

  override Sql sql(Uri sql)
  {
    Sql(files.file(sql).readAllStr)
  }
}
