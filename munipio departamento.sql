-- en Mysql

-- DDL
CREATE DATABASE MunicipioBD;

use MunicipioBD;

CREATE TABLE Pais(
ID int AUTO_INCREMENT NOT NULL primary key,
Nombre VARCHAR(50) NOT NULL UNIQUE,
Poblacion_total INT NOT NULL,
Cantidad_hombres INT NOT NULL,
Cantidad_mujeres INT NOT NULL,
Edad_promedio DECIMAL(5,2),
Temperatura_promedio DECIMAL(6,2) NOT NULL,
Ingreso_promedio DECIMAL(12,2) NOT NULL
);

CREATE TABLE Geografia (
ID int NOT NULL primary key AUTO_INCREMENT,
Nombre VARCHAR(50) NOT NULL unique,
Poblacion_total INT ,
Cantidad_hombres INT,
Cantidad_mujeres INT ,
Edad_promedio DECIMAL(5,2) NOT NULL,
Temperatura_promedio DECIMAL(6,2) NOT NULL,
Ingreso_promedio DECIMAL(12,2) NOT NULL,
ID_Pais INT NOT NULL,
Tipo ENUM('Departamento', 'Estado', 'Provincia', 'Region') NOT NULL,
FOREIGN KEY (ID_Pais) REFERENCES Pais (ID)
);

CREATE TABLE Municipio (
ID int AUTO_INCREMENT NOT NULL primary key,
Nombre VARCHAR(50) NOT NULL unique,
Poblacion_total INT ,
Cantidad_hombres INT ,
Cantidad_mujeres INT ,
Edad_promedio DECIMAL(5,2) NOT NULL,
Temperatura_promedio DECIMAL(6,2) NOT NULL,
Ingreso_promedio DECIMAL(12,2) NOT NULL,
ID_Geografia INT,
Es_Capital TINYINT(1) NOT NULL DEFAULT 0,
FOREIGN KEY (ID_Geografia) REFERENCES Geografia(ID)
);

-- DML

INSERT INTO Pais(ID,Nombre,Poblacion_total,Cantidad_hombres,Cantidad_mujeres,Edad_promedio,Temperatura_promedio, Ingreso_promedio)
VALUES
    (1, 'Colombia', 52300000, 25480000, 26520000, 31.2, 32.4, 14000000),
    (2, 'Venezuela', 28400000, 13326040, 13356000, 30.3, 24.5, 14000),
    (3, 'Argentina', 46000000, 22000000, 24000000, 32.0, 15.5, 20000),
    (4, 'Brasil', 214000000, 104000000, 110000000, 30.5, 26.0, 18000),
    (5, 'Chile', 19200000, 9100000, 10100000, 35.0, 14.0, 25000),
    (6, 'Perú', 34000000, 17000000, 17000000, 29.8, 22.0, 15000),
    (7, 'México', 126000000, 61000000, 65000000, 29.0, 20.5, 16000),
    (8, 'Uruguay', 3500000, 1700000, 1800000, 34.5, 17.5, 28000);



