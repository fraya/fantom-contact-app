using mustache

const mixin Mustaches
{
  @Operator
  abstract Mustache get(Uri uri)
}

const class FileMustaches : Mustaches
{
  const Files files

  new make(Files files) { this.files = files }

  @Operator
  override Mustache get(Uri uri)
  {
    Mustache(files.file(uri).in)
  }
}
