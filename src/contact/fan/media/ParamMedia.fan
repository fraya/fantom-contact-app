class ParamMedia : Media
{
  protected Str:Obj data

  new make(Str:Obj data := [:])
  {
    this.data = data
  }

  Bool isEmpty()
  {
    data.isEmpty
  }

  override This print(Str name, Obj value)
  {
    data[name] = value
    return this
  }

  override Media printOn(Media media)
  {
    data.each |v, k| { media = media.print(k, v) }
    return media
  }

  override Str toStr()
  {
    StrMedia { this, }.toStr
  }
}
