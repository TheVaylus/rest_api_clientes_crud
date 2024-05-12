-- Crear la base de datos
CREATE DATABASE masxmenos;

GO

-- Seleccionar la base de datos
USE masxmenos;

GO

-- Crear la tabla Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(255) NOT NULL,
    Apellido NVARCHAR(255) NOT NULL,
    Direccion NVARCHAR(255) NOT NULL,
    Telefono NVARCHAR(20) NOT NULL,
    Email NVARCHAR(255) NOT NULL
);

GO

-- Crear la tabla Empleados
CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(255) NOT NULL,
    Apellido NVARCHAR(255) NOT NULL,
    Cargo NVARCHAR(255) NOT NULL,
    Telefono NVARCHAR(20) NOT NULL,
    Email NVARCHAR(255) NOT NULL
);

GO

-- Crear la tabla Sedes
CREATE TABLE Sedes (
    SedeID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(255) NOT NULL,
    Direccion NVARCHAR(255) NOT NULL,
    Telefono NVARCHAR(20) NOT NULL
);

GO

-- Crear la tabla Proveedores
CREATE TABLE Proveedores (
    ProveedorID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(255) NOT NULL,
    Direccion NVARCHAR(255) NOT NULL,
    Telefono NVARCHAR(20) NOT NULL,
    Email NVARCHAR(255) NOT NULL
);

GO

-- Crear la tabla Productos
CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(255) NOT NULL,
    Descripcion TEXT NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    ProveedorID INT,
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

GO

-- Crear la tabla Ventas
CREATE TABLE Ventas (
    VentaID INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATE NOT NULL,
    ClienteID INT NOT NULL,
    EmpleadoID INT NOT NULL,
    SedeID INT NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID),
    FOREIGN KEY (SedeID) REFERENCES Sedes(SedeID)
);

GO

-- Crear la tabla DetalleVentas
CREATE TABLE DetalleVentas (
    DetalleVentaID INT PRIMARY KEY IDENTITY(1,1),
    VentaID INT NOT NULL,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

GO

-- Stored Procedure para insertar un nuevo cliente
CREATE PROCEDURE InsertarCliente
    @Nombre NVARCHAR(255),
    @Apellido NVARCHAR(255),
    @Direccion NVARCHAR(255),
    @Telefono NVARCHAR(20),
    @Email NVARCHAR(255)
AS
BEGIN
    INSERT INTO Clientes (Nombre, Apellido, Direccion, Telefono, Email)
    VALUES (@Nombre, @Apellido, @Direccion, @Telefono, @Email);
END;

GO

-- Stored Procedure para consultar detalles de un cliente por ClienteID
CREATE PROCEDURE ConsultarCliente
    @ClienteID INT
AS
BEGIN
    SELECT * FROM Clientes WHERE ClienteID = @ClienteID;
END;

GO

-- Stored Procedure para actualizar la dirección de un cliente por ClienteID
CREATE PROCEDURE ActualizarDireccionCliente
    @ClienteID INT,
    @NuevaDireccion NVARCHAR(255)
AS
BEGIN
    UPDATE Clientes SET Direccion = @NuevaDireccion WHERE ClienteID = @ClienteID;
END;

GO

-- Stored Procedure para eliminar un cliente por ClienteID
CREATE PROCEDURE EliminarCliente
    @ClienteID INT
AS
BEGIN
    DELETE FROM Clientes WHERE ClienteID = @ClienteID;
END;

GO

-- Stored Procedure para consultar todos los clientes
CREATE PROCEDURE ConsultarTodosClientes
AS
BEGIN
    SELECT * FROM Clientes;
END;
