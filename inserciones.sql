
-- -----------------------------------------------------
-- Inserción en la tabla Sede
-- -----------------------------------------------------
CALL poblar_sede('Calle 10 #15-20', 'Bucaramanga', 'Santander');

-- -----------------------------------------------------
-- Inserción en la tabla persona - 30 Registros
-- Distribución: 18 Clientes, 4 Vendedores, 8 Repartidores
-- -----------------------------------------------------

-- ** BLOQUE 1: CLIENTES (IDs 1 al 18) **

-- Cliente 1 (ID 1)
CALL poblar_persona('Andrea', 'Gómez', 'cc', '1030001234', '3001234567', 'Carrera 10 # 5-20', 'andrea.gomez@mail.com',1);
-- Cliente 2 (ID 2)
CALL poblar_persona('Juan', 'Martínez', 'cc', '1030002001', '3011122334', 'Avenida 5 # 10-30', 'juan.martinez@mail.com',1);
-- Cliente 3 (ID 3)
CALL poblar_persona('Laura', 'Díaz', 'pp', 'AR9012345', '3029876543', 'Calle 25 # 8-15', 'laura.diaz@mail.com',1);
-- Cliente 4 (ID 4)
CALL poblar_persona('Pedro', 'Sánchez', 'ce', 'E7654321', '3034567890', 'Diagonal 40 # 1-50', 'pedro.sanchez@mail.com',1);
-- Cliente 5 (ID 5)
CALL poblar_persona('Valeria', 'Ríos', 'cc', '1030003002', '3047788990', 'Carrera 70 # 2-60', 'valeria.rios@mail.com',1);
-- Cliente 6 (ID 6)
CALL poblar_persona('Daniel', 'Castro', 'cc', '1030004003', '3056655443', 'Calle 100 # 3-100', 'daniel.castro@mail.com',1);
-- Cliente 7 (ID 7)
CALL poblar_persona('Camila', 'Méndez', 'pp', 'VE1029384', '3061234000', 'Avenida Caracas # 10-20', 'camila.mendez@mail.com',1);
-- Cliente 8 (ID 8)
CALL poblar_persona('Felipe', 'Torres', 'cc', '1030005004', '3079988776', 'Transversal 50 # 15-45', 'felipe.torres@mail.com',1);
-- Cliente 9 (ID 9)
CALL poblar_persona('Gabriela', 'Herrera', 'ce', 'B8765432', '3082211334', 'Calle 65 # 5-80', 'gabriela.herrera@mail.com',1);
-- Cliente 10 (ID 10)
CALL poblar_persona('Héctor', 'Vargas', 'cc', '1030006005', '3095544667', 'Carrera 30 # 20-10', 'hector.vargas@mail.com',1);
-- Cliente 11 (ID 11)
CALL poblar_persona('Isabella', 'Ruiz', 'cc', '1030007006', '3108877990', 'Avenida 80 # 7-70', 'isabella.ruiz@mail.com',1);
-- Cliente 12 (ID 12)
CALL poblar_persona('Javier', 'Silva', 'pp', 'PE1122334', '3114433556', 'Calle 9 # 4-25', 'javier.silva@mail.com',1);
-- Cliente 13 (ID 13)
CALL poblar_persona('Karen', 'Pinto', 'cc', '1030008007', '3127766889', 'Diagonal 10 # 30-15', 'karen.pinto@mail.com',1);
-- Cliente 14 (ID 14)
CALL poblar_persona('Luis', 'Mora', 'ce', 'C3214567', '3131100223', 'Transversal 8 # 50-50', 'luis.mora@mail.com',1);
-- Cliente 15 (ID 15)
CALL poblar_persona('María', 'Cano', 'cc', '1030009008', '3149988112', 'Carrera 5 # 10-5', 'maria.cano@mail.com',1);
-- Cliente 16 (ID 16)
CALL poblar_persona('Nicolás', 'Gallo', 'pp', 'EC9876543', '3156677889', 'Avenida 60 # 20-30', 'nicolas.gallo@mail.com',1);
-- Cliente 17 (ID 17)
CALL poblar_persona('Olivia', 'Quintero', 'cc', '1030010009', '3161122330', 'Calle 70 # 12-40', 'olivia.quintero@mail.com',1);
-- Cliente 18 (ID 18)
CALL poblar_persona('Pablo', 'Zúñiga', 'cc', '1030011010', '3174455667', 'Diagonal 20 # 5-95', 'pablo.zuniga@mail.com',1);

