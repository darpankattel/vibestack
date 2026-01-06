const express = require("express");
// const { createClient } = require("redis");

const app = express();
app.use(express.json());

// const redis = createClient({
//   url: "redis://redis:6379"
// });

// redis.connect();

app.post("/task", async (req, res) => {
  const job = JSON.stringify(req.body);
//   await redis.lPush("jobs", job);
  res.json({ status: "queued", job });
});

app.get("/", (req, res) => {
  res.send({
    service: 'async-service',
    status: 'running',
    message: 'Async service is operational'
  });
});

app.listen(3000, () => {
  console.log("Async service on port 3000");
});
