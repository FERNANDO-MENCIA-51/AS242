CREATE DATABASE Consultas;
 
USE Consultas;

CREATE TABLE contacto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono CHAR(9) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    mensaje TEXT NOT NULL,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO contacto (nombre, apellido, telefono, correo, mensaje, fecha_envio)
VALUES 
('Lucas', 'Leyva', '987654321', 'lucas.leyva@gmail.com', 'Prueva 1', NOW()),
('Karla', 'Magallanes', '987654321', 'karla.magallanes@gmail.com', 'Prueva 2', NOW()),
('Luis', 'Mencia', '987654321', 'luis.mencia@gmail.com', 'Prueva 1', NOW());

select * from contacto;
