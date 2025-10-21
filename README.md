# Dalliat App

Aplicación Flutter para una experiencia de compra y entretenimiento multimedia con autenticación segura.

## Descripción

Este proyecto es una app Flutter que ofrece:
- Registro y login de usuarios contra una API Flask, con autenticación biométrica (huella, rostro, etc.) en Android para mayor seguridad.
- Almacenamiento seguro del token JWT utilizando `flutter_secure_storage`, protegiendo el acceso a funciones autenticadas.
- Pantallas principales para navegación: login, registro, inicio y tienda.
- Integración de reproducción multimedia, incluyendo videos de YouTube y audio, para una experiencia interactiva.
- Conexión a una API externa para gestión de usuarios y posiblemente productos.

## Estructura de vistas

- **Login** (`/login`):
  - Formulario para ingresar usuario y contraseña.
  - Requiere autenticación biométrica exitosa para proceder.
  - Al autenticarse, almacena el JWT y navega a la pantalla de inicio.

- **Registro** (`/register`):
  - Formulario para crear una nueva cuenta de usuario.
  - Envía datos a la API para registrar usuario y contraseña.

- **Home** (`/home`):
  - Pantalla principal que muestra un mensaje de bienvenida si el usuario está autenticado.
  - Muestra el token JWT almacenado de forma segura.
  - Opción para cerrar sesión, eliminando el JWT.

- **Shop** (`/shop`):
  - Pantalla de tienda para explorar y posiblemente adquirir productos.
  - Integra elementos multimedia como imágenes de productos (camisas, chaquetas, gorras, etc.).

## Almacenamiento del token JWT

El token JWT se almacena de forma segura en el dispositivo usando el paquete [`flutter_secure_storage`](https://pub.dev/packages/flutter_secure_storage). Esto garantiza que el token no sea accesible por otras apps y se protege con mecanismos del sistema operativo.

## Autenticación biométrica

La app utiliza el paquete [`local_auth`](https://pub.dev/packages/local_auth) para solicitar autenticación biométrica (huella, rostro, etc.) antes de acceder a la pantalla principal.

## API utilizada

La app se conecta a la API Flask:
[https://flaskapiexample-production.up.railway.app/]

- **Registro:** `POST /users/register`
- **Login:** `POST /users/login`
- **Listado de usuarios:** `GET /users/`


<img width="1071" height="681" alt="Untitled Diagram drawio" src="https://github.com/user-attachments/assets/d7143677-2ed9-4877-b80b-8dbc8c246867" />

## Requisitos

- Flutter 3.x

## Instalación y ejecución

1. Clona el repositorio.
2. Ejecuta `flutter pub get` para instalar dependencias.
3. Ejecuta en Android:
   ```sh
   flutter run
   ```

## Notas
- El token JWT se elimina al cerrar sesión.
- Si la autenticación biométrica falla, el usuario no accede a la pantalla principal.
- El almacenamiento seguro solo está disponible en dispositivos reales (no en emuladores sin soporte biométrico).


