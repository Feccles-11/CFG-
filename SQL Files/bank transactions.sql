create database bank;
use bank;

CREATE TABLE accounts (
  account_number int(11) DEFAULT NULL,
  account_holder_name varchar(50) DEFAULT NULL,
  account_holder_surname varchar(50) DEFAULT NULL,
  balance float DEFAULT NULL,
  overdraft_allowed tinyint(1) DEFAULT NULL
);

insert into accounts
(account_number, account_holder_name, account_holder_surname, balance, overdraft_allowed)
VALUES
(111112, 'Julie', 'Smith', 150, true),
(111113, 'James', 'Andrews', 20, false),
(111114, 'Jack', 'Oakes', -70, true),
(111115, 'Jasper', 'Wolf', 200, true);

select * from accounts;

-- transfer £50 
SET SQL_SAFE_UPDATES = 0;

START TRANSACTION ;
-- set transfer amount
SET @TransferAmount = 50 ; 

-- checking balance of acc and specifying where (table and columns) 
SELECT @MoneyAvailable := IF(balance > 0, balance, 0) AS Money 
FROM bank.accounts 
WHERE account_number = 111112
AND account_holder_name = 'Julie' ;

-- taking the money and specifying where from 
UPDATE accounts 
SET balance = balance - @TransferAmount 
WHERE account_number = 111112
AND account_holder_name = 'Julie' ;

-- depositing the money 
UPDATE accounts 
set balance = balance + @TransferAmount 
WHERE account_number = 111115
AND account_holder_name = 'Jasper' ;

COMMIT ; 

SELECT * from accounts ; 





