# Frases de los Simpsons 📺

Base de datos de frases de los Simpsons compuesta por las siguientes tablas:

- Frases
- Capítulos
- Personajes

A través de estas tablas la usuaria puede interactuar de distintas formas:

- Usar las distintas APIs:
  - [API frases](http://localhost:4000/frases) (también podremos subir una nueva frase a través de un post)
  - [API personajes](http://localhost:4000/personajes)
  - [API capítulos](http://localhost:4000/capitulos)
- Buscar por id a través en las APIs añadiendo `/id` al final de la. url:
  - Buscar frases por id del capítulo: [API](http://localhost:4000/frases-capitulos/:id)
  - Buscar frases por id del personaje: [API](http://localhost:4000/frases-personaje/:id)
- Otras funciones:
  - Borrar (delete), buscar (get) o modificar (put) por la id la frase [API](http://localhost:4000/frases/:id)
  - Consultar la [API combinada](http://localhost:4000/frases-personaje/:id) de frases, personajes y capítulos

## ¿Qué puedes hacer en la web?

También podrás ver el frontend con datos de la API
[en este enlace](http://localhost:4000/) en local.

> **Disclaimer:** Tanto el servidor como la base de datos están en local, por lo que hará falta descargar las bases de datos y conectarlas editando los datos de conexión. En la carpeta `/db`está la base de datos y también las querys de cómo se creó.
