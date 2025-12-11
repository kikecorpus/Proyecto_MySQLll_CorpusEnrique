-- consultas 
-- 1. Mostrar el nombre del repartidor, cantidad de entregas realizadas (estado='entregado'), y total acumulado de pedidos entregados.

select r.nombre , count(d.id_domicilio) as total_entregas
from repartidor r 
left join domicilio d 
on r.id_repartidor = d.repartidor_id
 
 -- correccion 
 -- EL problema se encontraba en que no indique a mysql como iba a contar 
 -- los coincidencias debido que en el select sentencie columnas adicionales fuera de la funcion count().

 SELECT 
    p.nombre, 
    p.apellido, 
    COUNT(d.pedido_id) AS total_domicilios
FROM persona p 
LEFT JOIN repartidor r 
    ON p.id_persona = r.id_repartidor
LEFT JOIN domicilio d 
    ON r.id_repartidor = d.repartidor_id
WHERE r.id_repartidor IS NOT NULL 
GROUP BY 
    p.id_persona;

-- 2. Mostrar los pedidos cuya entrega tomó más de 40 minutos entre hora_salida y hora_entrega

SELECT d.pedido_id, p.nombre , d.hora_salida , d.hora_entrega, TIMESTAMPDIFF(MINUTE, d.hora_salida, d.hora_entrega) AS Duracion_Minutos
FROM domicilio d
left join repartidor r ON d.repartidor_id = r.id_repartidor
WHERE TIMESTAMPDIFF(MINUTE, d.hora_salida, d.hora_entrega) > 40

-- adaptacion 
-- el select se encuentra correcto solo lo adapto a mi base de datos 

select d.pedido_id, p.nombre, d.hora_salida , d.hora_entrega, TIMESTAMPDIFF(MINUTE, d.hora_salida, d.hora_entrega) AS Duracion_Minutos
from domicilio d
left join repartidor r 
on d.repartidor_id = r.id_repartidor
left join persona p 
on p.id_persona = r.id_repartidor
WHERE TIMESTAMPDIFF(MINUTE, d.hora_salida, d.hora_entrega) > 10;


-- Mostrar los repartidores con estado 'activo' que no tienen domicilios asignados 

select r.nombre, r.estado, count(id_domicilio) as cant_pedidos
FROM repartidor r 
left join domicilio d 
ON r.id_repartidor = d.repartidor_id
where r.estado = 'activo' and id_domicilio = 0;

-- correccion 

-- el mismo error del ejercicio anterior, sobre utilizar group y por defecto la condicion se pondria con having

SELECT p.nombre,p.apellido,r.estado,COUNT(d.id_domicilio) AS cant_pedidos_asignados
FROMrepartidor r
JOIN persona p ON r.id_repartidor = p.id_persona -
LEFT JOIN domicilio d ON r.id_repartidor = d.repartidor_id
GROUP BY p.id_persona, p.nombre, p.apellido, r.estado
HAVING cant_pedidos_asignados = 0; 


/*
Vista resumen de desempeño
Crear una vista vista_desempeno_repartidor que muestre:
nombre_repartidor
entregas_totales
promedio_minutos_entrega
*/

create view select r.nombre, count(d.id_domicilio) AS total_entregados, avg(TIMESTAMPDIFF(MINUTE, d.hora_salida, d.hora_entrega))
FROM reparidor r 
left join domicilio d 
on r.id_repartidor = d.repartidor_id
where d.estado = 'entregado';

-- adaptacion 
SELECT p.nombre AS nombre_repartidor,p.apellido AS apellido_repartidor, r.zona, COUNT(d.id_domicilio) AS entregas_totales,AVG(TIMESTAMPDIFF(MINUTE, d.hora_salida, d.hora_entrega)) AS promedio_minutos_entrega
FROM repartidor r
JOIN persona p 
ON r.id_repartidor = p.id_persona 
LEFT JOIN domicilio d 
ON r.id_repartidor = d.repartidor_id 
WHERE d.estado = 'entregado'
GROUP BY p.id_persona, p.nombre, p.apellido, r.zona;