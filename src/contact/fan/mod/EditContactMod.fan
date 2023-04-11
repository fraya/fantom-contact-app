using web
using webmod
using mustache

const class EditContactMod : WebMod
{
  const static Log log := EditContactMod#.pod.log

  const ContactRepo repo
  const Mustache template

  new make(|This| f) { f(this) }

  Int? contact_id(WebReq req)
  {
    req.modRel.path.first?.toInt(10, false)
  }

  override Void onGet()
  {
    id := contact_id(req)
    if (id == null) return res.sendErr(404)

    contact := repo.findContactById(ContactId(id))
    if (contact == null) return res.sendErr(404)

    MustachePage(template) { contact, }.writeOn(res)
  }

  override Void onPost()
  {
    id := contact_id(req)
    if (id == null) return res.sendErr(404)

    // Add id to form
    form    := req.form.dup["id"] = id.toStr
    errors  := HtmlContactForm(form).validate
    contact := DefContact.fromForm(form)

    if (errors.isEmpty)
    {
      repo.update(contact)
      res.redirect(`/contacts`)
    }
    else
    {
      MustachePage(template) { contact, errors }.writeOn(res)
    }
  }
}
