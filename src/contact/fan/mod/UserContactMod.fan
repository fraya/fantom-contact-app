using web
using webmod
using mustache

const class UserContactMod : WebMod, RepoClient
{
  override Void onGet()
  {
    id := req.modRel.path.first?.toInt(10, false)
    if (id == null) return res.sendErr(404)

    contact := repo.findContactById(ContactId(id))
    if (contact == null) return res.sendErr(404)

    MustachePage(`show.mustache`)
      .add(contact)
      .writeOn(res)
  }
}

