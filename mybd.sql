drop database if exists `mydb`;
create database `mydb`;
use `mydb`;
create table `users`(
  `u_id` int primary key auto_increment,
  `u_name` varchar(150),
  `u_surname` varchar(150),
  `email` varchar(150),
  `password` varchar(150)
);
create table `collections`(
  `c_id` int primary key key auto_increment,
  `c_name` varchar(150),
  `description` text,
  `theme` varchar(150),
  `image` varchar(150),
  `idOwner` int,
  foreign key `collections`(`idOwner`) references `users`(`u_id`)
);
create table `items`(
  `i_id` int primary key key auto_increment,
  `i_name` varchar(150),
  `idCollection` int,
  foreign key `items`(`idCollection`) references `collections`(`c_id`)
);
create table `likes`(
  `l_id` int key auto_increment,
  `userId` int,
  `itemId` int,
   foreign key `likes`(`userId`) references `users`(`u_id`),
   foreign key (`itemId`) references `items`(`i_id`)
);
create table `comments`(
  `cm_id` int unsigned key auto_increment,
  `cm_text` text,
  `cm_date` date,
  `userId` int,
  `itemId` int,
  foreign key `comments`(`userId`) references `users`(`u_id`),
  foreign key (`itemId`) references `items`(`i_id`)
);
create table `settings`(
  `st_id` int key auto_increment,
  `language` varchar(150),
  `sb_books` integer unsigned,
  `idUser` int,
  `theme` bool -- light/dark--
);
insert into `users` (`u_name`, `u_surname`, `email`, `password`) values ('Edward', 'Kalin', 'edwardkalin@gmail.com', '12345'); 
insert into `collections` (`c_name`,`description`,`theme`,`image`,`idOwner`) values ('Tasks', 'My tasks for developing', 'Self-development', 'https://sun9-34.userapi.com/c206624/v206624844/a55fb/U49wL4AEbM0.jpg', 1); 
insert into `items` (`i_name`, `idCollection`) values ('homework', 1); 
select * from `users` join `collections`
on `users`.`u_id` = `collections`.`idOwner`
join `items` on `collections`.`c_id` = `items`.`idCollection`;
