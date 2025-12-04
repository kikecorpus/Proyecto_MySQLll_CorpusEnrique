# Proyecto_MySQLll_CorpusEnrique

# Proyecto_MySQLll_CorpusEnrique

 Pizzeria Don Piccolo - Sistema de Gestión de Base de Datos
 Descripción del ProyectoEste proyecto consiste en una base de datos relacional (MySQL/MariaDB) diseñada para gestionar las operaciones centrales de una cadena de pizzerías, Pizzeria Don Piccolo. El sistema modela los flujos de negocio clave, incluyendo la gestión de personal, inventario de ingredientes, elaboración de recetas, toma de pedidos, seguimiento de domicilios y cálculo de costos y ventas.La base de datos utiliza Triggers y Funciones Almacenadas para automatizar el cálculo de precios, costos de ingredientes (recetas), y el flujo de estados de los pedidos.
 
 ## Componentes Funcionales Clave
 
 El proyecto está dividido en varios archivos SQL que definen la estructura, la lógica de negocio y los datos de prueba.
 
 1. database.sql (DDL - Data Definition Language)Contiene las sentencias CREATE SCHEMA y CREATE TABLE.Establece la estructura de 30 tablas y todas las relaciones de Clave Foránea (FOREIGN KEY).
 
 2. funciones.sql 
 (Cálculo de Precios y Costos)
 Contiene las funciones matemáticas utilizadas por los triggers y procedimientos para asegurar la consistencia financiera:
 - calcular_costo_porcion: Calcula el costo de un ingrediente según la cantidad usada en la receta.- calcular_costo_receta: Suma los costos de todas las porciones para obtener el costo total de ingredientes de una pizza.
 - calcular_precio_con_iva: Aplica el IVA/impuestos al precio base.
 - calcular_total_pedido: Suma los subtotales de todos los detalle_pedido asociados.
 
 3. triggers.sql (Automatización del Flujo de Datos)
 
 Define la lógica que se ejecuta automáticamente ante eventos (INSERT/UPDATE).

 - precio_porcion: (BEFORE INSERT en receta) Calcula y asigna automáticamente el costo de la porción.
 - costo_receta: (AFTER INSERT en receta) Actualiza el costo_receta en la tabla pizza sumando todas sus porciones.-
 - total_pedido: (AFTER INSERT en detalle_pedido) Actualiza el total del pedido cuando se agrega un nuevo producto.
 - actualizar_estado_a_entregado: (AFTER UPDATE en domicilio) Cambia el estado del pedido a "entregado" tan pronto como se registra la hora_entrega.
 
 4. flujo_funcional.sql (Procedimientos de Inserción) 
 Contiene los procedimientos almacenados (CREATE PROCEDURE) para realizar inserciones complejas y consistentes en las tablas (ej: poblar_persona, poblar_pedido, poblar_domicilio). Estos procedimientos encapsulan la lógica para generar datos automáticamente (como la distancia y el precio del domicilio).
 
 5. inserciones.sql (Datos de Prueba)
 Contiene las llamadas a los procedimientos almacenados (CALL poblar_...) para llenar la base de datos con datos de ejemplo (30 personas, clientes, vendedores, pizzas, ingredientes y 5 pedidos completos).
 
# Pasos de InstalaciónEjecutar database.sql:
    
1. Crea el esquema pizzeria_don_piccolo y todas las tablas. 
    Ejecutar funciones.sql: 
2. Define todas las funciones de cálculo.
    Ejecutar triggers.sql: Define todos los disparadores de automatización.
    Ejecutar flujo_funcional.sql: Define todos los procedimientos de inserción.
    Ejecutar inserciones.sql: Llena la base de datos con datos de prueba (este archivo utiliza los procedimientos y triggers previamente creados).


