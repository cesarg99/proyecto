var mysql = require("mysql")
var util = require("util")

var conn = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "root",
    database: "test"
})

// Clase y constructor.
function tabla(nombre, conn) {
    this.nombre = nombre
    this.conn = conn
}

// Get y set.
tabla.prototype.setCols = function (cols) {
    this.cols = cols
}

tabla.prototype.setTypes = function (types) {
    this.types = types
}

// Insertar
tabla.prototype.insert = function (datos) {
    // Scope de la clase.
    var sql = "INSERT INTO " + this.nombre + "("

    // Creando la string con las columnas.
    for (var i = 0; i < this.cols.length; i++) {
        if (i == 0) {
            sql = sql + util.format("%s", this.cols[i])
        } else {
            sql = sql + util.format(", %s", this.cols[i])
        }
    }

    sql = sql + ") VALUES("

    for (var i = 0; i < this.cols.length; i++) {
        if (this.types[i] == "string") {
            if (i == 0) {
                sql = sql + util.format("'%s'", datos[i])
            } else {
                sql = sql + util.format(", '%s'", datos[i])
            }
        } else {
            if (i == 0) {
                sql = sql + util.format("%s", datos[i])
            } else {
                sql = sql + util.format(", %s", datos[i])
            }
        }
    }

    sql = sql + ")"
    this.conn.query(sql, function (err, result) {
        if (err) throw err;
    });

    console.log("Insertado!")
}

var data = [1, 2, 4]
console.log(data.indexOf(4))

tabla.prototype.delete = function (key, id) {
    var sql = "DELETE FROM " + this.nombre + " WHERE " + key + " = "
    var typeIndex = this.cols.indexOf(key)

    if (this.types[typeIndex] == "string") {
        sql = sql + util.format("'%s'", id)
        this.conn.query(sql, function (err, result) {
            if (err) throw err;
            console.log("Borrado!");
        });
    } else {
        sql = sql + util.format("%s", id)
        this.conn.query(sql, function (err, result) {
            if (err) throw err;
            console.log("Borrado!");
        });
    }
}



var a = new tabla("usuarios", conn)
a.setCols(["user", "contra"])
a.setTypes( ["string", "string"])

a.insert(["user", "2"])
a.insert(["hola", "xD"])
a.delete("user", "user")
