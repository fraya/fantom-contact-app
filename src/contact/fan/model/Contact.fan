const class Firstname : Printable
{
  const Str value

  new make(Str value)
  {
    if (value.trim.size == 0)
      throw ArgErr("Firstname required")
    this.value = value.trim
  }

  override Media writeOn(Media media)
  {
    media.write("firstname", value)
  }
}

const class Lastname : Printable
{
  const Str value
  new make(Str value) { this.value = value }
  override Media writeOn(Media media)
  {
    media.write("lastname", value)
  }
}

const class Phone : Printable
{
  const Str value
  new make(Str value) { this.value = value }
  override Media writeOn(Media media)
  {
    media.write("phone", value)
  }
}

const class Email : Printable
{
  const Str value
  new make(Str value) { this.value = value }
  override Media writeOn(Media media)
  {
    media.write("email", value)
  }
}

const mixin Contact : Printable
{
  abstract Int id()
  abstract Firstname firstname()
  abstract Lastname lastname()
  abstract Phone phone()
  abstract Email email()

  override Media writeOn(Media media)
  {
    media.write("id", id)
      .writeObj(firstname)
      .writeObj(lastname)
      .writeObj(phone)
      .writeObj(email)
  }
}
