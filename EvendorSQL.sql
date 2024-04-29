
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

-- Create Vendors table
CREATE TABLE vendors (
    id SERIAL PRIMARY KEY,
    vendor_name VARCHAR(255) NOT NULL,
    vendor_type VARCHAR(100) NOT NULL,
    vendor_price NUMERIC(100, 2) NOT NULL,
    vendor_rating INTEGER NOT NULL
);

-- Create Venues table
CREATE TABLE venues (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


-- Create Bookings table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    event_type_id INTEGER REFERENCES event_types(id),
    venue_id INTEGER REFERENCES venues(id),
    user_id INTEGER REFERENCES users(id),
    vendor_id INTEGER REFERENCES vendors(id),
    booking_date DATE NOT NULL
);

-- Add ability for the Bookings Table to use Arrays for multiple vendors
ALTER TABLE bookings ADD COLUMN vendor_ids INTEGER[];




INSERT INTO event_types (name) VALUES 
    ('Wedding'),
    ('Bar Mitzvah');

INSERT INTO venues (name) VALUES 
    ('EinLiMusag Hall'),
    ('Leonardo Hotel'),
    ('Narnia Hall');

INSERT INTO users (first_name, last_name) VALUES 
    ('Ben', 'Stark'),
    ('David', 'Kingsman'),
    ('Sarah', 'Weiss');


INSERT INTO vendors (vendor_name, vendor_type,vendor_price, vendor_rating, image_url) VALUES 
    ('DOfer Photography', 'Photographer', 50, 5, 'https://scontent.ftlv16-1.fna.fbcdn.net/v/t39.30808-6/293310780_443935171075568_5978492322524888453_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_ohc=c9Glur_ed38Q7kNvgFPgEXX&_nc_ht=scontent.ftlv16-1.fna&oh=00_AfCf5JKmfSsujaIVu8nCD61Uvml-pH_wnbsvGMPb8D8TWQ&oe=6630B542'),
    ('Moonlight Bunny Photography', 'Photographer', 40, 5),
    ('Todd Snap', 'Photographer', 60, 4),
    ('Checkpoint Pics', 'Photographer', 70, 4),
    ('Magnet Dudes', 'Photographer', 30, 4),
    ('Pennywise', 'Entertainment', 20, 2),
    ('Dr. Whodini', 'Entertainment', 35, 4),
    ('Toad Funguy', 'Entertainment', 30, 5),
    ('DJ FunkyKong', 'Musician', 40, 5),
    ('1Up Band', 'Musician', 70, 4),
    ('KISS', 'Musician', 500, 5),
    ('Holy Bagel', 'Catering', 70, 4),
    ('Japanda Sushi', 'Catering', 80, 5),
    ('Mama Mia', 'Catering', 60, 3),
    ('Mister Meaty', 'Catering', 40, 2);
    

-- Sample bookings
INSERT INTO bookings (event_type_id, venue_id, user_id, vendor_ids, booking_date) VALUES 
(1, 1, 1, ARRAY[2, 5, 9, 13], '2024-05-15'), -- Ben Stark books a Wedding at EinLiMusag Hall with Moonlight Bunny Photography, Magnet Dudes, DJ FunkyKong and Japanda Sushi
(2, 3, 2, ARRAY[4, 5, 7, 9, 12], '2024-06-20'), -- David Kingsman books a Bar Mitzvah at Narnia Hall with Checkpoint Pics, Magnet Dudes, Dr. Whodini, DJ FunkyKong and Holy Bagel
(1, 2, 3, ARRAY[1, 5, 10, 14], '2024-07-10'); -- Sarah Weiss books a Wedding at Leonardo Hotel with DOfer Photography, Magnet Dudes, 1Up Band and Mama Mia 
