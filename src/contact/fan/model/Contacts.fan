const mixin Contacts : Printable
{
  abstract Void each(|Contact,Int| c)
  abstract Contact? first()
  abstract Int size()
}
