drop database if exists vacantes;
 create database vacantes;

use vacantes;
#tabla ROL
create table rol(
idRol int not null primary key auto_increment,
descRol varchar(50),
estado int not null
);
 
#creando la tabla usuario
create table usuario(
idUsuario int not null primary key auto_increment,
nombreUsuario varchar(50) unique,
contraseña varchar(50),
estado int not null,
idRol int not null

);

#Tabla idoma
create table idioma(
idIdioma int not null primary key auto_increment,
idioma varchar(50),
estado int
);

#tabla departamentpo
create table pais(
idPais int not null primary key auto_increment,
pais varchar(75), 
estado int 
);

#tabla departamento
create table departamento(
idDepartamento int not null primary key auto_increment,
departamento varchar(75),
idPais int not null,
estado int 
);

#tabla municipio
create table provincia(
idProvincia int not null primary key auto_increment,
provincia varchar(75),
idDepartamento int not null,
estado int
);

#tabla Profesion 
create table profesion(
idProfesion int not null primary key auto_increment,
profesion varchar(75),
estado int,
descripcion varchar(100)
);

#tabla de grado de estudio
create table gradoEstudio(
idGradoEstudio int not null primary key auto_increment,
grado varchar(50), 
estado int 
);

#tabla postulante 
create table postulante(
idPostulante int not null primary key auto_increment,
nombres varchar(75) not null,
apellidos varchar(75) not null,
genero varchar(45) not null,
fechaNacimiento date not null,
telefono varchar(30) not null,
idProvincia int not null,
idDepartamento int not null,
idPais int not null,
idUsuario int not null,
correo varchar(50) not null,
direccion varchar(75) not null,
idProfesion int not null,
idGradoEstudio int not null,
idIdioma int not null,
fotoPerfil longBLOB,
fechaRegistro date not null, 
estado int not null 
);

#tabla experiencia Laboral
create table experiencia(
idExperiencia int not null primary key auto_increment,
empresa varchar(50),
cargo varchar(50),
descripcion varchar(50),
tiempoLaborado int,
idPostulante int not null,
estado int

);
#tabla relacion
create table relacion(
idRelacion int not null primary key auto_increment,
idSeguido int not null,
idSeguidor int not null,
estado int not null
);


#tabla rubro 
create table rubro(
idRubro int not null primary key auto_increment,
nombre varchar(50),
descripcion varchar(50),
estado int 
);

#tabla empresa
create table empresa(
idEmpresa int not null primary key auto_increment,
nombre varchar(75) not null,
direccion varchar(75) ,
telefono varchar(25) not null,
mision varchar(500) ,
vision varchar(500) ,
correo varchar(50) not null,
latitud varchar(150) ,
longitud varchar(150) ,
idUsuario int not null,
idRubro int ,
idProvincia int ,
idDepartamento int ,
idPais int not null,
estado int not null

);


#tabla Habilidades
create table habilidades(
idHabilidad int not null primary key auto_increment,
habilidad varchar(50),
estado int,
descripcion varchar(100),
idProfesion int
);

#tabla detalleHabilidad
create table detalleHabilidad(
idDetalleHabilidad int not null primary key auto_increment,
idHabilidad int not null,
idPostulante int not null,
estado int 
);

#tabla gradoUniversitario
create table gradoUniversitario(
idGradoUniversitario int not null primary key auto_increment,
nombreGrado varchar(50),
estado int
);

#tabla Carrera
create table carrera(
idCarrera int not null auto_increment primary key,
nombreCarrera varchar(50), 
estado int,
idGradoUniversitario int
);

#tabla Puesto
create table puesto(
idPuesto int not null auto_increment primary key,
nombrePuesto varchar(50),
descripcion varchar(50),
idArea int ,
estado int
);

#tabla area
create table area(
idArea int not null primary key auto_increment,
nombre varchar(50),
estado int
);

#tabla oferta
create table oferta(
idOferta int not null primary key auto_increment,
titulo varchar(50),
descripcion varchar(100),
vacantes int,
salarioMinimo double,
salarioMaximo double,
requisitos varchar(500),
idEmpresa int,
aniosExperiencia int,
generoOferta varchar(50),
edadMinima int,
edadMaxima int,
idArea int,
idPuesto int,
fechaPublicacion varchar(100),
estado int



);

