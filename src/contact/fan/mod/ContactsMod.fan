using web
using webmod
using mustache

const class ContactsMod : WebMod
{
  const ContactBook contacts
  const Mustache template

  new make(|This| f) { f(this) }

  override Void onGet()
  {
    query := req.modRel.query.get("q", "")
    media := MustacheMedia(template)
    media  = contacts.print(media)
    res.headers["Content-Type"] = "text/html; charset=utf-8"
    res.out.print(media)
  }
}
