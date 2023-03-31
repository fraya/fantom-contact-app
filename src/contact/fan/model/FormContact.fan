const class ContactForm : Contact
{
  const [Str:Str]? form

  new make([Str:Str]? form)
  {
    this.form = form
  }

  override Int id()
  {
    0
  }

  override Firstname firstname()
  {
    Firstname(form["firstname"])
  }

  override Lastname lastname()
  {
    Lastname(form["lastname"])
  }

  override Email email()
  {
    Email(form["email"])
  }

  override Phone phone()
  {
    Phone(form["phone"])
  }
}

