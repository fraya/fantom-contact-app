using mustache

class MustacheMedia : ParamMedia
{
  Mustache template

  new make(Mustache template, Str:Obj data := [:])
  : super.make(data)
  {
    this.template = template
  }

  override Str toStr()
  {
    template.render(data)
  }
}
