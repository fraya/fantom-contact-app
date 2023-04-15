**
** A collection of 'Contact'
**
const mixin Contacts : Printable
{
  abstract Void each(|Contact,Int| c)
  abstract This withContact(Contact c)
}

const class DefContacts : Contacts
{
  // Because Fantom only have generics in 'List'
  // I encapsulate a list of 'Contact' to be 'Printable.'
  const protected Contact[] contacts

  new make(Contact[] contacts := [,])
  {
    this.contacts = contacts
  }

  **
  ** Print contacs in 'Media'
  **
  override Media printOn(Media media)
  {
    // Mustache represent lists as
    // ["contacts", [["id":1,"firstname":"John"], [...]]
    data := contacts.map { DefMedia().print(it).toParams }
    return media.printAttr("contacts", data)
  }

  override Void each(|Contact,Int| c)
  {
    contacts.each(c)
  }

  override This withContact(Contact c)
  {
    DefContacts(contacts.dup.add(c))
  }
}
