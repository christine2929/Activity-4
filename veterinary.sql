CREATE DATABASE veterinary;

CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animals (
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments (
appointid INT PRIMARY KEY,
animalid INT,
appointdate DATE,
reason VARCHAR(255),
FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors (
 doctorid INT PRIMARY KEY
AUTO_INCREMENT,
 dfirstname VARCHAR(50) NOT NULL,
 dlastname VARCHAR(50) NOT NULL,
 specialty VARCHAR(100),
 phone VARCHAR(15),
 email VARCHAR(100)
);

CREATE TABLE invoices (
 invoiceid INT PRIMARY KEY AUTO_INCREMENT,
 appointid INT,
 totalamount NUMERIC(10,2),
 paymentdate TIME,
 FOREIGN KEY (appointid) REFERENCES
appointments(appointid)
);

CREATE TABLE medicalrecords (
 recordid INT PRIMARY KEY,
 animalid INT,
 recorddate DATETIME,
 doctorid INT,
 diagnosis VARCHAR(255),
 prescription VARCHAR(255),
 notes TEXT,
 FOREIGN KEY (animalid) REFERENCES
animals(animalid),
 FOREIGN KEY (doctorid) REFERENCES
doctors(doctorid)
);

INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email)
VALUES
(1, 'Christine', 'De Chavez', 'Batangas City', '09171234567', 'christine.dechavez@email.com'),
(2, 'Angelica', 'Aguba', 'Quezon City', '09182345678', 'angelica.aguba@gmail.com'),
(3, 'Ahuge', 'De Quina', 'Makati City', '09193456789', 'ahuge.dequina@gmail.com'),
(4, 'Bianca', 'Corpuz', 'Taguig City', '09204567890', 'bianca.corpuz@gmail.com'),
(5, 'Irish', 'Fampulme', 'Pasig City', '09215678901', 'irish.fampulme@email.com'),
(6, 'Francine', 'Feliciano', 'Mandaluyong City', '09226789012', 'francine.feliciano@email.com'),
(7, 'Jessica', 'Hernandez', 'San Juan City', '09237890123', 'jessica.hernandez@email.com'),
(8, 'Niur', 'Marasigan', 'Parañaque City', '09248901234', 'niurn@email.com'),
(9, 'Rafael', 'Ilagan', 'Alabang City', '09259012345', 'rafael.ilagan@email.com'),
(10, 'Dian', 'Ilagan', 'Alabang City', '09260123456', 'dianne.ilagan@email.com');

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES
(1, 'Misty', 'Cat', 'British Shorthair', '2019-05-12', 'Female', 'Blue', 11),
(2, 'Oreo', 'Cat', 'Tuxedo', '2020-08-25', 'Male', 'Black/White', 12),
(3, 'Ginger', 'Cat', 'Domestic Shorthair', '2018-11-03', 'Female', 'Orange Tabby', 13),
(4, 'Smokey', 'Cat', 'Russian Blue', '2021-02-14', 'Male', 'Gray', 14),
(5, 'Chloe', 'Cat', 'Birman', '2017-09-18', 'Female', 'Seal Point', 15),
(6, 'Leo', 'Cat', 'Savannah', '2019-12-07', 'Male', 'Spotted Brown', 16),
(7, 'Mochi', 'Cat', 'Scottish Fold', '2022-03-22', 'Female', 'Fluffy Gray', 17),
(8, 'Phoenix', 'Cat', 'Egyptian Mau', '2020-07-30', 'Male', 'Silver Spotted', 18),
(9, 'Sapphire', 'Cat', 'Ragdoll', '2021-04-09', 'Female', 'Blue Bicolor', 19),
(10, 'Thor', 'Cat', 'Norwegian Forest', '2016-10-15', 'Male', 'Brown Tabby', 20);

INSERT INTO appointments (appointid, animalid,
appointdate, reason)
VALUES
(1, 1, '2025-11-01', 'Annual vaccination'),
(2, 2, '2025-11-03', 'Routine check-up'),
(3, 3, '2025-11-05', 'Skin allergy treatment'),
(4, 4, '2025-11-07', 'Dental cleaning'),
(5, 5, '2025-11-09', 'Injury examination'),
(6, 6, '2025-11-11', 'Spay/Neuter consultation'),
(7, 7, '2025-11-13', 'Digestive issues follow-up'),
(8, 8, '2025-11-15', 'Fever and lethargy'),
(9, 9, '2025-11-17', 'Weight management advice'),
(10, 10, '2025-11-19', 'Vaccination booster');

INSERT INTO doctors (doctorid, dfirstname, dlastname, speciality, phone, email)
VALUES
(1, 'Dr.Angelica', 'Navarro', 'General Veterinarian', '0912-345-6789', 'angelica.navarro@example.com'),
(2, 'Dr.Michael', 'Domingo', 'Exotic Animals Specialist', '0923-456-7890', 'michael.domingo@example.com'),
(3, 'Dr.Jasmine', 'Cortez', 'Dental Specialist', '0934-567-8901', 'jasmine.cortez@example.com'),
(4, 'Dr.Paulo', 'Rivera', 'Rehabilitation Specialist', '0945-678-9012', 'paulo.rivera@example.com'),
(5, 'Dr.Katrina', 'Delos Santos', 'Emergency Care Specialist', '0956-789-0123', 'katrina.santos@example.com'),
(6, 'Dr.Roman', 'Valdez', 'Oncology Specialist', '0967-890-1234', 'roman.valdez@example.com'),
(7, 'Dr.Bianca', 'Mendoza', 'Ophthalmology Specialist', '0978-901-2345', 'bianca.mendoza@example.com'),
(8, 'Dr.Diego', 'Lopez', 'Radiology Specialist', '0989-012-3456', 'diego.lopez@example.com'),
(9, 'Dr.Serena', 'Ferrer', 'Cardiology Specialist', '0990-123-4567', 'serena.ferrer@example.com'),
(10, 'Dr.Henry', 'Castillo', 'Dermatology Specialist', '0907-234-5678', 'henry.castillo@example.com');

INSERT INTO invoices(invoiceid, appointid, totalamount,
paymentdate)
VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:30:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 75.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes)
VALUES 
    (1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
    (2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
    (3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
    (4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
    (5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
    (6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
    (7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
    (8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
    (9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
    (10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');

    ALTER TABLE owners
ADD registereddate DATE;

ALTER TABLE invoices
RENAME COLUMN paymentdate TO
paymenttime;

DELETE FROM appointments
WHERE animalid = (
 SELECT animalid FROM animals WHERE name =
'Simba'
);

UPDATE doctors
SET dlastname = 'Reyes-Gonzales'
WHERE doctorid = 4;

SELECT DISTINCT species
FROM animals;

