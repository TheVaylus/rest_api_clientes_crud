import express from "express";
import cors from "cors";
import clientesRoutes from "./routes/clientes.routes.js";
import morgan from "morgan";
import swaggerUi from 'swagger-ui-express';
import swaggerDocument from '../swagger.json' assert { type: "json" };

import config from "./config.js";

const app = express();

// settings
app.set("port", config.port);

// Middlewares
app.use(cors());
app.use(morgan("dev"));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));
// Routes
app.use("/api", clientesRoutes);

export default app;

