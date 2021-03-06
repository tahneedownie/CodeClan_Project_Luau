DROP TABLE guests;
DROP TABLE rooms;


CREATE TABLE rooms (
  id SERIAL8 primary key,
  room_name VARCHAR(255)
);

CREATE TABLE guests (
  id SERIAL8 primary key,
  title VARCHAR(255),
  first_name VARCHAR(255) NOT NULL,
  surname VARCHAR(255) NOT NULL,
  address VARCHAR(255),
  city VARCHAR(255),
  country VARCHAR(255),
  postcode VARCHAR(255),
  email VARCHAR(255),
  room_id INT8 REFERENCES rooms(id)
);
