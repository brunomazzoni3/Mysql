CREATE DATABASE IF NOT EXISTS peliculas_brunogeneros;
use peliculas_bruno;

CREATE TABLE IF NOT EXISTS peliculas (
codigo INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(100) NOT NULL,
url VARCHAR(255),
imagen_promocional VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS generos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
SELECT * FROM peliculas;
CREATE TABLE IF NOT EXISTS pelicula_genero (
  id_pelicula INT,
    id_genero INT,
 PRIMARY KEY (id_pelicula, id_genero),
 FOREIGN KEY (id_pelicula) REFERENCES peliculas(codigo),
 FOREIGN KEY (id_genero)   REFERENCES generos (id)
 );
SELECT * FROM pelicula_genero;

    INSERT INTO peliculas (titulo, url, imagen_promocional)
		VALUES ('Harry Potter', 'https://www.youtube.com/watch?v=VyHV0BRtdxo', 'https://i0.wp.com/imgs.hipertextual.com/wp-content/uploads/2021/11/Harry-Potter-Stone-1_w.png?fit=2189%2C1152&quality=50&strip=all&ssl=1'),
				('Avatar', 'https://www.youtube.com/watch?v=5PSNL1qE6VY', 'https://sm.ign.com/ign_es/movie/a/avatar/avatar_3gqz.png'),
				('Fast and furious', 'https://www.youtube.com/watch?v=32RAq6JzY-w', 'https://cdn.superaficionados.com/imagenes/12-peliculas-de-accion-fast-x.jpg'),
				('Godzilla', 'https://www.youtube.com/watch?v=vIu85WQTPRc', 'https://hips.hearstapps.com/hmg-prod/images/godzilla-vs-kong-fotogramas-copia-2-1616793657.jpg?resize=980:*'),
				('Interestellar', 'https://www.youtube.com/watch?v=2LqzF5WauAw', 'https://pics.filmaffinity.com/Interstellar-366875261-large.jpg');

	INSERT INTO generos (nombre)
		VALUES ('Terror'),('Ciencia Ficcion'), ('Romance'), ('Accion'),('Drama');
	
    
    INSERT INTO pelicula_genero (id_pelicula, id_genero)
    SELECT codigo, id 
    FROM peliculas 
    CROSS JOIN generos 
    WHERE titulo = 'Harry Potter' AND nombre IN ('Ciencia Ficcion');
    
    INSERT INTO pelicula_genero (id_pelicula, id_genero)
    SELECT codigo, id 
    FROM peliculas 
    CROSS JOIN generos 
    WHERE titulo = 'Avatar' AND nombre IN ('Romance', 'Ciencia Ficcion');
    
    INSERT INTO pelicula_genero (id_pelicula, id_genero)
    SELECT codigo, id 
    FROM peliculas 
    CROSS JOIN generos 
    WHERE titulo = 'Fast and Furious' AND nombre IN ('Accion');
    
    INSERT INTO pelicula_genero (id_pelicula, id_genero)
    SELECT codigo, id 
    FROM peliculas 
    CROSS JOIN generos 
    WHERE titulo = 'Godzilla' AND nombre IN ('Terror');
	
    INSERT INTO pelicula_genero (id_pelicula, id_genero)
    SELECT codigo, id 
    FROM peliculas 
    CROSS JOIN generos 
    WHERE titulo = 'Interestellar' AND nombre IN ('Drama');