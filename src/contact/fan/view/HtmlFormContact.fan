const class HtmlFormContact : Contact
{
  const Str:Str form

  new make(Str:Str form) { this.form = form }

  @Operator
  Str get(Str name) { form.getChecked(name) }

  override ContactId id()  { ContactId.def }
  override Str firstname() { this["firstname"] }
  override Str lastname()  { this["lastname"] }
  override Str phone()     { this["phone"] }
  override Str email()     { this["email"] }
}
