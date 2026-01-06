const express = require("express");
// const { createClient } = require("redis");

const router = express.Router();

// const redis = createClient({
//   url: "redis://redis:6379"
// });

// redis.connect();

// POST /tasks
router.post("/task", async (req, res) => {
  const job = JSON.stringify(req.body);
//   await redis.lPush("jobs", job);
  res.json({ status: "queued", job });
});

module.exports = router;
