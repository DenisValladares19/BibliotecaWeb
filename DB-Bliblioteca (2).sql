drop database Biblioteca;
create database Biblioteca;
use Biblioteca;

create table libro (
idLibro int not null auto_increment,
nombre varchar(50),
idGenero int,
anioLanzamiento int,
idEditorial int,
sinopsis varchar(250),
isbn varchar(50),
cantidad int,
idTipoLibro int,
edicion varchar(50),
costoCompra double,
costoVenta double,
idAutor int,
urlimagen varchar(50),
urlArchivo varchar(50),
borradoLogico int,
primary key(idLibro));



insert into libro(idLibro,nombre,idGenero,anioLanzamiento,idEditorial,sinopsis,isbn,cantidad,idTipoLibro,edicion,costoCompra,costoVenta,idAutor,urlimagen,urlArchivo,borradoLogico)
values
(1,"El turno del ofendido",1,1962,6,"Los poemas que integran El turno del ofendido reflejan con profundo lirismo el interés de Roque Dalton por temas sociales e históricos, al tiempo que critica mordazmente la historia salvadoreña. Afloran además, en este libro, poemas de alto contenido indigenista y religioso, en los que cabe advertir a ratos una postura anticlerical.",
"Pasillo 3",12,1," " ,12.3,16.99,1,"el_turno_del_ofendido.jpg","Libro/PDF/elturno.pdf",1),
(2,"La llama doble",1,1993,8,"La llama doble es un ensayo enteramente unitario que, por su importancia en el conjunto de la obra Octavio Paz, resulta comparable a títulos tan decisivos como El arco y la lira o El laberinto de la soledad.",
"Pasillo 6",9,1," " ,23.3,30.99,2,"llamad.jpg","Libro/PDF/llamadoble.pdf",1),
(3,"Cien años de soledad",2,1982,6,"Muchos años después, frente al pelotón de fusilamiento, el coronel Aureliano Buendía había de recordar aquella tarde remota en que su padre lo llevó a conocer el hielo. Macondo era entonces una aldea de veinte casas de barro y cañabrava construidas a la orilla de un río de aguas diáfanas que se precipitaban por un lecho de piedras pulidas, blancas y enormes como huevos prehistóricos. El mundo era tan reciente, que muchas cosas carecían de nombre, y para mencionarlas había que señalarlas con el dedo.",
"Pasillo 2",25,2," " ,15.1,19.35,3,"cien_años.jpg","Libro/PDF/ciensoledad.pdf",1);


create table editorial(
idEditorial int not null auto_increment,
nombre varchar(50),
idPais int,
borradoLogico int,
primary key(idEditorial));

insert into editorial(idEditorial,nombre,idPais,borradoLogico)
values
(1,"Alire",1,1),
(2,"Mosaic Press",1,1),
(3,"Future Horizons",2,1),
(4,"Universidad del Valle de Guatemala",5,1),
(5,"Editorial Santillana S.A. De C.V.",7,1),
(6,"Nova Casa",7,1),
(7,"Anama Ediciones",8,1),
(8,"Alfaomega Grupo Editor",3,1),
(9,"Tragaluz Editores S.A.",11,1),
(10,"The University of the West Indies Press",29,1),
(11,"Editorial Alfa",35,1),
(12,"ManuPax Editores",14,1),
(13,"Naïve",32,1);

create table tipoLibro(
idTipoLibro int not null auto_increment,
tipo varchar(50),
borradoLogico int,
primary key(idTipoLibro));

insert into tipoLibro(idTipoLibro,tipo,borradoLogico)
values
(1,"Digital",1),
(2,"Fisico",1);



create table prestamo(
idPrestamo int not null auto_increment,
inicio date,
fin date,
estado boolean,
idSolicitud int,
borradoLogico int,
primary key(idPrestamo));

create table solicitudPrestamo(
idSolicitud int not null,
idCliente int,
idLibro int,
fecha date,
borradoLogico int,
primary key(idSolicitud));


