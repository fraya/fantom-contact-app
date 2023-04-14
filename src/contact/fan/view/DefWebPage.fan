using web

const abstract class DefWebPage : HtmlPage
{
  const Int statusCode := 200
  const Str:Obj params := [:]

  new make(Int statusCode, Str:Obj params := [:])
  {
    this.statusCode = statusCode
    this.params = params
  }

  override Void writeOn(WebRes res)
  {
    res.statusCode = this.statusCode
    res.headers["Content-type"] = "text/html; charset=utf-8"
    out := res.out
    out.html
    out.header
    out.title.w(params.get("title", "Contacts")).titleEnd
    out.script(Str
    <|src="https://unpkg.com/htmx.org@1.7.0"
      integrity="sha384-EzBXYPt0/T6gxNp0nuPtLkmRpmDBbjg6WmCUZRLXBBwYYmwAUxzlSGej0ARHX0Bo"
      crossorigin="anonymous"
    |>)
    out.scriptEnd
    out.headerEnd
    out.body
    writeBody(res, out)
    out.bodyEnd
    out.htmlEnd
  }

  abstract Void writeBody(WebRes res, WebOutStream out)
}
