use pizzeria_don_piccolo; 

-- ---------------------------------------------------------
-- Calcular el precio  con iva
-- ---------------------------------------------------------

DELIMITER //
CREATE FUNCTION calcular_precio_con_iva(porcentaje_iva DECIMAL(10,2), precio_base DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC 
BEGIN 
	declare precio_final DECIMAL(10,2); 
    set precio_final =  precio_base * (1+ porcentaje_iva); 
    return precio_final;
END; //
DELIMITER ; 


-- select calcular_precio_con_iva(0.20,100000 );

-- ---------------------------------------------------------
-- Calcular costo de porcion en la receta 
-- ---------------------------------------------------------
-- esta funcion existe para determinar el precio de la cantidad usada en ingrediente por cada pizza

DELIMITER //
CREATE FUNCTION calcular_costo_porcion (cant_porcion INT, precio_ingrediente DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	declare porcion_precio INT;
    SET porcion_precio = cant_porcion * precio_ingrediente;
    return porcion_precio;
END ; //
DELIMITER ; 
	
    
-- ---------------------------------------------------------
-- Calcular costo de la receta 
-- ---------------------------------------------------------
DELIMITER //
CREATE FUNCTION calcular_costo_receta (id INT)
RETURNS DECIMAL(10,2)
NOT DETERMINISTIC
READS SQL DATA
BEGIN
	declare precio_receta DECIMAL(10,2);
    
	select SUM(precio_porcion)
    INTO precio_receta
    FROM receta
    WHERE receta.pizza_id = id;
    
    return precio_receta; 
END ; //
DELIMITER ; 

-- ---------------------------------------------------------
-- Calcular subtotal - detalle pedido 
-- ---------------------------------------------------------
DELIMITER //
CREATE FUNCTION calcular_subtotal (mano_obra DECIMAL(10,2),iva DECIMAL(10,2), id_pizza INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE subtotal DECIMAL(10,2); 
    DECLARE precio_base DECIMAL(10,2);
    
    SET precio_base = calcular_costo_receta(id_pizza) + mano_obra; 
	
    SET subtotal = calcular_precio_con_iva( iva, precio_base);
    
	RETURN subtotal;
END ; //
DELIMITER ; 

-- -----------------------------------------------------
-- Calcular total pedido 
-- -----------------------------------------------------
DELIMITER //
CREATE FUNCTION calcular_total_pedido (pedido INT)
RETURNS DECIMAL(10,2)
NOT DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE total_pedido DECIMAL(10,2);
    
	SELECT SUM(subtotal)
    INTO total_pedido
    FROM detalle_pedido
    WHERE detalle_pedido.pedido_id = pedido;

    return total_pedido; 
END ; //
DELIMITER ; 




