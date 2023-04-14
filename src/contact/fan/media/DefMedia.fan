const class DefMedia : Media
{
  const protected Str:Obj data

  new make(Str:Obj data := [:])
  {
    this.data = data
  }

  Bool isEmpty()
  {
    data.isEmpty
  }

  override This printAttr(Str name, Obj value)
  {
    DefMedia(data.dup[name] = value)
  }

  Str:Obj toParams()
  {
    data
  }

  override Str toStr()
  {
    data.toStr
  }
}
