const class HtmlForm : Printable
{
  const Str:Str data
  const FormField[] fields

  static HtmlForm contact()
  {
    HtmlForm()
      .withField(FormField { name = "firstname"; maxSize = 50 })
      .withField(FormField { name = "lastname"; maxSize = 100 })
      .withField(FormField { name = "phone"; minSize = 9; maxSize = 11 })
      .withField(FormField { name = "email"; minSize = 5; })
  }

  new make(Str:Str data := [:], FormField[] fields := [,])
  {
    this.data   = data
    this.fields = fields
  }

  This withField(FormField field)
  {
    HtmlForm(data, fields.dup.add(field))
  }

  This withData(Str:Str data)
  {
    HtmlForm(data, fields.map { it.withValue(data) })
  }

  Bool hasErrors()
  {
    fields.any |FormField f->Bool| { return f.hasErrors }
  }

  Media validateOn(Media media)
  {
    tmp := media
    fields.each { tmp = it.validateOn(tmp) }
    return tmp
  }

  override Media printOn(Media media)
  {
    validateOn(media)
  }
}
