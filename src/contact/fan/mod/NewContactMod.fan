using web
using webmod
using mustache

const class NewContactMod : WebMod, RepoClient
{
  const static Log log := NewContactMod#.pod.log

  HtmlPage view()
  {
    MustachePage(`new.mustache`)
  }

  override Void onGet()
  {
    view.writeOn(res)
  }

  override Void onPost()
  {
    errors  := HtmlContactForm(req.form).validate
    contact := DefContact.fromForm(req.form)

    if (errors.isEmpty)
    {
      id := repo.add(contact)
      res.redirect(`/contacts`)
    }
    else
    {
      view
        .add(contact)
        .add(errors)
        .writeOn(res)
    }
  }
}
