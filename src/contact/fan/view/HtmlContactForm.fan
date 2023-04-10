class HtmlContactForm
{
  Str:Str form

  HtmlFormField firstname := HtmlFormField("firstname") { maxSize = 50 }
  HtmlFormField lastname  := HtmlFormField("lastname")
  HtmlFormField phone     := HtmlFormField("phone") { minSize = 9; maxSize = 9 }
  HtmlFormField email     := HtmlFormField("email") { minSize = 5 }

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
