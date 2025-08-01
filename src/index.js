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

server.post('/frases', async (req, res) => {

    const {texto, marca_tiempo, descripcion, id_personaje, id_capitulo} = req.body;
   
    try {
    const connection = await getConnection();
    const [result] = await connection.query('INSERT INTO frases(texto, marca_tiempo, descripcion, id_personaje, id_capitulo) VALUES (?,?,?,?,?);', [texto, marca_tiempo, descripcion, id_personaje, id_capitulo]);
    await connection.end();
    if (result.length === 0) {
        return res.status(404).json({error: "frase no encontrada"});
    }
    res.status(200).json({
        "success": true,
        "id": result.insertId

    });

    } catch(error){
        res.status(500).json(error);
    }
});


server.get('/frases', async(req, res) => {
    console.log("ey")
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



