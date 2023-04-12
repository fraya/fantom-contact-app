SELECT id,
       firstname,
       lastname,
       phone,
       email
  FROM contacts
 WHERE firstname LIKE @q
    OR lastname LIKE @q
    OR phone LIKE @q
    OR email LIKE @q
