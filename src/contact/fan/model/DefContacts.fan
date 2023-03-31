const class DefContacts : Contacts
{
  const Contact[] data

  new make(Contact[] vals := [,])
  {
    data = vals
  }

  override Void each(|Contact,Int| f)
  {
    data.each(f)
  }

  override Contact? byId(Int id)
  {
    data.find |Contact c->Bool| { return c.id == id }
  }
}
