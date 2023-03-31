using web
using webmod
using mustache

const class UserContactMod : WebMod
{
  const ContactBook contacts
  const Mustache template

  new make(|This| f) { f(this) }

  override Void onGet()
  {
    userId := req.modRel.path.first?.toInt(10, false)

    if (userId == null)
        res.sendErr(404)
    else
        onContact(userId)
  }

  Void onContact(Int id)
  {
    contact := contacts.byId(id)

    if (contact != null)
    {
      media := MustacheMedia(template).writeObj(contact)
      res.headers["Content-Type"] = "text/html; charset=utf-8"
      res.out.print(media)
    }
    else
      res.sendErr(404)
  }
}
