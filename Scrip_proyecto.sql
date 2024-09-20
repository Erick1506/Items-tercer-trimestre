-- Crear base de datos 
create database Proyecto;
use Proyecto;
SET SQL_SAFE_UPDATES = 0;

-- Creacion de las tablas 
create table Categoria(
Id_Categoria int auto_increment not null,
Nombre_Categoria varchar (400) not null,
Descripcion_Categoria varchar(200) not null,
primary key (Id_categoria)
);

create table Clasificacion (
Id_Clasificacion int auto_increment not null,
Nombre_Clasificacion varchar(200) not null,
Descripcion_Clasificacion varchar(200) not null,
Id_Categoria int,
primary key (Id_clasificacion),
foreign key (Id_categoria) references Categoria(Id_categoria)
);

create table Estado_Producto(
Id_Estado_Producto  int auto_increment not null,
Tipo_Estado_Producto varchar(200) not null,
primary key (Id_Estado_Producto)
);
create table Marca(
Id_Marca int auto_increment not null,
Marca_Producto varchar(200) not null,
primary key (Id_Marca)
);

create table Fecha_Vencimiento(
Id_Fecha_Vencimiento int auto_increment not null,
Fecha_Vencimiento date not null,
primary key (Id_Fecha_Vencimiento )
);

create table Producto(
Id_Producto int auto_increment not null,
Nombre_Producto varchar (200) not null,
Descripcion_Producto varchar(200) not null,
Codigo_Barras int not null,
Costo_Adquisicion double not null,
Peso varchar (200) not null,
Precio double not null,
Cantidad_Stock int not null,
Id_Clasificacion int,
Id_Categoria int,
Id_Estado_Producto int,
Id_Marca int,
Id_Fecha_Vencimiento int,
primary key(Id_Producto),
foreign key (Id_Clasificacion) references Clasificacion(Id_Clasificacion),
foreign key (Id_Categoria) references Categoria(Id_Categoria),
foreign key (Id_Estado_Producto) references Estado_Producto(Id_Estado_Producto),
foreign key (Id_Marca) references Marca(Id_Marca),
foreign key (Id_Fecha_Vencimiento) references Fecha_Vencimiento(Id_Fecha_Vencimiento)
);

create table Turno(
Id_Turno int auto_increment not null,
Turno varchar(45),
primary key(Id_Turno)
);

create table Regente(
Id_Regente int auto_increment not null,
Nombre varchar(45) not null,
Apellido varchar(45) not null,
DNI int not null,
Fecha_Contratacion date not null,
Licencia int not null,
Correo varchar(45) not null,
Telefono float,
Id_Turno int,
Contraseña varchar(200),
primary key(Id_Regente),
foreign key (Id_Turno) references Turno(Id_Turno)
);

create table Comprobante(
Id_Comprobante int auto_increment not null,
Cantidad int not null,
Fecha_Venta date not null,
Total int not null,
Id_Regente int,
Id_Producto int,
primary key(Id_Comprobante),
foreign key (Id_Regente) references Regente(Id_Regente),
foreign key (Id_Producto) references Producto(Id_Producto)
);

create table Administrador(
Id_Administrador int auto_increment not null,
Nombre varchar(45) not null,
Apellido varchar(45) not null,
Correo varchar(45) not null,
Telefono float not null,
Contraseña varchar(200),
primary key (Id_Administrador)
);
      
Create table Fecha_Stock(
Id_Fecha_Stock int auto_increment not null,
Fecha_Stock date not null,
primary key(Id_Fecha_Stock)
);


create table Notificacion_Stock(
Id_Notificacion int auto_increment not null,
Mensaje varchar(200) not null,
Id_Administrador int,
Id_Fecha_Stock int,
primary key(Id_Notificacion),
foreign key (Id_Administrador) references Administrador(Id_Administrador),
foreign key (Id_Fecha_Stock) references Fecha_Stock(Id_Fecha_Stock)
);


create table Fecha_Insercion(
Id_Fecha_Insercion int auto_increment not null,
Fecha_Insercion varchar(45) not null,
primary key (Id_Fecha_Insercion)
);


create table Formula_Medica(
Id_Formula int auto_increment not null,
Nombre_Paciente varchar(45) not null,
Identificacion_Paciente int not null,
Id_Administrador int,
Id_Fecha_Insercion int,
primary key(Id_Formula),
foreign key (Id_Administrador) references Administrador(Id_Administrador),
foreign key (Id_Fecha_Insercion) references Fecha_Insercion(Id_Fecha_Insercion)
);


create table Proveedor(
Id_Proveedor int auto_increment not null,
Nombre_Proveedor varchar(45) not null,
Direccion_Proveedor varchar(45) not null,
Correo varchar(45) not null,
Telefono float not null,
Id_Administrador int,
Primary key (Id_Proveedor),
foreign key (Id_Administrador) references Administrador(Id_Administrador)
);

create table Descuento(
Id_Descuento int auto_increment not null,
Descuento Double not null,
primary key(Id_Descuento)
);

create table Fecha_Inicio(
Id_Fecha_Inicio int auto_increment not null,
Fecha_Inicio Date not null,
primary key(Id_Fecha_Inicio)
);


create table Fecha_Fin(
Id_Fecha_Fin int auto_increment not null,
Fecha_Fin Date not null,
primary key(Id_Fecha_Fin)
);

CREATE TABLE Tipo_Promocion (
    Id_Tipo_Promocion INT AUTO_INCREMENT NOT NULL,
    Tipo_Promocion VARCHAR(50) NOT NULL,
    PRIMARY KEY(Id_Tipo_Promocion)
);

CREATE TABLE Promocion (
    Id_Promocion INT AUTO_INCREMENT NOT NULL,
    Id_Administrador INT,
    Id_Producto INT,
    Id_Descuento INT,
    Id_Fecha_Inicio INT,
    Id_Fecha_Fin INT,
    Id_Tipo_Promocion INT,  -- Agregada esta columna
    PRIMARY KEY(Id_Promocion),
    FOREIGN KEY (Id_Administrador) REFERENCES Administrador (Id_Administrador),
    FOREIGN KEY (Id_Producto) REFERENCES Producto (Id_Producto),
    FOREIGN KEY (Id_Descuento) REFERENCES Descuento (Id_Descuento),
    FOREIGN KEY (Id_Fecha_Inicio) REFERENCES Fecha_Inicio (Id_Fecha_Inicio),
    FOREIGN KEY (Id_Fecha_Fin) REFERENCES Fecha_Fin (Id_Fecha_Fin),
    FOREIGN KEY (Id_Tipo_Promocion) REFERENCES Tipo_Promocion (Id_Tipo_Promocion)
);


create table Tipo_Transaccion(
Id_Tipo_Transaccion int auto_increment not null,
Tipo_Transaccion varchar(45),
primary key(Id_Tipo_Transaccion)
);

create table Transacciones(
Id_Transacciones int auto_increment not null,
Fecha_Transacciones date not null,
Cantidad int not null,
Detalles_Adicionales varchar(45) not null,
Id_Administrador int,
Id_Producto int,
Id_Tipo_Transaccion int,
primary key(Id_Transacciones),
foreign key (Id_Administrador) references Administrador(Id_Administrador),
foreign key (Id_Producto) references Producto(Id_Producto),
foreign key (Id_Tipo_Transaccion) references Tipo_Transaccion(Id_Tipo_Transaccion)
);

-- Insertar datos en la tabla Categoria
INSERT INTO Categoria (Id_Categoria, Nombre_Categoria, Descripcion_Categoria) VALUES 
(1,'Medicamentos', 'Medicamentos generales'),
(2,'Suplementos', 'Suplementos alimenticios'),
(3,'Cuidado Personal', 'Productos de cuidado personal'),
(4,'Instrumental', 'Instrumentos médicos'),
(5,'Ortopedia', 'Equipos ortopédicos'),
(6,'Higiene', 'Productos de higiene personal'),
(7,'Bebidas', 'Bebidas medicinales'),
(8,'Accesorios', 'Accesorios médicos'),
(9,'Vitaminas', 'Vitaminas y minerales'),
(10,'Belleza', 'Productos de belleza'),
(11,'Calzado', 'Calzado ortopédico'),
(12,'Cosméticos', 'Cosméticos medicinales'),
(13,'Ropa Médica', 'Uniformes y ropa para médicos'),
(14,'Protección', 'Equipos de protección personal'),
(15,'Electrónica', 'Dispositivos electrónicos médicos'),
(16,'Herbolarios', 'Productos a base de hierbas'),
(17,'Diabetes', 'Productos para diabéticos'),
(18,'Inmunología', 'Medicamentos para el sistema inmunológico'),
(19,'Geriatría', 'Productos para personas mayores'),
(20,'Pediatría', 'Productos para niños');

