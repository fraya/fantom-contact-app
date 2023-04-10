using web
using webmod
using mustache

const class DeleteContactMod : WebMod
{
  const static Log log := DeleteContactMod#.pod.log
  const ContactRepo repo

  new make(|This| f) { f(this) }

  Int? contact_id(WebReq req)
  {
    req.modRel.path.first?.toInt(10, false)
  }

  override Void onPost()
  {
    id := contact_id(req)
    if (id == null) return res.sendErr(404)

    repo.delete(ContactId(id))
    res.redirect(`/contacts`)
  }
}
