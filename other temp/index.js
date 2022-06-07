const express = require('express');
const morgan = require('morgan');
const { engine } = require('express-handlebars');

const path = require('path');

//inicializar Express
const aplicacion = express();

//Configuracion
aplicacion.set('port', process.allowedNodeEnvironmentFlags.PORT || 4000);
aplicacion.set('views', path.join(__dirname,'views'));
aplicacion.engine('.hbs', engine({
defaultLayout: 'main',
layoutDir: path.join(aplicacion.get('views'), 'layouts'),
partialsDir: path.join(aplicacion.get('views'), 'partials'),
extname:'.hbs',
helpers: require('./librerias/handlebars')

}));

aplicacion.set('view engine', '.hbs');
aplicacion.use(morgan('dev'));
aplicacion.use(express.urlencoded({extended: false}));
aplicacion.use(express.json());

//Variables Globales
aplicacion.use((req, res, next) =>{
    next();
});


//Rutas
aplicacion.use(require('./rutas'));
aplicacion.use(require('./rutas/authentication'));
aplicacion.use('/links',require('./rutas/links'));



//Archivos Publicos

aplicacion.use(express.static(path.join(__dirname, 'public')));


//Iniciar el servidor
aplicacion.listen(aplicacion.get('port'), () => {

console.log('Server en puerto', aplicacion.get('port'));
});