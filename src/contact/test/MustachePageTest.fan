class MustachePageTest : Test
{
  MustachePage? page

  override Void setup()
  {
    page = MustachePage(`fake.mustache`)
  }

  override Void teardown()
  {
    page = null
  }

  Void testParams()
  {
    p2 := page.printAttr("id", 1)
    verify(p2.data.containsKey("id"))
    verifyEq(p2.data["id"], 1)
  }
}
