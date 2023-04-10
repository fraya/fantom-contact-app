using web
using webmod
using mustache

const class UserContactMod : WebMod
{
  const ContactRepo repo
  const Mustache template

  new make(|This| f) { f(this) }

  override Void onGet()
  {
    id := req.modRel.path.first?.toInt(10, false)
    if (id == null) return res.sendErr(404)

    contact := repo.findContactById(ContactId(id))
    if (contact == null) return res.sendErr(404)

    media := contact.printOn(MustacheMedia(template))
    res.headers["Content-Type"] = "text/html; charset=utf-8"
    res.out.print(media)
  }
}

