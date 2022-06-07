const mysql = require('mysql');
const {promisify} = require('util');

const Connection = require('mysql/lib/Connection');

const {database} = require('./keys');

const pool = mysql.createPool(database);

pool.getConnection((err, connection) => {

    if(err){

        if(err.code === 'PROTOCOL_CONNECTION_LOST'){

            console.error('LA CONEXION CON LA BASE DE DATOS ES CERRADA');
        }
        if (err.code === 'ER_CON_COUNT_ERROR')
        {
            console.error('BASE DE DATOS TIENE CONEXIONES');
        }
        if (err.code === 'ECONNREFUSED')
        console.error('CONEXION FUE RECHAZADA');
    }
    if(connection) connection.release();
    console.log('BASE DE DATOS CONECTADA');
    return;
})

pool.query = promisify(pool.query);


module.exports = pool;