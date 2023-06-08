/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

--cargar datos
datos = LOAD 'data.tsv' USING PigStorage('\t') AS (letra: chararray, fecha: chararray, cantidad: int);

grupos = GROUP datos BY letra;

conteos = FOREACH grupos GENERATE group AS letra, COUNT(datos) AS cantidad;

-- Escribir los resultados en el archivo de salida
STORE conteos INTO  'output' USING PigStorage(',');
