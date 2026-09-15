-- Requiere MySQL 8.0.16 o superior

DROP DATABASE IF EXISTS biblioteca_campus;

CREATE DATABASE biblioteca_campus
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE biblioteca_campus;

CREATE TABLE autores (
    id_autor         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre           VARCHAR(100) NOT NULL,
    apellido         VARCHAR(100) NOT NULL,
    biografia        TEXT,
    fecha_nacimiento DATE,
    nacionalidad     VARCHAR(80),
    creado_en        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE libros (
    id_libro   INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo     VARCHAR(255) NOT NULL,
    genero     VARCHAR(100) NOT NULL,
    isbn       VARCHAR(20) NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    creado_en  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_libros_isbn UNIQUE (isbn)
) ENGINE=InnoDB;

CREATE TABLE libro_autor (
    id_libro INT UNSIGNED NOT NULL,
    id_autor INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_libro, id_autor),
    CONSTRAINT fk_libroautor_libro
        FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_libroautor_autor
        FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE publicaciones (
    id_publicacion    INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_libro          INT UNSIGNED NOT NULL,
    editorial         VARCHAR(150) NOT NULL,
    fecha_publicacion DATE NOT NULL,
    numero_edicion    SMALLINT UNSIGNED NOT NULL DEFAULT 1,
    idioma            VARCHAR(50) NOT NULL DEFAULT 'Español',
    CONSTRAINT fk_publicacion_libro
        FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uq_publicacion_edicion UNIQUE (id_libro, numero_edicion, idioma),
    CONSTRAINT chk_numero_edicion CHECK (numero_edicion > 0)
) ENGINE=InnoDB;

CREATE TABLE miembros (
    id_miembro     INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre         VARCHAR(100) NOT NULL,
    apellido       VARCHAR(100) NOT NULL,
    correo         VARCHAR(150) NOT NULL,
    telefono       VARCHAR(20),
    fecha_registro DATE NOT NULL DEFAULT (CURRENT_DATE),
    CONSTRAINT uq_miembros_correo UNIQUE (correo)
) ENGINE=InnoDB;

CREATE TABLE transacciones (
    id_transaccion            INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_libro                  INT UNSIGNED NOT NULL,
    id_miembro                INT UNSIGNED NOT NULL,
    fecha_prestamo            DATE NOT NULL,
    fecha_devolucion_estimada DATE NOT NULL,
    fecha_devolucion_real     DATE,
    estado                    ENUM('prestado', 'devuelto', 'atrasado') NOT NULL DEFAULT 'prestado',
    CONSTRAINT fk_transaccion_libro
        FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_transaccion_miembro
        FOREIGN KEY (id_miembro) REFERENCES miembros(id_miembro)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT chk_fechas_transaccion
        CHECK (fecha_devolucion_estimada >= fecha_prestamo),
    CONSTRAINT chk_devolucion_real
        CHECK (fecha_devolucion_real IS NULL OR fecha_devolucion_real >= fecha_prestamo)
) ENGINE=InnoDB;

CREATE INDEX idx_libros_genero ON libros(genero);
CREATE INDEX idx_libros_titulo ON libros(titulo);
CREATE INDEX idx_autores_apellido ON autores(apellido);
CREATE INDEX idx_miembros_apellido ON miembros(apellido);
CREATE INDEX idx_transacciones_estado ON transacciones(estado);
CREATE INDEX idx_publicaciones_libro_fecha ON publicaciones(id_libro, fecha_publicacion);