-- Insertar datos en la tabla Clasificacion
INSERT INTO Clasificacion (Id_Clasificacion, Nombre_Clasificacion, Descripcion_Clasificacion, Id_Categoria) VALUES 
(1,'Analgésicos', 'Medicamentos para aliviar el dolor', 1),
(2,'Multivitamínicos', 'Suplementos con varias vitaminas', 2),
(3,'Champú', 'Producto para el cuidado del cabello', 3),
(4,'Pinzas Quirúrgicas', 'Instrumental utilizado en cirugías', 4),
(5,'Sillas de Ruedas', 'Equipos ortopédicos para movilidad', 5),
(6,'Jabón Antibacterial', 'Producto de higiene para manos', 6),
(7,'Agua Mineral', 'Bebida rica en minerales', 7),
(8,'Estetoscopio', 'Accesorio utilizado por médicos', 8),
(9,'Vitamina C', 'Suplemento de ácido ascórbico', 9),
(10,'Maquillaje Hipoalergénico', 'Productos de belleza para pieles sensibles', 10),
(11,'Zapatos Ortopédicos', 'Calzado ortopédico para personas con problemas en los pies', 11),
(12,'Labiales Medicinales', 'Cosméticos con propiedades curativas', 12),
(13,'Batas Médicas', 'Ropa para personal de salud', 13),
(14,'Mascarillas N95', 'Equipos de protección personal', 14),
(15,'Monitores de Signos Vitales', 'Dispositivos electrónicos para medir signos vitales', 15),
(16,'Pomadas', 'Ungüentos para el tratamiento de diversas afecciones', 1),
(17,'Proteínas', 'Suplementos proteicos', 2),
(18,'Desodorantes', 'Productos para el control del sudor', 3),
(19,'Sueros', 'Tratamientos para la piel', 12),
(20,'Cintas Médicas', 'Cintas para soporte y protección', 4);

INSERT INTO Estado_Producto (Id_Estado_Producto,Tipo_Estado_Producto) VALUES
 (1,'Agotado'), (2,'En Promoción'), (3,'Disponible');

-- Insertar datos en la tabla Marca
INSERT INTO Marca (Id_Marca, Marca_Producto) VALUES 
(1,'Pfizer'),
(2,'Bayer'),
(3,'Roche'),
(4,'Johnson & Johnson'),
(5,'Nestlé Health Science'),
(6,'GNC'),
(7,'LOréal'),
(8,'Philips Healthcare'),
(9,'3M Healthcare'),
(10,'Orthofix'),
(11,'Hanesbrands Inc.'),
(12,'Kimberly-Clark'),
(13,'Nivea'),
(14,'Colgate-Palmolive'),
(15,'Medtronic'),
(16,'Abbott'),
(17,'Merck'),
(18,'Eli Lilly'),
(19,'GlaxoSmithKline'),
(20,'Sanofi');


-- Insertar datos en la tabla Fecha_Vencimiento
INSERT INTO Fecha_Vencimiento (Id_Fecha_Vencimiento, Fecha_Vencimiento) VALUES 
(1, '2025-01-15'),
(2, '2025-06-20'),
(3, '2026-03-10'),
(4, '2026-11-30'),
(5, '2025-09-05'),
(6, '2027-02-18'),
(7, '2027-07-25'),
(8, '2028-04-12'),
(9, '2028-12-01'),
(10, '2029-05-22'),
(11, '2029-09-14'),
(12, '2026-08-08'),
(13, '2027-10-19'),
(14, '2028-06-27'),
(15, '2029-03-03'),
(16, '2025-11-30'),
(17, '2026-07-15'),
(18, '2027-01-25'),
(19, '2028-02-10'),
(20, '2029-04-20');

INSERT INTO Turno (Id_Turno,Turno) VALUES 
('1','Mañana'),
('2','Tarde'),
('3','Noche');

-- Para la ejecucuion exitosa de las consultas de encriptacion se debe ejecutar en orden en el que esta depues de crear la base de datos sino marcara error de sintaxis
 
-- CONTRASEÑA ENCRIPTADA PARA EL Regente 
-- 1. Eliminar la columna Contraseña
ALTER TABLE Regente
DROP COLUMN Contraseña;

-- 2. Agregar columna de clave encriptada
ALTER TABLE Regente
ADD COLUMN Contraseña VARBINARY(64);
-- Insertar los datos con la contraseña en texto plano

INSERT INTO Regente (Id_Regente, Nombre, Apellido, DNI, Fecha_Contratacion, Licencia, Correo, Telefono, Id_Turno, Contraseña) VALUES 
(1, 'Pablo', 'Lopez', 87654321, '2023-05-10', 987654321, 'Pablo.lopez@example.com', 30000000, 1, UNHEX(SHA2('54321', 256)));

-- 3. Encriptar la contraseña con SHA2
UPDATE Regente
SET Contraseña = UNHEX(SHA2(Contraseña, 256));

-- 4. Renombrar la columna Contraseña
ALTER TABLE Regente
RENAME COLUMN Contraseña TO Contraseña_encriptada;

-- 5. verificar los resultados de la encriptacion
SELECT Id_Regente, Contraseña_encriptada
FROM Regente;

INSERT INTO Producto (Id_Producto, Nombre_Producto, Descripcion_Producto, Codigo_Barras, Costo_Adquisicion, Peso, Precio, Cantidad_Stock, Id_Clasificacion, Id_Categoria, Id_Estado_Producto, Id_Marca, Id_Fecha_Vencimiento) VALUES 
(1,'Paracetamol 500mg', 'Tabletas para aliviar el dolor y fiebre', 1234567, 5000, '0.1 kg', 12000, 100, 1, 1, 3, 1, 1),
(2,'Multivitamínico Daily', 'Suplemento diario de vitaminas y minerales', 1234568, 8000, '0.2 kg', 18000, 150, 2, 2, 1, 2, 2),
(3,'Shampoo Anticaspa', 'Champú para el control de la caspa', 1234569, 4000, '0.3 kg', 8000, 80, 3, 3, 2, 3, 3),
(4,'Pinzas Quirúrgicas', 'Pinzas de acero inoxidable para cirugía', 1234570, 15000, '0.5 kg', 35000, 50, 4, 4, 3, 4, 4),
(5,'Silla de Ruedas Básica', 'Silla de ruedas para movilidad básica', 1234571, 250000, '10 kg', 600000, 20, 5, 5, 1, 5, 5),
(6,'Jabón Antibacterial', 'Jabón para la limpieza antibacteriana de manos', 1234572, 2000, '0.4 kg', 5000, 200, 6, 6, 2, 6, 6),
(7,'Agua Mineral 1L', 'Botella de agua mineral', 1234573, 1000, '1 kg', 3000, 500, 7, 7, 1, 7, 7),
(8,'Estetoscopio Básico', 'Estetoscopio para auscultación médica', 1234574, 20000, '0.2 kg', 50000, 30, 8, 8, 3, 8, 8),
(9,'Vitamina C 1000mg', 'Suplemento de vitamina C', 1234575, 6000, '0.1 kg', 15000, 120, 9, 9, 1, 9, 9),
(10,'Maquillaje Hipoalergénico', 'Base de maquillaje para pieles sensibles', 1234576, 10000, '0.2 kg', 25000, 90, 10, 10, 2, 10, 10),
(11,'Zapatos Ortopédicos', 'Zapatos especiales para problemas de pie', 1234577, 80000, '1 kg', 200000, 15, 11, 11, 3, 11, 11),
(12,'Labiales Medicinales', 'Labiales con propiedades curativas', 1234578, 3000, '0.05 kg', 7000, 200, 12, 12, 1, 12, 12),
(13,'Batas Médicas', 'Uniformes médicos para personal de salud', 1234579, 20000, '0.4 kg', 50000, 40, 13, 13, 2, 13, 13),
(14,'Mascarillas N95', 'Mascarillas de protección contra partículas', 1234580, 15000, '0.1 kg', 35000, 100, 14, 14, 3, 14, 14),
(15,'Monitor de Signos Vitales', 'Dispositivo para medir signos vitales', 1234581, 500000, '2 kg', 1200000, 10, 15, 15, 1, 15, 15),
(16,'Antibiótico Amoxicilina', 'Medicamento para infecciones bacterianas', 1234582, 7000, '0.1 kg', 17000, 150, 1, 1, 2, 1, 16),
(17,'Proteína en Polvo', 'Suplemento para aumento de masa muscular', 1234583, 12000, '0.5 kg', 30000, 80, 2, 2, 1, 2, 17),
(18,'Crema Hidratante', 'Crema para la hidratación de la piel', 1234584, 5000, '0.2 kg', 12000, 120, 3, 3, 3, 3, 18),
(19,'Termómetro Digital', 'Dispositivo para medir la temperatura corporal', 1234585, 8000, '0.1 kg', 20000, 70, 4, 4, 2, 4, 19),
(20,'Guantes Estériles', 'Guantes para uso médico estéril', 1234586, 3000, '0.1 kg', 8000, 200, 5, 5, 1, 5, 20);


