
# Tarea1Modulo3
<h3><b>Creado:</b> Gonzalo de Jesus Palacios Gonzalez <Br>
<b>Carnet:</b> PG14048</h3>

## Enunciado:

Construir un Datawarehouse para la gestion de ventas que se alimente de la base de datos
TailSpinToys que mantiene las transacciones realizadas por una empresa de venta de juguetes.
La idea del DW es que puedan medir los niveles de venta por cantidad y precio.

<b>Se deberan de considerar los siguientes aspectos:</b>
1. En el modelo origen, existen atributos que estan no normalizados y que se convienten
en dimensiones basura (chunk)
2. Todas las dimensiones y todos sus atributos son de tipo SCD2
3. En esta base de datos hay 3 años de transacciones y por consiguiente la dimension de tiempo
debera tener al menos 5 años de fechas
4. La estrategia de este ejercicio es carga inicial

<b>Para esta actividad, se deberan construir los siguientes puntos:</b>
1. Diseño dimensional
2. Construir la BD de DW
3. Construir los ETL para todas las dimensiones y tabla de hechos, junto con un orquestador 
que ejecute todo a la vez

<b>Fecha de entrega:</b> 11 de agosto a traves de la plataforma.\
<b>Entregable:</b> Enlace a un repositorio publico en Github\
El ejercicio equivale al 30% de la evaluacion del modulo 3.\
Es un ejercicio individual.