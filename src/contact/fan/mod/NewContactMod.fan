using web
using webmod
using mustache

const class NewContactMod : WebMod
{
  const static Log log := NewContactMod#.pod.log
  const ContactRepo repo
  const Mustache template

  new make(|This| f) { f(this) }

  override Void onGet()
  {
    MustachePage(template).writeOn(res)
  }

  Int? contact_id(WebReq req)
  {
    req.modRel.path.first?.toInt(10, false)
  }

  override Void onPost()
  {
    errors  := HtmlContactForm(req.form).validate
    contact := DefContact.fromForm(req.form)

    if (errors.isEmpty)
    {
      id := repo.add(contact)
      res.redirect(`/contacts`)
    }
    else
    {
      MustachePage(template) { contact, errors }.writeOn(res)
    }
  }
}
