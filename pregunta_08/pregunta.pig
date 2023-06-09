/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

datos = LOAD 'data.tsv' USING PigStorage('\t') AS 
        ( letter:charArray,
          letter_bag:bag{dict:tuple(letter:chararray)},
          lista:map[]);

valores = FOREACH datos GENERATE FLATTEN(letter_bag), FLATTEN(KEYSET(lista));

-- Agrupar los elementos por tupla generada.
grupos = GROUP valores BY ($0,$1);

conteo = FOREACH grupos GENERATE $0, COUNT($1);

STORE conteo INTO 'output' USING PigStorage(',');
