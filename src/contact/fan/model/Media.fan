using mustache

mixin Media
{
  abstract This write(Str name, Obj value)

  This writeObj(Printable printable)
  {
    printable.writeOn(this)
  }
}

mixin Printable
{
  abstract Media writeOn(Media m)
}

class ParameterMedia : Media
{
  Str:Obj content := [:]

  new make(Str:Obj content := [:]) {
    this.content = content
  }

  override This write(Str name, Obj value)
  {
    content.add(name, value)
    return this
  }
}

class MustacheMedia : Media
{
  Mustache mustache
  Str:Obj content := [:]

  new make(Mustache mustache) { this.mustache = mustache }

  override This write(Str name, Obj value)
  {
    content.add(name, value)
    return this
  }

  override Str toStr()
  {
    mustache.render(content)
  }
}
