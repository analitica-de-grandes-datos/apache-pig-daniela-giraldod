/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
--cargar datos
datos = LOAD 'data.csv' USING PigStorage(',') AS (nombre1: chararray, nombre2: chararray, fecha: chararray ,color:chararray ,cantidad: int);

datos_con_longitud = FOREACH datos GENERATE nombre2 AS apellido, SIZE(STRSPLIT(nombre2, ' ')) AS longitud;

datos_ordenados = ORDER datos_con_longitud BY longitud DESC, apellido;

s = LIMIT datos_ordenados 5;

STORE s INTO 'output' USING PigStorage(',');
