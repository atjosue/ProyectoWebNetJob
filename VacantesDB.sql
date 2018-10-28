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
nombreUsuario varchar(50),
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
fechaRegistro date not null, 
estado int not null 
);

#tabla experiencia Laboral
create table experiencia(
idExperiencia int not null primary key auto_increment,
empresa varchar(50),
cargo varchar(50),
descripcion varchar(50),
salario double,
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
direccion varchar(75) not null,
telefono varchar(25) not null,
mision varchar(500),
vision varchar(500),
correo varchar(50) not null,
latitud varchar(150),
longitud varchar(150),
idUsuario int not null,
idRubro int not null,
idProvincia int not null,
idDepartamento int not null,
idPais int not null ,
estado int

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
fechaPublicacion date,
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
alter table empresa  add constraint fk_empresaPais foreign key (idPais)references pais (idPais);
alter table empresa  add constraint fk_empresaDepartamento foreign key (idDepartamento)references departamento (idDepartamento);
alter table empresa  add constraint fk_empresaProvincia foreign key (idProvincia)references provincia (idProvincia);
alter table empresa  add constraint fk_empresaRubro foreign key (idRubro)references rubro (idRubro);
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



 
#insertando datos
insert into rol values(0,'Administrador',1);
insert into rol values(0,'Usuario',1);

#insertando usuario para sistema de Escritorio
insert into usuario values(0,'CarlosCampos','27b97374ec529e1ec0cadae4cd25e04c',1,1);
insert into usuario values(0,'JosueTrejo','27b97374ec529e1ec0cadae4cd25e04c',1,1);
insert into usuario values(0,'FernandoFlamenco','27b97374ec529e1ec0cadae4cd25e04c',1,1);
insert into usuario values(0,'KevinMontiel','27b97374ec529e1ec0cadae4cd25e04c',1,1);


select r.descRol, u.nombreUsuario from usuario u inner join Rol r on r.idRol=u.idRol where nombreUsuario='CarlosCampos' and contraseña='27b97374ec529e1ec0cadae4cd25e04c';

insert into gradoUniversitario values(0,'Ingenieria',1);

select h.idHabilidad, h.habilidad, h.descripcion, p.profesion from habilidades h inner join profesion p on p.idProfesion=h.idProfesion where h.estado=1 and h.idProfesion=1;
select p.nombrePuesto, p.descripcion, a.nombre from puesto p inner join area a on a.idArea=p.idArea where p.estado=1 and p.idArea=1;

select * from rubro

