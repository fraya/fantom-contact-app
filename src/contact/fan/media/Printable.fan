**
** An object that can print its internal state in a 'Media' object
**
** Example:
**
**   class Player : Printable {
**     Str name
**     Int hp
**     override Media printOn(Media media) {
**       media
**         .printAttr("name", name)
**         .printAttr("hp", hp)
**     }
**   }
**
**
mixin Printable
{
  **
  ** Prints on 'Media' possibly returning a new instance
  **
  abstract Media printOn(Media media)
}
