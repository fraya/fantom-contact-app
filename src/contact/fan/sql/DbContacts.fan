using sql

const class DbContacts : DefContacts
{
  new make(Row[] rows)
  : super.make(rows.map { SqlContact(it) })
  {}
}
