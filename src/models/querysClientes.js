export const querys = {
    // CRUD
    create: "EXEC InsertarCliente @Nombre, @Apellido, @Direccion, @Telefono, @Email",

    // Read simple
    getAll: "EXEC ConsultarTodosClientes",

    // Read con parametro
    getById: "EXEC ConsultarCliente @ClienteID",

    // U
    update: "EXEC ActualizarDireccionCliente @ClienteID, @NuevaDireccion",

    // D
    deleteCliente: "EXEC EliminarCliente @ClienteID"
};