create table penalizacion(
idPenalizacion int not null,
cantidad float,
motivo varchar(50),
idCliente int,
idPrestamo int,
borradoLogico int,
primary key(idPenalizacion)
);

create table cliente(
idCliente int not null auto_increment,
nombre varchar(50),
apellido varchar(50),
direccion varchar(100),
idPais int,
idUsuario int,
borradoLogico int,
primary key(idCliente));

insert into cliente(idCliente,nombre,apellido,direccion,idPais,idUsuario,borradoLogico)
value
(1,"User","Cliente","San Salvador",7,4,1),
(2,"Jimmy","Jocsan","La Libertad",3,5,1),
(3,"Leonardo","Tadeo","San Jose",9,6,1);


create table pais(
idPais int not null auto_increment,
nombre varchar(50),
borradoLogico int,
primary key(idPais));


insert into pais(idPais,nombre,borradoLogico)
values
(1,"Canada",1),
(2,"Estados Unidos",1),
(3,"Mexico",1),
(4,"Belice",1),
(5,"Guatemala",1),
(6,"Honduras",1),
(7,"El Salvador",1),
(8,"Nicaragua",1),
(9,"Costa Rica",1),
(10,"Panama",1),
(11,"Colombia",1),
(12,"Brasil",1),
(13,"Argentina",1),
(14,"Perú",1),
(15,"Bolivia",1),
(16,"Chile",1),
(17,"Paraguay",1),
(18,"Ecuador",1),
(19,"Guyana",1),
(20,"Uruguay",1),
(21,"Surinam",1),
(22,"Trinidad y Tobago",1),
(23,"Cuba",1),
(24,"Republica Dominicana",1),
(25,"Bahamas",1),
(26,"Barbados",1),
(27,"Dominica",1),
(28,"Haití",1),
(29,"Jamaica",1),
(30,"Antigua y Barbuda",1),
(31,"Granada",1),
(32,"Santa Lucia",1),
(33,"San Cristobal y Nieves",1),
(34,"San Vicente y las Granadinas",1),
(35,"Venezuela",1);



create table empleado(
idEmpleado int not null auto_increment,
nombre varchar(50),
apellido varchar(50),
direccion varchar(50),
dui varchar(10),
nit varchar(20),
afp varchar(15),
isss varchar(15),
idUsuario int,
borradoLogico int,
primary key(idEmpleado));


insert into empleado(idEmpleado,nombre,apellido,direccion,dui,nit,afp,isss,idUsuario,borradoLogico)
values
(1,"Francisco Edgardo","Hernandez Palacios","Santa Tecla","05153578-5","0507-141098-101-1","012884254415","106912364",2,1),
(2,"Denis Alexander","Valladares Escobar","San Sanvador","00257832-9","0254-241099-332-2","068795412357","587641357",3,1);


create table usuarios
(
id int(11) not null primary key auto_increment,
usuario varchar(45) not null,
password varchar(45) not null,
correo varchar(45) not null,
borradoLogico int,
id_tipo int(11)
);


insert into usuarios values(1,"Administrador",Sha1("12345"),"admin@mail.com",1,1);
insert into usuarios values(2,"Edgardo",Sha1("123456"),"edgard@mail.com",1,2);
insert into usuarios values(3,"Denis",Sha1("123456"),"denis@mail.com",1,2);
insert into usuarios values(4,"User",Sha1("123456"),"user@mail.com",1,3);
insert into usuarios values(5,"Jocsan",Sha1("123456"),"jocsan@mail.com",1,3);
insert into usuarios values(6,"Tadeo",Sha1("123456"),"tadeo@mail.com",1,3);

create table tipo_usuario
(
id int(11) not null primary key auto_increment,
nombre varchar(45) not null);

insert into tipo_usuario values(1,"Administrador");
insert into tipo_usuario values(2,"Empleado");
insert into tipo_usuario values(3,"Cliente");

create table venta(
idVenta int not null auto_increment,
idCliente int,
idLibro int,
fecha date,
cantidad int,
totalPagar float,
idDetalleEnvio int,
idEstadoVenta int,
borradoLogico int,
primary key(idVenta));

