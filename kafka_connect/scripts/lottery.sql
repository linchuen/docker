SHOW MASTER STATUS;

CREATE DATABASE IF NOT EXISTS cdc;
USE cdc;

CREATE TABLE IF NOT EXISTS`lottery_number` (
  `lottery_id` int(11) NOT NULL,
  `round` bigint(20) NOT NULL,
  `winning_numbers` varchar(20) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`lottery_id`,`round`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT IGNORE INTO lottery_number
(lottery_id, round, winning_numbers, created_time)
VALUES
(1, 20241117001, '01,02,03,04,05,06,07', NOW()),
(1, 20241117002, '01,02,03,04,05,06,07', NOW()),
(1, 20241117003, '01,02,03,04,05,06,07', NOW()),
(1, 20241117004, '01,02,03,04,05,06,07', NOW()),
(1, 20241117005, '01,02,03,04,05,06,07', NOW());