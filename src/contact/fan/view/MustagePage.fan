using mustache
using web

class MustachePage : HtmlPage
{
  Uri mustache
  Str:Obj data := [:]

  new make(Uri mustache)
  {
    this.mustache = mustache
  }

  override This print(Str name, Obj value)
  {
    data[name] = value
    return this
  }

  override Media printOn(Media media)
  {
    data.each |val,name| { media = media.print(name, val) }
    return media
  }

  override Void writeOn(WebRes res)
  {
    mustaches := (Mustaches) Service.find(Mustaches#)
    template  := mustaches.template(mustache)
    res.headers["Content-Type"] = "text/html; charset=utf-8"
    res.out.print(template.render(data))
  }
}
