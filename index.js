const express = require('express');
const bodyParser = require('body-parser');
const clicks = require('./routes/clicks.routes'); // Importa rota
const app = express();
app.use('/clicks', clicks);
let porto = 8000;
app.listen(porto, () => {
    console.log('Servidor em execução no porto' + porto);
});

const dotenv = require("dotenv");

dotenv.config();

//Banco de Dados
const mongoose = require('mongoose');

mongoose.connect(process.env.MONGODB_URL,{useNewUrlParser: true });
mongoose.Promise = global.Promise;
let db = mongoose.connection;
db.on('error', console.error.bind(console, 'Erro na Ligação ao MongoDB'));

//Body Parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use('/', clicks);