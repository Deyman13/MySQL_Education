"""Создание структуры таблиц"""

CREATE TABLE `first_homework`.`manufacturer_id` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE);


CREATE TABLE `first_homework`.`mobile_phones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `manufacturer_idx` INT NOT NULL,
  `product_count` INT NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `product_name_UNIQUE` (`product_name` ASC) VISIBLE,
  INDEX `manufacturer_idx_idx` (`manufacturer_idx` ASC) VISIBLE,
  CONSTRAINT `manufacturer_idx`
    FOREIGN KEY (`manufacturer_idx`)
    REFERENCES `first_homework`.`manufacturer_id` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


"""Заполнение таблиц"""

INSERT INTO `first_homework`.`manufacturer_id` (`id`, `name`) VALUES ('1', 'Apple');
INSERT INTO `first_homework`.`manufacturer_id` (`id`, `name`) VALUES ('2', 'Samsung');
INSERT INTO `first_homework`.`manufacturer_id` (`id`, `name`) VALUES ('3', 'Huawei');


INSERT INTO `first_homework`.`mobile_phones` (`product_name`, `manufacturer_idx`, `product_count`, `price`) VALUES ('IPhone X', '1', '3', '76000');
INSERT INTO `first_homework`.`mobile_phones` (`product_name`, `manufacturer_idx`, `product_count`, `price`) VALUES ('IPhone 8', '1', '2', '51000');
INSERT INTO `first_homework`.`mobile_phones` (`product_name`, `manufacturer_idx`, `product_count`, `price`) VALUES ('Galaxy S9', '2', '2', '56000');
INSERT INTO `first_homework`.`mobile_phones` (`product_name`, `manufacturer_idx`, `product_count`, `price`) VALUES ('Galaxy S8', '2', '1', '41000');
INSERT INTO `first_homework`.`mobile_phones` (`product_name`, `manufacturer_idx`, `product_count`, `price`) VALUES ('P20 Pro', '3', '5', '36000');

"""Первое задание:
- Выведите название, производителя и цену для товаров, количество которых превышает 2"""

USE first_homework;

SELECT mobile_phones.product_name, manufacturer_id.name, mobile_phones.price 
FROM mobile_phones 
JOIN manufacturer_id ON mobile_phones.manufacturer_idx = manufacturer_id.id 
WHERE mobile_phones.product_count > 2;

"""Второе задание:
- Выведите весь ассортимент товаров марки “Samsung”"""

SELECT mobile_phones.product_name, mobile_phones.product_count, mobile_phones.price
FROM mobile_phones
JOIN manufacturer_id ON mobile_phones.manufacturer_idx = manufacturer_id.id
WHERE manufacturer_id.name = 'Samsung';