INSERT INTO Comprobante (Id_Comprobante, Cantidad, Fecha_Venta, Total, Id_Regente, Id_Producto) VALUES 
(1, 2, '2024-09-15', 24000, 1, 1),   -- Paracetamol 500mg
(2, 1, '2024-09-15', 18000, 1, 2),   -- Multivitamínico Daily
(3, 3, '2024-09-16', 24000, 1, 3),   -- Shampoo Anticaspa
(4, 5, '2024-09-16', 175000, 1, 4),  -- Pinzas Quirúrgicas
(5, 1, '2024-09-17', 600000, 1, 5),  -- Silla de Ruedas Básica
(6, 4, '2024-09-17', 20000, 1, 6),   -- Jabón Antibacterial
(7, 6, '2024-09-18', 18000, 1, 7),   -- Agua Mineral 1L
(8, 1, '2024-09-18', 50000, 1, 8),   -- Estetoscopio Básico
(9, 3, '2024-09-19', 45000, 1, 9),   -- Vitamina C 1000mg
(10, 2, '2024-09-19', 50000, 1, 10),  -- Maquillaje Hipoalergénico
(11, 2, '2024-09-20', 400000, 1, 11), -- Zapatos Ortopédicos
(12, 5, '2024-09-20', 35000, 1, 12),  -- Labiales Medicinales
(13, 3, '2024-09-21', 150000, 1, 13), -- Batas Médicas
(14, 4, '2024-09-21', 140000, 1, 14), -- Mascarillas N95
(15, 1, '2024-09-22', 1200000, 1, 15), -- Monitor de Signos Vitales
(16, 3, '2024-09-22', 36000, 1, 1),  -- Paracetamol 500mg (Compra adicional)
(17, 2, '2024-09-23', 36000, 1, 2),  -- Multivitamínico Daily (Compra adicional)
(18, 4, '2024-09-23', 32000, 1, 3),  -- Shampoo Anticaspa (Compra adicional)
(19, 6, '2024-09-24', 210000, 1, 4), -- Pinzas Quirúrgicas (Compra adicional)
(20, 2, '2024-09-24', 1200000, 1, 5); -- Silla de Ruedas Básica (Compra adicional)

-- CONTRASEÑA ENCRIPTADA PARA EL ADMINISTRADOR 
-- Eliminar la columna Contraseña
ALTER TABLE Administrador
DROP COLUMN Contraseña;

-- Agregar columna de clave encriptada
ALTER TABLE Administrador
ADD COLUMN Contraseña VARBINARY(64);

-- Insertar los datos con la contraseña en texto plano
INSERT INTO Administrador (Id_Administrador, Nombre, Apellido, Correo, Telefono, Contraseña) VALUES 
(1, 'Juan', 'Pérez', 'juan.perez@example.com', 1234567890, UNHEX(SHA2('clave123', 256))); 

-- Encriptar la contraseña con SHA2
UPDATE Administrador
SET Contraseña = UNHEX(SHA2(Contraseña, 256));

-- Renombrar la columna Contraseña
ALTER TABLE Administrador
RENAME COLUMN Contraseña TO Contraseña_encriptada;

-- verificar los resultados de la encriptacion
SELECT Id_Administrador, Contraseña_encriptada
FROM Administrador;

INSERT INTO Fecha_Stock (Id_Fecha_Stock, Fecha_Stock) VALUES 
(1, '2024-09-01'),
(2, '2024-09-02'),
(3, '2024-09-03'),
(4, '2024-09-04'),
(5, '2024-09-05'),
(6, '2024-09-06'),
(7, '2024-09-07'),
(8, '2024-09-08'),
(9, '2024-09-09'),
(10, '2024-09-10'),
(11, '2024-09-11'),
(12, '2024-09-12'),
(13, '2024-09-13'),
(14, '2024-09-14'),
(15, '2024-09-15'),
(16, '2024-09-16'),
(17, '2024-09-17'),
(18, '2024-09-18'),
(19, '2024-09-19'),
(20, '2024-09-20');


INSERT INTO Notificacion_Stock (Id_Notificacion, Mensaje, Id_Administrador, Id_Fecha_Stock) VALUES 
(1, 'Nivel de stock bajo para el producto A', 1, 1),
(2, 'Reabastecimiento necesario para el producto B', 1, 2),
(3, 'Nuevo envío recibido para el producto C', 1, 3),
(4, 'Revisión de inventario necesaria para el producto D', 1, 4),
(5, 'Producto E fuera de stock', 1, 5),
(6, 'Reabastecimiento urgente para el producto F', 1, 6),
(7, 'Pedido realizado para el producto G', 1, 7),
(8, 'Alerta de stock bajo para el producto H', 1, 8),
(9, 'Actualización de stock para el producto I', 1, 9),
(10, 'El producto J necesita reposición', 1, 10),
(11, 'Nuevo lote recibido para el producto K', 1, 11),
(12, 'Estado del stock del producto L actualizado', 1, 12),
(13, 'Alerta de inventario para el producto M', 1, 13),
(14, 'Revisión de stock completada para el producto N', 1, 14),
(15, 'Confirmación de pedido para el producto O', 1, 15),
(16, 'Nivel de stock bajo para el producto P', 1, 16),
(17, 'Reabastecimiento necesario para el producto Q', 1, 17),
(18, 'Nuevo envío recibido para el producto R', 1, 18),
(19, 'Revisión de inventario necesaria para el producto S', 1, 19),
(20, 'Producto T fuera de stock', 1, 20);

INSERT INTO Fecha_Insercion (Id_Fecha_Insercion ,Fecha_Insercion) VALUES
(1,'2024-01-01'),
(2,'2024-02-15'),
(3,'2024-03-30'),
(4,'2024-04-10'),
(5,'2024-05-25'),
(6,'2024-06-12'),
(7,'2024-07-19'),
(8,'2024-08-05'),
(9,'2024-09-15'),
(10,'2024-10-20'),
(11,'2024-11-01'),
(12,'2024-12-12'),
(13,'2025-01-10'),
(14,'2025-02-28'),
(15,'2025-03-15'),
(16, '2025-04-22'),
(17, '2025-05-18'),
(18, '2025-06-30'),
(19, '2025-07-10'),
(20, '2025-08-15');

INSERT INTO Formula_Medica (Id_Formula ,Nombre_Paciente, Identificacion_Paciente, Id_Administrador, Id_Fecha_Insercion) VALUES
(1,'Juan Pérez', 123456789, 1, 1),
(2,'María López', 987654321, 1, 2),
(3,'Carlos Gómez', 456789123, 1, 3),
(4,'Ana Martínez', 321654987, 1, 4),
(5,'Luis Rodríguez', 654321987, 1, 5),
(6,'Laura Fernández', 789456123, 1, 6),
(7,'Pedro Sánchez', 852741963, 1, 7),
(8,'Isabel Torres', 963852741, 1, 8),
(9,'Jorge Castro', 147258369, 1, 9),
(10,'Patricia Morales', 258963147, 1, 10),
(11,'Ricardo Morales', 369852741, 1, 11),
(12,'Sandra Vargas', 741852963, 1, 12),
(13,'Andrés Ruiz', 852963741, 1, 13),
(14,'Claudia Ortega', 951753852, 1, 14),
(15,'Miguel Ángel', 753951852, 1, 15),
(16, 'Sofía Gómez', 159753486, 1, 16),
(17, 'Felipe Martínez', 258147369, 1, 17),
(18, 'Natalia Reyes', 369147852, 1, 18),
(19, 'Daniela Morales', 456123789, 1, 19),
(20, 'Julian Díaz', 987123456, 1, 20);

