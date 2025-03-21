CREATE DATABASE nano;
USE nano;
CREATE TABLE `salon_bookings` (
  `teamMember` varchar(45) DEFAULT NULL,
  `12-13` int(11) DEFAULT NULL,
  `12-13-booking-id` varchar(20) DEFAULT NULL,
  `13-14` int(11) DEFAULT NULL,
  `13-14-booking-id` varchar(20) DEFAULT NULL,
  `14-15` int(11) DEFAULT NULL,
  `14-15-booking-id` varchar(20) DEFAULT NULL,
  `15-16` int(11) DEFAULT NULL,
  `15-16-booking-id` varchar(20) DEFAULT NULL,
  `16-17` int(11) DEFAULT NULL,
  `16-17-booking-id` varchar(20) DEFAULT NULL,
  `17-18` int(11) DEFAULT NULL,
  `17-18-booking-id` varchar(20) DEFAULT NULL,
  `bookingDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `filldates`(dateStart DATE, dateEnd DATE, stylistName VARCHAR(20))
BEGIN
  WHILE dateStart <= dateEnd DO
    INSERT INTO salon_bookings (teamMember, bookingDate) VALUES (stylistName, dateStart);
    SET dateStart = date_add(dateStart, INTERVAL 1 DAY);
  END WHILE;salon_bookingssalon_bookings
END$$

DELIMITER ;
-- CALL `nano`.`filldates`(<{dateStart DATE}>, <{dateEnd DATE}>, <{stylistName VARCHAR(20)}>);
CALL `nano`.`filldates`(20250301, 20250307, 'Chelsi');
CALL `nano`.`filldates`(20250301, 20250307, 'Amy');
-- SET SQL_SAFE_UPDATES = 0; if you try use a delete and have not run this before it will throw an error
-- DELETE FROM nano.salon_bookings WHERE teamMember = 'Amy'; if you ran the procedure twice

SET SQL_SAFE_UPDATES = 0;