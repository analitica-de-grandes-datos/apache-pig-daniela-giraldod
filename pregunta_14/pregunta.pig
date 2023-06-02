/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       color 
   FROM 
       u 
   WHERE 
       color NOT LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig


--cargar datos
datos = LOAD 'data.csv' USING PigStorage(',') AS (c1: chararray, c2: chararray, c3: chararray ,c4: chararray,c5: chararray);

colores = FOREACH datos GENERATE c5 AS color;

seleccion = FILTER colores BY NOT(color MATCHES 'b.*');

STORE seleccion INTO 'output' USING PigStorage(',');
