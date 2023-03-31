const class HtmlField
{
  const Str name
  const Bool notEmpty

  new make(Str name, Bool notEmpty := false)
  {
    this.name = name
    this.notEmpty = notEmpty
  }

  Bool isValid(Str? value)
  {
    if (notEmpty)
      return value != null && value.trim.size > 0
    return true
  }
}

const class HtmlForm
{
  const Str:Str values
  const HtmlField[] fields

  new make(|This| f) { f(this) }

  @Operator
  This add(HtmlField field)
  {
    HtmlForm
    {
      it.values = this.values
      it.fields = this.fields.dup.add(field)
    }
  }

  [Str:Str]? validate()
  {
    errors := [Str:Str][:]

    fields.each |field|
    {
      name := field.name
      if (!field.isValid(values.get(name, null)))
        errors[name] = "Field ${name} required"
    }

    return errors.size > 0 ? errors : null
  }
}
