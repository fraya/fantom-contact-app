class MediaErr : ParamMedia
{
  new make(Str:Obj data := [:]) : super.make(data)
  {}

  override This print(Str name, Obj value)
  {
    super.print("errors/${name}", value)
  }
}
