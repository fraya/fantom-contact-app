using sql

const class SqlContact : Contact
{
  override const Int id
  override const Firstname firstname
  override const Lastname lastname
  override const Phone phone
  override const Email email

  // Object must be initialized in constructor because `Row` is not
  // 'const'
  new make(Row row)
  {
    id        = row->id
    firstname = Firstname(row->firstname)
    lastname  = Lastname(row->lastname)
    phone     = Phone(row->phone)
    email     = Email(row->email)
  }
}
