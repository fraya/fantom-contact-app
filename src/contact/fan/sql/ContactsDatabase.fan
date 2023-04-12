using sql

const class ContactDbRepo : ContactRepo, Service
{
  const static Log log := ContactDbRepo#.pod.log

  const Database database
  const Sqls sqls

  new make(|This| f) { f(this) }

  override Void onStart()
  {
    sqls.sql(`schema.sql`).execute(database.connection)
  }

  override ContactId add(Contact contact)
  {
    sql := sqls.sql(`insert-contact.sql`).add(contact)
    ids := sql.insert(database.connection)
    return ContactId(ids.first)
  }

  override Int update(Contact contact)
  {
    sql := sqls.sql(`contact-update.sql`).add(contact)
    return sql.update(database.connection)
  }

  override Contact? findContactById(ContactId id)
  {
    sql  := sqls.sql(`contact-by-id.sql`).add(id)
    data := sql.query(database.connection)
    return DbContacts(data).first
  }

  override Void delete(ContactId id)
  {
    sql := sqls.sql(`contact-delete.sql`)
      .add(id)
      .execute(database.connection)
  }

  override Contacts findContacts(Str query)
  {
    if (log.isDebug)
      log.debug("sql:contact-by-query $query")

    data := sqls.sql(`contacts-by-query.sql`)
      .print("q", query)
      .query(database.connection)
    return DbContacts(data)
  }

  override Contacts all()
  {
     sql  := sqls.sql(`all-contacts.sql`)
     data := sql.query(database.connection)
     return DbContacts(data)
  }
}