-- ** BLOQUE 2: VENDEDORES (IDs 19 al 22) **

-- Vendedor 1 (ID 19)
CALL poblar_persona('Carlos', 'Rojas', 'cc', '1030012011', '3189876543', 'Calle 15 # 3-10', 'carlos.rojas@pizzeria.com',1);
-- Vendedor 2 (ID 20)
CALL poblar_persona('Elena', 'Velez', 'cc', '1030013012', '3195566778', 'Carrera 22 # 50-5', 'elena.velez@pizzeria.com',1);
-- Vendedor 3 (ID 21)
CALL poblar_persona('Ricardo', 'Castaño', 'pp', 'VE9988776', '3201122334', 'Avenida 30 # 1-1', 'ricardo.castano@pizzeria.com',1);
-- Vendedor 4 (ID 22)
CALL poblar_persona('Marta', 'Pinzón', 'cc', '1030014013', '3214433556', 'Transversal 60 # 10-20', 'marta.pinzon@pizzeria.com',1);

-- ** BLOQUE 3: REPARTIDORES (IDs 23 al 30) **

-- Repartidor 1 (ID 23)
CALL poblar_persona('Javier', 'Pérez', 'pp', 'VE1234567', '3221100223', 'Avenida 20 # 8-50', 'javier.perez@pizzeria.com',1);
-- Repartidor 2 (ID 24)
CALL poblar_persona('Manuel', 'Acosta', 'cc', '1030015014', '3239988112', 'Calle 80 # 2-30', 'manuel.acosta@pizzeria.com',1);
-- Repartidor 3 (ID 25)
CALL poblar_persona('Sofía', 'Giraldo', 'cc', '1030016015', '3246677889', 'Diagonal 5 # 40-10', 'sofia.giraldo@pizzeria.com',1);
-- Repartidor 4 (ID 26)
CALL poblar_persona('Andrés', 'Ospina', 'pp', 'CO5432109', '3251122330', 'Carrera 90 # 1-5', 'andres.ospina@pizzeria.com',1);
-- Repartidor 5 (ID 27)
CALL poblar_persona('Diana', 'Quijano', 'cc', '1030017016', '3264455667', 'Calle 10 # 6-60', 'diana.quijano@pizzeria.com',1);
-- Repartidor 6 (ID 28)
CALL poblar_persona('Fabián', 'López', 'ce', 'H1234567', '3278877990', 'Avenida 10 # 3-15', 'fabian.lopez@pizzeria.com',1);
-- Repartidor 7 (ID 29)
CALL poblar_persona('Gloria', 'Marín', 'cc', '1030018017', '3284433556', 'Transversal 2 # 80-20', 'gloria.marin@pizzeria.com',1);
-- Repartidor 8 (ID 30)
CALL poblar_persona('Hugo', 'Navarro', 'cc', '1030019018', '3297766889', 'Diagonal 55 # 10-35', 'hugo.navarro@pizzeria.com',1);


-- -----------------------------------------------------
-- Asignación de Roles Específicos (Clientes, Vendedores, Repartidores, Usuarios)
-- Usa los IDs generados en la tabla 'persona' (1 al 30)
-- -----------------------------------------------------

-- ** 2.1 CLIENTES (IDs 1 al 18) **
-- Llama al procedimiento: poblar_cliente (id_cliente)
CALL poblar_cliente(1);
CALL poblar_cliente(2);
CALL poblar_cliente(3);
CALL poblar_cliente(4);
CALL poblar_cliente(5);
CALL poblar_cliente(6);
CALL poblar_cliente(7);
CALL poblar_cliente(8);
CALL poblar_cliente(9);
CALL poblar_cliente(10);
CALL poblar_cliente(11);
CALL poblar_cliente(12);
CALL poblar_cliente(13);
CALL poblar_cliente(14);
CALL poblar_cliente(15);
CALL poblar_cliente(16);
CALL poblar_cliente(17);
CALL poblar_cliente(18);

