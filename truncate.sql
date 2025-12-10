SET FOREIGN_KEY_CHECKS = 0;

-- Tablas de Relación y Detalle
TRUNCATE TABLE detalle_pedido;
TRUNCATE TABLE receta;
TRUNCATE TABLE pago;
TRUNCATE TABLE domicilio;

-- Tablas de Ingredientes, Medidas y Pizzas
TRUNCATE TABLE ingrediente;
TRUNCATE TABLE medida;
TRUNCATE TABLE pizza;
TRUNCATE TABLE tipo_pizza;

-- Tablas de Pedidos, Roles y Personas
TRUNCATE TABLE pedido;
TRUNCATE TABLE repartidor;
TRUNCATE TABLE vendedor;
TRUNCATE TABLE cliente;
TRUNCATE TABLE usuario;
TRUNCATE TABLE persona;

-- Tablas Base
TRUNCATE TABLE sede;

SET FOREIGN_KEY_CHECKS = 1;
