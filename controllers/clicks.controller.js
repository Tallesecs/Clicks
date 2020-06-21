var Clicks = require('../models/clicks.model');

exports.test = function (req, res) {
    res.send('Olá! Lael');
};

//Adicionar smartphone à BD
exports.create = function (req, res) {
    let clicks = new Clicks(
     {
     quant_total: req.body.quant_total,
     quant_brasil: req.body.quant_brasil,
     quant_estados: req.body.quant_estados,
     quant_mundo: req.body.quant_mundo,
     quant_contatos: req.body.quant_contatos
     }
     );
     clicks.save(function (err) {
    if (err) {
    return next(err);
     }
     res.send('Registo de Click criado com sucesso!!')
     })
    };