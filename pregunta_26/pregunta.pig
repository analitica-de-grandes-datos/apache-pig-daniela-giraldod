/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname 
   FROM 
       u 
   WHERE 
       SUBSTRING(firstname, 0, 1) >= 'm';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos = LOAD 'data.csv' USING PigStorage(',') AS (c1: chararray, nombre: chararray, apellido: chararray ,c4: chararray,color: chararray, value:int);


datos_filtrados = FILTER datos BY SUBSTRING(nombre, 0, 1) >= 'm';
nombres = FOREACH datos_filtrados GENERATE nombre;
STORE nombres INTO 'output' USING PigStorage(',');
