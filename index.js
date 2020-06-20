const express = require('express');
const bodyParser = require('body-parser');
const clicks = require('./routes/clicks.routes'); // Importa rota
const app = express();
app.use('/clicks', clicks);
let porto = 8000;
app.listen(porto, () => {
    console.log('Servidor em execução no porto' + porto);
});

const mongoose = require('mongoose');

let url = '';
let mongoDB = process.env.MONGODB_URI || url;
mongoose.connect(mongoDB);
mongoose.Promise = global.Promise;
let db = mongoose.connection;
db.on('error', console.error.bind(console, 'Erro na Ligação ao MongoDB'));