CREATE DATABASE Biblioteca_Examen DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE Biblioteca_Examen;

CREATE TABLE estudiantes (
    carne int(7) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre varchar (50),
    apellido varchar (50),
    direccion varchar (100),
    telefono int (8),
    fechanacimiento date,
    codigo_grado int (10)
);
CREATE TABLE prestamos (
    cod_prestamo int (10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    codigo_libro int (10),
    carne int(7),
    fecha_prestamo date,
    fecha_devolucion date,
    cod_empleado int (10)
);
CREATE TABLE libros (
    codigo_libro int (10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    codigo_autor int (10),
    codigo_editorial int (10),
    titulo varchar (100),
    numero_paginas int,
    tamanio varchar (15),
    precio float,
    estado int(5),
    edicion int(5)
);
CREATE TABLE estados (
    cod_estado int (5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre varchar (25)
);
CREATE TABLE empleados (
    cod_empleado int (10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre varchar (50),
    apellido varchar (50),
    direccion varchar (100),
    email varchar (100)
);
CREATE TABLE grados (
    codigo_grado int (10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre varchar (25)
);
CREATE TABLE editoriales (
    codigo_editorial int (10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre varchar (25),
    direccion varchar (100),
    telefono int (8),
    email varchar (100)
);
CREATE TABLE autores (
    codigo_autor int (10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    apellido_autor varchar (50),
    nombre_autor varchar (50),
    pais_origen int (10)
);
CREATE TABLE paises (
    cod_pais int (10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre varchar (50)
);
ALTER TABLE estudiantes
ADD CONSTRAINT pk_fk_codigo_grado FOREIGN KEY (codigo_grado) REFERENCES grados (codigo_grado) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE prestamos
ADD CONSTRAINT pk_fk_carne FOREIGN KEY (carne) REFERENCES estudiantes (carne) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE prestamos
ADD CONSTRAINT pk_fk_cod_empleado FOREIGN KEY (cod_empleado) REFERENCES empleados (cod_empleado) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE prestamos
ADD CONSTRAINT pk_fk_cod_libro FOREIGN KEY (codigo_libro) REFERENCES libros (codigo_libro) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE libros
ADD CONSTRAINT pk_fk_estado FOREIGN KEY (estado) REFERENCES estados (cod_estado) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE libros
ADD CONSTRAINT pk_fk_cod_autor FOREIGN KEY (codigo_autor) REFERENCES autores (codigo_autor) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE libros
ADD CONSTRAINT pk_fk_cod_editorial FOREIGN KEY (codigo_editorial) REFERENCES editoriales (codigo_editorial) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE autores
ADD CONSTRAINT pk_fk_pais_origen FOREIGN KEY (pais_origen) REFERENCES paises (cod_pais) ON UPDATE CASCADE ON DELETE CASCADE;