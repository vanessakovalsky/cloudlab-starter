const express = require("express");
const os = require("os");

const app = express();
const port = process.env.PORT || 8080;

app.get("/", (req, res) => {
  res.send(`
    <h1>🚀 CloudLab Starter - Node.js App</h1>
    <p>Bienvenue sur votre première application déployée sur GCP !</p>
    <p><b>Serveur :</b> ${os.hostname()}</p>
  `);
});

app.listen(port, () => {
  console.log(`✅ Serveur lancé sur le port ${port}`);
});
