# API REST con Stored Procedures - Proyecto CRUD

Este proyecto consiste en el desarrollo de una API REST que proporciona funcionalidades CRUD (Create, Read, Update, Delete) para gestionar datos de clientes en una base de datos. La API utiliza stored procedures para interactuar con la base de datos, lo que garantiza una capa de seguridad y modularidad.

## Funcionalidades

La API ofrece las siguientes funcionalidades:

### 1. Crear un nuevo cliente

Permite registrar un nuevo cliente en la base de datos.

### 2. Consultar detalles de un cliente

Permite obtener información detallada de un cliente específico proporcionando su ID.

### 3. Actualizar la información de un cliente

Permite modificar la información de un cliente existente, como su dirección, nombre, etc.

### 4. Eliminar un cliente

Permite eliminar un cliente de la base de datos según su ID.

### 5. Consultar todos los clientes

Permite obtener una lista de todos los clientes registrados en la base de datos.

## Tecnologías Utilizadas

- **Lenguaje de Programación:** Se ha utilizado NodeJS para la parte de el backend.
- **Framework de Desarrollo:** Express.js para la creación de la API REST.
- **Base de Datos:** Se ha utilizado Microsoft SQL Server (todo el script para la creacion de la base de datos exacta usada para este proyecto incluyendo todas las tablas y Stored Procedures estan en el archivo .sql en la carpeta DB de el proyecto).
- **Stored Procedures:** Se han implementado stored procedures para la interacción con la base de datos.

## Disclaimer

- Parte de el codigo para la configuracion general de la api fueron copiados y modificados de proyectos realizados en clase, esto para el ahorro de tiempo en tareas repetitivas como crear desde cero toda la configuracion general y conexion de la api.

- El archivo .env tendra que ser modifica para ajustar la conexion en cada dispositivo a la base de datos.


