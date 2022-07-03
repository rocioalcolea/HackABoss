/*EJERCICIO 1*/

/*Creo la base de datos*/
CREATE DATABASE IF NOT EXISTS usuarios_sem8;
/*Selecciono la base de datos que he creado*/
USE usuarios_sem8;

/*Creo la tabla usuarios*/
CREATE TABLE IF NOT EXISTS usuarios(
id_usuario INT PRIMARY KEY, 
dni VARCHAR (15),
telefono INT,
email VARCHAR(100),
nombre VARCHAR (20),
apellidos VARCHAR (100),
direccion VARCHAR (100),
poblacion VARCHAR (50),
pais VARCHAR (20),
CP INT
);

/*EJERCICIO 2*/

/*copio la tabla de usuarios para obtener las direcciones y borro los campos de usuarios*/
/*no entiendo en el enunciado que significa mover, si crear de cero o copiar y modificar....*/
CREATE TABLE IF NOT EXISTS direccion LIKE usuarios; 
ALTER TABLE  direccion DROP id_usuario;
ALTER TABLE  direccion DROP dni;
ALTER TABLE  direccion DROP telefono;
ALTER TABLE  direccion DROP nombre;
ALTER TABLE  direccion DROP apellidos;
ALTER TABLE  direccion DROP email;
ALTER TABLE direccion ADD  id_direccion INT Primary key;

/*modificamos usuarios para eliminar los campos de direccion*/
ALTER TABLE  usuarios DROP direccion;
ALTER TABLE  usuarios DROP pais;
ALTER TABLE  usuarios DROP CP;
ALTER TABLE  usuarios DROP poblacion;
ALTER TABLE  usuarios ADD  id_direccion INT,
/*añadirmos clave foranea relacionada con la tabla de direccion*/
ADD constraint `fk_id_direccion` FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion);


/*EJERCICIO 3*/

/*relleno la tabla con los datos proporcionados, comenzando con direccion para completar usuarios sin error*/
INSERT INTO direccion (direccion, poblacion,pais, CP, id_direccion) VALUES("98339 Loftsgordon Road","Babakanbandung","Indonesia",83297,1); 
INSERT INTO direccion (direccion, poblacion,pais, CP, id_direccion) VALUES("74641 Dwight Avenue","Bilar","Philippines",44455,2); 
INSERT INTO direccion (direccion, poblacion,pais, CP, id_direccion) VALUES("9510 Milwaukee Street","Sumberejo","Indonesia",62965,3); 
INSERT INTO direccion (direccion, poblacion,pais, CP, id_direccion) VALUES("8902 Doe Crossing Alley","Steinkjer","Norway",54756,4); 
INSERT INTO direccion (direccion, poblacion,pais, CP, id_direccion) VALUES("8616 Stephen Hill","Charleston","United States",51471,5); 


INSERT INTO usuarios (id_usuario,dni, telefono,email, nombre, apellidos, id_direccion) VALUES(1,"279948941-9",993870144,"ilethem0@google.com.au","Irvin", "Lethem",1); 
INSERT INTO usuarios (id_usuario,dni, telefono,email, nombre, apellidos, id_direccion) VALUES(2,"748551874-7",497494899,"kmungan1@howstuffworks.com","Kylie", "Mungan",2); 
INSERT INTO usuarios (id_usuario,dni, telefono,email, nombre, apellidos, id_direccion) VALUES(3,"215649413-4",776631050,"ydibbert2@businesswire.com","Yul", "Dibbert",3); 
INSERT INTO usuarios (id_usuario,dni, telefono,email, nombre, apellidos, id_direccion) VALUES(4,"617064473-7",921948685,"tmcgorley3@studiopress.com","Tamra", "Mc Gorley",4); 
INSERT INTO usuarios (id_usuario,dni, telefono,email, nombre, apellidos, id_direccion) VALUES(5,"178988896-4",304168000,"eimbrey4@cpanel.net","Elmira", "Imbrey",5); 

/*EJERCICIO 4*/
/*selecciono nombre, apellido y telefono ordenados alfabeticamente por apellido*/
SELECT nombre, apellidos, telefono FROM usuarios ORDER BY apellidos;

/*cuantos usuarios hay de cada pais*/
SELECT pais, COUNT(*) FROM direccion GROUP BY pais;