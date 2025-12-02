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