create table envio(
idEnvio int not null auto_increment,
costoEnvio double,
destino varchar(100),
borradoLogico int,
primary key(idEnvio));

create table detalleEnvio(
idDetalleEnvio int not null auto_increment,
idEnvio int,
idCompra int,
idEstadoEnvio int,
tiempoEnvio varchar(15),
borradoLogico int,
primary key(idDetalleEnvio));


create table estadoEnvio(
idEstadoEnvio int auto_increment,
nombreEstado varchar(50),
borradoLogico int,
primary key(idEstadoEnvio));


insert into estadoEnvio(idEstadoEnvio,nombreEstado,borradoLogico)
values
(1,"En Proceso de Envio",1),
(2,"Envaido",1),
(3,"Entregado",1),
(4,"Cancelado",1);


create table compra(
idCompra int auto_increment,
idEmpleado int,
idEditorial int,
fecha date,
cantidad int,
totalPagar double,
borradoLogico int,
primary key(idCompra));

create table membresia(
idMembresia int auto_increment,
fecha date,
duracion varchar(50),
idCliente int,
idTipoMembresia int,
borradoLogico int,
primary key(idMembresia));

create table tipoMembresia(
idTipoMembresia int primary key auto_increment,
nombre varchar(50)
);

create table club(
idClub int auto_increment,
idCliente int,
idEmpleado int,
nombre varchar(50),
borradoLogico int,
primary key(idClub));

create table oferta(
idOferta int auto_increment,
idClub int,
idEmpleado int,
nombre varchar(50),
descuento varchar(10),
borradoLogico int,
primary key(idOferta));

create table notificacion(
idNotificacion int auto_increment,
idOferta int,
borradoLogico int,
primary key(idNotificacion));

create table autor(
idAutor int auto_increment not null,
nombre varchar(50),
sexo varchar(50),
fechaNacimiento int,
fechaDefuncion int,
idGenero int,
idPais int,
biografia text,
imagen varchar(100),
borradoLogico int,
primary key (idAutor));


