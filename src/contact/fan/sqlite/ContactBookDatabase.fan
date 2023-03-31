using sql

const class ContactBookDatabase : ContactBook, Service
{
  const Database database
  const Sqls sqls

  new make(|This| f) { f(this) }

  override Void onStart()
  {
    sqls.sql(`schema.sql`).execute(database.connection)
  }

  override Obj add(Contact contact)
  {
    sql := sqls.sql(`insert-contact.sql`).writeObj(contact)
    return sql.execute(database.connection)
  }

  override Contact? byId(Int id)
  {
    sql := sqls.sql(`contact-by-id.sql`).write("id", id)
    return sql.query(database.connection)
      .map { SqlContact(it) }
      .first
  }

  override Void each(|Contact,Int| f)
  {
    sqls.sql(`all-contacts.sql`)
      .query(database.connection)
      .map { SqlContact(it) }
      .each(f)
  }
}
