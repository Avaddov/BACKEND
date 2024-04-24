
-- Create Event Types table
CREATE TABLE event_types (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


-- Create Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);


-- Create Venues table
CREATE TABLE venues (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


-- Create Bookings table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    event_type_id INT REFERENCES event_types(id),
    venue_id INT REFERENCES venues(id),
    user_id INT REFERENCES users(id),
    booking_date DATE NOT NULL,
    CONSTRAINT event_venue_user_unique UNIQUE (event_type_id, venue_id, user_id)
);
