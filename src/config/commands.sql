CREATE DATABASE petstore;

-- Connect to the database
\c petstore;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    mobile_number VARCHAR(20) NULL,
    address VARCHAR(50) NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    status BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now(),
    deleted_at TIMESTAMP NULL
);

-- SELECT FROM users
SELECT count(id) FROM users WHERE email =  '$email' and status = true;

SELECT id, firstname || ' ' || lastname as fullname, email, password FROM users;


-- SELECT * FROM users;

-- COMANDOS DE PSQL
/* 
  \c [nombre_bd] - Conecta a una base de datos específica.
  \l - Lista todas las bases de datos disponibles.
  \dt - Lista todas las tablas en la base de datos actual.
  \d [nombre_tabla] - Muestra la estructura (definición) de la tabla.
  \dn - Lista todos los esquemas en la base de datos.
  \du - Lista todos los roles (usuarios) en el servidor de PostgreSQL.
  \i [ruta_archivo] - Ejecuta comandos SQL desde un archivo (input).
  \o [ruta_archivo] - Envía la salida de los comandos a un archivo.
  \q - Sale de la consola de psql.
  \h [comando] - Muestra la ayuda del comando SQL especificado.
  \? - Muestra la ayuda general de todos los comandos de psql.
  \timing - Activa o desactiva la medición de tiempo para las consultas.
  \copy [tabla] FROM [archivo] - Copia datos desde un archivo a una tabla.
  \copy [tabla] TO [archivo] - Copia datos desde una tabla a un archivo.
  \watch [segundos] - Repeate la última consulta cada cierto número de segundos.
  \password [usuario] - Cambia la contraseña del usuario especificado.
  \set [nombre] [valor] - Establece una variable con un valor.
  \echo [mensaje] - Imprime un mensaje en la consola de psql.
  \x - Alterna la visualización extendida de las tablas de resultados.
  \g - Ejecuta la consulta SQL actual.
  \s - Muestra el historial de comandos ejecutados.
  \! [comando_sistema] - Ejecuta un comando del sistema operativo desde psql.
  \encoding - Muestra o cambia la codificación actual de la base de datos.
  \setenv [nombre] [valor] - Establece una variable de entorno para la sesión.
  \conninfo - Muestra información sobre la conexión actual.
  \cd [directorio] - Cambia el directorio actual de trabajo.
  \pset [opción] [valor] - Cambia la configuración de salida (ej. formato de tablas).
  \x [on off]
  \e - Abre el editor de texto para editar el comando SQL actual.
  \r - Resetea el buffer del comando (borra el comando en curso).
  \d+ [nombre_tabla] - Muestra la estructura detallada de una tabla con más
  información.
  \dt+ - Lista todas las tablas e información adicional (tamaño, etc.).
  \df - Lista todas las funciones definidas en la base de datos.
  \dv - Lista todas las vistas de la base de datos.
  \ds - Lista todas las secuencias en la base de datos.
  \dx - Lista todas las extensiones instaladas en la base de datos.
  \db - Lista todas las tablaspaces en el servidor de PostgreSQL.
  \set [variable] - Establece una variable en la sesión de psql.
  \unset [variable] - Elimina una variable de la sesión de psql.
*/