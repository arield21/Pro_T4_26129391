const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2');

const app = express();
app.use(bodyParser.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'rest-api2'
});

// Conectar a la base de datos
db.connect(err => {
    if (err) throw err;
    console.log('Conectado a la base de datos');
});

// Obtener todos los libros
app.get('/libros2', (req, res) => {
    db.query('SELECT * FROM Libros2', (err, results) => {
        if (err) return res.status(500).send(err);
        res.json(results);
    });
});

// Obtener un libro por ID
app.get('/libros2/:id', (req, res) => {
    const id = req.params.id;
    db.query('SELECT * FROM Libros2 WHERE id = ?', [id], (err, results) => {
        if (err) return res.status(500).send(err);
        if (results.length === 0) return res.status(404).send('Libro no encontrado');
        res.json(results[0]);
    });
});

// Crear un libro
app.post('/libros2', (req, res) => {
    const { nombre, autor, categoria, año_publicacion, ISBN } = req.body;
    db.query(`INSERT INTO Libros2 (nombre, autor, categoria, año_publicacion, ISBN) VALUES (?, ?, ?, ?, ?)`, 
    [nombre, autor, categoria, año_publicacion, ISBN], (err, results) => {
        if (err) return res.status(500).send(err);
        res.status(201).json({ id: results.insertId, nombre, autor, categoria, año_publicacion, ISBN });
    });
});

// Actualizar un libro
app.put('/libros2/:id', (req, res) => {
    const id = req.params.id;
    const { nombre, autor, categoria, año_publicacion, ISBN } = req.body;
    db.query(`UPDATE Libros2 SET nombre = ?, autor = ?, categoria = ?, año_publicacion = ?, ISBN = ? WHERE id = ?`, 
    [nombre, autor, categoria, año_publicacion, ISBN, id], (err, results) => {
        if (err) return res.status(500).send(err);
        if (results.affectedRows === 0) return res.status(404).send('Libro no encontrado');
        res.json({ id, nombre, autor, categoria, año_publicacion, ISBN });
    });
});

app.delete('/libros2/:isbn', (req, res) => {
    const isbn = req.params.isbn;
    db.query(`DELETE FROM Libros2 WHERE ISBN = ?`, [isbn], (err, results) => {
        if (err) {
            console.error('Error en la base de datos:', err); // Registro del error en la consola del servidor
            return res.status(500).send('Error en la base de datos');
        }
        if (results.affectedRows === 0) {
            return res.status(404).send('Libro no encontrado');
        }
        if (results.affectedRows === 1) {
            return res.status(200).send(`Libro con ISBN eliminado`);  //ah ajajajaj por fin se imprimio nae!!! me costo un peru!! porque no  se mostraba el mensaje cuando se eliminaba un libro             
        }
    });
});

// Manejo de excepciones
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).send('Algo salió mal!');
});

// Iniciar el servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Servidor escuchando en el puerto ${PORT}`);
});