const express = require('express');
const app = express();

app.get('/health', (req, res) => {
	res.sendStatus(200);
});

app.get('/', (req, res) => {
	res.send('OK');
});

app.listen(8000);