#tabla aplicacion Oferta
create table aplicacionOferta(
idAplicacionOferta int primary key auto_increment,
idOferta int,
idPostulante int,
fechaAplicacion date,
estado int

);

#tabla comentario 
create table comentario(
idComentario int primary key auto_increment,
comentario varchar(500),
fechaPublicacion datetime,
idUsuario int,
estado int

);

#tabla comentarioPerfil
create table comentarioPerfil(
idComentarioPerfil int primary key auto_increment,
idPostulante int, 
idComentario int,
estado int
);



#llaves foraneas
alter table usuario add constraint fk_usuarioRol foreign key (idRol)references rol (idRol) ;
alter table departamento  add constraint fk_DepartamentoPais foreign key (idPais)references pais (idPais);
alter table provincia add constraint fk_ProvinciaDepartamento foreign key (idDepartamento)references departamento (idDepartamento);
alter table postulante  add constraint fk_postulantePais  foreign key (idPais)references pais (idPais);
alter table postulante add constraint fk_postulanteDepartamento foreign key (idDepartamento)references Departamento (idDepartamento);
alter table postulante  add constraint fk_postulantProvincia foreign key (idProvincia)references provincia (idProvincia);
alter table postulante add constraint fk_postulanteUsuario foreign key (idUsuario)references usuario (idUsuario);
alter table postulante  add constraint fk_postulanteProfesion foreign key (idProfesion) references profesion (idProfesion);
alter table postulante  add constraint fk_postulanteGradoEstudio foreign key (idGradoEstudio)references gradoEstudio (idGradoEstudio);
alter table postulante  add constraint fk_postulanteIdioma foreign key (idIdioma)references idioma (idIdioma);
alter table detalleHabilidad  add constraint fk_detalleHabilidad1 foreign key (idHabilidad)references habilidades (idHabilidad);
alter table detalleHabilidad  add constraint fk_detalleHabilidad2 foreign key (idPostulante)references postulante (idPostulante);
alter table relacion add constraint fk_relacionUsuario1 foreign key (idSeguido)references usuario (idUsuario);
alter table relacion  add constraint fk_relacion foreign key (idSeguidor)references usuario (idUsuario);
#alter table empresa  add constraint fk_empresaPais foreign key (idPais)references pais (idPais);
#alter table empresa  add constraint fk_empresaDepartamento foreign key (idDepartamento)references departamento (idDepartamento);
#alter table empresa  add constraint fk_empresaProvincia foreign key (idProvincia)references provincia (idProvincia);
#alter table empresa  add constraint fk_empresaRubro foreign key (idRubro)references rubro (idRubro);
alter table experiencia  add constraint fk_experienciaPostulante foreign key (idPostulante)references postulante (idPostulante);
alter table carrera add constraint fk_carrera_gradoUniversitario foreign key(idGradoUniversitario) references gradoUniversitario(idGradoUniversitario);
alter table puesto add constraint fk_puestoArea foreign key(idArea) references area(idArea);
alter table oferta add constraint fk_EmpresaOferta foreign key(idEmpresa) references empresa(idEmpresa);
alter table oferta add constraint fk_AreaOferta foreign key(idArea) references area(idArea);
alter table oferta add constraint fk_PuestoOferta foreign key(idPuesto) references puesto(idPuesto);
alter table aplicacionOferta add constraint fk_PostulanteOferta foreign key(idPostulante) references postulante(idPostulante);
alter table aplicacionOferta add constraint fk_OfertaPostulante foreign key(idOferta) references oferta(idOferta);
alter table comentario add constraint fk_comentarioUsuario foreign key(idUsuario) references usuario(idUsuario);
alter table comentarioPerfil add constraint fk_PerfilComentario foreign key(idComentario) references comentario(idComentario);
alter table comentarioPerfil add constraint fk_ComentarioPerfil foreign key(idPostulante) references postulante(idPostulante);
alter table Experiencia add constraint fk_ExperienciaPostulante foreign key(idPostulante) references postulante(idPostulante);



 
#insertando datos
insert into rol values(0,'Administrador',1);
insert into rol values(0,'Usuario',1);

