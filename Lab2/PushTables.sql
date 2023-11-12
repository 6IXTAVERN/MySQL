#client
#INSERT INTO `mydb`.`client` (`id_client`, `full_name`, `passport`, `phone`) VALUES (DEFAULT, 'Лев Николаевич Толстой', '15 43 879670', '+79261234567');
#INSERT INTO `mydb`.`client` (`id_client`, `full_name`, `passport`, `phone`) VALUES (DEFAULT, 'Тургенев Иван Сергеевич', '31 92 756481', '+74951234567');
#INSERT INTO `mydb`.`client` (`id_client`, `full_name`, `passport`, `phone`) VALUES (DEFAULT, 'Богдан Степанович Ураганенко', '51 37 978234', '+79101234567');
#INSERT INTO `mydb`.`client` (`id_client`, `full_name`, `passport`, `phone`) VALUES (DEFAULT, 'Пушкин Александр Сергеевич', '86 74 538196', '+79031234567');
#INSERT INTO `mydb`.`client` (`id_client`, `full_name`, `passport`, `phone`) VALUES (DEFAULT, 'Ураган Васильевич Капканов', '42 03 215367', '+79881234567');
#INSERT INTO `mydb`.`client` (`id_client`, `full_name`, `passport`, `phone`) VALUES (DEFAULT, 'Ефим Петрович Ржевский', '67 21 894051', '+79871234567');
#INSERT INTO `mydb`.`client` (`id_client`, `full_name`, `passport`, `phone`) VALUES (DEFAULT, 'Василий Лукинич Дурнев', '92 56 537462', '+79651234567');
#INSERT INTO `mydb`.`client` (`id_client`, `full_name`, `passport`, `phone`) VALUES (DEFAULT, 'Федор Михайлович Сумкин', '20 65 309781', '+79721234567');
#INSERT INTO `mydb`.`client` (`id_client`, `full_name`, `passport`, `phone`) VALUES (DEFAULT, 'Семен Петрович Сарумянов', '34 18 657893', '+79131234567');
#INSERT INTO `mydb`.`client` (`id_client`, `full_name`, `passport`, `phone`) VALUES (DEFAULT, 'Станислав Богданович Кличко', '78 32 451209', '+79251234567');
#INSERT INTO `mydb`.`client` (`id_client`, `full_name`, `passport`, `phone`) VALUES (DEFAULT, 'Александр Романович Невский', '22 83 155478', '+79761234567');
#
#SELECT * FROM client;

#comfortable
#INSERT INTO `mydb`.`comfortable` (`id_comfortable`, `type`, `price`) VALUES (DEFAULT, 'Бизнес', 25000);
#INSERT INTO `mydb`.`comfortable` (`id_comfortable`, `type`, `price`) VALUES (DEFAULT, 'Обычный', 15000);
#INSERT INTO `mydb`.`comfortable` (`id_comfortable`, `type`, `price`) VALUES (DEFAULT, 'Эконом', 5000);
#
#SELECT * FROM comfortable;

#room
#INSERT INTO `mydb`.`room` (`id_room`, `id_comfortable`, `floor`) VALUES (DEFAULT, 1, 1);
#INSERT INTO `mydb`.`room` (`id_room`, `id_comfortable`, `floor`) VALUES (DEFAULT, 2, 2);
#INSERT INTO `mydb`.`room` (`id_room`, `id_comfortable`, `floor`) VALUES (DEFAULT, 3, 4);
#INSERT INTO `mydb`.`room` (`id_room`, `id_comfortable`, `floor`) VALUES (DEFAULT, 3, 4);
#INSERT INTO `mydb`.`room` (`id_room`, `id_comfortable`, `floor`) VALUES (DEFAULT, 2, 2);
#INSERT INTO `mydb`.`room` (`id_room`, `id_comfortable`, `floor`) VALUES (DEFAULT, 1, 2);
#INSERT INTO `mydb`.`room` (`id_room`, `id_comfortable`, `floor`) VALUES (DEFAULT, 1, 1);
#INSERT INTO `mydb`.`room` (`id_room`, `id_comfortable`, `floor`) VALUES (DEFAULT, 3, 3);
#INSERT INTO `mydb`.`room` (`id_room`, `id_comfortable`, `floor`) VALUES (DEFAULT, 2, 2);
#INSERT INTO `mydb`.`room` (`id_room`, `id_comfortable`, `floor`) VALUES (DEFAULT, 2, 1);
#
#SELECT * FROM room;living

