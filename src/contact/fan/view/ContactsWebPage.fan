using web

const class ContactsWebPage : DefWebPage
{
  new make(Str:Obj params := [:])
  : super.make(200, params)
  {}

  override This printAttr(Str name, Obj val)
  {
    ContactsWebPage(params.dup[name] = val)
  }

  override Void writeBody(WebRes res, WebOutStream out)
  {
    out.h1.w("Contacts app").h1End
    out.h2.w("A demo contact application").h2End
    out.br
    out.div("id='main'")
      out.form
        out.label("for='search'").w("Search Term").labelEnd
        out.input("id='search' name='q' type='search' placeholder='Search contacts'")
        out.tag("button","hx-post='/contacts' hx-target='#main'")
        out.w("Search")
        out.tagEnd("button")
      out.formEnd
    out.divEnd
  }
}
