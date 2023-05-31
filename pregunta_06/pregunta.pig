/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos = LOAD 'data.tsv' AS 
        ( letter:charArray,
          letter_bag:bag{},
          lista:map[]);
          
v = FOREACH datos GENERATE FLATTEN(letter_bag) as flatten_letter;

grupos = GROUP v BY flatten_letter;

conteos = FOREACH grupos GENERATE group AS lista, COUNT(datos) AS cantidad;

STORE z INTO 'output' USING PigStorage(',');

