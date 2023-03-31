using web
using webmod

const class IndexMod : WebMod
{
  override Void onGet()
  {
    res.redirect(`/contacts`)
  }
}
