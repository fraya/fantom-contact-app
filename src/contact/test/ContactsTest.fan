class ContactsTest : Test
{
  Contact? john
  Contact? jane
  Contacts? contacts

  override Void setup()
  {
    john = DefContact
    {
      id = 1
      firstname = Firstname("John")
      lastname = Lastname("Doe")
      phone = Phone("5551234")
      email = Email("john@example.org")
    }

    jane = DefContact
    {
      id = 2
      firstname = Firstname("Jane")
      lastname = Lastname("Doe")
      phone = Phone("5554321")
      email = Email("jane@example.org")
    }

    contacts = DefContacts([john, jane])
  }

  override Void teardown()
  {
    contacts = null
  }

  Void testById()
  {
    verifyEq(contacts.byId(1), john)
    verifyEq(contacts.byId(2), jane)
  }
}
