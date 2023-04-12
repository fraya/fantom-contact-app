using mustache

const mixin Mustaches
{
  abstract Mustache template(Uri uri)
}

const class FileMustaches : Mustaches, Service
{
  const Files files

  new make(Files files) { this.files = files }

  override Mustache template(Uri uri)
  {
    Mustache(files.file(uri).in)
  }
}
