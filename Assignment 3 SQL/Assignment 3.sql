-- I am going to create a tracking system for a local animal shelter which will keep records of animals in the shelter (current and historic), potential and historic adopters and also details of completed adoptions.  
create database Animal_Shelter; 
use Animal_Shelter; 


-- First I'm going to create a table to track the animals in the shelter. I also want this to include information about animals that have previously been adopted so I will track their adoption status and date of adoption if applicable.
create table animals (
animal_id int auto_increment primary key, 
animal_name varchar(30) not null,
species varchar(30) not null check (species in ('Dog', 'Cat', 'Rabbit', 'Bird', 'Other')),
age_years int check (age_years >= 0),
available_for_adoption boolean,
adoption_date date null); 

-- Now I want to insert the animals' data in to the table. 
insert into animals 
(animal_name, species, age_years, available_for_adoption, adoption_date)
values
('Dennis', 'Dog', 6, false, '2024-02-10'),
('Laim', 'Dog', 5, false, '2024-06-12'),
('Minnie', 'Cat', 1, false, '2024-07-14'), 
('Craig', 'Cat', 11, false, '2024-03-15'),
('Pig', 'Cat', 8, false, '2024-01-16'), 
('Winnie', 'Bird', 2, true, null),
('Mole', 'Rabbit', 3, true, null), 
('Cerberus', 'Other', 10, true, null), 
('Lois', 'Dog', 12, true, null), 
('Paula', 'Cat', 6, true, null); 

-- I'm also going to list the shelter staff, their role, and if they're able to authorise an adoption. 
create table staff (
staff_id int auto_increment primary key, 
staff_name varchar(30) not null,
staff_surname varchar(30) not null,
staff_role varchar(50) not null,
authorise_adoption boolean not null);

insert into staff
(staff_name, staff_surname, staff_role, authorise_adoption)
values 
('Robert', 'Smith', 'Administrator', false),
('Louise', 'Dales', 'Site Manager', true),
('Ricky', 'Speight', 'Animal Handler', true),
('Matthew', 'Greeves', 'Animal Handler', true),
('Helen', 'Taylor', 'Receptionist', false),
('Fiona', 'Miles', 'Animal Handler - Apprentice', false),
('Rachel', 'Hawthorne', 'Vet', false),
('Kyle', 'Shales', 'Cleaner', false);

-- Next I want to create a table to store information and contact details for potential adopters. 
create table adopters (
adopter_id int auto_increment primary key, 
adopter_name varchar(30) not null, 
adopter_surname varchar(30) not null, 
adopter_phone varchar(11) unique not null,
adopter_email varchar(50) unique not null);

insert into adopters
(adopter_name, adopter_surname, adopter_phone, adopter_email)
values
('Lauren', 'Raven-Hill', '01234567890', 'laurenisthebest@email.com'),
('Rhianna', 'Longbottom', '23456789012', 'rhiannaissocool@email.com'),
('Allen', 'Scholes', '34567890123', 'allenscholes@email.com'),
('Luke', 'OBrien', '45678901234', 'lukelukeluke@email.com'),
('Violet', 'Holt', '56789012345', 'violetisviolent@email.com'),
('Ralph', 'Holdson', '67890123456', 'ralphknowswhatsup@email.com'),
('James', 'Ward', '78901234567', 'jamesyjames@email.com'),
('Frank', 'Eccles', '89012345678', 'frankyfrank@email.com');


-- Now I need to create a table to track animal adoptions. 
create table completed_adoptions (
adoption_id int auto_increment primary key, 
animal_id int not null,
adopter_id int not null,
staff_id int not null,
adoption_date date); 

insert into completed_adoptions
(animal_id, adopter_id, staff_id, adoption_date)
values
(1, 3, 2, '2024-02-10'),
(2, 1, 4, '2024-06-12'),
(3, 5, 3, '2024-07-14'),
(4, 2, 3, '2024-03-15'),
(5, 4, 2, '2024-01-16');

-- Example queries

-- To create a stored procedure to view all animals currently available for adoption. 
delimiter // 
create procedure available_animals()
begin 
select * from animals 
where available_for_adoption = true;
end ; 
//

-- To run the procedure. 
call available_animals 

-- To remove a member of staff from the staff table. 
-- delete from staff
-- where staff_name = 'Robert' 
-- and staff_surname = 'Smith'

-- To count how many animals are available for adoption. 
select count(animal_id)
from animals
where available_for_adoption = true 

-- To view the average age of animals available for adoption. 
select round(avg(age_years))
from animals 
where available_for_adoption = true 

-- To view the oldest animals available for adoption. 
select * 
from animals 
where available_for_adoption = true
order by age_years desc 
limit 1 

-- To view which staff are able to authorise an adoption. 
Select * 
from staff
where authorise_adoption = true
order by staff_id

-- To view all dogs available for adoption. 
Select animal_name, species, age_years 
from animals
where species = 'Dog' 
and available_for_adoption = true 
order by age_years

-- To view animals available for adoption that are 3 years or older. 
Select animal_name, species, age_years 
from animals
where age_years >= 3 
and available_for_adoption = true 
order by age_years

-- To view animals, other than dogs, available for adoption that are younger than 5. 
Select animal_name, species, age_years 
from animals
where species <> 'Dog' 
and age_years <= 5 
and available_for_adoption = true 
order by age_years

-- To view previously adopted animals and the year in which they were adopted. 
select animal_name, species, age_years, year(adoption_date) as adoption_year 
from animals
where available_for_adoption = false 
order by adoption_year 

-- To view which animals were adopted on which date and which member of staff authorised the adoption. 
select a.animal_name, c.adoption_date, s.staff_name, s.staff_role 
from animals a
join completed_adoptions c on a.animal_id = c.animal_id
join staff s on s.staff_id = c.staff_id
order by c.adoption_date

-- To view who adopted the animals, the date of adoption and and the final four digits of their adopter's phone number.  
select a.animal_name, c.adoption_date, ad.adopter_name, ad.adopter_surname, right(ad.adopter_phone,4)
from animals a
join completed_adoptions c on a.animal_id = c.animal_id
join adopters ad on ad.adopter_id = c.adopter_id
order by c.adoption_date









