using mustache
using web

const class MustachePage : HtmlPage
{
  const Uri mustache
  const Str:Obj data

  new make(Uri mustache, Str:Obj data := [:])
  {
    this.mustache = mustache
    this.data = data
  }

  override This printAttr(Str name, Obj val)
  {
    MustachePage(mustache, data.dup[name] = val)
  }

  override Void writeOn(WebRes res)
  {
    mustaches := (Mustaches) Service.find(Mustaches#)
    template  := mustaches.template(mustache)
    res.headers["Content-Type"] = "text/html; charset=utf-8"
    res.out.print(template.render(data))
  }
}
