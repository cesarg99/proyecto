var express = require("express")
var router = express.Router()

// Handler de tablas de base de datos.
var conn = require("../db orm/orm").conn
var tabla = require("../db orm/orm").tabla
var util = require("util")

// Variables globales del usuario.
var nombreUser = null

// Rutas.
router.get("/", (req, res) => {
    var user = req.body.user
    var pass = req.body.password

    // Registro en base de datos.
    var tbUsuarios = new tabla("usuarios", conn)
    tbUsuarios.setCols(["user", "contra"])
    tbUsuarios.setTypes(["string", "string"])

    tbUsuarios.doQuery(null).then((resultado) => {
        res.render("index", { resultado })
    }).catch((error) => {
        console.log("Error")
    })

    
})

router.get("/deleted", (req, res) => {
    var user = req.query.user

    var tbUsuarios = new tabla("usuarios", conn)
    tbUsuarios.setCols(["user", "contra"])
    tbUsuarios.setTypes(["string", "string"])

    tbUsuarios.delete("user", user)

    console.log(user)
})


router.get("/login", (req, res) => {
    res.render("login")
})

router.get("/registro", (req, res) => {
    res.render("registro")
})

// Recibir info de form en html.
/* 
router.post("/registrado", (req, res) => {
    // Recibiendo argumentos de formulario.
    var user = req.body.user
    var pass = req.body.password

    // Registro en base de datos.
    var tbUsuarios = new tabla("usuarios", conn)
    tbUsuarios.setCols(["user", "contra"])
    tbUsuarios.setTypes(["string", "string"])
    
    // Insertando datos. En caso de exito.
    tbUsuarios.insert([user, pass])

    res.render("registrado", { user })
})*/

