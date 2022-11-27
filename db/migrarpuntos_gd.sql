update gd   SET
departamento_id =  (select m.departamento_id from geo.municipio as m  where st_intersects(m.geom, st_setsrid(st_makepoint(gd.location_longitude_decimal::DECIMAL,gd.location_latitude_decimal::DECIMAL), 4326)))
, departamento = (select m.departamen from geo.municipio as m  where st_intersects(m.geom, st_setsrid(st_makepoint(gd.location_longitude_decimal::DECIMAL,gd.location_latitude_decimal::DECIMAL), 4326)))
, municipio_id = (select m.id from geo.municipio as m  where st_intersects(m.geom, st_setsrid(st_makepoint(gd.location_longitude_decimal::DECIMAL,gd.location_latitude_decimal::DECIMAL), 4326)))
, municipio = (select m."name" from geo.municipio as m  where st_intersects(m.geom, st_setsrid(st_makepoint(gd.location_longitude_decimal::DECIMAL,gd.location_latitude_decimal::DECIMAL), 4326)))
, provincia = (select m.provincia from geo.municipio as m  where st_intersects(m.geom, st_setsrid(st_makepoint(gd.location_longitude_decimal::DECIMAL,gd.location_latitude_decimal::DECIMAL), 4326)))
where gd.location_latitude_decimal is not null

;

select 
(select m.departamento_id from geo.municipio as m where st_intersects(m.geom, st_setsrid(st_makepoint(gd.location_longitude_decimal::DECIMAL,gd.location_latitude_decimal::DECIMAL), 4326))) as depa,
gd.id, gd.location_latitude_decimal, gd.location_longitude_decimal, gd.departamento_id,gd.municipio_id,gd.departamento, gd.municipio,gd.provincia
from gd as gd
where gd.location_latitude_decimal is not null