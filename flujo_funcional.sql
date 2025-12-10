
USE pizzeria_don_piccolo ;


-- -----------------------------------------------------
-- Procedimientos almacenados
-- necesarios para el funcionamiento y flujo dela base de datos
-- -----------------------------------------------------
/* 
 1. Se crean procedimientos almacenados para las inserciones necesarias en cada tabla con
	CREATE PROCEDURE y su respectiva sintaxys*/


 -- -----------------------------------------------------
-- Table `sede`
-- -----------------------------------------------------
DELIMITER //

CREATE PROCEDURE poblar_sede(
    IN s_direccion_sede VARCHAR(45),
    IN s_ciudad VARCHAR(45),
    IN s_departamento VARCHAR(45)
)
BEGIN
    INSERT INTO sede(direccion_sede, ciudad, departamento)
    VALUES (s_direccion_sede, s_ciudad, s_departamento);
END; //

DELIMITER ;
-- -----------------------------------------------------
-- Table `persona`
-- -----------------------------------------------------
DELIMITER //
create procedure poblar_persona (
IN nombre_p varchar(45), 
IN apellido_p VARCHAR(45), 
IN tipo_documento_p ENUM('cc','pp','ce'), 
IN documento_p VARCHAR(45), 
IN telefono_p VARCHAR(45), 
IN direccion_p VARCHAR(200), 
IN correo_p VARCHAR(200),
IN sede_id_p INT)
begin
	insert into persona (nombre,  apellido, tipo_documento, documento, telefono, direccion, correo, sede_id)
    values(nombre_p, apellido_p, tipo_documento_p, documento_p, telefono_p, direccion_p, correo_p, sede_id_p);
end; //
DELIMITER ; 


-- -----------------------------------------------------
-- Table `cliente`
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE poblar_cliente(
    IN id_cliente_p INT
)
BEGIN
    INSERT INTO cliente(id_cliente)
    VALUES(id_cliente_p);
END; //
DELIMITER ;

-- -----------------------------------------------------
-- Table`vendedor`
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE poblar_vendedor(
    IN id_vendedor_p INT
)
BEGIN
    INSERT INTO vendedor(id_vendedor)
    VALUES(id_vendedor_p);
END; //
DELIMITER ;

-- -----------------------------------------------------
-- Table `pedido`
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE poblar_pedido(
    IN p_cliente_id INT,
    IN p_vendedor_id INT,
    IN p_tipo_pedido ENUM('sitio','domicilio'),
    IN p_estado_entrega ENUM('preparacion','entregado','cancelado'))

BEGIN
    INSERT INTO pedido(cliente_id, vendedor_id, tipo_pedido, estado_entrega)
    VALUES(p_cliente_id, p_vendedor_id, p_tipo_pedido, p_estado_entrega);
END; //
DELIMITER ;

-- -----------------------------------------------------
-- Table `tipo_pizza`
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE poblar_tipo_pizza(
    IN p_tipo VARCHAR(45)
)
BEGIN
    INSERT INTO tipo_pizza(tipo)
    VALUES(p_tipo);
END; //
DELIMITER ;

-- -----------------------------------------------------
-- Table `pizza`
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE poblar_pizza(
    IN p_nombre VARCHAR(150),
    IN p_tamano ENUM('personal','mediana','grande','extragrande'),
    IN p_tipo_pizza_id INT,
    IN p_mano_obra DECIMAL(10,2),
    IN p_iva DECIMAL(10,2)
)
BEGIN
    INSERT INTO pizza(nombre, tamaño, tipo_pizza_id, mano_obra, iva)
    VALUES(p_nombre, p_tamano, p_tipo_pizza_id, p_mano_obra, p_iva);
END; //
DELIMITER ;

-- -----------------------------------------------------
-- Table `detalle_pedido`
-- -----------------------------------------------------
-- me toco calcular el subtotal en el procedure debido  al Error Code: 1442. TABLA MUTANTE 
 -- AL intentar el update con un trigger para actuliazar el subtotal  
DELIMITER //
CREATE PROCEDURE poblar_detalle_pedido(
    IN p_pizza_id INT,
    IN p_cantidad INT,
    IN p_pedido_id INT
)
BEGIN
	DECLARE t_subtotal DECIMAL(10,2);
    DECLARE costo_mano_obra DECIMAL(10,2);
	DECLARE costo_iva DECIMAL(10,2);
	
	SELECT mano_obra,IVA
    INTO costo_mano_obra,costo_iva
    FROM pizza 
    WHERE id_pizza = p_pizza_id;

    SET t_subtotal = calcular_subtotal(costo_mano_obra,costo_iva,p_pizza_id);
    
    INSERT INTO detalle_pedido(pizza_id,cantidad, pedido_id,subtotal)
    VALUES(p_pizza_id, p_cantidad, p_pedido_id, t_subtotal);
