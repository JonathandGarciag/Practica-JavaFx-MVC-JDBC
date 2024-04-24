-- drop database if exists SuperDB; --

Create database SuperDB;
Use SuperDB;

Create Table Clientes(
	clienteId int not null auto_increment,
    nombre varchar(30) not null,
    apellido varchar(30) not null,
    telefono varchar(15) not null,
    direccion varchar(200) not null,
    nit varchar(11) default 'CF',
    Primary key PK_clienteId(clienteId)
);

Insert into Clientes(nombre, apellido, telefono, direccion, nit) values
	('Luis', 'Cuxun', '1234-5678', 'Ciudad', '165-489'),
    ('Estuardo', 'Garcia', '9876-5432', 'Ciudad', '489-789'),
    ('Carlos', 'Mendez', '1899-1596', 'Ciudad', '132-489');
    
select * from Clientes;
-- CRUD CLIENTES --
-- AGREGAR --
Delimiter $$
Create procedure sp_agregarClientes(nom varchar(30), ape varchar(30), tel varchar(15), dir varchar(200), nt varchar(11))
begin
				insert into Clientes(nombre, apellido, telefono, direccion, nit)
						values (nom, ape, tel, dir, nt);
end$$
Delimiter ;

-- LISTAR --
delimiter $$
create procedure sp_ListaClientes()
	begin
		select 
			Clientes.clienteId,
			Clientes.nombre,
			Clientes.apellido,
            Clientes.telefono,
            Clientes.direccion,
            Clientes.nit
				from Clientes;
	end$$
delimiter ;

-- ELIMINAR --
delimiter $$
create procedure sp_EliminarClientes(in clidId  int)
	begin
		delete from Clientes
			where clienteId  = clidId;
	end$$
delimiter ;

-- BUSCAR --
delimiter $$
create procedure sp_BuscarClientes(in clidId int)
	begin
		select
			Clientes.nombre,
			Clientes.apellido,
            Clientes.telefono,
            Clientes.direccion,
            Clientes.nit
            from Clientes
					where clienteId = clidId;
	end$$
delimiter ;

-- EDITAR --
delimiter $$
create procedure sp_EditarClientes(in clidId int, in nom varchar(30), in ape varchar(30), in tel varchar(15), in dir varchar(200), in nt varchar(11))
	begin	
		update Clientes
			set
				nombre = nom,
                apellido = ape,
                telefono = tel,
                direccion = dir,
                nit = nt
					where clienteId = clidId;
	end$$
delimiter ;

call sp_ListaClientes();
    
SET GLOBAL time_zone = '-6:00';
    
    
    
    
    
    
    
    
    
    
    
    


