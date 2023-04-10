const class DefContact : Contact
{
  override const ContactId id := ContactId.def
  override const Str firstname
  override const Str lastname
  override const Str phone
  override const Str email

  static new fromForm(Str:Str form)
  {
    DefContact
    {
      id        = ContactId(form.get("id", "0"))
      firstname = form.getChecked("firstname")
      lastname  = form.getChecked("lastname")
      phone     = form.getChecked("phone")
      email     = form.getChecked("email")
    }
  }

  new make(|This| f) { f(this) }
}
