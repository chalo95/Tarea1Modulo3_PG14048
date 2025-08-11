/*###################################
		Creacion de la base
#####################################*/
create database DWTailspinToys;


/*###################################
	Hace uso de la base de datos
#####################################*/
use DWTailspinToys;

/*###################################
	Creacion de Dimencion Productos
#####################################*/

CREATE TABLE DimProductos (
    ProductoKey INT PRIMARY KEY IDENTITY,
    IDProducto INT NOT NULL,
    SKUProducto NVARCHAR(50) NOT NULL,
    NombreProducto NVARCHAR(50) NOT NULL,
    CategoriaProducto NVARCHAR(50) NOT NULL,
    GrupoArticulo NVARCHAR(50) NOT NULL,
    experiencia NVARCHAR(50) NOT NULL,
    TipoKit NVARCHAR(50) NOT NULL,
    CurrentRow BIT DEFAULT 1,
    effective_date DATETIME DEFAULT GETDATE(),
    expiration_date DATETIME DEFAULT '9999-12-31'
);

/*###################################
	Creacion de Dimencion Estados(Ubicacion)
#####################################*/
CREATE TABLE DimEstados (
    EstadoKey INT PRIMARY KEY IDENTITY,
    EstadoID INT NOT NULL,
    MonbreEstado NVARCHAR(50) NOT NULL,
    NombreRegion NVARCHAR(50) NOT NULL,
    ZonaHoraria NVARCHAR(50) NOT NULL,
    CurrentRow BIT DEFAULT 1,
    effective_date DATETIME DEFAULT GETDATE(),
    expiration_date DATETIME DEFAULT '9999-12-31'
);

/*###################################
	Creacion de Dimencion Fechas
#####################################*/
CREATE TABLE DimFechas (
    FechaKey INT PRIMARY KEY IDENTITY,
    Fecha DATETIME NOT NULL,
    Anio INT NOT NULL,
    Mes INT NOT NULL,
    Dia INT NOT NULL,
    Semana INT NOT NULL,
);
/*########################################
	Creacion de Tablas de hecho Ventas
##########################################*/
CREATE TABLE FactVentas (
    VentasKey INT PRIMARY KEY IDENTITY,
    IdVentas NVARCHAR(10) NOT NULL,
    ProductID INT NOT NULL,
    StateID INT NOT NULL,
    DateID INT NOT NULL,
    FechaOrden DATETIME NOT NULL,
	FechaEnvio DATETIME NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(18, 2) NOT NULL,
    Subtotal DECIMAL(18, 2) NOT NULL,
    Descuento DECIMAL(18, 2) NOT NULL,
    Total DECIMAL(18, 2) NOT NULL,
    PromotionCode NVARCHAR(20) NOT NULL

    /*****************Llaves foráneas********************/
    FOREIGN KEY (ProductID) REFERENCES DimProductos(ProductoKey),
    FOREIGN KEY (StateID) REFERENCES DimEstados(EstadoKey),
    FOREIGN KEY (DateID) REFERENCES DimFechas(FechaKey)
);
