/*#############################################
Acontinuacion se presenta los datos y los campos de las
dimenciones que se cargara el Datawarehouse
################################################*/

/*######################################
				DimProductos
########################################*/
Begin
	select 
		ProductID as IDProducto,
		ProductSKU as SKUProducto ,
		ProductName as NombreProducto, 
		ProductCategory as CategoriaProducto, 
		ItemGroup as GrupoArticulo, 
		Demographic as experiencia, 
		case KitType 
			when 'RTF' then 'Ready to Fly'
			when 'KIT' then 'Kit para ensamblar'
			else 'Otro'
		end as TipoKit
	from Product;
end 

/*######################################
				DimEstados(ubicacion)
########################################*/
Begin
	select
		s.StateID as EstadoID,
		s.StateName as MonbreEstado,
		r.RegionName as NombreRegion,
		CASE s.TimeZone
			WHEN 'AKST' THEN 'Alaska Standard Time'
			WHEN 'CST' THEN 'Central Standard Time'
			WHEN 'EST' THEN 'Eastern Standard Time'
			WHEN 'MST' THEN 'Mountain Standard Time'
			WHEN 'PST' THEN 'Pacific Standard Time'
			WHEN 'HST' THEN 'Hawaii-Aleutian Standard Time'
			ELSE 'Otra'
		END as ZonaHoraria 
	from 
		State s join region r on s.RegionID = r.RegionID;
end 

/*######################################
				FactVentas
########################################*/
Begin
	select
		OrderNumber as IdVentas,
		ProductID as ProductoID,
		CustomerStateID as EstadoID,
		CONVERT(DATETIME, OrderDate) as FechaOrden,
		CONVERT(DATETIME, ISNULL(ShipDate,'1900-01-01')) as FechaEnvio,
		Quantity as Cantidad,
		UnitPrice as PrecioUnitario,
		(Quantity*UnitPrice) as SubTotal,
		DiscountAmount as Descuento,
		(Quantity*UnitPrice)-DiscountAmount as Total,
		isnull(PromotionCode,'') as CodigoPromocion
	from
		Sales;
End

