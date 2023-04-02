using web
using webmod
using mustache

const class NewContactMod : WebMod
{
  const ContactBook contacts
  const Mustache template

  new make(|This| f) { f(this) }

  override Void onGet()
  {
    media := MustacheMedia(template)
    res.headers["Content-Type"] = "text/html; charset=utf-8"
    res.out.print(media)
  }

  HtmlForm contactForm(Str:Str values)
  {
    HtmlForm
    {
      it.values = values
      HtmlField("firstname"),
      HtmlField("lastname"),
      HtmlField("email"),
      HtmlField("phone")
    }
  }

  override Void onPost()
  {
    form    := contactForm(req.form)
    contact := ContactForm(req.form)
    errors := form.validate

    if (errors != null)
    {
      data := ParameterMedia()
        .writeObj(contact)
        .content.addAll(errors)

      res.headers["Content-Type"] = "text/html; charset=utf-8"
      res.out.print(template.render(data))
    }
    else
    {
      id := contacts.add(contact)
      res.redirect(`/contacts`)
    }
  }
}
