const class ContactErr : Err, Media, Printable
{
  const Str:Obj data

  new make(Str msg, Str:Obj data := [:])
  : super(msg, null)
  {
    this.data = data
  }

  override This printAttr(Str name, Obj value)
  {
    ContactErr(msg, data.dup[name] = value)
  }

  override Media printOn(Media media)
  {
    data.each |v, k|
    {
      media = media.printAttr(k, v)
    }

    return media
  }
}
