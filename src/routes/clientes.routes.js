import { Router } from "express";

import {
    getAll,
    getById,
    create,
    update,
    deleteCliente
    } from "../controllers/clientes.controller.js";

const router = Router();

//CRUD

//C
router.post("/clientes/create", create);

//Read simple
router.post("/clientes/getAll", getAll );

//Read con parametro
router.post("/clientes/getById", getById );

//U
router.post("/clientes/update", update);

//Delete fisico
router.post("/clientes/delete", deleteCliente);


export default router;
