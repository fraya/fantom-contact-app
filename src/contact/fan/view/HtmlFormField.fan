const class FormField
{
  const Str name
  const Str? value
  const Int minSize := 1
  const Int maxSize := 100

  new make(|This| f) { f(this) }

  This withValue(Str:Str form)
  {
    FormField
    {
      it.name    = this.name
      it.value   = form.getChecked(this.name, false)
      it.minSize = this.minSize
      it.maxSize = this.maxSize
    }
  }

  Bool isEmpty() { value == null }

  Bool isUndersize() { value.size < minSize }

  Bool isOversize() { value.size > maxSize }

  Bool hasErrors() { isEmpty || isUndersize || isOversize }

  Media validateOn(Media media)
  {
    if (isEmpty)
      return media.printAttr("errors/${name}", "Field is required")

    if (isUndersize)
      return media.printAttr("errors/${name}", "Minimum length is ${minSize}")

    if (isOversize)
      return media.printAttr(name, "Maximum length is ${maxSize}")

    return media
  }
}
