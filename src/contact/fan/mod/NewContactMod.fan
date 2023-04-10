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
    media := MustacheMedia(template)
    res.headers["Content-Type"] = "text/html; charset=utf-8"
    res.out.print(media)
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
      media := MustacheMedia(template) { contact, errors }
      res.headers["Content-Type"] = "text/html; charset=utf-8"
      res.out.print(media)
    }
  }
}
