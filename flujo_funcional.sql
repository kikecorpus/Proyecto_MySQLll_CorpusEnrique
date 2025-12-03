use pizzeria_don_piccolo; 

-- -----------------------------------------------------
-- INSERCIONES DE DATA EN CADA TABALA
-- -----------------------------------------------------
/* 
 Se crean procedimientos almacenados para las inserciones necesarias en cada tabla con
 CREATE PROCEDURE y su respectiva sintaxys
 */
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
END //

DELIMITER ;
-- -----------------------------------------------------
-- Table `persona`
-- -----------------------------------------------------
delimiter //
create procedure poblar_persona (
IN nombre_p varchar(45), 
IN apellido_p VARCHAR(45), 
IN tipo_documento_p ENUM('cc','pp','ce'), 
IN documento_p VARCHAR(45), 
IN telefono_p VARCHAR(45), 
IN direccion_p VARCHAR(200), 
IN correo_p VARCHAR(200)) 
begin
	insert into persona (nombre,  apellido, tipo_documento, documento, telefono, direccion, correo)
    values(nombre_p, apellido_p, tipo_documento_p, documento_p, telefono_p, direccion_p, correo_p);
end; //
delimiter ; 


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
END //
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
END //
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
END //
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
    IN p_costo_receta DECIMAL(10,2),
    IN p_iva DECIMAL(10,2),
    IN p_utilidad DECIMAL(10,2)
)
BEGIN
    INSERT INTO pizza(nombre, tamaño, tipo_pizza_id, mano_obra, costo_receta, iva, utilidad)
    VALUES(p_nombre, p_tamano, p_tipo_pizza_id, p_mano_obra, p_costo_receta, p_iva, p_utilidad);
END //
DELIMITER ;

-- -----------------------------------------------------
-- Table `detalle_pedido`
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE poblar_detalle_pedido(
    IN p_pizza_id INT,
    IN p_cantidad INT,
    IN p_pedido_id INT
)
BEGIN
    INSERT INTO detalle_pedido(pizza_id, cantidad, pedido_id)
    VALUES(p_pizza_id, p_cantidad, p_pedido_id);
END //
DELIMITER ;

-- -----------------------------------------------------
-- Table `pago`
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE poblar_pago(
    IN p_estado_pago ENUM('pago','pendiente','abono'),
    IN p_tipo_pago ENUM('app','tarjeta de credito','efectivo', 'pediente'),
    IN p_fecha_pago DATETIME
)
BEGIN
	if p_fecha_pago is null then 
    set p_fecha_pago = now();
    end if;
    
    INSERT INTO pago(estado_pago, tipo_de_pago, fecha_de_pago)
    VALUES (p_estado_pago, p_tipo_pago, p_fecha_pago);
END //
DELIMITER ;



delimiter //

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
END //
DELIMITER ;

-- -----------------------------------------------------
-- Table `ingrediente`
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE poblar_ingrediente(
	IN p_ingrediente VARCHAR(45),
    IN p_precio DECIMAL(10,2),
    IN p_stock INT,
    IN p_iva DECIMAL(10,2),
    IN p_precio_final DECIMAL(10,2),
    IN p_medida_id INT
)
BEGIN
    INSERT INTO ingrediente(ingrediente,precio, stock, iva, precio_final, medida_id)
    VALUES(p_ingrediente, p_precio, p_stock, p_iva, p_precio_final, p_medida_id);
END //
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
END //
DELIMITER ;

-- -----------------------------------------------------
-- Table `domicilio`
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE poblar_domicilio(
    IN p_direccion VARCHAR(150),
    IN p_precio_domicilio DECIMAL(10,2),
    IN p_precio_final_pedido DECIMAL(10,2),
    IN p_distancia_km INT,
    IN p_hora_salida DATETIME,
    IN p_hora_entrega DATETIME,
    IN p_pedido_id INT,
    IN p_repartidor_id INT
)
BEGIN
    -- crear trigger para actulizar la hora de salida y entrada 
    -- crear trigger para actulizar la distacia aproximada 
    -- crear trigger para los precios 
    INSERT INTO domicilio(direccion_domicilio, distancia_aprox_km, hora_salida, hora_entrega, pedido_id, repartidor_id)
    VALUES(p_direccion, p_distancia, p_hora_salida,p_hora_entrega, p_pedido_id, p_repartidor_id);
END //
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
END //

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
END //
DELIMITER ;


