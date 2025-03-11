create database myfitness_db;
use myfitness_db;

create table gym_classes (
class_id int auto_increment primary key,
class_name varchar(30) not null,
class_type varchar(30) not null,
class_time time not null, 
class_session varchar(2) generated always as (
        case 
            when hour(class_time) < 12 then 'AM'
            else 'PM'
		end 
) stored
);

insert into gym_classes 
(class_name, class_type, class_time)
values
('Rise & Spin', 'Cardio', '06:00:00'),
('Early Bird Yoga', 'Stretch', '07:00:00'),
('Breakfast Bootcamp', 'Weight Training', '08:00:00'),
('HIT Morning', 'Cardio', '09:00:00'),
('Pilates', 'Stretch', '10:00:00'),
('Brunch Spin', 'Cardio', '11:00:00'),
('Lunchtime Bootcamp', 'Weight Training', '13:00:00'),
('Afternoon HIT', 'Cardio', '15:00:00'),
('Teatime Spin', 'Cardio', '17:00:00'), 
('Girls Who Lift', 'Weight Training', '18:00:00'),
('Night Owl Yoga', 'Stretch', '20:00:00');

select * from gym_classes;


