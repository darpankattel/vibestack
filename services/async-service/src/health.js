const express = require("express");
const router = express.Router();

router.get("/", (req, res) => {
  res.json({
    service: 'async-service',
    status: 'running',
    message: 'Async service is operational!'
  });
});

module.exports = router;