INSERT INTO Proveedor (Id_Proveedor ,Nombre_Proveedor, Direccion_Proveedor, Correo, Telefono, Id_Administrador) VALUES
(1,'Farmacia San José', 'Avenida Primera de mayo, Bogotá', 'contacto@farmaciasanjose.com', 3012345678, 1),
(2,'Distribuidora El Sol', 'Calle 45 #67-89, Bogotá', 'info@distribuidoraelsol.com', 3023456789, 1),
(3,'Laboratorios Biotech', 'Carrera 12 #34-56, Bogotá', 'ventas@biotechlabs.com', 3034567890, 1),
(4,'Medicamentos Del Valle', 'Bulevar 10 #11-22, Bogotá', 'contacto@medicamentosdelvalle.com', 3045678901, 1),
(5,'Farmacias del Norte', 'Zona Industrial 303, Bogotá', 'servicio@farmaciasdelnorte.com', 3056789012, 1),
(6,'Medipharma', 'Avenida Central 78, Bogotá', 'info@medipharma.com', 3067890123, 1),
(7,'Grupo Farma', 'Calle de la Salud 45, Bogotá', 'ventas@grupofarma.com', 3078901234, 1),
(8,'Distribuciones Medicas', 'Avenida de los Médicos 123, Bogotá', 'contacto@distribucionesmedicas.com', 3089012345, 1),
(9,'Farmacia del Centro', 'Calle 56 #78-90, Bogotá', 'atencion@farmaciadelcentro.com', 3090123456, 1),
(10,'Medicamentos Vital', 'Carrera 5 #6-7,  Bogotá', 'ventas@medicamentosvital.com', 3101234567, 1),
(11,'Salud y Bienestar', 'Calle 22 #33-44, Bogotá', 'info@saludybienestar.com', 3112345678, 1),
(12,'Farmacia Nueva Vida', 'Calle 89 #12-34, Bogotá', 'contacto@farmacianuevavida.com', 3123456789, 1),
(13,'Centro Farmacéutico', 'Avenida de la Salud 56, Bogotá', 'atencion@centrofarmaceutico.com', 3134567890, 1),
(14,'Medicamentos Plus', 'Carrera 8 #9-10, Bogotá', 'info@medicamentosplus.com', 3145678901, 1),
(15,'Farmacia A y B', 'Bulevar del Centro 123, Bogotá', 'ventas@farmaciaayb.com', 3156789012, 1),
(16, 'Clinica Farma', 'Calle 4 #5-6, Bogotá', 'contacto@clinicafarma.com', 3167890123, 1),
(17, 'Farmacia Omega', 'Avenida del Progreso 99, Bogotá', 'info@farmaciaomega.com', 3178901234, 1),
(18, 'Distribuciones Salud', 'Carrera 3 #2-3, Bogotá', 'ventas@distribucionessalud.com', 3189012345, 1),
(19, 'Medicamentos Generales', 'Calle 8 #9-10, Bogotá', 'contacto@medicamentosgenerales.com', 3190123456, 1),
(20, 'Farmacia Bienestar', 'Bulevar San Francisco 12, Bogotá', 'atencion@farmaciabienestar.com', 3201234567, 1);

INSERT INTO Descuento (Id_Descuento,Descuento) VALUES
(1,10.00),
(2,15.50),
(3,20.00),
(4,5.75),
(5,12.30),
(6,8.40),
(7,25.00),
(8,7.00),
(9,18.25),
(10,11.50),
(11,13.75),
(12,9.00),
(13,22.00),
(14,14.00),
(15,17.50),
(16, 30.00),
(17, 6.50),
(18, 19.75),
(19, 21.00),
(20, 10.25);

INSERT INTO Fecha_Inicio (Id_Fecha_Inicio,Fecha_Inicio) VALUES
(1,'2024-01-01'),
(2,'2024-02-01'),
(3,'2024-03-01'),
(4,'2024-04-01'),
(5,'2024-05-01'),
(6,'2024-06-01'),
(7,'2024-07-01'),
(8,'2024-08-01'),
(9,'2024-09-01'),
(10,'2024-10-01'),
(11,'2024-11-01'),
(12,'2024-12-01'),
(13,'2025-01-01'),
(14,'2025-02-01'),
(15,'2025-03-01'),
(16,'2025-04-01'),
(17,'2025-05-01'),
(18,'2025-06-01'),
(19,'2025-07-01'),
(20,'2025-08-01');

INSERT INTO Fecha_Fin (Id_Fecha_Fin,Fecha_Fin) VALUES
(1,'2024-01-31'),
(2,'2024-02-29'),
(3,'2024-03-31'),
(4,'2024-04-30'),
(5,'2024-05-31'),
(6,'2024-06-30'),
(7,'2024-07-31'),
(8,'2024-08-31'),
(9,'2024-09-30'),
(10,'2024-10-31'),
(11,'2024-11-30'),
(12,'2024-12-31'),
(13,'2025-01-31'),
(14,'2025-02-28'),
(15,'2025-03-31'),
(16,'2025-04-30'),
(17,'2025-05-31'),
(18,'2025-06-30'),
(19,'2025-07-31'),
(20,'2025-08-31');

INSERT INTO Tipo_Promocion (Id_Tipo_Promocion,Tipo_Promocion)
VALUES 
(1,'Descuento Directo'),
(2,'2x1'),
(3,'Envío Gratis'),
(4,'Descuento por Volumen'),
(5,'Primera Compra'),
(6,'Descuento Temporada'),
(7,'Descuento Referidos'),
(8,'Regalo por Compra'),
(9,'Promoción Tiempo Limitado'),
(10,'Cashback'),
(11,'Descuento en Productos Seleccionados'),
(12,'Descuento por Cliente VIP'),
(13,'Descuento por Cumpleaños'),
(14,'Descuento por Compras Recurrentes'),
(15,'Descuento por Liquidación'),
(16, 'Compra 1 y Lleva el Segundo a Mitad de Precio'),
(17, 'Regalo de Muestra'),
(18, 'Descuento en Primer Pedido'),
(19, 'Descuento por Pago Contado'),
(20, 'Descuento en Compras en Línea');



INSERT INTO Promocion (Id_Promocion,Id_Administrador, Id_Producto, Id_Descuento, Id_Fecha_Inicio, Id_Fecha_Fin,Id_Tipo_Promocion) VALUES
(1,1, 1, 1, 1, 1,1),
(2,1, 2, 2, 2, 2,2),
(3,1, 3, 3, 3, 3,3),
(4,1, 4, 4, 4, 4,4),
(5,1, 5, 5, 5, 5,5),
(6,1, 6, 6, 6, 6,6),
(7,1, 7, 7, 7, 7,7),
(8,1, 8, 8, 8, 8,8),
(9,1, 9, 9, 9, 9,9),
(10,1, 10, 10, 10,10, 10),
(11,1, 11, 11, 11, 11,11),
(12,1, 12, 12, 12, 12,12),
(13,1, 13, 13, 13, 13,13),
(14,1, 14, 14, 14, 14,14),
(15,1, 15, 15, 15, 15,15),
(16, 1, 16, 6, 1, 2, 16),
(17, 1, 17, 7, 2, 3, 17),
(18, 1, 18, 8, 3, 4, 18),
(19, 1, 19, 9, 4, 5, 19),
(20, 1, 20, 10, 5, 6, 20);

INSERT INTO Tipo_Transaccion (Id_Tipo_Transaccion,Tipo_Transaccion) VALUES
(1,'Compra'),
(2,'Venta'),
(3,'Devolución'),
(4,'Intercambio'),
(5,'Reembolso'),
(6,'Transferencia'),
(7,'Donación'),
(8,'Adquisición'),
(9,'Descuento'),
(10,'Ajuste'),
(11,'Facturación'),
(12,'Pago'),
(13,'Recibo'),
(14,'Reserva'),
(15,'Cancelación'),
(16, 'Compra por Mayor'),
(17, 'Venta al Por Menor'),
(18, 'Devolución por Garantía'),
(19, 'Intercambio de Producto'),
(20, 'Reembolso Parcial');

