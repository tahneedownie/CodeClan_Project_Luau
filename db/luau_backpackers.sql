DROP TABLE guests;
DROP TABLE rooms;

CREATE TABLE rooms (
  id SERIAL8 primary key,
  room_name VARCHAR(255)
);

CREATE TABLE guests (
  id SERIAL8 primary key,
  title VARCHAR(255),
  first_name VARCHAR(255),
  surname VARCHAR(255),
  address VARCHAR(255),
  email VARCHAR(255),
  room_id INT8 REFERENCES rooms(id),
);
