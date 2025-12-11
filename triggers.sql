use pizzeria_don_piccolo; 
-- -----------------------------------------------------
-- Creacion de trigger 
-- -----------------------------------------------------
 /*
	Se crean Trigger para la insercion de valores de precios en las tablas que siguen la 
	siguiente depencia:
	Ingrediente -> Receta -> Pizza -> Detalle pedido -> Pedido / -> domicilio -> Pago
 */
 
-- -----------------------------------------------------
-- disparador de precio de porcion en la receta 
-- -----------------------------------------------------
/*
	cada vez que se inserta una receta se dispara el calculo para el precio de la cantidad 
	usada en ingrediente por cada pizza  
*/

DELIMITER //
CREATE TRIGGER precio_porcion
BEFORE INSERT ON receta
FOR EACH ROW
BEGIN
	DECLARE cant_porcion INT;
    DECLARE precio_ingrediente DECIMAL(10,2);
    
    SET cant_porcion = new.porcion;
    
	SELECT precio
    INTO precio_ingrediente
    FROM ingrediente
    WHERE id_ingrediente = NEW.ingrediente_id;

	SET NEW.precio_porcion = calcular_costo_porcion(NEW.porcion, precio_ingrediente);
END; //
DELIMITER ;

-- -----------------------------------------------------
-- disparador calcular costo de la receta 
-- -----------------------------------------------------

DELIMITER //

CREATE TRIGGER costo_receta
AFTER INSERT ON receta
FOR EACH ROW
BEGIN
	DECLARE id INT; 
    
	SET id = new.pizza_id;
    
    UPDATE pizza 
    SET costo_receta = calcular_costo_receta(id)
    WHERE pizza.id_pizza = id;
END; //
DELIMITER ;


-- -----------------------------------------------------
-- disparador calcular total pedido
-- -----------------------------------------------------

DELIMITER //

CREATE TRIGGER total_pedido
AFTER INSERT ON detalle_pedido
FOR EACH ROW
BEGIN
	DECLARE id_pedido_v INT; 
    
	SET id_pedido_v = new.pedido_id;
    
    UPDATE pedido
    SET precio_final = calcular_total_pedido(id_pedido_v)
    WHERE id_pedido = id_pedido_v ;
END; //
DELIMITER ;

-- -----------------------------------------------------
-- disparador asigna domicilio o pedido a pago
-- -----------------------------------------------------
DELIMITER //    
CREATE TRIGGER actualizar_codigo_pago_domicilio
AFTER INSERT ON domicilio
FOR EACH ROW
BEGIN

    UPDATE pago
    SET codigo = NEW.id_domicilio
    WHERE codigo = NEW.pedido_id;

    UPDATE pago
    SET pago_domicilio = 1
    WHERE codigo = NEW.id_domicilio and pago_domi = 1;
END; //
DELIMITER ;


