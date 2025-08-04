CREATE DATABASE simpsons;

CREATE TABLE frases (
	id INT auto_increment primary key not null,
    texto VARCHAR(255) not null,
    marca_tiempo TIME,
	descripcion TEXT
);

CREATE TABLE personajes (
	id INT auto_increment primary key not null,
    nombre VARCHAR(45) not null,
	apellido VARCHAR(45),
    ocupacion VARCHAR(45),
	descripcion TEXT
);

CREATE TABLE capitulos (
	id INT auto_increment primary key not null,
    titulo VARCHAR(45) not null,
	numero_episodio INT,
    temporada INT,
	fecha_emision DATE, 
    sinopsis TEXT
);

ALTER TABLE frases ADD COLUMN id_personaje INT;

ALTER TABLE frases
ADD FOREIGN KEY (id_personaje)
REFERENCES personajes (id);

ALTER TABLE frases ADD COLUMN id_capitulo INT;

ALTER TABLE frases
ADD FOREIGN KEY (id_capitulo)
REFERENCES capitulos (id);

CREATE TABLE personajes_has_capitulos (
	id_personajes INT NOT NULL,
    FOREIGN KEY (id_personajes) REFERENCES personajes(id),
    id_capitulos INT NOT NULL,
    FOREIGN KEY (id_capitulos) REFERENCES capitulos(id),
    PRIMARY KEY (id_personajes, id_capitulos)
);


INSERT INTO personajes (nombre, apellido, ocupacion, descripcion)
VALUES ('Marge', 'Bouvier', 'ama de casa', 'Es la madre de la familia Simpson'), 
('Homer', 'Simpson', 'inspector de seguridad', 'Es el padre de la familia Simpson'),
('Bart', 'Simpson', 'estudiante', 'Es el hijo mayor de la familia Simpson'),
('Lisa', 'Simpson', 'estudiante', 'Es la hija mediana de la familia Simpson'),
('Maggie', 'Simpson', '', 'Es la hija menor de la familia Simpson'),
('Ned', 'Flanders', 'emprendedor', 'Es el vecino de la familia Simpson');

INSERT INTO frases (texto, descripcion, id_personaje, id_capitulo)
VALUES ('Hola holita', 'frase típica de Flanders', 6, 3),
('¿Qué es la mente, algo real? ¿qué es lo real?, nada real-mente', 'frase de Homer cundo acuesta a Bart', 2, 1);

INSERT INTO capitulos (titulo, numero_episodio, temporada, fecha_emision, sinopsis)
VALUES ('Sin blanca navidad', 1, 1, '1989-12-17', 'Durante las compras de Navidad, Bart se escabulle y se hace un tatuaje. Marge lo descubre y usa el dinero de los regalos para quitárselo.'),
 ('Bart el genio', 2, 1, '1990-01-02', 'Bart tiene problemas en una prueba de inteligencia y en secreto intercambia su examen con el de Martin, el genio de la clase.'),
 ('La odisea de Homer', 3, 1, '1990-01-09', 'Homer, ansioso porque lo vean trabajando, accidentalmente bloquea su carrito en una tubería radioactiva, provocando de inmediato un incendio.');
 
 INSERT INTO personajes_has_capitulos (id_personajes, id_capitulos)
 VALUES (1,1), 
 (2,1),
 (3,1), 
 (4,1),
 (5,1), 
 (1,2),
 (2,2), 
 (3,2),
 (4,2), 
 (5,2),
 (1,3), 
 (2,3),
 (3,3), 
 (4,3),
 (5,3), 
 (6,3);

INSERT INTO capitulos (titulo, numero_episodio, temporada, fecha_emision, sinopsis)
VALUES ('Hogar, agridulce hogar', 4, 1, '1990-01-28', 'La familia Simpson va a terapia.'),
('Bart, el general', 5, 1, '1990-02-04', 'Bart prepara una guerra contra Nelson para defender a Lisa.'),
('El Blues de la Mona Lisa', 6, 1, '1990-02-11', 'Lisa está triste y se refugia en su música.'),
('El Abominable Hombre Del Bosque', 7, 1, '1990-02-18', 'Los Simpsons se van de viaje en caravana al bosque.');

INSERT INTO frases (texto, marca_tiempo, descripcion, id_personaje, id_capitulo)
VALUES ('Mi hermano es malo malo, no hace más que chinchar.', '05:14:00', 'Frase de Lisa cantando blues', 4, 6),
('Pues... ¡que empiece la zampa!', '01:55:50', 'a la hora de la cena en el comedor', 4, 4),
('Duerme mi niña sobre la rama, cuando la rama se rompa ya, junto a mi niña la cuna caerá', '01:55:50', 'Marge le canta una nana a Maggie', 1, 1),
('Esto es un vehículo para todo tipo de terreno', '02:24:50', 'conduciendo una caravana en medio del bosque', 2, 7),
('No te apures, la situación no es tan mala como pudiera parecer, ¿acaso olvidas que soy un experto montañero?', '11:58:32', 'frase de Homer cuando se pierden en el bosque', 2, 7);
