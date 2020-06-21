const mongoose = require('mongoose');
const Schema = mongoose.Schema;

let ClicksSchema = new Schema({
    quant_total: {type: Number, required: true},
    quant_brasil: {type: Number, required: true},
    quant_estados: {type: Number, required: true},
    quant_mundo: {type: Number, required: true},
    quant_contatos: {type: Number, required: true}
});
// Exportar o modelo
module.exports = mongoose.model('Clicks', ClicksSchema);