**
** A 'Media' is a way to an object to write the data
** it contains without exposing its internal state.
** See https://www.yegor256.com/2016/04/05/printers-instead-of-getters.html
**
const mixin Media
{
  **
  ** Add an attribute to 'Media' returning a new
  ** instance.
  **
  abstract This printAttr(Str name, Obj value)

  **
  ** 'Printable' objects print themselves on this 'Media'
  **
  This print(Printable printable)
  {
    printable.printOn(this)
  }
}
