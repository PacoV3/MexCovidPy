## Casos positivos
Los casos positivos son el conjunto de casos que tengan resultado de muestra positivo o que se clasifiquen positivos por asociación epidemiológica o por dictaminación (solo para defunciones). Se filtran todos los casos positivos (CLASIFICACION_FINAL valores “1”, “2” y “3”) registrados en la base de datos.

## Casos activos
Los casos activos son todos aquellos positivos a SARS-CoV-2 con fecha de inicio de síntomas en los últimos 14 días. Las defunciones de casos activos se consideran parte de los casos activos, porque, desde una perspectiva poblacional, contribuyeron a la transmisión del virus. La forma de calcular los casos activos es la siguiente:

- Se filtran todos los casos positivos (CLASIFICACION_FINAL valores “1”, “2” y “3”) registrados en la base de datos.
- Se cuentan los casos según fecha de inicio de síntomas (FECHA_SINTOMAS) y se consideran solo aquellos con menos de 14 días.

## Casos recuperados
Los casos recuperados son todos aquellos positivos a SARS-CoV-2 no hospitalizados, con fecha de inicio de síntomas con más de 14 días y sin fecha de defunción. La forma de calcular los casos activos es la siguiente:

- Se filtran todos los casos positivos (CLASIFICACION_FINAL valores “1” y “2”), ambulatorios (TIPO_PACIENTE valor “1”), sin fecha de defunción (FECHA_DEF valor “99-99-9999”) registrados en la base de datos.
- Se cuentan los casos según fecha de inicio de síntomas (FECHA_SINTOMAS) y según fecha de defunción (FECHA_DEF).
- Al total de casos registrados se restan todos los casos con fecha de inicio de síntomas anterior a los últimos 14 días y los casos con fecha de defunción establecida.

## Casos sospechosos
Los casos sospechosos son la suma de todos aquellos que, para una semana epidemiológica, que cumplen alguna de las siguientes condiciones:

- Se les tomó muestra, pero aún no reciben resultado de la misma.
- Se les tomó muestra, pero ésta no tiene posibilidad de resultado y la clasificación final del caso no es de asociación epidemiológica ni de dictaminación.
- Pacientes a los que no se les tomó muestra y la clasificación final del caso no es de asociación epidemiológica ni de dictaminación.

Para el cálculo de los casos sospechosos se deben seguir la siguiente con sideración:

- Se filtran todos los registros cuyo valor de la CLASIFICACION_FINAL final sea 3, 4 y 5.

## Casos estimados
Los casos estimados, sean positivos, activos o defunciones, es la suma de los casos estimados por entidad federativa y semana epidemiológica, los cuales se calculan de la siguiente manera:

Casos Estimados= [CasosPositivos] + (Casos Sospechosos) × (Indice de positividad)

Donde:

- Casos positivos: Son los casos positivos por entidad de residencia en una determinada semana epidemiológica de inicio de síntomas.
- Casos sospechosos: son los casos sospechosos por entidad federativa de residencia en una determinada semana epidemiológica de inicio de síntomas
- Índice de positividad: es la proporción de muestras positivas a SARS-CoV-2 y el total de muestras (positivos más negativos) para una semana epidemiológica de inicio de síntomas, en una entidad federativa determinada de residencia.

Adicionalmente, para la representación de la información, se considera lo siguiente:

- Las vistas georreferenciadas consideran el lugar de residencia de los pacientes reportados (ENTIDAD_RES y MUNICIPIO_RES).
- Las series temporales consideran la fecha de ingreso (FECHA_SINTOMAS) para los casos Confirmados, Sospechosos y Negativos.
- Las series temporales consideran la fecha de defunción (FECHA_DEF) para los casos de Defunciones.