CREATE DATABASE dbsalestechet
USE dbsalestechnet
GO

SELECT name, database_id, create_date
FROM sys.databases;
GO



/* Crear esquema lamado Ventas */
CREATE SCHEMA Ventas
GO

/* Crear esquema llamdo RRHH*/

CREATE SCHEMA RRHH
GO

/* */

SELECT * FROM sys.schemas;
GO

/* Crear ujn tabla TBCLIENTE*/
CREATE TABLE TBCLIENTE (
	DNI char(8),
	NOMBRE varchar(90),
	APELLIDOS varchar(90)
)
GO

/* Listar las tablas de la base de datos*/

SELECT * FROM sys.tables
GO

/* Transferir la tabla cliente al esquema Venta*/

ALTER SCHEMA Ventas
TRANSFER dbo.TBCLIENTE
GO

/* Crear una tabla Producto con los campos: Codigo, Descripción y Precio */
CREATE TABLE Producto (
    Codigo INT PRIMARY KEY,
    Descripcion VARCHAR(255),
    Precio DECIMAL(10, 2)
);
GO

/* Transferir la tabla Producto al esquema Ventas */
ALTER SCHEMA Ventas
TRANSFER dbo.Producto;
GO

/* Crear una tabla Vendedor con los campos: DNI, Nombres, Apellidos y Cargo */
CREATE TABLE Vendedor (
    DNI CHAR(8) PRIMARY KEY,
    Nombres VARCHAR(90),
    Apellidos VARCHAR(90),
    Cargo VARCHAR(50)
);
GO

/* Transferir la tabla Producto al esquema RRHH */
ALTER SCHEMA RRHH
TRANSFER dbo.Vendedor;
GO

SELECT * FROM sys.tables
GO

/* Tipos de datos de usuarios*/

/* Listar los tipos de datos de usuario*/
SELECT NAME FROM systypes;

/* Crear un tipo de usuario con Procedimiento Almacenado*/
SP_ADDTYPE fono,  'char(9)', 'NULL'
GO

/* Crear Tipo de datos SEXO (1 caracter)*/
SP_ADDTYPE sexo,  'char(1)', 'NULL'
GO
/* Crear Tipo de datos DNI (8 caracter)*/
SP_ADDTYPE dni,  'char(8)', 'NULL'
GO
/* Crear Tipo de datos PRECIO (decimal 8,2)*/
SP_ADDTYPE precio,  'decimal(8,2)', 'NULL'
GO
/* Crear tipos de usuarios con CREATE TYPE*/

CREATE TYPE SUELDO FROM decimal(8,2) NOT NULL
GO

/* Crear Tipo de datos FNACIMIENTO (date)*/
CREATE TYPE ENACIEMIENTO FROM DATE NOT NULL

/* Crear Tipo de dato StocK (int)*/
CREATE TYPE STOCK FROM INT NULL
GO
/* ELiminar Tipo de datos */



/*** Tipos de Tablas ***/
-- Tablas temporales locales

CREATE TABLE TBTPRODUCTO
(
	ID int,
	PRODUCTO varchar(60),
	DESCRIPCION varchar(100),
	documento dni
)
GO

-- Solo se ejecuta en la sesion que fue creada
select * from #TBTPRODUCTO 
GO

/* TABALAS TEMPORALES GLOBALES */

CREATE TABLE ##CATEGORIA
(
	CODIGO char(1),
	NOMBRE varchar(20),
	DESCRIPCION varchar(100)
)

-- Estarán disponibles en todas las sesiones abiertas
select * from ##CATEGORIA 
GO

/*Variables tipos tabla (se tiene que ejecutar en bloque)*/
DECLARE @TBCOLABORADOR TABLE
(
	CODIGO char(5),
	NOMBRES varchar(60),
	APELLIDOS varchar(100)
)
SELECT * FROM @TBCOLABORADOR
go

/*Tablas fisicas*/

CREATE TABLE TBPROVEEDOR
(
	RUC char(11),
	RAZ_SOCIAL varchar(100),
	UBIGEO char(6)
)
GO

SELECT * FROM TBPROVEEDOR
GO

/* Creamos un filegroup y le asociamos a un archivo fisico*/
ALTER DATABASE dbsalestechnet
ADD FILEGROUP VENTAS
GO

ALTER DATABASE dbsalestechnet
ADD FILE
(
    NAME = 'data_ventas_2023',
    FILENAME = 'C:Data\data_ventas_2023',
    SIZE = 100MB
)
TO FILEGROUP VENTAS;
GO

/* Funcion de particion*/

	CREATE PARTITION FUNCTION fnpNumerador (int)
	AS RANGE LEFT
	FOR VALUES(50,	200)
	GO