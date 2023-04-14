using web
using webmod
using mustache

const class EditContactMod : WebMod, RepoClient
{
  const static Uri template := `edit.mustache`

  Int? contact_id(WebReq req)
  {
    req.modRel.path.first?.toInt(10, false)
  }

  override Void onGet()
  {
    id := contact_id(req)
    if (id == null) return res.sendErr(404)

    contact := repo.findContactById(ContactId(id))
    if (contact == null) return res.sendErr(404)

    MustachePage(template).print(contact).writeOn(res)
  }

  override Void onPost()
  {
    id := contact_id(req)
    if (id == null) return res.sendErr(404)

    data    := req.form.dup["id"] = id.toStr // Add id to form
    form    := HtmlForm.contact.withData(data)
    contact := DefContact.fromMap(data)

    if (form.hasErrors)
    {
      MustachePage(template)
        .print(contact)
        .print(form)
        .writeOn(res)
    }
    else
    {
      repo.update(contact)
      res.redirect(`/contacts`)
    }
  }
}