INSERT INTO Geografia (ID,Nombre, Poblacion_total, Cantidad_hombres, Cantidad_mujeres, Edad_promedio, Temperatura_promedio, Ingreso_promedio, ID_pais, Tipo)
VALUES
(1,'Amazonas', 80000, 40000, 40000, 27, 28.0, 500000, 1,'Departamento'),
(2,'Antioquia', 6620000, 3200000, 3420000, 31, 22.5, 1200000, 1,'Departamento'),
(3,'Arauca', 270000, 135000, 135000, 28, 27.0, 900000, 1,'Departamento'),
(4,'Atlántico', 2560000, 1230000, 1330000, 30, 28.5, 1000000, 1,'Departamento'),
(5,'Bolívar', 2170000, 1080000, 1090000, 29, 27.8, 950000, 1,'Departamento'),
(6,'Boyacá', 1200000, 600000, 600000, 32, 14.0, 850000, 1,'Departamento'),
(7,'Caldas', 998000, 500000, 498000, 30, 18.5, 1100000, 1,'Departamento'),
(8,'Caquetá', 400000, 200000, 200000, 28, 24.0, 750000, 1,'Departamento'),
(9,'Casanare', 400000, 200000, 200000, 30, 26.0, 1150000, 1,'Departamento'),
(10,'Cauca', 1450000, 720000, 730000, 29, 20.5, 850000, 1,'Departamento'),
(11,'Cesar', 1200000, 590000, 610000, 30, 28.0, 950000, 1,'Departamento'),
(12,'Chocó', 520000, 260000, 260000, 27, 26.5, 700000, 1,'Departamento'),
(13,'Córdoba', 1800000, 900000, 900000, 28, 29.0, 950000, 1,'Departamento'),
(14,'Cundinamarca', 3000000, 1500000, 1500000, 32, 15.0, 1400000, 1,'Departamento'),
(15,'Guainía', 55000, 27500, 27500, 26, 28.0, 600000, 1,'Departamento'),
(16,'Guaviare', 100000, 50000, 50000, 27, 26.0, 650000, 1,'Departamento'),
(17,'Huila', 1200000, 600000, 600000, 30, 24.5, 1100000, 1,'Departamento'),
(18,'La Guajira', 1020000, 490000, 530000, 28, 29.5, 850000, 1,'Departamento'),
(19,'Magdalena', 1300000, 640000, 660000, 29, 28.5, 900000, 1,'Departamento'),
(20,'Meta', 1100000, 550000, 550000, 29, 25.5, 1100000, 1,'Departamento'),
(21,'Nariño', 1850000, 910000, 940000, 30, 18.0, 900000, 1,'Departamento'),
(22,'Norte de Santander', 1400000, 700000, 700000, 31, 27.0, 1000000, 1,'Departamento'),
(23,'Putumayo', 350000, 175000, 175000, 28, 23.5, 700000, 1,'Departamento'),
(24,'Quindío', 550000, 270000, 280000, 30, 19.5, 1150000, 1,'Departamento'),
(25,'Risaralda', 1000000, 490000, 510000, 31, 20.5, 1200000, 1,'Departamento'),
(26,'San Andrés y Providencia', 80000, 40000, 40000, 29, 27.0, 1300000, 1,'Departamento'),
(27,'Santander', 2200000, 1100000, 1100000, 32, 20.0, 1350000, 1,'Departamento'),
(28,'Sucre', 900000, 450000, 450000, 28, 27.5, 850000, 1,'Departamento'),
(29,'Tolima', 1400000, 700000, 700000, 31, 24.0, 1100000, 1,'Departamento'),
(30,'Valle del Cauca', 4700000, 2300000, 2400000, 30, 24.5, 1400000, 1,'Departamento'),
(31,'Vaupés', 40000, 20000, 20000, 27, 26.5, 500000, 1,'Departamento'),
(32,'Vichada', 100000, 50000, 50000, 28, 27.0, 600000, 1,'Departamento'),
(33,'Amazonas de Venezuela', 200000, 100000, 100000, 25.5, 26.8, 2000000, 2,'Estado'),
(34,'Anzoátegui', 1400000, 700000, 700000, 30.2, 28.5, 2500000, 2,'Estado'),
(35,'Apure', 500000, 250000, 250000, 29.0, 27.8, 1800000, 2,'Estado'),
(36,'Aragua', 1700000, 850000, 850000, 31.0, 27.5, 3000000, 2,'Estado'),
(37,'Barinas', 600000, 300000, 300000, 28.5, 26.5, 2200000, 2,'Estado'),
(38,'Bolívar de Venezuela', 1800000, 900000, 900000, 28.5, 27.0, 2800000, 2,'Estado'),
(39,'Carabobo', 2100000, 1050000, 1050000, 30.0, 27.0, 3100000, 2,'Estado'),
(40,'Cojedes', 400000, 200000, 200000, 29.5, 28.2, 1900000, 2,'Estado'),
(41,'Delta Amacuro', 150000, 75000, 75000, 27.0, 28.0, 1600000, 2,'Estado'),
(42,'Distrito Capital', 2200000, 1080000, 1120000, 33.0, 24.0, 4000000, 2,'Estado'),
(43,'Falcón', 900000, 450000, 450000, 30.0, 29.0, 2300000, 2,'Estado'),
(44,'Guárico', 800000, 400000, 400000, 29.0, 26.8, 2000000, 2,'Estado'),
(45,'Lara', 1800000, 900000, 900000, 32.0, 27.5, 2900000, 2,'Estado'),
(46,'Mérida', 900000, 450000, 450000, 28.0, 20.5, 2500000, 2,'Estado'),
(47,'Miranda', 3000000, 1500000, 1500000, 31.5, 25.5, 3500000, 2,'Estado'),
(48,'Monagas', 1200000, 600000, 600000, 29.8, 28.0, 2700000, 2,'Estado'),
(49,'Nueva Esparta', 500000, 250000, 250000, 30.5, 28.5, 3500000, 2,'Estado'),
(50,'Portuguesa', 900000, 450000, 450000, 29.0, 27.5, 2100000, 2,'Estado'),
(51,'Sucre de Venezuela', 1100000, 550000, 550000, 30.5, 28.0, 2400000, 2,'Estado'),
(52,'Táchira', 1400000, 700000, 700000, 28.5, 22.0, 2600000, 2,'Estado'),
(53,'Trujillo', 800000, 400000, 400000, 28.0, 23.0, 2000000, 2,'Estado'),
(54,'Vargas', 400000, 200000, 200000, 30.5, 27.5, 2600000, 2,'Estado'),
(55,'Yaracuy', 700000, 350000, 350000, 29.5, 27.5, 2400000, 2,'Estado'),
(56,'Zulia', 4000000, 2000000, 2000000, 29.0, 29.5, 3100000, 2,'Estado'),
(57,'Buenos Aires', 17541141, 8630000, 8911141, 32.5, 16.9, 35000.00, 3,'Provincia'),
(58,'Córdoba de Argentina', 3760450, 1850000, 1910450, 31.2, 18.2, 34000.00, 3,'Provincia'),
(59,'Santa Fe', 3569168, 1740000, 1829168, 32.0, 17.5, 33000.00, 3,'Provincia'),
(60,'CABA', 3075646, 1470000, 1605646, 36.0, 17.0, 60000.00, 3,'Provincia'),
(61,'Mendoza', 2043266, 1010000, 1033266, 34.5, 14.6, 32000.00, 3,'Provincia'),
(62,'Tucumán', 1806149, 870000, 936149, 30.8, 20.4, 28000.00, 3,'Provincia'),
(63,'Entre Ríos', 1385966, 680000, 706966, 32.0, 18.5, 27000.00, 3,'Provincia'),
(64,'Salta', 1527760, 750000, 777760, 28.7, 21.3, 26000.00, 3,'Provincia'),
(65,'Misiones', 1307201, 646000, 661201, 28.6, 22.4, 24000.00, 3,'Provincia'),
(66,'Chaco', 1204541, 590000, 614541, 27.8, 22.0, 23000.00, 3,'Provincia'),
(67,'Corrientes', 1203094, 592000, 611094, 28.2, 22.3, 23000.00, 3,'Provincia'),
(68,'Santiago del Estero', 1008187, 495000, 513187, 26.9, 23.2, 22000.00, 3,'Provincia'),
(69,'San Juan', 818234, 400000, 418234, 31.0, 17.8, 25000.00, 3,'Provincia'),
(70,'Jujuy', 797955, 389000, 408955, 27.2, 18.6, 22000.00, 3,'Provincia'),
(71,'Río Negro', 747610, 365000, 382610, 34.2, 11.2, 30000.00, 3,'Provincia'),
(72,'Neuquén', 726590, 354000, 372590, 35.4, 13.6, 35000.00, 3,'Provincia'),
(73,'Formosa', 606041, 295000, 311041, 25.0, 24.5, 20000.00, 3,'Provincia'),
(74,'Chubut', 618994, 302000, 316994, 36.0, 12.4, 37000.00, 3,'Provincia'),
(75,'San Luis', 540905, 265000, 275905, 32.8, 16.0, 28000.00, 3,'Provincia'),
(76,'Catamarca', 429556, 209000, 220556, 29.8, 20.2, 20000.00, 3,'Provincia'),
(77,'La Rioja', 393531, 190000, 203531, 30.5, 19.4, 22000.00, 3,'Provincia'),
(78,'La Pampa', 366022, 178000, 188022, 35.0, 14.5, 32000.00, 3,'Provincia'),
(79,'Santa Cruz', 333473, 162000, 171473, 37.5, 8.8, 40000.00, 3,'Provincia'),
(80,'Tierra del Fuego', 190641, 94000, 96641, 34.0, 5.2, 45000.00, 3,'Provincia');


