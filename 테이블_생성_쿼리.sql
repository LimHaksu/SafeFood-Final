create table board (
   no int auto_increment,
  writer varchar(50) NOT NULL,
  title varchar(50) NOT NULL,
  contents varchar(10000) NOT NULL,
  comments varchar(3000),
  constraint pk_board primary key(no)
);
create table intake(
	id varchar(20),
    date date,
    code int,
    PRIMARY KEY(id,date),
    FOREIGN KEY (id) REFERENCES user(id) on delete cascade,
    FOREIGN KEY (code) REFERENCES food(code) on delete cascade
);
CREATE TABLE `food` (
  `code` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `supportpereat` double DEFAULT NULL,
  `calory` double DEFAULT NULL,
  `carbo` double DEFAULT NULL,
  `protein` double DEFAULT NULL,
  `fat` double DEFAULT NULL,
  `sugar` double DEFAULT NULL,
  `natrium` double DEFAULT NULL,
  `chole` double DEFAULT NULL,
  `fattyacid` double DEFAULT NULL,
  `transfat` double DEFAULT NULL,
  `maker` varchar(50) DEFAULT NULL,
  `material` varchar(1000) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  `allergy` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ;
CREATE TABLE `reply` (
  `no` int(11) DEFAULT NULL,
  `writer` varchar(50) DEFAULT NULL,
  `comments` varchar(3000) DEFAULT NULL,
  KEY `no` (`no`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`no`) REFERENCES `board` (`no`) ON DELETE CASCADE
);
CREATE TABLE `user` (
  `id` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `allergy` varchar(200) DEFAULT NULL,
  `friend` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`id`)
);