-- ** 2.2 VENDEDORES (IDs 19 al 22) **
-- Llama al procedimiento: poblar_vendedor (id_vendedor)
CALL poblar_vendedor(19);
CALL poblar_vendedor(20);
CALL poblar_vendedor(21);
CALL poblar_vendedor(22);


-- ** 2.3 REPARTIDORES (IDs 23 al 30) **
-- Llama al procedimiento: poblar_repartidor (id_persona, zona, estado)
-- Distribución de Zonas y Estados
CALL poblar_repartidor(23, 'locadiad N', 'disponible'); -- Javier Pérez
CALL poblar_repartidor(24, 'localidad S', 'disponible'); -- Manuel Acosta
CALL poblar_repartidor(25, 'localidad E', 'no disponible'); -- Sofía Giraldo (en descanso)
CALL poblar_repartidor(26, 'localidad O', 'disponible'); -- Andrés Ospina
CALL poblar_repartidor(27, 'locadiad N', 'disponible'); -- Diana Quijano
CALL poblar_repartidor(28, 'localidad S', 'no disponible'); -- Fabián López (en descanso)
CALL poblar_repartidor(29, 'localidad E', 'disponible'); -- Gloria Marín
CALL poblar_repartidor(30, 'localidad O', 'disponible'); -- Hugo Navarro

-- ** 2.4 USUARIOS (IDs 19 al 30) **
-- Llama al procedimiento: poblar_usuario (id_persona, usuario, contrasena)
-- Vendedores (IDs 19-22)
CALL poblar_usuario(19, 'crojas', 'pass123');      -- Carlos Rojas (Vendedor 1)
CALL poblar_usuario(20, 'evelez', 'pass123');      -- Elena Velez (Vendedor 2)
CALL poblar_usuario(21, 'rcastano', 'pass123');    -- Ricardo Castaño (Vendedor 3)
CALL poblar_usuario(22, 'mpinzon', 'pass123');     -- Marta Pinzón (Vendedor 4)

-- Repartidores (IDs 23-30)
CALL poblar_usuario(23, 'jperez', 'pass123');      -- Javier Pérez (Repartidor 1)
CALL poblar_usuario(24, 'macosta', 'pass123');     -- Manuel Acosta (Repartidor 2)
CALL poblar_usuario(25, 'sgiraldo', 'pass123');    -- Sofía Giraldo (Repartidor 3)
CALL poblar_usuario(26, 'aospina', 'pass123');     -- Andrés Ospina (Repartidor 4)
CALL poblar_usuario(27, 'dquijano', 'pass123');    -- Diana Quijano (Repartidor 5)
CALL poblar_usuario(28, 'flopez', 'pass123');      -- Fabián López (Repartidor 6)
CALL poblar_usuario(29, 'gmarin', 'pass123');      -- Gloria Marín (Repartidor 7)
CALL poblar_usuario(30, 'hnavarro', 'pass123');    -- Hugo Navarro (Repartidor 8)

-- -----------------------------------------------------
-- 3. Inserción en la tabla medida
-- Llama al procedimiento: poblar_medida (medida, cantidad)
-- -----------------------------------------------------

-- ID 1: Kilogramos (para ingredientes secos/sólidos)
CALL poblar_medida('kg', 1);
-- ID 2: Mililitros (para líquidos)
CALL poblar_medida('ml', 1000);
-- ID 3: Cantidad (para unidades o porciones)
CALL poblar_medida('cantidad', 1);

-- -----------------------------------------------------
-- 4. Inserción en la tabla tipo_pizza
-- Llama al procedimiento: poblar_tipo_pizza (tipo)
-- -----------------------------------------------------

-- ID 1: Tipos de pizza (Clásica, antes Tradicional)
CALL poblar_tipo_pizza('Clásica');
-- ID 2: Tipos de pizza (Especial)
CALL poblar_tipo_pizza('Especial');
-- ID 3: Tipos de pizza (Vegetariana)
CALL poblar_tipo_pizza('Vegetariana');

