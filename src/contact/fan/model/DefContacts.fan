const class DefContacts : Contacts, Printable
{
  const private Contact[] data

  new make(Contact[] data := [,])
  {
    this.data = data
  }

  override Contact? first()
  {
    data.first
  }

  override Void each(|Contact,Int| c)
  {
    data.each(c)
  }

  override Media printOn(Media media)
  {
    media.print("contacts", data)
  }

  override Int size()
  {
    data.size
  }

  override Str toStr()
  {
    StrMedia().add(this).toStr
  }
}