INSERT INTO Municipio (Nombre, Poblacion_total, Cantidad_hombres, Cantidad_mujeres, Edad_promedio, Temperatura_promedio, Ingreso_promedio, ID_Geografia, Es_Capital)
VALUES
('Leticia', 50000, 25000, 25000, 27, 28.0, 500000, 1, 1),  -- Amazonas
('Medellín', 2500000, 1200000, 1300000, 30, 22.5, 1500000, 2, 1), -- Antioquia
('Arauca', 80000, 40000, 40000, 28, 27.0, 900000, 3, 1), -- Arauca
('Barranquilla', 1200000, 600000, 600000, 30, 28.5, 1200000, 4, 1), -- Atlántico
('Cartagena', 1030000, 500000, 530000, 30, 28.0, 1100000, 5, 1), -- Bolívar
('Tunja', 200000, 100000, 100000, 31, 14.0, 950000, 6, 1), -- Boyacá
('Manizales', 400000, 200000, 200000, 29, 18.5, 1100000, 7, 1), -- Caldas
('Florencia', 200000, 100000, 100000, 28, 24.0, 750000, 8, 1), -- Caquetá
('Yopal', 180000, 90000, 90000, 30, 26.0, 1150000, 9, 1), -- Casanare
('Popayán', 300000, 150000, 150000, 30, 20.5, 950000, 10, 1), -- Cauca
('Valledupar', 450000, 220000, 230000, 30, 28.0, 1000000, 11, 1), -- Cesar
('Quibdó', 130000, 65000, 65000, 27, 26.5, 800000, 12, 1), -- Chocó
('Montería', 500000, 250000, 250000, 28, 29.0, 950000, 13, 1), -- Córdoba
('Bogotá', 8000000, 3900000, 4100000, 32, 15.0, 3000000, 14, 1), -- Cundinamarca (Bogotá es Distrito Capital)
('Inírida', 50000, 25000, 25000, 26, 28.0, 600000, 15, 1), -- Guainía
('San José del Guaviare', 70000, 35000, 35000, 27, 26.0, 650000, 16, 1), -- Guaviare
('Neiva', 400000, 200000, 200000, 30, 24.5, 1100000, 17, 1), -- Huila
('Riohacha', 270000, 130000, 140000, 28, 29.5, 850000, 18, 1), -- La Guajira
('Santa Marta', 500000, 250000, 250000, 29, 28.5, 900000, 19, 1), -- Magdalena
('Villavicencio', 550000, 270000, 280000, 29, 25.5, 1100000, 20, 1), -- Meta
('Pasto', 400000, 200000, 200000, 30, 18.0, 900000, 21, 1), -- Nariño
('Cúcuta', 700000, 350000, 350000, 31, 27.0, 1000000, 22, 1), -- Norte de Santander
('Mocoa', 100000, 50000, 50000, 28, 23.5, 700000, 23, 1), -- Putumayo
('Armenia', 300000, 150000, 150000, 30, 19.5, 1150000, 24, 1), -- Quindío
('Pereira', 500000, 250000, 250000, 31, 20.5, 1200000, 25, 1), -- Risaralda
('San Andrés', 80000, 40000, 40000, 29, 27.0, 1300000, 26, 1), -- San Andrés y Providencia
('Bucaramanga', 600000, 300000, 300000, 32, 20.0, 1350000, 27, 1), -- Santander
('Sincelejo', 300000, 150000, 150000, 28, 27.5, 850000, 28, 1), -- Sucre
('Ibagué', 500000, 250000, 250000, 31, 24.0, 1100000, 29, 1), -- Tolima
('Cali', 2500000, 1200000, 1300000, 30, 24.5, 1400000, 30, 1), -- Valle del Cauca
('Mitú', 30000, 15000, 15000, 27, 26.5, 500000, 31, 1), -- Vaupés
('Puerto Carreño', 20000, 10000, 10000, 28, 27.0, 600000, 32, 1), -- Vichada
('Soacha', 695000, 340000, 355000, 30.0, 14.5, 1400000, 14, 0);  



