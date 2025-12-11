use pizzeria_don_piccolo; 

-- Consulta para probar la funcion y trigger  precio_porcion en receta

select i.ingrediente, i.precio, r.porcion, r.precio_porcion
from ingrediente i 
left join receta r 
on i.id_ingrediente = r.ingrediente_id;

-- consulta de pago 
select p.codigo, if( p.codigo = d.id_domicilio, d.id_domicilio, pe.id_pedido)
from pago p 
left join pedido pe 
on p.codigo = pe.id_pedido 
left join domicilio d 
on p.codigo = d.id_domicilio;
