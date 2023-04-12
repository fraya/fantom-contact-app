using web
using webmod
using mustache

const class ContactsMod : WebMod, RepoClient
{
  const static Log log := ContactsMod#.pod.log

  override Void onGet()
  {
    MustachePage(`contacts.mustache`)
      .add(repo.all)
      .writeOn(res)
  }

  override Void onPost()
  {
    query := req.form.get("q", "").trim
    contacts := (query.size > 0) ?
      repo.findContacts("%" + query + "%") : repo.all

    MustachePage(`contacts-detail.mustache`)
      .add(contacts)
      .writeOn(res)
  }
}