-- 1.Agregar un municipio
INSERT INTO municipio municipio (Nombre, Poblacion_total, Cantidad_hombres, Cantidad_mujeres, Edad_promedio, Temperatura_promedio, Ingreso_promedio, ID_Geografia, Es_Capital)
VALUES
('Melgar', 10000, 10000, 20000, 31.2, 25.0, 1100000, 29, 0);

-- 2.Actualizar las poblaciones y ingreso de municipio

UPDATE Municipio
SET Poblacion_total = 400000, Cantidad_hombres = 200000, Cantidad_mujeres = 200000, Ingreso_promedio = 9200000
WHERE Nombre = 'Soacha';

-- 3.Borrar numicipio de Melgar
delete from municipio where Nombre= 'Melgar';

-- 4.ver municipio de un departamento
SELECT g.Nombre AS Nombre_Departamento
FROM Municipio m
JOIN Geografia g ON m.ID_Geografia = g.ID
WHERE m.Nombre = 'Medellín'; -- cualquier nombre de un municipio

-- 5.consulta de valor mayor de ingreso promedio
SELECT Nombre FROM Geografia WHERE Ingreso_promedio > 1000000;

-- 6.consulta de igual de valor Poblacion total 
SELECT Nombre FROM Geografia WHERE Poblacion_total = 3000000;

