class ContactTest : Test
{
  Contact? contact

  override Void setup()
  {
    contact = DefContact
    {
      id = 0
      firstname = Firstname("John")
      lastname = Lastname("Doe")
      phone = Phone("5551234")
      email = Email("john@example.org")
    }
  }

  override Void teardown()
  {
    contact = null
  }

  // Void testMedia()
  // {
  //   content := ParameterMedia()
  //   contact.print(content)
  //   verifyEq(content["id"], 0)
  //   verifyEq(content["first"], "John")
  //   verifyEq(content["last"], "Doe")
  //   verifyEq(content["phone"], "5551234")
  //   verifyEq(content["email"], "john@example.org")
  // }
}
