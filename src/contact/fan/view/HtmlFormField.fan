const class HtmlFormField
{
  const static Log log := HtmlFormField#.pod.log

  const Str name
  const Int minSize := 1
  const Int maxSize := 100

  new make(Str name, |This|? f := null)
  {
    this.name  = name
    if (f != null) f(this)
  }

  Media? validate(Str:Str form)
  {
    value  := form.getChecked(name, false)

    if (value == null)
    {
      log.debug("Form field '${name}' not present")
      return MediaErr().print(name, "This field is required")
    }

    if (value.size < minSize)
    {
      log.debug("'${name}' size: ${value.size} expected >= ${minSize}")
      return MediaErr().print(name, "Field minimum size of characters is ${minSize}")
    }

    if (value.size > maxSize)
    {
      log.debug("'${name}' size: ${value.size} expected <= ${maxSize}")
      return MediaErr().print(name, "Field maximum size of characters is ${maxSize}")
    }

    return null
  }
}
