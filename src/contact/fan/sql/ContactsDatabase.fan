using sql

const class ContactDbRepo : ContactRepo, Service
{
  const Database database
  const Sqls sqls

  new make(|This| f) { f(this) }

  override Void onStart()
  {
    sqls.sql(`schema.sql`).execute(database.connection)
  }

  override ContactId add(Contact contact)
  {
    ids := sqls.sql(`insert-contact.sql`)
             .print(contact)
             .insert(database.connection)
    return ContactId(ids.first)
  }

  override Int update(Contact contact)
  {
    sql := sqls.sql(`contact-update.sql`).print(contact)
    return sql.update(database.connection)
  }

  override Contact? findContactById(ContactId id)
  {
    sqls.sql(`contact-by-id.sql`)
      .print(id)
      .query(database.connection)
      .map { SqlContact(it) }
      .first
  }

  override Void delete(ContactId id)
  {
    sql := sqls.sql(`contact-delete.sql`)
      .print(id)
      .execute(database.connection)
  }

  override Contacts findContacts(Str query)
  {
    data := sqls.sql(`contacts-by-query.sql`)
      .printAttr("q", query)
      .query(database.connection)
      .map { SqlContact(it) }
    return DefContacts(data)
  }

  override Contacts all()
  {
     data := sqls.sql(`all-contacts.sql`)
       .query(database.connection)
       .map { SqlContact(it) }
     return DefContacts(data)
  }
}
