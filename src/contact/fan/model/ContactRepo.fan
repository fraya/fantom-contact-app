const mixin ContactRepo
{
  **
  ** Adds a new contact
  **
  abstract ContactId add(Contact contact)

  **
  ** Finds a contact by the id
  **
  abstract Contact? findContactById(ContactId id)

  abstract Contacts findContacts(Str query)

  **
  ** Updates a contact
  **
  abstract Int update(Contact contact)

  **
  ** Remove contact
  **
  abstract Void delete(ContactId id)

  **
  ** All contacts
  **
  abstract Contacts all()
}
