using web
using webmod
using mustache

const class NewContactMod : WebMod, RepoClient
{
  const static Uri template := `new.mustache`

  override Void onGet()
  {
    MustachePage(template).writeOn(res)
  }

  override Void onPost()
  {
    form    := HtmlForm.contact.withData(req.form)
    contact := DefContact.fromMap(req.form)

    if (form.hasErrors)
    {
      MustachePage(template)
        .print(form)
        .print(contact)
        .writeOn(res)
    }
    else
    {
      id := repo.add(contact)
      res.redirect(`/contacts`)
    }
  }
}