-- 7.visualizar total de poblaciones
SELECT Nombre as Nombre_Deparatmento, Poblacion_total FROM Geografia where id_pais=1; -- solo pais de Colombia

-- 8.Visualizar el total del poblaciones
SELECT SUM(Poblacion_total) AS Poblacion_Nacional FROM Geografia where id_pais = 1; -- solo pais de Colombia

-- trigger suma hombre y mujer total cantidad
DELIMITER $$

CREATE TRIGGER check_population_municipio
BEFORE INSERT ON Municipio
FOR EACH ROW
BEGIN
    IF NEW.Poblacion_total <> (NEW.Cantidad_hombres + NEW.Cantidad_mujeres) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La población total debe ser igual a la suma de hombres y mujeres.';
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER check_population_municipio_update
BEFORE UPDATE ON Municipio
FOR EACH ROW
BEGIN
    IF NEW.Poblacion_total <> (NEW.Cantidad_hombres + NEW.Cantidad_mujeres) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La población total debe ser igual a la suma de hombres y mujeres.';
    END IF;
END $$

DELIMITER ;


-- no puede eliminar municipio capital
DELIMITER $$

CREATE TRIGGER prevent_delete_capital
BEFORE DELETE ON Municipio
FOR EACH ROW
BEGIN
    IF OLD.Es_Capital = 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: No puedes eliminar un municipio capital.';
    END IF;
END $$

DELIMITER ;

-- Actualizar las poblaciones

DELIMITER $$

CREATE TRIGGER update_population_departamento
AFTER INSERT ON Municipio
FOR EACH ROW
BEGIN
    UPDATE Geografia
    SET Poblacion_total = (
        SELECT SUM(Poblacion_total) FROM Municipio WHERE ID_Geografia = NEW.ID_Geografia
    )
    WHERE ID = NEW.ID_Geografia;
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER update_population_departamento_update
AFTER UPDATE ON Municipio
FOR EACH ROW
BEGIN
    UPDATE Geografia
    SET Poblacion_total = (
        SELECT SUM(Poblacion_total) FROM Municipio WHERE ID_Geografia = NEW.ID_Geografia
    )
    WHERE ID = NEW.ID_Geografia;
END $$

DELIMITER $$

CREATE TRIGGER update_population_departamento_delete
AFTER DELETE ON Municipio
FOR EACH ROW
BEGIN
    UPDATE Geografia
    SET Poblacion_total = (
        SELECT IFNULL(SUM(Poblacion_total), 0) FROM Municipio WHERE ID_Geografia = OLD.ID_Geografia
    )
    WHERE ID = OLD.ID_Geografia;
END $$

DELIMITER ;
