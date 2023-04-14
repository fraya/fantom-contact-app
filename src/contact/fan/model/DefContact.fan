const class DefContact : Contact
{
  override const ContactId id := ContactId.def
  override const Str firstname
  override const Str lastname
  override const Str phone
  override const Str email

  static new fromMap(Str:Str form)
  {
    DefContact
    {
      id        = ContactId(form.get("id", "0"))
      firstname = form["firstname"]
      lastname  = form["lastname"]
      phone     = form["phone"]
      email     = form["email"]
    }
  }

  new make(|This| f) { f(this) }

  override Str toStr()
  {
    "${lastname}, ${firstname}  #${phone} ${email}"
  }
}