#living
#INSERT INTO `mydb`.`living` (`id_living`, `id_room`, `factually_arrive`, `factually_leaving`) VALUES (DEFAULT, 1, '2023-05-10 20:00:00', '2023-05-12 19:00:00');
#INSERT INTO `mydb`.`living` (`id_living`, `id_room`, `factually_arrive`, `factually_leaving`) VALUES (DEFAULT, 1, NULL, NULL);
#INSERT INTO `mydb`.`living` (`id_living`, `id_room`, `factually_arrive`, `factually_leaving`) VALUES (DEFAULT, 3, '2023-04-03 18:00:00', '2023-04-06 13:00:00');
#INSERT INTO `mydb`.`living` (`id_living`, `id_room`, `factually_arrive`, `factually_leaving`) VALUES (DEFAULT, 4, '2022-02-02 10:00:00', '2022-02-10 12:00:00');
#INSERT INTO `mydb`.`living` (`id_living`, `id_room`, `factually_arrive`, `factually_leaving`) VALUES (DEFAULT, 5, NULL, NULL);
#INSERT INTO `mydb`.`living` (`id_living`, `id_room`, `factually_arrive`, `factually_leaving`) VALUES (DEFAULT, 6, '2021-01-02 09:00:00', '2021-02-03 10:00:00');
#INSERT INTO `mydb`.`living` (`id_living`, `id_room`, `factually_arrive`, `factually_leaving`) VALUES (DEFAULT, 7, '2020-12-01 11:00:00', '2020-12-05 11:00:00');
#INSERT INTO `mydb`.`living` (`id_living`, `id_room`, `factually_arrive`, `factually_leaving`) VALUES (DEFAULT, 8, '2019-12-03 12:00:00', '2019-12-05 13:00:00');
#INSERT INTO `mydb`.`living` (`id_living`, `id_room`, `factually_arrive`, `factually_leaving`) VALUES (DEFAULT, 9, '2020-01-12 11:00:00', '2020-01-13 13:00:00');
#INSERT INTO `mydb`.`living` (`id_living`, `id_room`, `factually_arrive`, `factually_leaving`) VALUES (DEFAULT, 10, '2018-03-03 10:00:00', '2018-03-05 10:00:00');
#
#SELECT * FROM Living;

#INSERT INTO `mydb`.`reservation` (`id_reservation`, `id_client`, `id_comfortable`, `id_living`, `date_arrival`, `date_leaving`, `nutrition`) VALUES (DEFAULT, 1, 1, 1, '2023-05-10 21:00:00', '2023-05-12 19:00:00', NULL);
#INSERT INTO `mydb`.`reservation` (`id_reservation`, `id_client`, `id_comfortable`, `id_living`, `date_arrival`, `date_leaving`, `nutrition`) VALUES (DEFAULT, 2, 2, 2, '2023-05-15 10:00:00', '2023-05-18 18:00:00', 1);
#INSERT INTO `mydb`.`reservation` (`id_reservation`, `id_client`, `id_comfortable`, `id_living`, `date_arrival`, `date_leaving`, `nutrition`) VALUES (DEFAULT, 2, 3, 3, '2023-04-03 17:00:00', '2023-04-06 14:00:00', 1);
#INSERT INTO `mydb`.`reservation` (`id_reservation`, `id_client`, `id_comfortable`, `id_living`, `date_arrival`, `date_leaving`, `nutrition`) VALUES (DEFAULT, 3, 3, 4, '2022-02-02 10:00:00', '2022-02-10 12:00:00', 1);
#INSERT INTO `mydb`.`reservation` (`id_reservation`, `id_client`, `id_comfortable`, `id_living`, `date_arrival`, `date_leaving`, `nutrition`) VALUES (DEFAULT, 4, 2, 5, '2021-05-06 12:00:00', '2021-06-06 13:00:00', NULL);
#INSERT INTO `mydb`.`reservation` (`id_reservation`, `id_client`, `id_comfortable`, `id_living`, `date_arrival`, `date_leaving`, `nutrition`) VALUES (DEFAULT, 4, 2, 6, '2021-01-02 09:00:00', '2021-02-03 10:00:00', NULL);
#INSERT INTO `mydb`.`reservation` (`id_reservation`, `id_client`, `id_comfortable`, `id_living`, `date_arrival`, `date_leaving`, `nutrition`) VALUES (DEFAULT, 5, 1, 7, '2020-12-01 11:00:00', '2020-12-05 11:00:00', 1);
#INSERT INTO `mydb`.`reservation` (`id_reservation`, `id_client`, `id_comfortable`, `id_living`, `date_arrival`, `date_leaving`, `nutrition`) VALUES (DEFAULT, 7, 1, 8, '2019-12-03 12:00:00', '2019-12-05 13:00:00', NULL);
#INSERT INTO `mydb`.`reservation` (`id_reservation`, `id_client`, `id_comfortable`, `id_living`, `date_arrival`, `date_leaving`, `nutrition`) VALUES (DEFAULT, 9, 1, 9, '2020-01-12 11:00:00', '2020-01-13 13:00:00', 1);
#INSERT INTO `mydb`.`reservation` (`id_reservation`, `id_client`, `id_comfortable`, `id_living`, `date_arrival`, `date_leaving`, `nutrition`) VALUES (DEFAULT, 10, 2, 10, '2018-03-03 10:00:00', '2018-03-05 10:00:00', NULL);
#
#SELECT * FROM reservation


#LAB3

#1.1
#select *
#from client
#order by full_name;

#select  *
#from reservation
#order by date_arrival DESC;

#select *
#from reservation
#order by date_arrival;

#1.2
#select *
#from room
#where floor=1;

#select *
#from room
#where floor=2;

#select *
#from reservation
#where nutrition=1 and date_arrival<'2022-10-20';

#1.3
#select count(*)
#from client;

#select sum(price) as SUM
#from comfortable;

#select count(*) 
#from reservation
#where nutrition;

#select count(*) 
#from reservation
#where nutrition is NULL;

#1.4
#select floor, COUNT(*) AS FloorsCount
#from room
#GROUP BY floor;

#select id_comfortable, floor, COUNT(*) 
#from room
#GROUP BY id_comfortable, floor with ROllUP;

#1.5
#select *
#from client
#WHERE passport LIKE N'%1';

#select *
#from client
#WHERE full_name LIKE N'%ович%';










