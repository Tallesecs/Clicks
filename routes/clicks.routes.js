const express = require('express');
const router = express.Router();


// Colocar controller que ainda não foi criado
const clicks_controller = require('../controllers/clicks.controller');
// teste simples
router.get('/testar' , clicks_controller.test);
module.exports = router;