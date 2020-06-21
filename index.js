const express = require('express');
const bodyParser = require('body-parser');
const clicks = require('./routes/clicks.routes'); // Importa rota
const app = express();
app.use('/clicks', clicks);
let porto = 8000;
app.listen(porto, () => {
    console.log('Servidor em execução no porto' + porto);
});


//Banco de Dados
const mongoose = require('mongoose');
let url = 'mongodb+srv://clicks:clicks@cluster0-rk0fg.mongodb.net/clicks?retryWrites=true&w=majority';
let mongoDB = process.env.MONGODB_URI || url;
mongoose.connect(mongoDB,{useNewUrlParser: true });
mongoose.Promise = global.Promise;
let db = mongoose.connection;
db.on('error', console.error.bind(console, 'Erro na Ligação ao MongoDB'));

//Body Parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use('/', clicks);