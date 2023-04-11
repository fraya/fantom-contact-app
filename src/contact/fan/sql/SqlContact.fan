using sql

const class SqlContact : Contact
{
  override const ContactId id
  override const Str firstname
  override const Str lastname
  override const Str phone
  override const Str email

  // Object must be initialized in constructor because `Row` is not 'const'
  new make(Row row)
  {
    id        = ContactId.make(row->id)
    firstname = row->firstname
    lastname  = row->lastname
    phone     = row->phone
    email     = row->email
  }
}
