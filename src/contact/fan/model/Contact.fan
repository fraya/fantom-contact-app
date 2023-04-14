const mixin Contact : Printable
{
  abstract ContactId id()
  abstract Str firstname()
  abstract Str lastname()
  abstract Str phone()
  abstract Str email()

  override Media printOn(Media media)
  {
    media
      .print(id)
      .printAttr("firstname", firstname)
      .printAttr("lastname", lastname)
      .printAttr("phone", phone)
      .printAttr("email", email)
  }
}
