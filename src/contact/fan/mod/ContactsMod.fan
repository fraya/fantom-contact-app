using web
using webmod
using mustache

const class ContactsMod : WebMod
{
  const static Log log := ContactsMod#.pod.log

  const ContactRepo repo
  const Mustache template

  new make(|This| f) { f(this) }

  override Void onGet()
  {
    query    := req.modRel.query.get("q", "")
    contacts := repo.all
    media    := MustacheMedia(template).add(contacts)
    res.headers["Content-Type"] = "text/html; charset=utf-8"
    res.out.print(media)
  }
}
