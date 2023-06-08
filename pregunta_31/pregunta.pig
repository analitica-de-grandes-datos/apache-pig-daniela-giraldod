/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos = LOAD 'data.csv' USING PigStorage(',') AS (c1: chararray, nombre: chararray, apellido: chararray ,fecha: chararray,color: chararray, value:int);

datos_con_fecha = FOREACH datos GENERATE ToDate(fecha, 'yyyy-MM-dd') AS fecha_nacimiento;
datos_por_anio = GROUP datos_con_fecha BY GetYear(fecha_nacimiento);
cantidad_por_anio = FOREACH datos_por_anio GENERATE group AS anio, COUNT(datos_con_fecha) AS cantidad;
STORE cantidad_por_anio INTO 'output' USING PigStorage(',');