INSERT INTO Transacciones (Id_Transacciones,Fecha_Transacciones, Cantidad, Detalles_Adicionales, Id_Administrador, Id_Producto, Id_Tipo_Transaccion) VALUES
(1,'2024-01-10', 5, 'Compra inicial', 1, 1, 1),
(2,'2024-02-15', 10, 'Venta mensual', 1, 2, 2),
(3,'2024-03-20', 3, 'Devolución parcial', 1, 3, 3),
(4,'2024-04-25', 7, 'Intercambio producto', 1, 4, 4),
(5,'2024-05-30', 8, 'Reembolso total', 1, 5, 5),
(6,'2024-06-05', 12, 'Transferencia entre almacenes', 1, 6, 6),
(7,'2024-07-15', 4, 'Donación especial', 1, 7, 7),
(8,'2024-08-20', 6, 'Adquisición de stock', 1, 8, 8),
(9,'2024-09-25', 9, 'Descuento aplicado', 1, 9, 9),
(10,'2024-10-30', 2, 'Ajuste inventario', 1, 10, 10),
(11,'2024-11-05', 11, 'Facturación mensual', 1, 11, 11),
(12,'2024-12-10', 15, 'Pago realizado', 1, 12, 12),
(13,'2025-01-15', 1, 'Recibo entregado', 1, 13, 13),
(14,'2025-02-20', 13, 'Reserva realizada', 1, 14, 14),
(15,'2025-03-25', 14, 'Cancelación procesada', 1, 15, 15),
(16, '2025-04-05', 6, 'Compra por mayor', 1, 16, 1),
(17, '2025-05-10', 8, 'Venta al por menor', 1, 17, 2),
(18, '2025-06-15', 5, 'Devolución por garantía', 1, 18, 3),
(19, '2025-07-20', 7, 'Intercambio de producto', 1, 19, 4),
(20, '2025-08-25', 4, 'Reembolso parcial', 1, 20, 5);



-- inner join

-- 1  Obtiene detalles completos de los productos junto con su estado, marca y cantidad en stock.
SELECT 
    p.Nombre_Producto AS Nombre_Producto,  -- Nombre del producto
    p.Descripcion_Producto AS Descripcion,  -- Descripción del producto
    e.Tipo_Estado_Producto AS Estado,  -- Estado del producto (e.g., disponible, agotado)
    m.Marca_Producto AS Marca,  -- Marca del producto
    p.Cantidad_Stock AS Cantidad_Stock  -- Cantidad disponible en stock
FROM 
    Producto p  -- Desde la tabla Producto
INNER JOIN 
    Estado_Producto e ON p.Id_Estado_Producto = e.Id_Estado_Producto  -- Unir con Estado_Producto para obtener el estado
INNER JOIN 
    Marca m ON p.Id_Marca = m.Id_Marca;  -- Unir con Marca para obtener la marca del producto



-- 2 Obtiene información del producto, incluyendo la categoría y la descripción de la categoría.
SELECT 
    p.Nombre_Producto AS Nombre_Producto,  -- Nombre del producto
    c.Nombre_Categoria AS Categoria,  -- Nombre de la categoría
    c.Descripcion_Categoria AS Descripcion_Categoria  -- Descripción de la categoría
FROM 
    Producto p  -- Desde la tabla Producto
INNER JOIN 
    Clasificacion cl ON p.Id_Clasificacion = cl.Id_Clasificacion  -- Unir con Clasificacion para obtener la categoría
INNER JOIN 
    Categoria c ON cl.Id_Categoria = c.Id_Categoria;  -- Unir con Categoria para obtener la descripción de la categoría


-- 3 Obtiene promociones activas con detalles de tipo, descuento y fechas.
SELECT 
    p.Id_Promocion AS ID_Promocion,  -- ID de la promoción
    tp.Tipo_Promocion AS Tipo_Promocion,  -- Tipo de promoción (e.g., descuento directo, 2x1)
    d.Descuento AS Descuento,  -- Descuento aplicado en la promoción
    fi.Fecha_Inicio AS Fecha_Inicio,  -- Fecha de inicio de la promoción
    ff.Fecha_Fin AS Fecha_Fin  -- Fecha de fin de la promoción
FROM 
    Promocion p  -- Desde la tabla Promocion
INNER JOIN 
    Tipo_Promocion tp ON p.Id_Tipo_Promocion = tp.Id_Tipo_Promocion  -- Unir con Tipo_Promocion para obtener el tipo de promoción
INNER JOIN 
    Descuento d ON p.Id_Descuento = d.Id_Descuento  -- Unir con Descuento para obtener el descuento aplicado
INNER JOIN 
    Fecha_Inicio fi ON p.Id_Fecha_Inicio = fi.Id_Fecha_Inicio  -- Unir con Fecha_Inicio para obtener la fecha de inicio
INNER JOIN 
    Fecha_Fin ff ON p.Id_Fecha_Fin = ff.Id_Fecha_Fin  -- Unir con Fecha_Fin para obtener la fecha de fin
WHERE 
    CURRENT_DATE BETWEEN fi.Fecha_Inicio AND ff.Fecha_Fin;  -- Filtrar para mostrar solo promociones activas



-- 4 Muestra información de productos junto con el total de ventas registradas.
SELECT 
    p.Nombre_Producto,  -- Nombre del producto
    p.Descripcion_Producto,  -- Descripción del producto
    p.Cantidad_Stock,  -- Cantidad en stock del producto
    COALESCE(SUM(c.Cantidad), 0) AS Total_Ventas  -- Suma total de la cantidad vendida para cada producto
FROM 
    Producto p  -- Desde la tabla Producto
LEFT JOIN 
    Comprobante c ON p.Id_Producto = c.Id_Producto  -- Unir con Comprobante para obtener las ventas de cada producto
GROUP BY 
    p.Id_Producto;  -- Agrupar por el ID del producto para calcular el total de ventas
  -- Unir con Fecha_Stock para obtener la fecha de stock



-- 5 Muestra productos con descuentos activos y la información de la promoción.
SELECT 
    p.Nombre_Producto,  -- Nombre del producto
    p.Descripcion_Producto,  -- Descripción del producto
    d.Descuento,  -- Descuento aplicado al producto
    tp.Tipo_Promocion  -- Tipo de promoción aplicada
FROM 
    Producto p  -- Desde la tabla Producto
INNER JOIN 
    Promocion pr ON p.Id_Producto = pr.Id_Producto  -- Unir con Promocion para obtener las promociones de cada producto
INNER JOIN 
    Descuento d ON pr.Id_Descuento = d.Id_Descuento  -- Unir con Descuento para obtener la cantidad del descuento
INNER JOIN 
    Tipo_Promocion tp ON pr.Id_Tipo_Promocion = tp.Id_Tipo_Promocion  -- Unir con Tipo_Promocion para obtener el tipo de promoción
WHERE 
    CURRENT_DATE BETWEEN (SELECT Fecha_Inicio FROM Fecha_Inicio fi WHERE fi.Id_Fecha_Inicio = pr.Id_Fecha_Inicio) 
    AND (SELECT Fecha_Fin FROM Fecha_Fin ff WHERE ff.Id_Fecha_Fin = pr.Id_Fecha_Fin);  -- Filtrar promociones activas


-- 6 Muestra transacciones detalladas por tipo de transacción y producto.
SELECT 
    t.Fecha_Transacciones,  -- Fecha de la transacción
    p.Nombre_Producto,  -- Nombre del producto
    t.Cantidad,  -- Cantidad de producto en la transacción
    tt.Tipo_Transaccion,  -- Tipo de transacción
    t.Detalles_Adicionales  -- Detalles adicionales de la transacción
FROM 
    Transacciones t  -- Desde la tabla Transacciones
INNER JOIN 
    Producto p ON t.Id_Producto = p.Id_Producto  -- Unir con Producto para obtener el nombre del producto
INNER JOIN 
    Tipo_Transaccion tt ON t.Id_Tipo_Transaccion = tt.Id_Tipo_Transaccion  -- Unir con Tipo_Transaccion para obtener el tipo de transacción
ORDER BY 
    t.Fecha_Transacciones DESC;  -- Ordenar por fecha de transacción en orden descendente
    
    
    
--------------------------------------------------------------------------------------------------------------------------------------------------



-- LEFT JOIN 

-- 1 Muestra productos y los descuentos aplicados a cada uno.
SELECT 
    p.Nombre_Producto,  -- Nombre del producto
    p.Descripcion_Producto,  -- Descripción del producto
    d.Descuento  -- Descuento aplicado al producto
FROM 
    Producto p  -- Desde la tabla Producto
LEFT JOIN 
    Promocion pr ON p.Id_Producto = pr.Id_Producto  -- Unir con Promocion para obtener las promociones del producto
LEFT JOIN 
    Descuento d ON pr.Id_Descuento = d.Id_Descuento;  -- Unir con Descuento para obtener la cantidad del descuento