-- -----------------------------------------------------
-- 5. Inserción en la tabla ingrediente
-- Llama al procedimiento (ACTUALIZADO): poblar_ingrediente (nombre, precio, stock, iva, precio_final, medida_id)
-- -----------------------------------------------------

-- ID 1: Masa de Pizza (Medida ID 3: Cantidad)
CALL poblar_ingrediente('Masa de Pizza', 6000.00, 200, 600.00, 6600.00, 3);
-- ID 2: Salsa de Tomate (Medida ID 1: Kg)
CALL poblar_ingrediente('Salsa de Tomate', 3200.00, 50, 320.00, 3520.00, 1);
-- ID 3: Queso Mozzarella (Medida ID 1: Kg)
CALL poblar_ingrediente('Queso Mozzarella', 10000.00, 100, 1000.00, 11000.00, 1);
-- ID 4: Jamón (Medida ID 1: Kg)
CALL poblar_ingrediente('Jamón', 12000.00, 80, 1200.00, 13200.00, 1);
-- ID 5: Champiñones (Medida ID 1: Kg)
CALL poblar_ingrediente('Champiñones', 4800.00, 60, 480.00, 5280.00, 1);
-- ID 6: Pepperoni (Medida ID 1: Kg)
CALL poblar_ingrediente('Pepperoni', 16000.00, 70, 1600.00, 17600.00, 1);
-- ID 7: Aceitunas Negras (Medida ID 1: Kg)
CALL poblar_ingrediente('Aceitunas Negras', 4000.00, 40, 400.00, 4400.00, 1);
-- ID 8: Pimientos (Medida ID 1: Kg)
CALL poblar_ingrediente('Pimientos', 4400.00, 55, 440.00, 4840.00, 1);
-- ID 9: Cebolla (Medida ID 1: Kg)
CALL poblar_ingrediente('Cebolla', 2400.00, 45, 240.00, 2640.00, 1);
-- ID 10: Aceite de Oliva (Medida ID 2: ML)
CALL poblar_ingrediente('Aceite de Oliva', 20000.00, 20, 2000.00, 22000.00, 2);

-- -----------------------------------------------------
-- 6. Inserción en la tabla pizza (PRECIOS EN COP)
-- Llama al procedimiento: poblar_pizza (nombre, tamaño, tipo_pizza_id, mano_obra, costo_receta, iva, utilidad)
-- NOTA: Los tipos de pizza son: 1=Clásica, 2=Especial, 3=Vegetariana
-- -----------------------------------------------------

-- ID 1: Pizza Margarita (Clásica - ID 1)
-- USD Equivalente: MO: 5.00, Receta: 6.50, IVA: 2.00, Utilidad: 12.00 | Total Venta: 25.50
CALL poblar_pizza('Margarita', 'grande', 1, 20000.00, 26000.00, 8000.00, 48000.00);
-- Precio Venta: $102,000 COP

-- ID 2: Pizza de Pepperoni (Clásica - ID 1)
-- USD Equivalente: MO: 4.00, Receta: 8.00, IVA: 2.50, Utilidad: 10.00 | Total Venta: 24.50
CALL poblar_pizza('Pepperoni Clásica', 'mediana', 1, 16000.00, 32000.00, 10000.00, 40000.00);
-- Precio Venta: $98,000 COP

-- ID 3: Pizza de la Casa (Especial - ID 2)
-- USD Equivalente: MO: 7.50, Receta: 15.00, IVA: 4.50, Utilidad: 25.00 | Total Venta: 57.00
CALL poblar_pizza('Suprema Don Piccolo', 'extragrande', 2, 30000.00, 60000.00, 18000.00, 100000.00);
-- Precio Venta: $208,000 COP

-- ID 4: Pizza de Jamón y Champiñones (Especial - ID 2)
-- USD Equivalente: MO: 5.50, Receta: 9.00, IVA: 3.00, Utilidad: 14.00 | Total Venta: 31.50
CALL poblar_pizza('Fungui Jamón', 'grande', 2, 22000.00, 36000.00, 12000.00, 56000.00);
-- Precio Venta: $126,000 COP