#insertando usuario para sistema de Escritorio
insert into usuario values(0,'CarlosCampos','27b97374ec529e1ec0cadae4cd25e04c',1,1);
insert into usuario values(0,'JosueTrejo','27b97374ec529e1ec0cadae4cd25e04c',1,1);
insert into usuario values(0,'FernandoFlamenco','27b97374ec529e1ec0cadae4cd25e04c',1,1);
insert into usuario values(0,'KevinMontiel','27b97374ec529e1ec0cadae4cd25e04c',1,1);
insert into usuario values(0,'EduardoRamos','123',1,1);


select r.descRol, u.nombreUsuario from usuario u inner join Rol r on r.idRol=u.idRol where nombreUsuario='CarlosCampos' and contraseña='27b97374ec529e1ec0cadae4cd25e04c';

insert into gradoUniversitario values(0,'Ingenieria',1);

select h.idHabilidad, h.habilidad, h.descripcion, p.profesion from habilidades h inner join profesion p on p.idProfesion=h.idProfesion where h.estado=1 and h.idProfesion=1;
select p.nombrePuesto, p.descripcion, a.nombre from puesto p inner join area a on a.idArea=p.idArea where p.estado=1 and p.idArea=1;

/*JOSUE AMAYA 28/1018 12:13 am*/

INSERT INTO `vacantes`.`rol` (`descRol`, `estado`) VALUES ('Postulante', '1');
INSERT INTO `vacantes`.`rol` (`descRol`, `estado`) VALUES ('Empresa', '1');

/* agregar un usuario para empresa*/
INSERT INTO `vacantes`.`usuario` (`nombreUsuario`, `contraseña`, `estado`, `idRol`) VALUES ('aviaca123', '6116afedcb0bc31083935c1c262ff4c9', '1', '4');
INSERT INTO `vacantes`.`usuario` (`nombreUsuario`, `contraseña`, `estado`, `idRol`) VALUES ('CarlosRamos', '6116afedcb0bc31083935c1c262ff4c9', '1', '3');

/*agregar rubros para las empresas*/
INSERT INTO `vacantes`.`rubro` (`nombre`, `descripcion`, `estado`) VALUES ('Industriales', 'empresas relacionadas con la industria', '1');
INSERT INTO `vacantes`.`rubro` (`nombre`, `descripcion`, `estado`) VALUES ('Turismo', 'empresas relacionadas con  el turismo', '1');
INSERT INTO `vacantes`.`rubro` (`nombre`, `descripcion`, `estado`) VALUES ('Software', 'emresas ralacionadas con la gestion y produccion de softa', '1');

/* agregar paises*/
INSERT INTO `vacantes`.`pais` (`pais`, `estado`) VALUES ('El Salvador', '1');
INSERT INTO `vacantes`.`pais` (`pais`, `estado`) VALUES ('Guatemala', '1');
INSERT INTO `vacantes`.`pais` (`pais`, `estado`) VALUES ('Hondurass', '1');
INSERT INTO `vacantes`.`pais` (`pais`, `estado`) VALUES ('Nicaragua', '1');
INSERT INTO `vacantes`.`pais` (`pais`, `estado`) VALUES ('Costarica', '1');
INSERT INTO `vacantes`.`pais` (`pais`, `estado`) VALUES ('Panama', '1');

/*agregar departamentos para el salvador*/
INSERT INTO `vacantes`.`departamento` (`idDepartamento`, `departamento`, `idPais`, `estado`) VALUES ('', 'San Salvador', '1', '1');
INSERT INTO `vacantes`.`departamento` (`departamento`, `idPais`, `estado`) VALUES ('Santa Ana', '1', '1');
INSERT INTO `vacantes`.`departamento` (`departamento`, `idPais`, `estado`) VALUES ('La Libertad', '1', '1');
INSERT INTO `vacantes`.`departamento` (`departamento`, `idPais`, `estado`) VALUES ('Sonsonate', '1', '1');

