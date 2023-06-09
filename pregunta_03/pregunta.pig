/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

--cargar datos
datos = LOAD 'data.tsv' USING PigStorage('\t') AS (letra: chararray, fecha: chararray, cantidad: int);

datos = FOREACH datos GENERATE cantidad;
ordenar  = ORDER datos BY cantidad asc;

s = LIMIT ordenar 5;

-- Escribir los resultados en el archivo de salida
STORE s INTO  'output' USING PigStorage(',');