-- 2. Obtener el ID del comprobante, el nombre y apellido del regente y el nombre del producto
-- Esta consulta muestra el ID del comprobante, el nombre y apellido del regente que realizó la venta y el nombre del producto vendido.
SELECT 
    comp.Id_Comprobante,  -- Seleccionamos el ID del comprobante
    r.Nombre AS Nombre_Regente,  -- Seleccionamos el nombre del regente y lo renombramos como Nombre_Regente
    r.Apellido AS Apellido_Regente,  -- Seleccionamos el apellido del regente y lo renombramos como Apellido_Regente
    p.Nombre_Producto  -- Seleccionamos el nombre del producto vendido
FROM 
    Comprobante comp  -- Desde la tabla Comprobante
LEFT JOIN 
    Regente r ON comp.Id_Regente = r.Id_Regente  -- Hacemos un LEFT JOIN con Regente para obtener el nombre y apellido del regente asociado al comprobante. Se incluyen todos los comprobantes, incluso si no tienen un regente asociado.
LEFT JOIN 
    Producto p ON comp.Id_Producto = p.Id_Producto;  -- Hacemos un LEFT JOIN con Producto para obtener el nombre del producto asociado al comprobante. Se incluyen todos los comprobantes, incluso si no tienen un producto asociado.
    
    

-- 3 Muestra productos y sus fechas de vencimiento.
SELECT 
    p.Nombre_Producto,  -- Nombre del producto
    p.Descripcion_Producto,  -- Descripción del producto
    fv.Fecha_Vencimiento  -- Fecha de vencimiento del producto
FROM 
    Producto p  -- Desde la tabla Producto
LEFT JOIN 
    Fecha_Vencimiento fv ON p.Id_Fecha_Vencimiento = fv.Id_Fecha_Vencimiento;  -- Unir con Fecha_Vencimiento para obtener la fecha de vencimiento del producto


-- 4. Obtener el nombre del paciente, identificación del paciente, nombre y apellido del administrador y la fecha de inserción
-- Esta consulta muestra el nombre del paciente, la identificación del paciente, el nombre y apellido del administrador que insertó la fórmula médica, y la fecha de inserción.
SELECT 
    fm.Nombre_Paciente,  -- Seleccionamos el nombre del paciente
    fm.Identificacion_Paciente,  -- Seleccionamos la identificación del paciente
    a.Nombre AS Nombre_Administrador,  -- Seleccionamos el nombre del administrador y lo renombramos como Nombre_Administrador
    a.Apellido AS Apellido_Administrador,  -- Seleccionamos el apellido del administrador y lo renombramos como Apellido_Administrador
    fi.Fecha_Insercion  -- Seleccionamos la fecha de inserción de la fórmula médica
FROM 
    Formula_Medica fm  -- Desde la tabla Formula_Medica
LEFT JOIN 
    Administrador a ON fm.Id_Administrador = a.Id_Administrador  -- Hacemos un LEFT JOIN con Administrador para obtener el nombre y apellido del administrador asociado a la fórmula médica. Se incluyen todas las fórmulas médicas, incluso si no tienen un administrador asociado.
LEFT JOIN 
    Fecha_Insercion fi ON fm.Id_Fecha_Insercion = fi.Id_Fecha_Insercion;  -- Hacemos un LEFT JOIN con Fecha_Insercion para obtener la fecha de inserción asociada a la fórmula médica. Se incluyen todas las fórmulas médicas, incluso si no tienen una fecha de inserción asociada.
    
    
-- 5 Muestra transacciones y la información del administrador que las realizó.
SELECT 
    t.Fecha_Transacciones,  -- Fecha de la transacción
    t.Cantidad,  -- Cantidad de producto en la transacción
    t.Detalles_Adicionales,  -- Detalles adicionales de la transacción
    a.Nombre AS Admin_Nombre,  -- Nombre del administrador
    a.Apellido AS Admin_Apellido  -- Apellido del administrador
FROM 
    Transacciones t  -- Desde la tabla Transacciones
LEFT JOIN 
    Administrador a ON t.Id_Administrador = a.Id_Administrador;  -- Unir con Administrador para obtener la información del administrador asociado a la transacción

    

-- 6. Obtener el nombre del producto, el ID de la promoción, el descuento, la fecha de inicio y la fecha de fin de la promoción
-- Esta consulta muestra el nombre del producto, el ID de la promoción, el descuento aplicado a la promoción, y las fechas de inicio y fin de la promoción.
SELECT 
    p.Nombre_Producto,  -- Seleccionamos el nombre del producto
    pr.Id_Promocion,  -- Seleccionamos el ID de la promoción
    ds.Descuento,  -- Seleccionamos el descuento aplicado a la promoción
    fi.Fecha_Inicio,  -- Seleccionamos la fecha de inicio de la promoción
    ff.Fecha_Fin  -- Seleccionamos la fecha de fin de la promoción
FROM 
    Promocion pr  -- Desde la tabla Promocion
LEFT JOIN 
    Producto p ON pr.Id_Producto = p.Id_Producto  -- Hacemos un LEFT JOIN con Producto para obtener el nombre del producto asociado a la promoción. Se incluyen todas las promociones, incluso si no tienen un producto asociado.
LEFT JOIN 
    Descuento ds ON pr.Id_Descuento = ds.Id_Descuento  -- Hacemos un LEFT JOIN con Descuento para obtener el descuento aplicado en la promoción. Se incluyen todas las promociones, incluso si no tienen un descuento asociado.
LEFT JOIN 
    Fecha_Inicio fi ON pr.Id_Fecha_Inicio = fi.Id_Fecha_Inicio  -- Hacemos un LEFT JOIN con Fecha_Inicio para obtener la fecha de inicio de la promoción. Se incluyen todas las promociones, incluso si no tienen una fecha de inicio asociada.
LEFT JOIN 
    Fecha_Fin ff ON pr.Id_Fecha_Fin = ff.Id_Fecha_Fin;  -- Hacemos un LEFT JOIN con Fecha_Fin para obtener la fecha de fin de la promoción. Se incluyen todas las promociones, incluso si no tienen una fecha de fin asociada.
 
 
 --------------------------------------------------------------------------------------------------------------------------------------------------------
 
 
 
-- RIGHT JOIN 


-- 1. Obtener el ID del producto, nombre del producto, precio, ID del comprobante, cantidad, fecha de venta y total
-- Esta consulta muestra los detalles de productos y los comprobantes asociados, incluyendo el ID del producto, nombre, precio, ID del comprobante, cantidad vendida, fecha de venta y total de la venta.
SELECT 
    p.Id_Producto,  -- Seleccionamos el ID del producto
    p.Nombre_Producto,  -- Seleccionamos el nombre del producto
    p.Precio,  -- Seleccionamos el precio del producto
    c.Id_Comprobante,  -- Seleccionamos el ID del comprobante
    c.Cantidad,  -- Seleccionamos la cantidad vendida del producto
    c.Fecha_Venta,  -- Seleccionamos la fecha de la venta
    c.Total  -- Seleccionamos el total de la venta
FROM 
    Comprobante c  -- Desde la tabla Comprobante
RIGHT JOIN 
    Producto p ON c.Id_Producto = p.Id_Producto  -- Hacemos un RIGHT JOIN con Producto para obtener todos los productos, incluso si no tienen un comprobante asociado
ORDER BY 
    p.Id_Producto;  -- Ordenamos los resultados por ID del producto

-- 2. Obtener información de productos junto con detalles de la categoría a la que pertenecen
-- Esta consulta muestra todos los detalles de los productos junto con la información de la categoría, 
-- incluso si algunos productos no tienen una categoría asociada.
SELECT 
    p.Id_Producto,  -- Seleccionamos el ID del producto
    p.Nombre_Producto,  -- Seleccionamos el nombre del producto
    p.Descripcion_Producto,  -- Seleccionamos la descripción del producto
    p.Codigo_Barras,  -- Seleccionamos el código de barras del producto
    p.Costo_Adquisicion,  -- Seleccionamos el costo de adquisición del producto
    p.Peso,  -- Seleccionamos el peso del producto
    p.Precio,  -- Seleccionamos el precio del producto
    p.Cantidad_Stock,  -- Seleccionamos la cantidad de stock disponible del producto
    p.Id_Clasificacion,  -- Seleccionamos el ID de la clasificación del producto
    p.Id_Categoria,  -- Seleccionamos el ID de la categoría del producto
    p.Id_Estado_Producto,  -- Seleccionamos el ID del estado del producto
    p.Id_Marca,  -- Seleccionamos el ID de la marca del producto
    p.Id_Fecha_Vencimiento,  -- Seleccionamos el ID de la fecha de vencimiento del producto
    c.Id_Categoria AS Categoria_ID,  -- Seleccionamos el ID de la categoría desde la tabla Categoria y lo renombramos como Categoria_ID
    c.Nombre_Categoria AS Categoria_Nombre,  -- Seleccionamos el nombre de la categoría desde la tabla Categoria y lo renombramos como Categoria_Nombre
    c.Descripcion_Categoria AS Categoria_Descripcion  -- Seleccionamos la descripción de la categoría desde la tabla Categoria y lo renombramos como Categoria_Descripcion
