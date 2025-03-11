This API allows the user to view available gym classes and filter by type.

1. In order to run this, the following database and table will need to be created:

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

2. Open the config.py file and input your credentials. 
DB_CONFIG = {
    'host': 'localhost',
    'user': 'your_mysql_username',
    'password': 'your_mysql_password',
    'database': 'myfitness_db'
}

3. Available endpoints: 
http://127.0.0.1:5000/ - Shows a welcome message. 
http://127.0.0.1:5000/codeofconduct - Shows the gym code of conduct. 
http://127.0.0.1:5000/allclasses - Shows all classes. 
http://127.0.0.1:5000/allclasses/cardio - Shows all cardio classes. 
http://127.0.0.1:5000/allclasses/stretch - Shows all stretch classes. 
http://127.0.0.1:5000/allclasses/weight - Shows all weight training classes. 
http://127.0.0.1:5000/allclasses/am - Shows all classes in the morning. 