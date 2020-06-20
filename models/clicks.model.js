const mongoose = require('mongoose');
const Schema = mongoose.Schema;

let ClicksSchema = new Schema({
    quant_total: {type: Number, required: true},
    quant_brasil: {type: Number},
    quant_estados: {type: Number},
    quant_mundo: {type: Number},
    quant_contatos: {type: Number}
});
// Exportar o modelo
module.exports = mongoose.model('Clicks', ClicksSchema);