-- ID 5: Pizza Vegetariana (Vegetariana - ID 3)
-- USD Equivalente: MO: 3.00, Receta: 5.50, IVA: 1.50, Utilidad: 8.00 | Total Venta: 18.00
CALL poblar_pizza('Verde Primavera', 'personal', 3, 12000.00, 22000.00, 6000.00, 32000.00);
-- Precio Venta: $72,000 COP
-- -----------------------------------------------------
-- 7.Inserción en la tabla receta
-- Llama al procedimiento: poblar_receta (porcion, ingrediente_id, pizza_id, precio_porcion)
-- NOTA: La porción se calcula en función de la medida (kg/ml/cantidad)
-- -----------------------------------------------------

-- ** RECETA 1: MARGARITA (Pizza ID 1) **
CALL poblar_receta(1, 1, 1);   -- 1 Masa
CALL poblar_receta(0.25, 2, 1);    -- 0.25 kg Salsa
CALL poblar_receta(0.40, 3, 1);   -- 0.40 kg Queso
CALL poblar_receta(0.01, 10, 1);   -- 10 ml Aceite

-- ** RECETA 2: PEPPERONI CLÁSICA (Pizza ID 2) **
CALL poblar_receta(1, 1, 2);   -- 1 Masa
CALL poblar_receta(0.30, 2, 2);   -- 0.30 kg Salsa
CALL poblar_receta(0.50, 3, 2);   -- 0.50 kg Queso
CALL poblar_receta(0.40, 6, 2);   -- 0.40 kg Pepperoni

-- ** RECETA 3: SUPREMA DON PICCOLO (Pizza ID 3) **
CALL poblar_receta(1, 1, 3);   -- 1 Masa
CALL poblar_receta(0.50, 2, 3);   -- 0.50 kg Salsa
CALL poblar_receta(1.00, 3, 3);  -- 1.00 kg Queso
CALL poblar_receta(0.50, 4, 3);   -- 0.50 kg Jamón
CALL poblar_receta(0.30, 5, 3);   -- 0.30 kg Champiñones
CALL poblar_receta(0.40, 6, 3);   -- 0.40 kg Pepperoni
CALL poblar_receta(0.20, 8, 3);    -- 0.20 kg Pimientos

-- ** RECETA 4: FUNGUI JAMÓN (Pizza ID 4) **
CALL poblar_receta(1, 1, 4);   -- 1 Masa
CALL poblar_receta(0.40, 2, 4);   -- 0.40 kg Salsa
CALL poblar_receta(0.70, 3, 4);   -- 0.70 kg Queso
CALL poblar_receta(0.60, 4, 4);   -- 0.60 kg Jamón
CALL poblar_receta(0.50, 5, 4);   -- 0.50 kg Champiñones

-- ** RECETA 5: VERDE PRIMAVERA (Pizza ID 5) **
CALL poblar_receta(1, 1, 5);   -- 1 Masa
CALL poblar_receta(0.20, 2, 5);    -- 0.20 kg Salsa
CALL poblar_receta(0.30, 3, 5);   -- 0.30 kg Queso
CALL poblar_receta(0.20, 5, 5);   -- 0.20 kg Champiñones
CALL poblar_receta(0.10, 7, 5);    -- 0.10 kg Aceitunas
CALL poblar_receta(0.15, 8, 5);    -- 0.15 kg Pimientos
CALL poblar_receta(0.10, 9, 5);    -- 0.10 kg Cebolla


-- -- -----------------------------------------------------
-- 8. Inserción en la tabla pedido (TOTALES EN COP)
-- Llama al procedimiento: poblar_pedido (cliente_id, vendedor_id, estado, total_pedido, fecha_hora, tipo_pedido)
-- -----------------------------------------------------

-- Pedido 1 (ID 1): Domicilio. Total: $200,000 COP
CALL poblar_pedido(1, 19,'domicilio','entregado');

