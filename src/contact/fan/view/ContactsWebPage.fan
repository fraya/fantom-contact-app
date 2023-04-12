using web

class ContactsWebPage : DefWebPage
{
  new make(|This| f)
  : super.make(f)
  {}

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
