using util

const class CsvContact : Contact
{
  const Str[] row

  new make(Str[] row) { this.row = row }

  override Int id()
  {
    row[0].toInt
  }

  override Firstname firstname()
  {
    Firstname(row[1])
  }

  override Lastname lastname()
  {
    Lastname(row[2])
  }

  override Phone phone()
  {
    Phone(row[3])
  }

  override Email email()
  {
    Email(row[4])
  }
}

const class CsvContacts : Contacts, Service
{
  const File file

  new make(File file)
  {
    this.file = file
  }

  override Void each(|Contact,Int| f)
  {
    csv      := CsvInStream(file.in)
    contacts := csv.readAllRows.map |r| { CsvContact(r) }
    contacts.each(f)
  }

  override Contact? byId(Int id)
  {
    each |Contact c| { if (c.id == id) return c }
    return null
  }
}
