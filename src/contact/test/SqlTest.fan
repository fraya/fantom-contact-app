using sql

class SqlTest : Test
{
  SqlConn? conn
  Sql schema := Sql("create table test (id int, name text)")
  Sql insert := Sql("insert into test (id, name) values (@id, @name)")
  Sql count  := Sql("select count(*) as n from test")

  override Void setup()
  {
    conn = Sqlite.memory.connection
    schema.execute(conn)
  }

  override Void teardown()
  {
    conn.close
  }

  Void testParams()
  {
    n := 5
    (1..n).each |i|
    {
      q := insert.printAttr("id", i).printAttr("name", i.toStr)
      verify(q.params.containsKey("id"))
      verify(q.params.containsKey("name"))
      verifyEq(q.params["id"], i)
      verifyEq(q.params["name"], i.toStr)
      q.insert(conn)
    }
    verifyEq(count.query(conn).first->n, n)
  }
}
