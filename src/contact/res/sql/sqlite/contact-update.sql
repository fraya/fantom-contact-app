UPDATE
    contacts
SET
      firstname = @firstname
    , lastname = @lastname
    , phone = @phone
    , email = @email
WHERE
    id = @id
