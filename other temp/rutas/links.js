const express = require('express');
const router = express.Router();

const pool = require('../database');

router.get('/add', (req, res) => {

    res.render('links/add');
});

router.post('/add', async (req, res) => {

const { nombres, apellidos,telefono,carrera,facultad,area,codigocarrera,email,estado} = req.body;

const newLink = {
nombres, 
apellidos,
telefono,
carrera,
facultad,
area,
codigocarrera,
email,
estado
};



await pool.query('INSERT INTO estudiante set ?', [newLink]);

const { user, pass} = req.body;

const newLink2 = {
user,
pass
};



await pool.query('INSERT INTO login set ?', [newLink2]);

res.send('Registrado correctamente');





});
    

router.get('/', async (req, res) => {
const estudiantes = await pool.query('SELECT * FROM estudiante');
console.log('estudiantes');
res.render('links/list', {estudiantes});



});

module.exports = router;