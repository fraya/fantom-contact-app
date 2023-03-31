const mixin Contacts
{
  abstract Contact? byId(Int id)

  abstract Void each(|Contact,Int| f)
}
