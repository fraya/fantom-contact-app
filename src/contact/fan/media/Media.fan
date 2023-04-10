**
** A 'Media' is a way to an object to write the data
** it contains without exposing its internal state.
** See https://www.yegor256.com/2016/04/05/printers-instead-of-getters.html
**
mixin Media : Printable
{
  abstract This print(Str name, Obj value)

  @Operator
  This add(Printable? printable)
  {
    printable?.printOn(this)
    return this
  }
}