FROM 
    Producto p  -- Desde la tabla Producto
RIGHT JOIN 
    Categoria c ON p.Id_Categoria = c.Id_Categoria;  -- Realizamos un RIGHT JOIN con la tabla Categoria para incluir todas las categorías, incluso si no hay productos asociados


-- 3. Obtener el ID del regente, nombre, apellido, turno, total de ventas y monto total de ventas, y última venta
-- Esta consulta muestra información sobre los regentes, incluyendo el total de ventas y monto total de ventas por turno.
SELECT 
    r.Id_Regente,  -- Seleccionamos el ID del regente
    r.Nombre,  -- Seleccionamos el nombre del regente
    r.Apellido,  -- Seleccionamos el apellido del regente
    t.Turno,  -- Seleccionamos el turno del regente
    COUNT(c.Id_Comprobante) AS Total_Ventas,  -- Contamos el número total de comprobantes asociados al regente
    COALESCE(SUM(c.Total), 0) AS Monto_Total_Ventas,  -- Calculamos el monto total de ventas, usando COALESCE para manejar posibles valores NULL
    MAX(c.Fecha_Venta) AS Ultima_Venta  -- Seleccionamos la fecha de la última venta realizada por el regente
FROM 
    Regente r  -- Desde la tabla Regente
RIGHT JOIN 
    Turno t ON r.Id_Turno = t.Id_Turno  -- Hacemos un RIGHT JOIN con Turno para obtener todos los turnos, incluso si no hay regentes asociados a ellos
LEFT JOIN 
    Comprobante c ON r.Id_Regente = c.Id_Regente  -- Hacemos un LEFT JOIN con Comprobante para obtener todas las ventas realizadas por el regente
GROUP BY 
    r.Id_Regente, r.Nombre, r.Apellido, t.Turno  -- Agrupamos los resultados por ID del regente, nombre, apellido y turno
ORDER BY 
    Monto_Total_Ventas DESC;  -- Ordenamos los resultados por monto total de ventas en orden descendente

-- 4. Obtener el nombre, apellido, DNI, turno y fecha de contratación de los regentes en turno de 'Mañana'
-- Esta consulta muestra la información de los regentes que están asignados al turno de 'Mañana'.
SELECT 
    r.Nombre,  -- Seleccionamos el nombre del regente
    r.Apellido,  -- Seleccionamos el apellido del regente
    r.DNI,  -- Seleccionamos el DNI del regente
    t.Turno,  -- Seleccionamos el turno del regente
    r.Fecha_Contratacion  -- Seleccionamos la fecha de contratación del regente
FROM 
    Regente r  -- Desde la tabla Regente
RIGHT JOIN 
    Turno t ON r.Id_Turno = t.Id_Turno  -- Hacemos un RIGHT JOIN con Turno para obtener todos los turnos, incluso si no hay regentes asociados a ellos
WHERE 
    t.Turno = 'Mañana';  -- Filtramos para incluir solo regentes asignados al turno de 'Mañana'

-- 5. Obtener el ID del producto, nombre del producto, nombre de la categoría y nombre de la clasificación
-- Esta consulta muestra la información del producto, incluyendo su categoría y clasificación.
SELECT 
    p.Id_Producto,  -- Seleccionamos el ID del producto
    p.Nombre_Producto,  -- Seleccionamos el nombre del producto
    c.Nombre_Categoria,  -- Seleccionamos el nombre de la categoría del producto
    cl.Nombre_Clasificacion  -- Seleccionamos el nombre de la clasificación del producto
FROM 
    Producto p  -- Desde la tabla Producto
RIGHT JOIN 
    Clasificacion cl ON p.Id_Clasificacion = cl.Id_Clasificacion  -- Hacemos un RIGHT JOIN con Clasificacion para obtener todos los productos, incluso si no tienen una clasificación asociada
RIGHT JOIN 
    Categoria c ON cl.Id_Categoria = c.Id_Categoria;  -- Hacemos un RIGHT JOIN con Categoria para obtener la categoría asociada a la clasificación del producto
    
    
 --------------------------------------------------------------------------------------------------------------------------------------------------------
 
 
 
-- Consultas anidadas

-- 1 Consulta para obtener el total vendido por producto
-- y el estado actual del producto
SELECT
    p.Nombre_Producto,  -- Nombre del producto
    e.Tipo_Estado_Producto,  -- Estado actual del producto
    SUM(c.Cantidad) AS Total_Vendido  -- Total vendido del producto
FROM
    Producto p
INNER JOIN
    Comprobante c ON p.Id_Producto = c.Id_Producto
INNER JOIN
    Estado_Producto e ON p.Id_Estado_Producto = e.Id_Estado_Producto
GROUP BY
    p.Nombre_Producto, e.Tipo_Estado_Producto;
    
    
-- 2 Consulta para obtener productos con descuentos activos
-- y sus fechas de inicio y fin de la promoción.
SELECT
    p.Nombre_Producto,  -- Nombre del producto
    d.Descuento,  -- Descuento aplicado
    fi.Fecha_Inicio,  -- Fecha de inicio de la promoción
    ff.Fecha_Fin  -- Fecha de fin de la promoción
FROM
    Promocion pr
INNER JOIN
    Producto p ON pr.Id_Producto = p.Id_Producto
INNER JOIN
    Descuento d ON pr.Id_Descuento = d.Id_Descuento
INNER JOIN
    Fecha_Inicio fi ON pr.Id_Fecha_Inicio = fi.Id_Fecha_Inicio
INNER JOIN
    Fecha_Fin ff ON pr.Id_Fecha_Fin = ff.Id_Fecha_Fin
WHERE
    CURDATE() BETWEEN fi.Fecha_Inicio AND ff.Fecha_Fin;  -- Descuentos activos
    
    
--  3 Consulta para obtener el producto con el mayor costo de adquisición
-- y el total vendido de ese producto
SELECT
    p.Nombre_Producto,  -- Nombre del producto
    p.Costo_Adquisicion,  -- Costo de adquisición del producto
    SUM(c.Cantidad) AS Total_Vendido  -- Total vendido del producto
FROM
    Producto p
INNER JOIN
    Comprobante c ON p.Id_Producto = c.Id_Producto
WHERE
    p.Costo_Adquisicion = (
        SELECT MAX(p2.Costo_Adquisicion)  -- Encuentra el mayor costo de adquisición
        FROM Producto p2
    )
GROUP BY
    p.Nombre_Producto, p.Costo_Adquisicion;
    

--  4 Consulta para obtener el historial de transacciones para un producto específico
-- y ordenar las transacciones por fecha
SELECT
    p.Nombre_Producto,  -- Nombre del producto
    t.Fecha_Transacciones,  -- Fecha de la transacción
    t.Cantidad,  -- Cantidad transaccionada
    t.Detalles_Adicionales,  -- Detalles adicionales de la transacción
    tt.Tipo_Transaccion  -- Tipo de transacción
FROM
    Transacciones t
INNER JOIN
    Producto p ON t.Id_Producto = p.Id_Producto
INNER JOIN
    Tipo_Transaccion tt ON t.Id_Tipo_Transaccion = tt.Id_Tipo_Transaccion
WHERE
    p.Id_Producto = 5  -- Id del producto específico
ORDER BY
    t.Fecha_Transacciones DESC;  -- Ordenar por fecha de transacción
    

-- 5 Consulta para obtener la cantidad total de productos por estado
-- y la clasificación a la que pertenecen
SELECT
    e.Tipo_Estado_Producto,  -- Tipo de estado del producto
    c.Nombre_Clasificacion,  -- Nombre de la clasificación
    COUNT(p.Id_Producto) AS Cantidad_Total  -- Cantidad total de productos
FROM
    Producto p
INNER JOIN
    Estado_Producto e ON p.Id_Estado_Producto = e.Id_Estado_Producto
INNER JOIN
    Clasificacion c ON p.Id_Clasificacion = c.Id_Clasificacion
