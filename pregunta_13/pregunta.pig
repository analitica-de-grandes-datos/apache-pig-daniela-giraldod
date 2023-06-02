/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
        
--cargar datos
datos = LOAD 'data.csv' USING PigStorage(',') AS (c1: chararray, c2: chararray, c3: chararray ,c4: chararray,c5: chararray);

colores = FOREACH datos GENERATE c5 AS color;

seleccion = FILTER colores BY color MATCHES 'b.*';

STORE seleccion INTO 'output' USING PigStorage(',');


