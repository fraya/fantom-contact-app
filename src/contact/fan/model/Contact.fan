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
      .add(id)
      .print("firstname", firstname)
      .print("lastname", lastname)
      .print("phone", phone)
      .print("email", email)
  }

  override Str toStr()
  {
    StrMedia { this, }.toStr
  }
}
