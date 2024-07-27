# DBT Citi Bike Project

## Descripción del Proyecto

Este proyecto utiliza dbt (Data Build Tool) y DuckDB para procesar y analizar datos de los viajes en bicicleta de Citi Bike. El objetivo es demostrar cómo dbt puede ser utilizado para transformar y analizar datos de manera eficiente, gestionando la ingesta, limpieza, y enriquecimiento de datos, así como la creación de métricas útiles.

## Orígenes

El proyecto se basa en datos públicos proporcionados por Citi Bike, un sistema de bicicletas compartidas en Nueva York. Los datos incluyen información detallada sobre cada viaje realizado, como el tipo de bicicleta, las estaciones de inicio y finalización, y los tiempos de cada viaje.

## Descripción de los Datos

Los datos de Citi Bike incluyen las siguientes columnas:
- `ride_id`: Identificador único para cada viaje
- `rideable_type`: Tipo de bicicleta (por ejemplo, clásica, eléctrica)
- `started_at`: Fecha y hora de inicio del viaje
- `ended_at`: Fecha y hora de finalización del viaje
- `start_station_name`: Nombre de la estación de inicio
- `start_station_id`: Identificador de la estación de inicio
- `end_station_name`: Nombre de la estación de finalización
- `end_station_id`: Identificador de la estación de finalización
- `start_lat`: Latitud de la estación de inicio
- `start_lng`: Longitud de la estación de inicio
- `end_lat`: Latitud de la estación de finalización
- `end_lng`: Longitud de la estación de finalización
- `member_casual`: Tipo de usuario (miembro o casual)

## Pasos Hechos con DBT

### 1. Cargar los Datos

Los datos fueron cargados desde varios archivos CSV a una tabla staging en DuckDB utilizando dbt. Esto incluyó la especificación de tipos de datos para asegurar una ingesta correcta.

### 2. Rellenar Valores Nulos

Se creó una segunda tabla staging para gestionar valores nulos, reemplazándolos con valores predeterminados (por ejemplo, 'Unknown' para texto y 0.0 para números).

### 3. Cambiar Tipos de Datos

Se creó una vista final en DuckDB para asegurar que los tipos de datos fueran consistentes y correctos para su uso en análisis posteriores.

### 4. Calcular Tiempo y Distancia

Se añadió una vista adicional que calcula el tiempo de cada viaje en minutos y la distancia en kilómetros utilizando la fórmula Haversine para calcular la distancia entre dos puntos geográficos.

## Queries Finales

### Tiempo Medio y Distancia Media por Tipo de Bicicleta

Una consulta SQL fue creada para calcular el tiempo medio y la distancia media de los viajes agrupados por el tipo de bicicleta.

### Trayecto Más Largo en Tiempo y Distancia

Dos consultas SQL fueron creadas para identificar el trayecto más largo en términos de tiempo y distancia. Estas consultas ordenan los datos por la duración del viaje y la distancia recorrida, respectivamente, y seleccionan el viaje más largo en cada caso.

Este resumen proporciona una visión general de los procesos y análisis realizados en el proyecto utilizando dbt y DuckDB.
