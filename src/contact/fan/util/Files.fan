using concurrent

const mixin Files
{
  abstract Uri? base()

  abstract File file(Uri path)

  Uri path(Uri uri)
  {
    base == null ? uri : base + uri
  }
}

const class DefFiles : Files
{
  override const Uri? base

  new make(Uri? base := null) { this.base = base }

  override File file(Uri file)
  {
    return path(file).toFile
  }
}
