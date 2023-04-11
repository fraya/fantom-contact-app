using web
using webmod
using mustache

const class ContactsMod : WebMod
{
  const static Log log := ContactsMod#.pod.log

  const ContactRepo repo
  const Mustache template

  new make(|This| f) { f(this) }

  override Void onGet()
  {
    query := req.modRel.query.get("q", "")
    MustachePage(template)
      .add(repo.all)
      .writeOn(res)
  }
}