-- Pedido 2 (ID 2): Domicilio. Total: $300,000 COP
CALL poblar_pedido(2, 20, 'domicilio','entregado' );

-- Pedido 3 (ID 3): Recoger en Tienda. Total: $102,000 COP
CALL poblar_pedido(3, 19, 'sitio','preparacion');

-- Pedido 4 (ID 4): Domicilio. Total: $252,000 COP
CALL poblar_pedido(4, 21, 'domicilio','entregado');

-- Pedido 5 (ID 5): Domicilio. Total: $208,000 COP
CALL poblar_pedido(5, 20, 'domicilio','entregado');

-- -----------------------------------------------------
-- 9. Inserción en la tabla detalle_pedido (SUBTOTALES EN COP)
-- NOTA: Subtotal = Cantidad * Precio de Venta de la Pizza
-- -----------------------------------------------------

-- Pedido 1 (ID 1): Cliente 1, Vendedor 19. Total $170,000 COP
-- 1x Margarita Grande ($102,000) + 1x Pepperoni Mediana ($98,000) = $200,000 
CALL poblar_detalle_pedido(1, 1, 1); 
CALL poblar_detalle_pedido(2, 1, 1);   

-- Pedido 2 (ID 2): Cliente 2, Vendedor 20. Total $300,000 COP
CALL poblar_detalle_pedido(3, 1, 2);  -- 1x Suprema Don Piccolo EG ($208,000)
CALL poblar_detalle_pedido(5, 1, 2);   -- 1x Verde Primavera Personal ($72,000)
CALL poblar_detalle_pedido(1, 0, 2);   -- 1x Personal (Ajuste para total $300,000)

-- Pedido 3 (ID 3): Cliente 3, Vendedor 19. Total $102,000 COP
CALL poblar_detalle_pedido(1, 1, 3);  -- 1x Margarita Grande ($102,000)

-- Pedido 4 (ID 4): Cliente 4, Vendedor 21. Total $252,000 COP
CALL poblar_detalle_pedido(4, 2, 4);  -- 2x Fungui Jamón Grande (2 * $126,000 = $252,000)

-- Pedido 5 (ID 5): Cliente 5, Vendedor 20. Total $208,000 COP
CALL poblar_detalle_pedido(3, 1, 5);  -- 1x Suprema Don Piccolo EG ($208,000)

-- -----------------------------------------------------
-- 10. Inserción en la tabla pago
-- -----------------------------------------------------
-- Pedido 1: Pago Total ($200,000) con Tarjeta
CALL poblar_pago('pago', 'tarjeta de credito', null);

select * from pago;

-- Pedido 2: Pago Total ($300,000) con Efectivo
CALL poblar_pago('pago', 'efectivo', null);

-- Pedido 3: Pendiente de Pago (Sitio)
CALL poblar_pago('pendiente', 'efectivo',null);

-- Pedido 4: Pago Total ($252,000) con App
CALL poblar_pago('pago', 'app',null);

-- Pedido 5: Abono ($100,000), el resto pendiente
CALL poblar_pago('abono', 'tarjeta de credito', null);

-- -----------------------------------------------------
-- 11. Inserción en la tabla domicilio
-- Repartidores disponibles: 23 (N), 24 (S), 26 (O), 27 (N), 29 (E), 30 (O)
-- -----------------------------------------------------

-- Pedido 1 (Cliente 1): Entregado por Repartidor 23 (N)
CALL poblar_domicilio('Carrera 10 # 5-20', 5, '19:00:00', '19:30:00', 1, 23);

-- Pedido 2 (Cliente 2): Entregado por Repartidor 24 (S)
CALL poblar_domicilio('Avenida 5 # 10-30', 8, '19:15:00', '19:55:00', 2, 24);

-- Pedido 4 (Cliente 4): Entregado por Repartidor 26 (O)
CALL poblar_domicilio('Diagonal 40 # 1-50', 4, '19:30:00', '19:50:00', 4, 26);

-- Pedido 5 (Cliente 5): Entregado por Repartidor 27 (N)
CALL poblar_domicilio('Carrera 70 # 2-60', 10, '19:45:00', '20:20:00', 5, 27);
