SELECT
    id
  , firstname
  , lastname
  , phone
  , email
FROM
  contacts
WHERE
  id = @id
