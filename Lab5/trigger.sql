#1#####################################################################################################################
CREATE TRIGGER SetReservationPrice
BEFORE INSERT ON Reservation
FOR EACH ROW
BEGIN
  DECLARE _price DECIMAL(10, 2);
  DECLARE _days INT;
  DECLARE _day_nutrition_price INT;

  SET _day_nutrition_price = 10000;
  SET _days = DATEDIFF(NEW.date_leaving, NEW.date_arrival);
  SET _price = (SELECT price
                FROM Comfortable
                WHERE id_comfortable = NEW.id_comfortable) * _days;

  IF NEW.date_arrival > DATE_ADD(CURDATE(), INTERVAL 6 MONTH) THEN
    SET _price = _price * 1.1;
  END IF;

  # Стоимость питания не зависит от времени брони
  IF NEW.nutrition = 1 THEN
    SET _price = _price + _days * _day_nutrition_price;
  END IF;

  SET NEW.ovr_price = _price;
END;

INSERT INTO Reservation (id_living, id_client, id_comfortable, date_arrival, date_leaving, nutrition, ovr_price)
VALUES (16, 1, 1, '2024-12-05', '2024-12-15', 1, 0),
       (17, 2, 2, '2024-05-10', '2024-05-15', 0, 0),
       (18, 3, 3, '2024-08-20', '2024-08-25', 0, 0);

#2######################################################################################################################

CREATE TRIGGER UpdateNutrition
BEFORE UPDATE ON Reservation
FOR EACH ROW
BEGIN
    DECLARE _day_nutrition_price INT;
    SET _day_nutrition_price = 10000;

    IF NEW.nutrition <> OLD.nutrition THEN
        IF NEW.nutrition = 1 THEN
            SET NEW.ovr_price = NEW.ovr_price + DATEDIFF(NEW.date_leaving, NEW.date_arrival) * _day_nutrition_price;
        ELSE
            SET NEW.ovr_price = NEW.ovr_price - DATEDIFF(NEW.date_leaving, NEW.date_arrival) * _day_nutrition_price;
        END IF;
    END IF;
END;

UPDATE Reservation
SET nutrition = 1
WHERE id_reservation = 29;


#3######################################################################################################################

# Проверка проводится так: если есть запись в таблице living для данного room,
# и у этой записи living в промежуток проживания попадает нынешнее время, то запрет на удаление.
# Еще возможна ситуация, что date_arrival задан, а date_leaving является NULL - значит на данный момент
# в номере проживают, тоже нужно блокировать удаление.
CREATE TRIGGER DeleteRoom
BEFORE DELETE ON Room
FOR EACH ROW
BEGIN
    DECLARE room_occupied INT;
    SELECT COUNT(*)
    INTO room_occupied
    FROM Living
    WHERE id_room = OLD.id_room
      AND (factually_arrive <= NOW() AND (factually_leaving >= NOW() OR factually_leaving IS NULL));

    IF room_occupied > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Невозможно удалить: номер занят';
    ELSE
        DELETE
        FROM Reservation
        WHERE id_living IN (SELECT id_living
                            FROM Living
                            WHERE id_room = OLD.id_room);
        DELETE FROM Living WHERE id_room = OLD.id_room;
    END IF;
END;

DELETE FROM Room
WHERE id_room = 1;


