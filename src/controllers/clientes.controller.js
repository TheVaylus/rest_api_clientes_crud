import { getConnection, sql } from "../models/index.js";

const executeQuery = async (query, parameters = []) => {
    try {
        const pool = await getConnection();
        const request = pool.request();
        parameters.forEach(param => {
            request.input(param.name, param.type, param.value);
        });
        const result = await request.query(query);
        return result.recordset;
    } catch (error) {
        throw error;
    }
};

export const create = async (request, result) => {
    const { nombre, apellidos, direccion, telefono, email } = request.body;

    try {
        const query = "EXEC InsertarCliente @Nombre, @Apellido, @Direccion, @Telefono, @Email";
        const parameters = [
            { name: "Nombre", type: sql.NVarChar, value: nombre },
            { name: "Apellido", type: sql.NVarChar, value: apellidos },
            { name: "Direccion", type: sql.NVarChar, value: direccion },
            { name: "Telefono", type: sql.NVarChar, value: telefono },
            { name: "Email", type: sql.NVarChar, value: email }
        ];
        const createdClient = await executeQuery(query, parameters);
        result.json(createdClient);
    } catch (error) {
        result.status(500).send(error.message);
    }
};

export const getById = async (request, result) => {
    const { id_alumno } = request.body;

    try {
        const query = "EXEC ConsultarCliente @ClienteID";
        const parameters = [
            { name: "ClienteID", type: sql.Int, value: id_alumno }
        ];
        const client = await executeQuery(query, parameters);
        result.json(client);
    } catch (error) {
        result.status(500).send(error.message);
    }
};

export const update = async (request, result) => {
    try {
        const { id, nuevaDireccion } = request.body;

        const query = "EXEC ActualizarDireccionCliente @ClienteID, @NuevaDireccion";
        const parameters = [
            { name: "ClienteID", type: sql.Int, value: id },
            { name: "NuevaDireccion", type: sql.NVarChar, value: nuevaDireccion }
        ];
        const updatedClient = await executeQuery(query, parameters);
        result.json(updatedClient);
    } catch (error) {
        result.status(500).send(error.message);
    }
};

export const deleteCliente = async (request, result) => {
    try {
        const { id } = request.body;

        const query = "EXEC EliminarCliente @ClienteID";
        const parameters = [
            { name: "ClienteID", type: sql.Int, value: id }
        ];
        const deletedClient = await executeQuery(query, parameters);
        result.json(deletedClient);
    } catch (error) {
        result.status(500).send(error.message);
    }
};

export const getAll = async (request, result) => {
    try {
        const query = "EXEC ConsultarTodosClientes";
        const clients = await executeQuery(query);
        result.json(clients);
    } catch (error) {
        result.status(500).send(error.message);
    }
};
