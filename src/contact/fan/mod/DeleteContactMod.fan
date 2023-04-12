using web
using webmod
using mustache

const class DeleteContactMod : WebMod, RepoClient
{
  const static Log log := DeleteContactMod#.pod.log

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
