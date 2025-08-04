import express from 'express';
import cors from 'cors';
import mysql from 'mysql2/promise';
import dotenv from 'dotenv';

dotenv.config();

const port = process.env.PORT || 4000;

const server = express();

server.use(cors());
server.use(express.json());

server.listen(port, () => {
    console.log(`servidor escuchando: http://localhost:${port}`);
})
 
const getConnection = async() => {
    return await mysql.createConnection (
        {
            host: process.env.DB_HOST,
            user: process.env.DB_USER,
            password: process.env.DB_PASS,
            database: process.env.DB_NAME,
            port: process.env.DB_PORT,
        }
    )
}

//subir una frase nueva
server.post('/frases', async (req, res) => {

    const {texto, marca_tiempo, descripcion, id_personaje, id_capitulo} = req.body;
   
    try {
    const connection = await getConnection();
    const [result] = await connection.query('INSERT INTO frases(texto, marca_tiempo, descripcion, id_personaje, id_capitulo) VALUES (?,?,?,?,?);', [texto, marca_tiempo, descripcion, id_personaje, id_capitulo]);
    await connection.end();
    if (result.length === 0) {
        return res.status(404).json({error: "información no encontrada"});
    }
    res.status(200).json({
        "success": true,
        "id": result.insertId

    });

    } catch(error){
        res.status(500).json(error);
    }
});

// ver todas las frases
server.get('/frases', async(req, res) => {
    try{
        const connection = await getConnection();
        const [result] = await connection.query('SELECT * FROM simpsons.frases');
        await connection.end();
        res.status(200).json({
            info: { "count": result.lenght },
            result: result
        });
     } catch(error){
        res.status(500).json({error: error});
    }
}); 

//buscar por la id de la frase
server.get('/frases/:id', async (req, res) => {
    const id = req.params.id;
    try{
        const connection = await getConnection();
        const [result] = await connection.query('SELECT * FROM simpsons.frases WHERE id = ?', [id]);
        await connection.end();
        if (result.length === 0) {
            return res.status(404).json({error: "frase no encontrada"});
        }
        res.status(200).json({
            result: result
        });
    
    } catch(error){
        res.status(500).json({error: error});
    }
});

//modificar por la id de la frase
server.put('/frases/:id', async (req, res) => {
    const id = req.params.id;

    const texto = req.body.texto;
    const tiempo = req.params.marca_tiempo;
    const descripcion = req.body.descripcion;
    const personaje = req.body.id_personaje;
    const capitulo = req.body.id_capitulo;

    // const {marca_tiempo, texto, descripcion, id_personaje, id_capitulo} = req.body;

    try {
        const connection = await getConnection();
        const [result] = await connection.query('UPDATE simpsons.frases SET texto = ?, marca_tiempo = ?, descripcion = ?, id_personaje = ?, id_capitulo = ? WHERE id= ?', [texto, tiempo, descripcion, personaje, capitulo, id]);

        await connection.end();
        if (result.affectedRows === 0){
            return res.status(404).json({error: "id de la frase no encontrado"});
        }
        res.status(200).json({success: true});
     
    } catch(error){
        res.status(500).json({error: error});
    }
});

//borrar por la id de la frase
server.delete('/frases/:id', async (req, res) => {
    const id = req.params.id;

    try {
        const connection = await getConnection();
        const [result] = await connection.query('DELETE FROM frases WHERE id= ?', [id]);

        await connection.end();
        if (result.affectedRows === 0){
            return res.status(404).json({error: "id de la frase no encontrado"});
        }
        res.status(200).json({success: true});
     
    } catch(error){
        res.status(500).json({error: error});
    }
});

// buscar por la id del personaje 
server.get('/frases/personaje/:id', async (req, res) => {
    const id = req.params.id;
    try{
        const connection = await getConnection();
        const [result] = await connection.query('SELECT frases.texto as frase, personajes.nombre as personaje, capitulos.titulo as capitulo, capitulos.temporada FROM simpsons.frases INNER JOIN simpsons.personajes ON frases.id_personaje = personajes.id INNER JOIN simpsons.capitulos ON frases.id_capitulo = capitulos.id WHERE id_personaje = ?;', [id]);
        await connection.end();
        
        const name = result[0].personaje;

        if (result.length === 0) {
            return res.status(404).json({error: "frase no encontrada"});
        }
        res.status(200).json({
            "ID del personaje": id,
            "personaje": name,
            result: result
        });
    
    } catch(error){
        res.status(500).json({error: error});
    }
});

// buscar frases por la id del capitulo
server.get('/frases/capitulo/:id', async (req, res) => {
    const id = req.params.id;
    try{
        const connection = await getConnection();
        const [result] = await connection.query('SELECT frases.texto as frase, personajes.nombre as personaje, capitulos.titulo as capitulo, capitulos.temporada FROM simpsons.frases INNER JOIN simpsons.personajes ON frases.id_personaje = personajes.id INNER JOIN simpsons.capitulos ON frases.id_capitulo = capitulos.id WHERE id_capitulo = ?;', [id]);
        await connection.end();
        if (result.length === 0) {
            return res.status(404).json({error: "información no encontrada"});
        }
        res.status(200).json({
            "ID del capítulo": id,
            "frases": result
        });
    
    } catch(error){
        res.status(500).json({error: error});
    }
});

// ver todos los personajes
server.get('/personajes', async(req, res) => {
    try{
        const connection = await getConnection();
        const [result] = await connection.query('SELECT * FROM simpsons.personajes');
        await connection.end();
        res.status(200).json({
            info: { "count": result.lenght },
            result: result
        });
     } catch(error){
        res.status(500).json({error: error});
    }
});

// ver todos los capitulos
server.get('/capitulos', async(req, res) => {
    try{
        const connection = await getConnection();
        const [result] = await connection.query('SELECT * FROM simpsons.capitulos');
        await connection.end();
        res.status(200).json({
            info: { "count": result.lenght },
            result: result
        });
     } catch(error){
        res.status(500).json({error: error});
    }
});

// ver las frases, quien las dijo y en qué capítulo
server.get('/frases/personajes/capitulos', async(req, res) => {
    try{
        const connection = await getConnection();
        const [result] = await connection.query('SELECT frases.texto as frase, personajes.nombre as personaje, capitulos.titulo as capitulo FROM simpsons.frases INNER JOIN simpsons.personajes ON frases.id_personaje = personajes.id INNER JOIN simpsons.capitulos ON frases.id_capitulo = capitulos.id;');
        await connection.end();
        res.status(200).json({
            info: { "count": result.lenght },
            result: result
        });
     } catch(error){
        res.status(500).json({error: error});
    }
});