END; //
DELIMITER ;

-- -----------------------------------------------------
-- Table `pago`
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE poblar_pago(
    IN p_estado_pago ENUM('pago','pendiente','abono'),
    IN p_tipo_pago ENUM('app','tarjeta de credito','efectivo', 'pediente'),
    IN p_fecha_pago DATETIME,
    IN p_recibido DECIMAL(10,2),
    IN p_codigo INT
)
BEGIN
	if p_fecha_pago is null then 
    set p_fecha_pago = now();
    end if;
    
    INSERT INTO pago(estado_pago, tipo_de_pago, fecha_de_pago,recibido,codigo)
    VALUES (p_estado_pago, p_tipo_pago, p_fecha_pago,p_recibido,p_codigo);
END; //
DELIMITER ;


DELIMITER //
-- -----------------------------------------------------
-- Table `medida`
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE poblar_medida(
    IN p_medida ENUM('kg','ml','cantidad'),
    IN p_cantidad INT
)
BEGIN
    INSERT INTO medida(medida, cantidad)
    VALUES(p_medida, p_cantidad);
END; //
DELIMITER ;

-- -----------------------------------------------------
-- Table `ingrediente`
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE poblar_ingrediente(
	IN p_ingrediente VARCHAR(45),
    IN p_precio DECIMAL(10,2),
    IN p_stock INT,
    IN p_medida_id INT
)
BEGIN
    INSERT INTO ingrediente(ingrediente,precio, stock, medida_id)
    VALUES(p_ingrediente, p_precio, p_stock, p_medida_id);
END; //
DELIMITER ;


DELIMITER ; 

-- -----------------------------------------------------
-- Table `repartidor`
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE poblar_repartidor(
    IN p_id_persona INT,
    IN p_zona ENUM('locadiad N','localidad S','localidad E','localidad O'),
    IN p_estado ENUM('disponible','no disponible')
)
BEGIN
    INSERT INTO repartidor(id_repartidor, zona, estado)
    VALUES(p_id_persona, p_zona, p_estado);
END; //
DELIMITER ;

-- -----------------------------------------------------
-- Table `domicilio`
-- -----------------------------------------------------
/* Se crea un valor random para la distancia aproximada del domicilio entre 1 y 8 km 
y se establece de tarifa 1000 pesos por km para calcular el valor del domicilio
por ultimo se suma el precio del domiclio  al total del pedido calculado con su respectiva funcion*/
DELIMITER //
CREATE PROCEDURE poblar_domicilio(
    IN p_direccion VARCHAR(150),
    IN p_hora_salida DATETIME,
    IN p_hora_entrega DATETIME,
    IN p_pedido_id INT,
    IN p_repartidor_id INT
)
BEGIN
    DECLARE distancia INT;
    DECLARE precio_domi INT;
    DECLARE total_domicilio DECIMAL(10,2);
    SET distancia = FLOOR(RAND() * 8 + 1);
    SET precio_domi = distancia * 1000;
    SET total_domicilio =  precio_domi + calcular_total_pedido(p_pedido_id);
    
    INSERT INTO domicilio(direccion_domicilio, hora_salida, hora_entrega, pedido_id, repartidor_id, distancia_aprox_km,precio_domicilio,precio_final_pedido)
    
    VALUES(p_direccion, p_hora_salida,p_hora_entrega, p_pedido_id, p_repartidor_id,distancia,precio_domi,total_domicilio);
END; //
DELIMITER ;

-- -----------------------------------------------------
-- Table `receta`
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE poblar_receta(
    IN p_porcion INT,
    IN p_ingrediente_id INT,
    IN p_pizza_id INT
)
BEGIN
    INSERT INTO receta(porcion, ingrediente_id, pizza_id)
    VALUES(p_porcion, p_ingrediente_id, p_pizza_id);
END; //

DELIMITER ;
-- -----------------------------------------------------
-- Table `usuario`
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE poblar_usuario(
    IN p_id_persona INT,
    IN p_usuario VARCHAR(45),
    IN p_contrasena VARCHAR(45)
)
BEGIN
    INSERT INTO usuario(id_usuario, usuario, contrasena)
    VALUES(p_id_persona, p_usuario, p_contrasena);
END; //
DELIMITER ;




