class StrMedia : Media
{
  private StrBuf buf := StrBuf()

  new make(Str s := "")
  {
    buf.add(s)
  }

  override This print(Str name, Obj value)
  {
    buf.add("${name}:${value} ")
    return this
  }

  override Media printOn(Media media)
  {
    media.print("StrMedia", this.toStr)
  }

  override Str toStr()
  {
    buf.toStr
  }
}