/* agregar provincias para san salvador y la libertad*/
INSERT INTO `vacantes`.`provincia` (`provincia`, `idDepartamento`, `estado`) VALUES ('San Salvador', '1', '1');
INSERT INTO `vacantes`.`provincia` (`provincia`, `idDepartamento`, `estado`) VALUES ('Santa Tecla', '3', '1');
INSERT INTO `vacantes`.`provincia` (`provincia`, `idDepartamento`, `estado`) VALUES ('Santa Ana', '2', '1');
INSERT INTO `vacantes`.`provincia` (`provincia`, `idDepartamento`, `estado`) VALUES ('Pnchimalco', '1', '1');
INSERT INTO `vacantes`.`provincia` (`provincia`, `idDepartamento`, `estado`) VALUES ('Lourdes Colon', '3', '1');

/*Agregar informacion de la empresa avianca*/
alter table empresa add column facebook varchar(300);
alter table empresa add column instagram varchar(300);
alter table empresa add column paginaWeb varchar(300);
alter table empresa add column imagenEmpresa varchar(300);
alter table empresa add column descripcion1 varchar(1000);
alter table empresa add column descripcion2 varchar(300);
alter table empresa add column imagen mediumblob;

INSERT INTO `vacantes`.`empresa` (`nombre`, `direccion`, `telefono`, `mision`, `vision`, `correo`, `idUsuario`, `idRubro`, `idProvincia`, `idDepartamento`, `idPais`, `estado`, `facebook`, `instagram`, `paginaWeb`, `descripcion1`, `descripcion2`) 
VALUES ('Avianca', 'Boulevard no se que cerca de Santa elena wey', '(503) 2280-2313', 'Conectamos al mundo con Latinoamérica, buscando dar siempre más.', 'Con la mejor gente y tecnología para una experiencia excepcional, seremos la aerolínea latinoamericana preferida en el mundo. ',
 'avianca_sv@gmail.com', '5', '2', '2', '1', '1', '1', 'https://www.facebook.com/AviancaGlobal/', 'https://www.instagram.com/avianca/?hl=es-la', 'https://www.avianca.com/sv/es/', 'Avianca es la empresa lider en el transporte aereo de personas a anivel munial.\nCada vez que alguien menciona 
 nuestro nombre son una infinidad de pensamientos y recuerdor de los viajes que han realizafo con nosotros\nGracias a la gente que trabaja para nosotros podemos hacer esto y mucho mas por eso queremos que seas parte de nuestra familia', 'Avianca esta comprometida con tigo por eso hemos decidido 
 estar mas cerca de ti a travez de NetJob. aplica ya y se parte de nuestra familia.');
 
 /*INSERTAR EN AREA*/
use vacantes;
select * from area;
INSERT INTO `vacantes`.`area` (`nombre`, `estado`) VALUES ('RRHH', '1');
INSERT INTO `vacantes`.`area` (`nombre`, `estado`) VALUES ('Sistemas', '1');

 /*INSERTAR EN Puesto para rrhh y sistemas*/
 select * from puesto;
alter table puesto add column idEmpresa int;
alter table puesto drop constraint fk_empresa_puesto foreign key (idEmpresa) references empresa(idEmpresa);
INSERT INTO `vacantes`.`puesto` (`nombrePuesto`, `descripcion`, `idArea`, `estado`) VALUES ('Gerente', 'gerente de el area de recursos huanos el aca vamos a cevr todas las cosas que se cese', '1', '1');
INSERT INTO `vacantes`.`puesto` (`nombrePuesto`, `descripcion`, `idArea`, `estado`) VALUES ('Supervisor', 'supervisor de el area', '1', '1');
INSERT INTO `vacantes`.`puesto` (`nombrePuesto`, `descripcion`, `idArea`, `estado`) VALUES ('Secretaria ', 'secretaria de recursos humanos', '1', '1');
INSERT INTO `vacantes`.`puesto` (`nombrePuesto`, `descripcion`, `idArea`, `estado`) VALUES ('Secretaria', 'secretaria de sistemas', '2', '1');
INSERT INTO `vacantes`.`puesto` (`nombrePuesto`, `descripcion`, `idArea`, `estado`) VALUES ('Programador', 'programador junior', '2', '1');
INSERT INTO `vacantes`.`puesto` (`nombrePuesto`, `descripcion`, `idArea`, `estado`) VALUES ('Administrador de Base de Datos', 'encargado de adminitrar los datos de la empresa', '2', '1');
INSERT INTO `vacantes`.`puesto` (`nombrePuesto`, `descripcion`, `idArea`, `estado`) VALUES ('Diseñador Web', 'encargado de el diseño de la pagina web y de las demas aplicaciones', '2', '1');

alter table oferta add column idGradoEstudio int;
alter table oferta add constraint fk_OfertaGRadoEstudio foreign key (idGradoEstudio) references gradoEstudio(idGradoEstudio);

create table requisitos
(
	idRequisito int primary key auto_increment,
    requisito varchar(100),
    descripcion varchar(200),
	idOferta int,
    
    constraint fk_requsisto_empresa foreign key (idOferta) references oferta(idOferta)
);

alter table oferta drop column requisitos;
alter table oferta drop column generoOferta;
alter table oferta add column sexo varchar(100);
alter table oferta add column estadoP int;



INSERT INTO `vacantes`.`gradoestudio` (`grado`, `estado`) VALUES ('Parvularia', '1');
INSERT INTO `vacantes`.`gradoestudio` (`grado`, `estado`) VALUES ('Basica', '1');
INSERT INTO `vacantes`.`gradoestudio` (`grado`, `estado`) VALUES ('Media', '1');
INSERT INTO `vacantes`.`gradoestudio` (`grado`, `estado`) VALUES ('Superior', '1');

/*INSERTAR OFERTA DE PRUEBA*/
INSERT INTO `vacantes`.`oferta` (`titulo`, `descripcion`, `vacantes`, `salarioMinimo`, `salarioMaximo`, `idEmpresa`, `aniosExperiencia`, `edadMinima`, `edadMaxima`, `idArea`, `idPuesto`, `fechaPublicacion`, `estado`, `idGradoEstudio`, `sexo`, `estadoP`) VALUES (' solo hoy DBA ', 'esta es la primera oportonuidad que esta a tus pies', '2', '250', '250', '1', '3', '18', '60', '1', '1', '10/18/18', '1', '2', '1', '1');
INSERT INTO `vacantes`.`oferta` (`titulo`, `descripcion`, `vacantes`, `salarioMinimo`, `salarioMaximo`, `idEmpresa`, `aniosExperiencia`, `edadMinima`, `edadMaxima`, `idArea`, `idPuesto`, `fechaPublicacion`, `estado`, `idGradoEstudio`, `sexo`, `estadoP`) VALUES ('Se busca programador java', 'estamos ogreciendo grandes prestaciopnes a los mejores y tu eres uno', '2', '215', '156', '1', '3', '18', '61', '1', '1', '0000-00-00', '1', '2', '1', '1');

select idOferta from oferta where edadMaxima=25 and idEmpresa=1 and idGradoEstudio=4 and fechaPublicacion='Sat Nov 03 2018 17:34:32 GMT-0600 (hora estándar central)';

select * from usuario;
select idOferta from oferta where edadMaxima=25 and idEmpresa=1 and idGradoEstudio=4 and fechaPublicacion='Sat Nov 03 2018 17:34:32 GMT-0600 (hora estándar central)';


#INSERTANDO POFESIONES
INSERT INTO `vacantes`.`profesion` (`profesion`, `estado`, `descripcion`) VALUES ('Programador', '1', 'Desarrollar Software de Diferente Tipo');
INSERT INTO `vacantes`.`profesion` (`profesion`, `estado`, `descripcion`) VALUES ('Recepcionista', '1', 'Atender clientes que desen un servicio de algun negocio');

#INSERTANDO IDIOMAS
INSERT INTO `vacantes`.`idioma` (`idioma`, `estado`) VALUES ('Inglés', '1');
INSERT INTO `vacantes`.`idioma` (`idioma`, `estado`) VALUES ('Francés', '1');

alter table empresa add column estadoA int;
alter table empresa drop column imagenEmpresa;
alter table empresa add column imagen2 longblob;

use vacantes;
select * from usuario;
select * from requisitos;
INSERT INTO empresa (idEmpresa , nombre, telefono, correo, idUsuario,idPais, estado, estadoA) VALUES (0,'bimbo','561','fef',22,1,1,0);
INSERT INTO empresa (idEmpresa , nombre, telefono, correo, idUsuario,idPais, estado, estadoA ) VALUES (0,'Curacao','84653','bvuifn@feo',42,1,1,0);
select * from departamento;
select * from provincia;
select * from empresa where idUsuario=12
