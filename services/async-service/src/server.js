const express = require("express");

const taskRoutes = require("./routes/tasks");
const healthRoute = require("./health");

const app = express();
const PORT = 3000;

app.use(express.json());

// routes
app.use("/", healthRoute);
app.use("/tasks", taskRoutes);

// start server
app.listen(PORT, () => {
  console.log(`Async service running on port ${PORT}`);
});
