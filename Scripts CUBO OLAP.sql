USE Northwind;
-- Crear una vista para la concatenación de categoría y producto
CREATE VIEW ProductCategoryView AS
SELECT 
    p.ProductID, 
    p.ProductName, 
    c.CategoryName, 
    c.CategoryName + ' ' + p.ProductName AS CategoryProduct,
    p.SupplierID
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID;


-- Crear una vista que combine la información requerida
CREATE VIEW NorthwindCube AS
SELECT 
    c.CompanyName AS CustomerName, 
    c.Country AS CustomerCountry, 
    e.LastName AS EmployeeLastName, 
    s.Country AS SupplierCountry, 
    p.CategoryProduct
FROM 
    Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN ProductCategoryView p ON od.ProductID = p.ProductID
JOIN Suppliers s ON p.SupplierID = s.SupplierID;


-- Consulta para obtener los datos del cubo
SELECT 
    CustomerName, 
    CustomerCountry, 
    EmployeeLastName, 
    SupplierCountry, 
    CategoryProduct
FROM 
    NorthwindCube
ORDER BY 
    CustomerName;



-- Crear la tabla para los datos de movilidad
CREATE TABLE MobilityData (
    CountryRegionCode NVARCHAR(10),
    CountryRegion NVARCHAR(50),
    SubRegion1 NVARCHAR(50),
    SubRegion2 NVARCHAR(50),
    MetroArea NVARCHAR(50),
    Iso3166_2Code NVARCHAR(10),
    CensusFipsCode NVARCHAR(10),
    PlaceId NVARCHAR(50),
    Date DATE,
    RetailAndRecreationChange DECIMAL(5, 2),
    GroceryAndPharmacyChange DECIMAL(5, 2),
    ParksChange DECIMAL(5, 2),
    TransitStationsChange DECIMAL(5, 2),
    WorkplacesChange DECIMAL(5, 2),
    ResidentialChange DECIMAL(5, 2)
);

select * from dbo.MobilityData 

-- Crear una vista para los datos de movilidad
CREATE VIEW MobilityCube AS
SELECT 
    CountryRegion AS Country, 
    SubRegion1 AS Department, 
    Date, 
    RetailAndRecreationChange, 
    GroceryAndPharmacyChange, 
    ParksChange, 
    TransitStationsChange, 
    WorkplacesChange, 
    ResidentialChange
FROM 
    MobilityData;


-- Crear una vista para la concatenación de categoría y producto
CREATE VIEW ProductCategoryView1 AS
SELECT 
    p.ProductID, 
    p.ProductName, 
    c.CategoryName, 
    c.CategoryName + ' ' + p.ProductName AS CategoryProduct,
    p.SupplierID
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID;

-- Crear una vista para información de clientes, empleados, proveedores y productos
CREATE VIEW NorthwindCube1 AS
SELECT 
    c.CompanyName AS CustomerName, 
    c.Country AS CustomerCountry, 
    e.LastName AS EmployeeLastName, 
    s.Country AS SupplierCountry, 
    p.CategoryProduct
FROM 
    Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN ProductCategoryView p ON od.ProductID = p.ProductID
JOIN Suppliers s ON p.SupplierID = s.SupplierID;


-- Crear una vista que concatene el nombre del producto y el nombre de la categoría en un mismo campo
SELECT 
    CategoryName + ' - ' + ProductName AS CategoryProduct
FROM ProductCategoryView;

-- Consulta para revisar la información de la vista ProductCategoryView
SELECT *
FROM ProductCategoryView;

-- Consulta para revisar la información de la vista NorthwindCube
SELECT *
FROM NorthwindCube;

-- Consulta para revisar la información de la vista ProductCategoryConcatenated
SELECT *
FROM ProductCategoryConcatenated1;

