/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname, 
       color 
   FROM 
       u
   WHERE color NOT IN ('blue','black');

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */

datos = LOAD 'data.csv' USING PigStorage(',') AS (c1: chararray, nombre: chararray, c3: chararray ,c4: chararray,color: chararray, value:int);

base = FOREACH datos GENERATE nombre,color;

seleccion = FILTER base BY  NOT(color matches 'blue') OR NOT(color matches 'black');

STORE seleccion INTO 'output' USING PigStorage(',');
