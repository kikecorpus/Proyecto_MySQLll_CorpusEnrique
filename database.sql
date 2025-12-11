
-- -----------------------------------------------------
-- Schema pizzeria_don_piccolo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS pizzeria_don_piccolo;
USE pizzeria_don_piccolo ;

-- -----------------------------------------------------
-- Table sede
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS sede(
  id_sede INT AUTO_INCREMENT,
  direccion_sede VARCHAR(50) NOT NULL,
  ciudad VARCHAR(50) NOT NULL,
  departamento VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_sede)
);


-- -----------------------------------------------------
-- Table persona
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS persona(
  id_persona INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(45) NOT NULL, 
  tipo_documento ENUM('cc','pp','ce') NOT NULL,
  documento VARCHAR(50) NOT NULL,
  telefono VARCHAR(50) NULL,
  direccion VARCHAR(200) NOT NULL,
  correo VARCHAR(200) NULL,
  creado_en TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  sede_id INT NOT NULL,
  PRIMARY KEY (id_persona),
  FOREIGN KEY (sede_id)
  REFERENCES  sede(id_sede));


-- -----------------------------------------------------
-- Table cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cliente (
	id_cliente INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (id_cliente),
	FOREIGN KEY (id_cliente)
	REFERENCES persona (id_persona));


-- -----------------------------------------------------
-- Table vendedor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS vendedor (
   id_vendedor INT NOT NULL AUTO_INCREMENT,
   PRIMARY KEY (id_vendedor),
   FOREIGN KEY (id_vendedor)
   REFERENCES persona (id_persona));
    


-- -----------------------------------------------------
-- Table pedido
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pedido (
  id_pedido INT NOT NULL AUTO_INCREMENT,
  cliente_id INT NOT NULL,
  fecha_pedido TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  precio_final INT NOT NULL DEFAULT 0,
  estado_entrega ENUM('preparacion', 'entregado', 'cancelado') NOT NULL,
  tipo_pedido ENUM('sitio', 'domicilio') NOT NULL,
  fecha_entrega DATETIME NOT NULL DEFAULT NOW(),
  vendedor_id INT NOT NULL,
  PRIMARY KEY (id_pedido),
  FOREIGN KEY (cliente_id) REFERENCES cliente (id_cliente),
  FOREIGN KEY (vendedor_id) REFERENCES vendedor (id_vendedor));
 


-- -----------------------------------------------------
-- Table tipo_pizza
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS tipo_pizza (
  id_tipo_pizza INT NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_tipo_pizza));


-- -----------------------------------------------------
-- Table pizza
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pizza (
  id_pizza INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(150) NOT NULL,
  tamaño ENUM('personal', 'mediana', 'grande', 'extragrande') NOT NULL,
  tipo_pizza_id INT NOT NULL,
  mano_obra DECIMAL(10,2) NOT NULL,
  costo_receta DECIMAL(10,2) NOT NULL DEFAULT 0,
  iva DECIMAL(10,2) NOT NULL DEFAULT 0.19,
  PRIMARY KEY (id_pizza),
  FOREIGN KEY (tipo_pizza_id)
  REFERENCES tipo_pizza (id_tipo_pizza));

-- -----------------------------------------------------
-- Table detalle_pedido
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS detalle_pedido (
  id_detalle_pedido INT NOT NULL AUTO_INCREMENT,
  pizza_id INT NOT NULL,
  cantidad INT NOT NULL,
  pedido_id INT NOT NULL,
  subtotal INT NOT NULL DEFAULT 0,
  PRIMARY KEY (id_detalle_pedido),
  FOREIGN KEY (pedido_id)
  REFERENCES pedido (id_pedido),
  FOREIGN KEY (pizza_id)
  REFERENCES pizza (id_pizza));
 
-- -----------------------------------------------------
-- Table pago
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pago (
  id_pago INT NOT NULL AUTO_INCREMENT,
  estado_pago ENUM('pago', 'pendiente', 'abono') NOT NULL,
  tipo_de_pago ENUM('app', 'tarjeta de credito', 'efectivo') NOT NULL,
  fecha_de_pago DATETIME NOT NULL,
  recibido DECIMAL(10,2) NOT NULL DEFAULT 0,
  codigo INT NOT NULL,
  pago_domicilio TINYINT(1) NOT NULL DEFAULT 0, 
  PRIMARY KEY (id_pago));

-- -----------------------------------------------------
-- Table medida
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS medida (
  id_medida INT NOT NULL AUTO_INCREMENT,
  medida ENUM('kg', 'ml', 'cantidad') NULL,
  cantidad INT NULL,
  PRIMARY KEY (id_medida));


-- -----------------------------------------------------
-- Table ingrediente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ingrediente (
  id_ingrediente INT NOT NULL AUTO_INCREMENT,
  ingrediente VARCHAR(45) NOT NULL,
  precio DECIMAL(10,2) NULL,
  stock INT NULL,
  medida_id INT NULL,
  PRIMARY KEY (id_ingrediente),
  FOREIGN KEY (medida_id)
  REFERENCES medida (id_medida));

-- -----------------------------------------------------
-- Table repartidor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS repartidor (
  id_repartidor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  zona ENUM('locadiad N', 'localidad S', 'localidad E', 'localidad O') NOT NULL,
  estado ENUM('disponible', 'no disponible') NOT NULL,
  FOREIGN KEY (id_repartidor)
  REFERENCES persona (id_persona));


-- -----------------------------------------------------
-- Table domicilio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS domicilio (
  id_domicilio INT NOT NULL AUTO_INCREMENT,
  direccion_domicilio VARCHAR(150) NOT NULL,
  precio_domicilio INT NOT NULL,
  precio_final_pedido DECIMAL(10,2) NOT NULL,
  distancia_aprox_km INT NOT NULL,
  hora_salida TIME NOT NULL,
  hora_entrega TIME NOT NULL,
  pedido_id INT NOT NULL,
  repartidor_id INT NOT NULL,
  estado ENUM('entregado','en_ruta','cancelado'),
  PRIMARY KEY (id_domicilio),
  FOREIGN KEY (pedido_id)
  REFERENCES pedido (id_pedido),
  FOREIGN KEY (repartidor_id)
  REFERENCES repartidor (id_repartidor));

-- -----------------------------------------------------
-- Table receta
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS receta (
  id_receta INT NOT NULL AUTO_INCREMENT,
  porcion INT NULL,
  ingrediente_id INT NULL,
  pizza_id INT NULL,
  precio_porcion DECIMAL(10,2) NULL,
  PRIMARY KEY (id_receta),
  FOREIGN KEY (ingrediente_id)
  REFERENCES ingrediente (id_ingrediente),
  FOREIGN KEY (pizza_id)
  REFERENCES pizza (id_pizza));

-- -----------------------------------------------------
-- Table usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  usuario VARCHAR(45) NOT NULL,
  contrasena VARCHAR(45) NOT NULL, 
  FOREIGN KEY (id_usuario)
  REFERENCES persona (id_persona));
  



