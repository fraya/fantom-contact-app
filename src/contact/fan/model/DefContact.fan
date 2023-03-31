const class DefContact : Contact
{
  override const Int id
  override const Firstname firstname
  override const Lastname lastname
  override const Phone phone
  override const Email email

  new make(|This| f) { f(this) }
}
