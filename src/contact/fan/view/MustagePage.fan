using mustache
using web

class MustachePage : HtmlPage
{
  Mustache template
  Str:Obj data := [:]

  new make(Mustache template)
  {
    this.template = template
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
    res.headers["Content-Type"] = "text/html; charset=utf-8"
    res.out.print(template.render(data))
  }
}
