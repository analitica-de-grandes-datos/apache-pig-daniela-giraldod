/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

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

z = FOREACH (GROUP v BY flatten_letter) GENERATE group,COUNT(v.flatten_letter);

STORE z INTO 'output' USING PigStorage(',');
