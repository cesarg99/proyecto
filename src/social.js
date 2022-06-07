var express = require('express');
var router = express.Router();
var dbConn  = require('../lib/db');



// Agregar nuevo estudiante
router.post('/add', function(req, res, next) {    

    let carnet = req.body.carnet;
    let nombres = req.body.nombres;
    let apellidos = req.body.apellidos;
    let telefono = req.body.telefono;
    let carrera = req.body.carrera;
    let facultad = req.body.facultad;
    let area = req.body.area;
    let codigocarrera = req.body.codigocarrera;
    let email = req.body.email;
    let estado = req.body.estado;
    let idtutor = req.body.idtutor;
    let errors = false;

   

    // Si no hay errores
    if(!errors) {

        var form_data = {
            carnet: carnet,
            nombres: nombres,
            apellidos: apellidos,
            telefono: telefono,
            carrera: carrera,
            facultad: facultad,
            area: area,
            codigocarrera: codigocarrera,
            email: email,
            estado: estado,
            idtutor: idtutor
        }
        
        // Insertar estudiante
        dbConn.query('INSERT INTO estudiante SET ?', form_data, function(err, result) {
            //if(err) throw err
            if (err) {
                req.flash('error', err)
                 
                // render to add.ejs
                res.render('social/add', {
                    carnet: form_data.carnet,
                    nombres: form_data.nombres,
                    apellidos: form_data.apellidos,
                    telefono: form_data.telefono,
                    carrera: form_data.carrera,
                    facultad: form_data.facultad,
                    area: form_data.area,
                   codigocarrera: form_data.codigocarrera,
                    email: form_data.email, 
                    estado: form_data.estado,  
                    idtutor: form_data.idtutor                
                })
            } else {                
                req.flash('success', 'Estudiante agregado');
                res.redirect('/');
            }
        })
    }
})



// Visualizar pagina select y hacer consulta
router.get('/add', function(req, res, next) {    
    // render to add.ejs
    dbConn.query('SELECT * FROM docente', function (err, rs){
res.render('social/add', {doce: rs});

    })
 })

    

module.exports = router;