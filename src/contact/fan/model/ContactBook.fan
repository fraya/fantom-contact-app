const mixin ContactBook
{
  abstract Obj add(Contact c)
  abstract Contact? byId(Int id)
  abstract Void each(|Contact,Int| f)

  Media print(Media media)
  {
    data := [,]

    this.each
    {
      params := ParameterMedia().writeObj(it)
      data.add(params.content)
    }

    return media.write("contacts", data)
  }
}
