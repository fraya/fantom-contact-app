const class ContactId : Printable
{
  const static ContactId def := ContactId(0)

  const Int id

  new make(Int id) { this.id = id }

  new fromStr(Str s)
  : this.make(s.toInt(10))
  {}

  override Media printOn(Media media)
  {
    media.printAttr("id", id)
  }

  override Str toStr()
  {
    id.toStr
  }
}