insert into autor(idAutor,nombre,sexo,fechaNacimiento,fechaDefuncion,idGenero,idPais,biografia,imagen,borradoLogico)
values
(1,"Roque Dalton","Masculino",1935,1975,5,7,"Gabriel García Márquez nació en Aracataca (Colombia) el 6 de marzo de 1927. Sus padres fueron Gabriel García  y Luisa Márquez.
Estudió Derecho en la Universidad Nacional de Colombia, pero lo abandonó para dedicarse al periodismo y la literatura.
En 1955, publicó La hojarasca, su primer novela. En 1961, se instaló en Ciudad de México. El mismo año publicó El coronel no tiene quien le escriba y al año siguiente Los funerales de Mamá Grande. En 1967, mandó publicar en Buenos Aires Cien años de soledad, la obra que lo consagró a nivel mundial. En 1972, ganó el Premio Rómulo Gallegos y en 1982, el Premio Nobel de Literatura.
Otras grandes obras suyas son El otoño del patriarca (1975), Crónica de una muerte anunciada (1981), El amor en los tiempos del cólera (1985) y Noticia de un secuestro (1996). Sus memorias fueron publicadas en 2002 con el título de Vivir para contarla.
En sus últimos años padeció de cáncer linfático, mal que provocó su muerte el 17 de abril de 2014, en Ciudad de México.","Roque_Dalton.jpg",1), 
(2,"Octavio Paz","Masculino",1914,1998,4,3,"Octavio Irineo Paz Lozano ​ (Ciudad de México, 31 de marzo de 1914-Ib., 19 de abril de 1998) fue un poeta, ensayista y diplomático mexicano, Premio Nobel de Literatura en 1990. Se le considera uno de los más influyentes escritores del siglo XX y uno de los grandes poetas hispanos de todos los tiempos.​ Su extensa obra abarcó géneros diversos, entre los que sobresalieron poemas, ensayos y traducciones.
Paz fue introducido a la literatura a una edad temprana gracias a la biblioteca de su abuelo. Hijo y nieto de periodistas políticos, siguió la tradición familiar y se convirtió en escritor, publicando su primer volumen de poesía, Luna silvestre, en 1933. Paz también fue un hábil editor y ayudó a fundar una revista literaria llamada Taller en 1938. Entró en el servicio diplomático en 1945 y más tarde fue nombrado Embajador de México en la India, posición que ocupó de 1962 a 1968. Paz renunció en protesta por el manejo del gobierno mexicano de manifestaciones estudiantiles durante los Juegos Olímpicos
Maestro tanto en la poesía como en la prosa, Paz  desarrolló ambos géneros durante toda su vida. Poesía como «Piedra de sol (1957), y las obras críticas y analíticas, como El Laberinto de la soledad (1950), consolidaron su reputación de maestro del lenguaje y de intelecto agudo. Produjo más de 30 libros y colecciones de poesía en su vida. Paz recibió numerosos premios por su trabajo, incluyendo el Premio Nobel de Literatura en 1990. Murió el 19 de abril de 1998, en la Ciudad de México, México.","paz_octavio_1.jpg",1), 
(3,"Gabriel García Márquez","Masculino",1927,2014,2,11,"Roque Dalton fue un poeta, ensayista, narrador, dramaturgo, periodista y revolucionario salvadoreño que nació el 14 de mayo de 1935 en Quezaltepeque, San Salvador.
Dalton cursó sus primeros estudios en algunos colegios religiosos luego ingresó al Externado de San José, donde en 1953 obtuvo el título de bachiller.
Sus estudios superiores los realizó en México y Chile, pero terminaría regresando a El Salvador a concluirlos. Desde muy joven se dedicó al periodismo y a la literatura, participando en certámenes nacionales y centroamericanos donde obtuvo reconocimientos. Sus primeros poemas los publicó en la revista Hoja y en Diario Latino.
Fue uno de los partícipes de la renovación de la lírica latinoamericana de la década de 1960.
Fue miembro del Circulo Literario Universitario junto con Otto René Castillo, Manlio Argueta, Roberto Armijo y Alfonso Quijada, entre otros, obtuvo en tres ocasiones el Premio Centroamericano de Poesía y el Premio Casa de las Américas por Taberna y otros lugares, considerado como su mejor libro de poemas.A los 22 años Roque Dalton ingresó en el Partido Comunista Salvadoreño. Curiosamente su actividad literaria corre paralela a la militancia revolucionaria y el reconocimiento de su valía como escritor coincide a su vez con las primeras encarcelaciones y exilios en Guatemala, México, Cuba, Checoslovaquia, Corea, Vietnam del Norte y otros países.
Más tarde se convirtió en el fundador del Ejercito Revolucionario del Pueblo (ERP), una base importante para lo que luego sería la guerrilla salvadoreña.
Murió asesinado el 10 de Mayo de 1975, por  sus propios compañeros de esa organización que había fundado.","gabrielgarciamarquez12.jpg",1);




create table genero(
idGenero int auto_increment not null,
nombre varchar(50),
descripcion varchar(255),
primary key(idGenero));


insert into genero(idGenero,nombre,descripcion)
values
(1,"Poesia","Composición literaria que se concibe como expresión artística de la belleza por medio de la palabra,en especial aquella que está sujeta a la medida y cadencia del verso."),
(2,"Fantasia"," Un género narrativo basado sobre todo en los elementos de fantasía, dentro del cual se pueden agrupar varios subgéneros, entre los que están la literatura de terror, ciencia ficción o la literatura gótica."),
(3,"Religiosa","Es la literatura de tema religioso, o bien la parte del arte religioso que se expresa literariamente. Su opuesto es la literatura profana."),
(4,"Ciencia Ficcion","Es la denominación de uno de los géneros derivados de la literatura de ficción, junto con la literatura fantástica y la narrativa de terror."),
(5,"Medieval","Es toda aquella que fue producida durante la Edad Media, periodo que se extendió desde el siglo V hasta el siglo XV aproximadamente.");

use Biblioteca;
alter table libro add constraint fkLibroEditorial foreign key(idEditorial) references editorial (idEditorial) on update cascade on delete no action;
alter table libro add constraint fkLibroGenero foreign key(idGenero) references genero(idGenero) on update cascade on delete no action;    
alter table libro add constraint fkLibroTipoLibro foreign key(idTipoLibro) references tipoLibro(idTipoLibro) on update cascade on delete no action;
alter table prestamo add constraint fkPrestamoSolicitudPrestamo foreign key(idSolicitud) references solicitudPrestamo(idSolicitud) on update cascade on delete no action;
alter table solicitudPrestamo add constraint fkSolicitudPrestamoCliente foreign key(idCliente) references cliente(idCliente) on update cascade on delete no action;
alter table solicitudPrestamo add constraint fkSolicitudPrestamoLibro foreign key(idLibro) references libro(idLibro) on update cascade on delete no action;
alter table penalizacion add constraint fkPenalizacionCliente foreign key(idCliente) references cliente (idCliente) on update cascade on delete no action;
alter table penalizacion add constraint fkPenalizacionPrestamo foreign key(idPrestamo) references prestamo (idPrestamo) on update cascade on delete no action;
alter table cliente add constraint fkClienteUsuario foreign key(idUsuario) references usuarios(id)  on update cascade on delete no action;
alter table empleado add constraint fkEmpleadoUsuario foreign key(idUsuario) references usuarios(id);
alter table cliente add constraint fkClientePais foreign key(idPais) references pais(idPais) on update cascade on delete no action;
alter table detalleEnvio add constraint fkDetalleEnvioCompra foreign key(idCompra) references compra(idCompra) on update cascade on delete no action;
alter table detalleEnvio add constraint fkDetalleEnvioEnvio foreign key(idEnvio) references envio(idEnvio) on update cascade on delete no action;
alter table detalleEnvio add constraint fkDetalleEnvioEstadoEnvio foreign key(idEstadoEnvio) references estadoEnvio(idEstadoEnvio) on update cascade on delete no action;
alter table compra add constraint fkCompraEmpleado foreign key(idEmpleado) references empleado(idEmpleado) on update cascade on delete no action;
alter table compra add constraint fkCompraEditorial foreign key(idEditorial) references editorial(idEditorial) on update cascade on delete no action;
alter table membresia add constraint fkMembresiaCliente foreign key(idCliente) references cliente(idCliente) on update cascade on delete no action;
alter table membresia add constraint fkMembresiaTipo foreign key(idTipoMembresia) references tipoMembresia(idTipoMembresia) on update cascade on delete no action;
alter table club add constraint fkClubCliente foreign key(idCliente) references cliente(idCliente) on update cascade on delete no action;
alter table club add constraint fkClubEmpleado foreign key(idEmpleado) references empleado(idEmpleado) on update cascade on delete no action;
alter table oferta add constraint fkOfertaClub foreign key(idOferta) references club(idClub)  on update cascade on delete no action;
alter table oferta add constraint fkOfertaEmpleado foreign key(idEmpleado) references empleado(idEmpleado) on update cascade on delete no action;
alter table notificacion add constraint fkNotificacionOferta foreign key(idOferta) references oferta(idOferta) on update cascade on delete no action;
alter table usuarios add constraint fkTipoUsuario foreign key(id_tipo) references tipo_usuario(id) on update cascade on delete no action;
alter table venta add constraint fkVentaCliente foreign key(idCliente) references cliente(idCliente) on update cascade on delete no action;
alter table venta add constraint fkVentalibro foreign key(idLibro) references libro(idLibro) on update cascade on delete no action;
alter table autor add constraint fkautorGenero foreign key(idAutor) references genero(idGenero);
alter table libro add constraint fkLibroAutor foreign key(idAutor) references autor(idAutor);
alter table editorial add constraint fkEditorialPais foreign key(idPais) references pais(idPais);
alter table autor add constraint fkAutorPais foreign key(idAutor) references pais(idPais);
