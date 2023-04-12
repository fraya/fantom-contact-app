using web
using webmod
using mustache

const class ContactsMod : WebMod
{
  const static Log log := ContactsMod#.pod.log

  const ContactRepo repo

  new make(|This| f) { f(this) }

  override Void onGet()
  {
    mustaches := FileMustaches(DefFiles(`fan://contact/web/`))
    template  := mustaches[`contacts.mustache`]
    MustachePage(template) { repo.all, }.writeOn(res)
  }

  override Void onPost()
  {
    query := req.form.get("q", "").trim
    contacts := (query.size > 0) ?
      repo.findContacts("%" + query + "%") : repo.all

    mustaches := FileMustaches(DefFiles(`fan://contact/web/`))
    template  := mustaches[`contacts-detail.mustache`]
    MustachePage(template) { contacts, }.writeOn(res)
  }
}
