<<<<<<< HEAD
# Biblioteca Campus

## 1. Listar todos los libros disponibles
```sql
SELECT id_libro, titulo, genero, isbn
FROM libros
WHERE disponible = TRUE
ORDER BY titulo;
```

## 2. Buscar libros por género
```sql
SELECT id_libro, titulo, genero, isbn, disponible
FROM libros
WHERE genero = 'Realismo mágico'
ORDER BY titulo;
```

## 3. Obtener información de un libro por ISBN
```sql
SELECT id_libro, titulo, genero, isbn, disponible
FROM libros
WHERE isbn = '978-0307474728';
```

## 4. Contar el número de libros en la biblioteca
```sql
SELECT COUNT(*) AS total_libros
FROM libros;
```

## 5. Listar todos los autores
```sql
SELECT id_autor, nombre, apellido, nacionalidad
FROM autores
ORDER BY apellido, nombre;
```

## 6. Buscar autores por nombre
```sql
SELECT id_autor, nombre, apellido, biografia
FROM autores
WHERE nombre LIKE '%Gabriel%' OR apellido LIKE '%Gabriel%';
```

## 7. Obtener todos los libros de un autor específico
```sql
SELECT l.id_libro, l.titulo, l.genero
FROM libros l
INNER JOIN libro_autor la ON l.id_libro = la.id_libro
INNER JOIN autores a ON la.id_autor = a.id_autor
WHERE a.id_autor = 1
ORDER BY l.titulo;
```

## 8. Listar todas las ediciones de un libro
```sql
SELECT id_publicacion, editorial, fecha_publicacion, numero_edicion, idioma
FROM publicaciones
WHERE id_libro = 1
ORDER BY numero_edicion;
```

## 9. Obtener la última edición de un libro
```sql
SELECT id_publicacion, editorial, fecha_publicacion, numero_edicion, idioma
FROM publicaciones
WHERE id_libro = 1
ORDER BY fecha_publicacion DESC, numero_edicion DESC
LIMIT 1;
```

## 10. Contar cuántas ediciones hay de un libro específico
```sql
SELECT id_libro, COUNT(*) AS total_ediciones
FROM publicaciones
WHERE id_libro = 1
GROUP BY id_libro;
```

## 11. Listar todas las transacciones de préstamo
```sql
SELECT id_transaccion, id_libro, id_miembro, fecha_prestamo,
       fecha_devolucion_estimada, fecha_devolucion_real, estado
FROM transacciones
ORDER BY fecha_prestamo DESC;
```

## 12. Obtener los libros prestados actualmente
```sql
SELECT t.id_transaccion, l.titulo, t.fecha_prestamo, t.fecha_devolucion_estimada, t.estado
FROM transacciones t
INNER JOIN libros l ON t.id_libro = l.id_libro
WHERE t.estado IN ('prestado', 'atrasado')
ORDER BY t.fecha_devolucion_estimada;
```

## 13. Contar el número de transacciones de un miembro específico
```sql
SELECT id_miembro, COUNT(*) AS total_transacciones
FROM transacciones
WHERE id_miembro = 3
GROUP BY id_miembro;
```

## 14. Listar todos los miembros de la biblioteca
```sql
SELECT id_miembro, nombre, apellido, correo, telefono, fecha_registro
FROM miembros
ORDER BY apellido, nombre;
```

## 15. Buscar un miembro por nombre
```sql
SELECT id_miembro, nombre, apellido, correo
FROM miembros
WHERE nombre LIKE '%Laura%' OR apellido LIKE '%Laura%';
```

## 16. Obtener las transacciones de un miembro específico
```sql
SELECT t.id_transaccion, l.titulo, t.fecha_prestamo, t.fecha_devolucion_estimada, t.estado
FROM transacciones t
INNER JOIN libros l ON t.id_libro = l.id_libro
WHERE t.id_miembro = 3
ORDER BY t.fecha_prestamo DESC;
```

## 17. Listar todos los libros y sus autores
```sql
SELECT l.titulo, CONCAT(a.nombre, ' ', a.apellido) AS autor
FROM libros l
INNER JOIN libro_autor la ON l.id_libro = la.id_libro
INNER JOIN autores a ON la.id_autor = a.id_autor
ORDER BY l.titulo, a.apellido;
```

## 18. Obtener el historial de préstamos de un libro específico
```sql
SELECT t.id_transaccion, m.nombre, m.apellido, t.fecha_prestamo,
       t.fecha_devolucion_estimada, t.fecha_devolucion_real, t.estado
FROM transacciones t
INNER JOIN miembros m ON t.id_miembro = m.id_miembro
WHERE t.id_libro = 1
ORDER BY t.fecha_prestamo DESC;
```

## 19. Contar cuántos libros han sido prestados en total
```sql
SELECT COUNT(*) AS total_prestamos
FROM transacciones;
```

## 20. Listar todos los libros junto con su última edición y estado de disponibilidad
```sql
SELECT l.titulo, l.disponible, p.editorial, p.fecha_publicacion, p.numero_edicion
FROM libros l
LEFT JOIN publicaciones p ON p.id_publicacion = (
        SELECT p2.id_publicacion
        FROM publicaciones p2
        WHERE p2.id_libro = l.id_libro
        ORDER BY p2.fecha_publicacion DESC, p2.numero_edicion DESC
        LIMIT 1
    )
ORDER BY l.titulo;
```
=======
# Biblioteca_Campus
>>>>>>> deb833402d4aaac3cb3520549fdda3d53dcd100c
