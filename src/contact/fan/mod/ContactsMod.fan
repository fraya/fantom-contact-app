using web
using webmod

const class ContactsMod : WebMod, RepoClient
{
  override Void onGet()
  {
    MustachePage(`contacts.mustache`)
      .print(repo.all)
      .writeOn(res)
  }

  override Void onPost()
  {
    query := req.form.get("q", "").trim
    recs  := (query.size > 0) ?
      repo.findContacts("%" + query + "%") : repo.all

    MustachePage(`contacts-detail.mustache`)
      .print(recs)
      .writeOn(res)
  }
}
