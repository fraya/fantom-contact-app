using web

abstract class DefWebPage : HtmlPage
{
  Str title
  Int statusCode := 200
  Str:Obj params := [:]

  new make(|This| f) { f(this) }

  override Void writeOn(WebRes res)
  {
    res.statusCode = this.statusCode
    res.headers["Content-type"] = "text/html; charset=utf-8"
    out := res.out
    out.html
    out.header
    out.title.w(this.title).titleEnd
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

  override This print(Str name, Obj val)
  {
    params[name] = val
    return this
  }

  override Media printOn(Media media)
  {
    params.each |val, name| { media = media.print(name, val) }
    return media
  }

  abstract Void writeBody(WebRes res, WebOutStream out)
}