GROUP BY
    e.Tipo_Estado_Producto, c.Nombre_Clasificacion;
    
    
--  6 Consulta para obtener los productos con el mayor y menor precio en cada categoría
SELECT
    p.Nombre_Producto,  -- Nombre del producto
    p.Precio,  -- Precio del producto
    c.Nombre_Categoria,  -- Nombre de la categoría
    CASE
        WHEN p.Precio = max_precio.Precio_Max THEN 'Mayor Precio'
        WHEN p.Precio = min_precio.Precio_Min THEN 'Menor Precio'
    END AS Precio_Tipo
FROM
    Producto p
INNER JOIN
    Categoria c ON p.Id_Categoria = c.Id_Categoria
INNER JOIN (
    SELECT Id_Categoria, MAX(Precio) AS Precio_Max
    FROM Producto
    GROUP BY Id_Categoria
) max_precio ON p.Id_Categoria = max_precio.Id_Categoria AND p.Precio = max_precio.Precio_Max
INNER JOIN (
    SELECT Id_Categoria, MIN(Precio) AS Precio_Min
    FROM Producto
    GROUP BY Id_Categoria
) min_precio ON p.Id_Categoria = min_precio.Id_Categoria AND p.Precio = min_precio.Precio_Min;


-- 7 Consulta para obtener los productos que no tienen promociones activas y su stock actual
SELECT
    p.Nombre_Producto,  -- Nombre del producto
    p.Cantidad_Stock  -- Cantidad en stock
FROM
    Producto p
LEFT JOIN
    Promocion pr ON p.Id_Producto = pr.Id_Producto
WHERE
    pr.Id_Promocion IS NULL OR CURDATE() NOT BETWEEN (
        SELECT Fecha_Inicio 
        FROM Fecha_Inicio 
        WHERE Id_Fecha_Inicio = pr.Id_Fecha_Inicio
    ) AND (
        SELECT Fecha_Fin 
        FROM Fecha_Fin 
        WHERE Id_Fecha_Fin = pr.Id_Fecha_Fin
    );


-- 8 Consulta para obtener los descuentos aplicados a productos y la fecha de aplicación
SELECT
    p.Nombre_Producto,  -- Nombre del producto
    d.Descuento,  -- Descuento aplicado
    fi.Fecha_Inicio,  -- Fecha de inicio del descuento
    ff.Fecha_Fin  -- Fecha de fin del descuento
FROM
    Producto p
INNER JOIN
    Promocion pr ON p.Id_Producto = pr.Id_Producto
INNER JOIN
    Descuento d ON pr.Id_Descuento = d.Id_Descuento
INNER JOIN
    Fecha_Inicio fi ON pr.Id_Fecha_Inicio = fi.Id_Fecha_Inicio
INNER JOIN
    Fecha_Fin ff ON pr.Id_Fecha_Fin = ff.Id_Fecha_Fin;
    
    


-- 9 Consulta para obtener productos con la mayor variación en stock en el último año
SELECT
    p.Nombre_Producto,  -- Nombre del producto
    MAX(p.Cantidad_Stock) - MIN(p.Cantidad_Stock) AS Variacion_Stock  -- Variación en stock
FROM
    Producto p
INNER JOIN
    Transacciones t ON p.Id_Producto = t.Id_Producto
WHERE
    t.Fecha_Transacciones >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)  -- Último año
GROUP BY
    p.Nombre_Producto
HAVING
    Variacion_Stock = (
        SELECT MAX(Variacion)  -- Mayor variación en stock
        FROM (
            SELECT
                p2.Id_Producto,
                MAX(p2.Cantidad_Stock) - MIN(p2.Cantidad_Stock) AS Variacion
            FROM
                Producto p2
            INNER JOIN
                Transacciones t2 ON p2.Id_Producto = t2.Id_Producto
            WHERE
                t2.Fecha_Transacciones >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
            GROUP BY
                p2.Id_Producto
        ) AS Subconsulta
    )
ORDER BY
    Variacion_Stock DESC;
    
    

-- 10 Consulta para obtener el producto con la mayor cantidad en stock
SELECT
    p.Nombre_Producto,  -- Nombre del producto
    p.Cantidad_Stock  -- Cantidad en stock
FROM
    Producto p
WHERE
    p.Cantidad_Stock = (
        SELECT MAX(p2.Cantidad_Stock)  -- Mayor cantidad en stock
        FROM Producto p2
    );


----------------------------------------------------------------------------------------------------------------------------------------------------


-- Subonsultas 
-- Consulta 1: Obtener el nombre del producto, precio y nombre de la categoría para productos con el precio más alto en su categoría
SELECT P.Nombre_Producto,  -- Nombre del producto
       P.Precio,           -- Precio del producto
       C.Nombre_Categoria  -- Nombre de la categoría del producto
FROM Producto P
JOIN Categoria C ON P.Id_Categoria = C.Id_Categoria  -- Relación entre productos y su categoría
WHERE P.Precio = (
    -- Subconsulta: Obtener el precio máximo dentro de la misma categoría
    SELECT MAX(Precio) 
    FROM Producto P2 
    WHERE P2.Id_Categoria = P.Id_Categoria  -- Comparar dentro de la misma categoría
);

-- Consulta 2: Obtener el nombre del producto y la marca para productos con precio superior al promedio de su categoría
SELECT P.Nombre_Producto,  -- Nombre del producto
       M.Marca_Producto    -- Marca del producto
FROM Producto P
JOIN Marca M ON P.Id_Marca = M.Id_Marca  -- Relación entre productos y su marca
WHERE P.Precio > (
    -- Subconsulta: Obtener el precio promedio dentro de la misma categoría
    SELECT AVG(Precio) 
    FROM Producto P2 
    WHERE P2.Id_Categoria = P.Id_Categoria  -- Comparar dentro de la misma categoría
);

-- Consulta 3: Obtener el nombre del producto, cantidad en stock y clasificación para productos con stock inferior al promedio de su clasificación
SELECT P.Nombre_Producto,  -- Nombre del producto
       P.Cantidad_Stock,   -- Cantidad en stock del producto
       CL.Nombre_Clasificacion  -- Nombre de la clasificación del producto
FROM Producto P
JOIN Clasificacion CL ON P.Id_Clasificacion = CL.Id_Clasificacion  -- Relación entre productos y su clasificación
WHERE P.Cantidad_Stock < (
    -- Subconsulta: Obtener el promedio de stock dentro de la misma clasificación
    SELECT AVG(Cantidad_Stock) 
    FROM Producto P2 
    WHERE P2.Id_Clasificacion = P.Id_Clasificacion  -- Comparar dentro de la misma clasificación
);

-- Consulta 4: Obtener el nombre del producto, fecha de vencimiento y nombre de la categoría para productos con la fecha de vencimiento más cercana dentro de la misma clasificación
SELECT P.Nombre_Producto,  -- Nombre del producto
       F.Fecha_Vencimiento,  -- Fecha de vencimiento del producto
       C.Nombre_Categoria  -- Nombre de la categoría del producto
FROM Producto P
JOIN Fecha_Vencimiento F ON P.Id_Fecha_Vencimiento = F.Id_Fecha_Vencimiento  -- Relación entre productos y sus fechas de vencimiento
JOIN Categoria C ON P.Id_Categoria = C.Id_Categoria  -- Relación entre productos y sus categorías
WHERE F.Fecha_Vencimiento = (
    -- Subconsulta: Obtener la fecha de vencimiento mínima dentro de la misma clasificación
    SELECT MIN(F2.Fecha_Vencimiento) 
    FROM Producto P2 
    JOIN Fecha_Vencimiento F2 ON P2.Id_Fecha_Vencimiento = F2.Id_Fecha_Vencimiento
    WHERE P2.Id_Clasificacion = P.Id_Clasificacion  -- Comparar dentro de la misma clasificación
);

-- Consulta 5: Obtener las marcas que solo tienen productos disponibles en estado "3"
SELECT m.Marca_Producto,  -- Nombre de la marca
       'Disponible' AS Estado_Producto  -- Estado del producto como "Disponible"
FROM Marca m
JOIN Producto p ON m.Id_Marca = p.Id_Marca  -- Relación entre productos y sus marcas
GROUP BY m.Marca_Producto  -- Agrupar por marca
HAVING COUNT(
    CASE WHEN p.Id_Estado_Producto != 3 THEN 1 END  -- Contar los productos que no tienen estado "3"
) = 0;  -- Filtrar solo las marcas cuyos productos tienen el estado "3"





