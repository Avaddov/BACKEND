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

-- Sample bookings
INSERT INTO bookings (event_type_id, venue_id, user_id, booking_date) VALUES 
    (1, 1, 1, '2024-05-20'), -- Ben Stark books EinLiMusag Hall for a wedding
    (2, 3, 2, '2024-06-15'), -- David Kingsman books Narnia Hall for a Bar Mitzvah
    (1, 2, 3, '2024-07-10'); -- Sarah Weiss books Leonardo Hotel for a wedding

