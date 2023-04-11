const class HtmlContactForm
{
  const Str:Str form

  const HtmlFormField firstname := HtmlFormField("firstname") { maxSize = 50 }
  const HtmlFormField lastname  := HtmlFormField("lastname")
  const HtmlFormField phone     := HtmlFormField("phone") { minSize = 9; maxSize = 9 }
  const HtmlFormField email     := HtmlFormField("email") { minSize = 5 }

  new make(Str:Str form) { this.form = form }

  ParamMedia validate()
  {
    ParamMedia()
    {
      firstname.validate(form),
      lastname.validate(form),
      phone.validate(form),
      email.validate(form)
    }
  }
}
