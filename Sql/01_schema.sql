-- DDL: Creación de la estructura de la tabla empleados
CREATE TABLE IF NOT EXISTS empleados (  
    id INT AUTO_INCREMENT PRIMARY KEY,  
    nombre VARCHAR(100) NOT NULL,  
    email VARCHAR(150) NOT NULL UNIQUE,  
    departamento VARCHAR(100) NOT NULL,  
    puesto VARCHAR(100) NOT NULL,  
    fecha_ingreso DATE NOT NULL,  
    saldo_vacaciones INT NOT NULL DEFAULT 0,  
    banco_horas DECIMAL(5,1) NOT NULL DEFAULT 0,  
    modalidad VARCHAR(20) NOT NULL DEFAULT 'hibrido'  
);