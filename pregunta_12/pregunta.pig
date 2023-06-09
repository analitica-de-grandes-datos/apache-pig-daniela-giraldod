/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
salida esperada es la siguiente:

  (Hamilton)
  (Holcomb)
  (Garrett)
  (Fry)
  (Kinney)
  (Klein)
  (Diaz)
  (Guy)
  (Estes)
  (Jarvis)
  (Knight)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
--cargar datos
datos = LOAD 'data.csv' USING PigStorage(',') AS (c1: chararray, c2: chararray, c3: chararray );

apellidos = FOREACH datos GENERATE c3 AS nombre;

seleccion = FILTER apellidos BY (INDEXOF('defghijk', SUBSTRING(nombre, 0, 1)) >= 0);

apellidos_sel = FOREACH seleccion GENERATE nombre;

STORE apellidos_sel INTO 'output' USING PigStorage(',');