router.post("/logeado", (req, res) => {
    // Recibiendo argumentos de formulario.
    

    var user = req.body.user
    var pass = req.body.password
    var tipo = req.body.tutor

    global.nombreUser = user
    console.log(tipo)



    console.log(user)

    // Registro en base de datos.
    var tbUsuarios = new tabla("estudiante", conn)
    tbUsuarios.setCols(["carnet", "pass", "nombres", "apellidos", "telefono", "carrera", "facultad", "area", "codigocarrera", "email", "estado", "idtutor"])
    tbUsuarios.setTypes(["string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "other"])
    
    var tbTutores = new tabla("docente", conn)
    tbTutores.setCols(["idtutor", "nombres", "apellidos", "facultad", "telefono", "direccion", "usuario", "pass"])
    tbTutores.setTypes(["other", "string", "string", "string", "string", "string", "string", "string"])

    // Confirmacion del registro y busqueda del usuario.
    console.log("SELECT USER FROM " + tbTutores.nombre + " WHERE user = '" + user + "'")
    if (tipo == true) {
        tbTutores.doQuery("usuario = '" + user + "'").then((resultado) => {
            if (user == resultado[0].usuario && pass == resultado[0].pass) {
                console.log("Has iniciado sesion!")
                res.render("logeado", { user, tipo })
            } else {
                console.log("Error datos incorrectos")
                res.render("errorInicio")
            }
                
    
        }).catch((error) => {
            console.log("Error datos incorrectos")
            res.render("errorInicio")
        })
    } else {
        tbUsuarios.doQuery("carnet = '" + user + "'").then((resultado) => {
            if (user == resultado[0].carnet && pass == resultado[0].pass) {
                console.log("Has iniciado sesion!")
                res.render("logeado", { user })
            } else {
                console.log("Error datos incorrectos")
                res.render("errorInicio")
            }
                
    
        }).catch((error) => {
            console.log("Error datos incorrectos")
            res.render("errorInicio")
        })
    }
    

    
})

router.get("/errorInicio", (req, res) => {
    res.render("errorInicio")
})


// Agregar nuevo estudiante
router.post('/registrado', function (req, res, next) {

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


    var tbUsuarios = new tabla("estudiante", conn)
    tbUsuarios.setCols(["carnet", "pass", "nombres", "apellidos", "telefono", "carrera", "facultad", "area", "codigocarrera", "email", "estado", "idtutor"])
    tbUsuarios.setTypes(["string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "other"])

    
    tbUsuarios.insert([carnet, "a", nombres, apellidos, "1234-2222", "a", facultad, area, codigocarrera, email, estado, idtutor])

    // Si no hay errores
    if (errors) {

    } else {
        //req.flash('success', 'Estudiante agregado');
        res.render("login");
    }
})

router.get("/inicioRegistro", (req, res) => {
    // render to add.ejs
    conn.query('SELECT * FROM docente', function (err, rs){
        res.render('add', {doce: rs});
    })
})


<<<<<<< HEAD
// Modulo del tutor.
router.get("/crud_horas", (req, res) => {
    console.log("entrando")
    conn.query("select estudiante.carnet as carnet, estudiante.nombres as nombre, estudiante.apellidos apellido, docente.nombres tutornombres, sum(controlhoras.numhoras) as total, estudiante.estado as estado from estudiante inner join docente on estudiante.idtutor = docente.idtutor inner join controlhoras on estudiante.carnet = controlhoras.carnet group by estudiante.carnet", (err, rs) => {
        res.render("crud_horas", { resultado:rs})
        
    })
})

router.get("/estudianteEstado", (req, res) => {
    var registro = JSON.parse(req.query.resultado)

    var tbUsuarios = new tabla("estudiante", conn)
    tbUsuarios.setCols(["carnet", "pass", "nombres", "apellidos", "telefono", "carrera", "facultad", "area", "codigocarrera", "email", "estado", "idtutor"])
    tbUsuarios.setTypes(["string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "other"])

    tbUsuarios.doQuery(util.format("carnet='%s'", registro.carnet)).then((rs) => {
        // Actualizando el estado del estudiante desde el objeto.
        registro = rs[0]
        registro.estado = "aprobado"
        console.log(Object.values(registro))
        tbUsuarios.update(Object.values(registro), util.format("WHERE carnet='%s'", registro.carnet))

        
        
    })
    
    
})

=======
//////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////


// Visualizar pagina inicioestudiante y hacer consulta de select estudiante
router.get('/inicioestudiante', function(req, res, next) {    
    conn.query("SELECT * FROM estudiante WHERE carnet='CG19030'", function (err, resultado1){
        res.render('./inicioestudiante', {datosnombre: resultado1});
        
            })
 })


 
// Visualizar pagina progreso estudiante y hacer consulta(se utilizo doble consulta por que cada una se mantiene en un arreglo)
//Si se hace una consulta no hay problema, pero al momento de llamarlo con el foreach no se puede debido al arreglo por eso se coloco en distintos
router.get('/progreso1', function(req, res, next) {    
    // render de progreso1.ejs

    conn.query("SELECT * FROM estudiante WHERE carnet='CG19030'", function(err, resultado2) {
        if (err) {
          return console.log('error: ' + err.message);
        }
        conn.query("SELECT * FROM controlhoras WHERE carnet='CG19030'", function(err, resultado3) {
          if (err) {
            return console.log('error: ' + err.message);
          }
          res.render('./progreso1', {
            datosestudiante: resultado2,
            datoscontrol: resultado3
          });
        });
      });
 
 })


 // Visualizar pagina agregarhoras 
router.get('/registrarhoras', function(req, res, next) {    
    

// render de resgitrarhoras.ejs

    conn.query("SELECT * FROM estudiante WHERE carnet='CG19030'", function(err, resultado4) {
    if (err) {
      return console.log('error: ' + err.message);
    }
    conn.query("SELECT * FROM controlhoras WHERE carnet='CG19030'", function(err, resultado5) {
      if (err) {
        return console.log('error: ' + err.message);
      }
      res.render('./registrarhoras', {
        datosestudiante2: resultado4,
        datoscontrol2: resultado5
      });
    });
  });
    
 })

// Visualizar pagina registrarhoras2 y hacer consulta de select para obtener el carnet del estudiante logueado para luego insertar en tabla

router.get('/registrarhoras2', function(req, res, next) {    
 conn.query("SELECT * FROM estudiante WHERE carnet='CG19030'", function (err, resultado6){
   res.render('./registrarhoras2', {datoscarnet: resultado6});
        
       })
})





// Agregar nuevas horas
router.post('/registrarhoras2', function(req, res, next) {    

  let numhoras = req.body.numhoras;
  let fechainicio = req.body.fechainicio;
  let fechafinal = req.body.fechafinal;
  let institucion = req.body.institucion;
  let carnet = req.body.carnet;
  let errors = false;

 

  // Si no hay errores
  if(!errors) {

      var datos_horas = {
          numhoras: numhoras,
          fechainicio: fechainicio,
          fechafinal: fechafinal,
          institucion: institucion,
          carnet: carnet
          
      }
      
      // Insertar horas
      conn.query('INSERT INTO controlhoras SET ?', datos_horas, function(err, resultado7) {
          //if(err) throw err
          if (err) {
              req.flash('error', err)
               
              // render to registrarhoras2.ejs
              res.render('./registrarhoras2', {
                  numhoras: datos_horas.numhoras,
                  fechainicio: datos_horas.fechainicio,
                  fechafinal: datos_horas.fechafinal,
                  institucion: datos_horas.institucion,
                  carnet: datos_horas.carnet
              })
          } else {                
            
            res.send('Horas registradas ');
            
          }
      })
  }
})



// Agregar estado al estudiante al terminar las horas
router.post('/progreso1', function(req, res, next) {    


  let estado = req.body.estado;
  let errors = false;

 

  // Si no hay errores
  if(!errors) {

      var dato_estado = {

        estado: estado
          
      }
      
      // Insertar estado
      conn.query("UPDATE estudiante SET ? WHERE carnet='CG19030'", dato_estado, function(err, resultado8) {
          //if(err) throw err
          if (err) {
              req.flash('error', err)
               
              // render to registrarhoras2.ejs
              res.render('social/progreso1', {
                estado: datos_horas.estado
              })
          } else {                
            
            res.send('Proceso social enviado correctamente');
            
          }
      })
  }
})




>>>>>>> 136ab2becdcf70ed94469a5d971d596c47ad6c75
module.exports = router
