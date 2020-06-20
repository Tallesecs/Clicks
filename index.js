const express = require('express');
const bodyParser = require('body-parser');
const clicks = require('./routes/clicks.routes'); // Importa rota
const app = express();
app.use('/clicks', clicks);
let porto = 8000;
app.listen(porto, () => {
    console.log('Servidor em execução no porto' + porto);
});