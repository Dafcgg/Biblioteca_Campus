USE biblioteca_campus;

INSERT INTO autores (nombre, apellido, biografia, fecha_nacimiento, nacionalidad) VALUES
('Gabriel', 'García Márquez', 'Escritor colombiano, premio Nobel de Literatura 1982.', '1927-03-06', 'Colombia'),
('Isabel', 'Allende', 'Escritora chilena reconocida por el realismo mágico.', '1942-08-02', 'Chile'),
('George', 'Orwell', 'Novelista y ensayista británico, autor de obras distópicas.', '1903-06-25', 'Reino Unido'),
('Jane', 'Austen', 'Novelista inglesa conocida por sus comentarios sociales.', '1775-12-16', 'Reino Unido'),
('Julio', 'Cortázar', 'Escritor argentino, figura clave del boom latinoamericano.', '1914-08-26', 'Argentina');

INSERT INTO libros (titulo, genero, isbn, disponible) VALUES
('Cien años de soledad', 'Realismo mágico', '978-0307474728', FALSE),
('La casa de los espíritus', 'Realismo mágico', '978-0525433451', TRUE),
('1984', 'Distopía', '978-0451524935', FALSE),
('Orgullo y prejuicio', 'Romance', '978-1503290563', FALSE),
('Rayuela', 'Ficción experimental', '978-8437604572', TRUE);

INSERT INTO libro_autor (id_libro, id_autor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(5, 1);

INSERT INTO publicaciones (id_libro, editorial, fecha_publicacion, numero_edicion, idioma) VALUES
(1, 'Editorial Sudamericana', '1967-05-30', 1, 'Español'),
(1, 'Debolsillo', '2014-01-15', 5, 'Español'),
(2, 'Plaza & Janés', '1982-01-01', 1, 'Español'),
(3, 'Secker & Warburg', '1949-06-08', 1, 'Inglés'),
(3, 'Debolsillo', '2013-03-10', 3, 'Español'),
(4, 'T. Egerton', '1813-01-28', 1, 'Inglés'),
(5, 'Editorial Sudamericana', '1963-06-28', 1, 'Español');

INSERT INTO miembros (nombre, apellido, correo, telefono, fecha_registro) VALUES
('Dilan', 'Rodríguez', 'dilan.rodriguez@campuslands.edu.co', '3001234567', '2025-01-10'),
('Laura', 'Martínez', 'laura.martinez@correo.com', '3009876543', '2025-02-14'),
('Andrés', 'Gómez', 'andres.gomez@correo.com', '3012345678', '2025-03-05'),
('Camila', 'Torres', 'camila.torres@correo.com', '3023456789', '2025-04-20'),
('Santiago', 'Pérez', 'santiago.perez@correo.com', '3034567890', '2025-05-11');

INSERT INTO transacciones (id_libro, id_miembro, fecha_prestamo, fecha_devolucion_estimada, fecha_devolucion_real, estado) VALUES
(3, 1, '2026-08-01', '2026-08-15', NULL, 'prestado'),
(1, 2, '2026-07-10', '2026-07-24', '2026-07-22', 'devuelto'),
(2, 3, '2026-06-05', '2026-06-19', '2026-06-25', 'devuelto'),
(4, 4, '2026-08-05', '2026-08-19', NULL, 'prestado'),
(5, 5, '2026-05-01', '2026-05-15', '2026-05-14', 'devuelto'),
(1, 3, '2026-08-10', '2026-08-24', NULL, 'atrasado');
