-----------banco de dados-------------

para configurar o banco de dados 
altera o arquivo config.php
nome do banco: loja
usuario do banco: postgres
senha do banco: 123456
local banco: localhost


--comando de criacao do banco de dados--
 CREATE DATABASE loja;
--comando de criacao de tabela
CREATE TABLE usuarios
(
    id_usuario serial primary key,
    nome_usuario  varchar(60) not null,
    login  varchar(12) not null,
    email varchar(60) not null,
    senha varchar(45) not null,
    data_criacao timestamptz not null,
    tempo_expiracao_senha integer,
    cod_autorizacao varchar(1) ,
    status_usuario varchar(1) not null,
    cod_pessoa integer    
);
CREATE TABLE perfil
(
    id_perfil serial primary key,
    nome_perfil varchar(60) not null
    
);
CREATE TABLE aparelhos
(
    id_aparelho serial primary key,
    descricao_aparelho varchar(15) not null,
    codigo_aparelho varchar(100)    
);
CREATE TABLE usuario_perfil
(
    id_usuario integer not null,
    id_perfil integer not null,
    foreign key (id_usuario) references usuarios(id_usuario),
    foreign key (id_perfil) references perfil(id_perfil)    
);
CREATE TABLE usuario_aparelhos
(
    id_usuario integer not null,
    id_aparelho integer not null,
    foreign key (id_usuario) references usuarios(id_usuario),
    foreign key (id_aparelho) references aparelhos(id_aparelho)
);
--comando de criacao das sequencias
--inserir perfil
insert into perfil(nome_perfil) values('Administrador');
insert into perfil(nome_perfil) values('Diretor');
insert into perfil(nome_perfil) values('Coordenador');
insert into perfil(nome_perfil) values('RH'); 
--insert usuario
insert into usuarios(nome_usuario,email,login,senha,data_criacao,status_usuario) values('Usuario 01','usuario01@hotmail.com','usuario.01','123456',NOW(),1);
insert into usuarios(nome_usuario,email,login,senha,data_criacao,status_usuario) values('Usuario 02','usuario02@hotmail.com','usuario.02','123456',NOW(),1);
insert into usuarios(nome_usuario,email,login,senha,data_criacao,status_usuario) values('Usuario 03','usuario01@hotmail.com','usuario.03','123456',NOW(),0);
--insert usuario_perfil
insert into usuario_perfil(id_usuario,id_perfil) values(1,1);
insert into usuario_perfil(id_usuario,id_perfil) values(2,2);
insert into usuario_perfil(id_usuario,id_perfil) values(3,3);
--insert aparelho
insert into aparelhos(descricao_aparelho) values('aparelho01');
insert into aparelhos(descricao_aparelho) values('aparelho02');
insert into aparelhos(descricao_aparelho) values('aparelho03');
insert into aparelhos(descricao_aparelho) values('aparelho04');
insert into aparelhos(descricao_aparelho) values('aparelho05');
--insert usuario_perfil
insert into usuario_aparelhos(id_usuario,id_aparelho) values(1,1);
insert into usuario_aparelhos(id_usuario,id_aparelho) values(1,2);
insert into usuario_aparelhos(id_usuario,id_aparelho) values(2,3);
insert into usuario_aparelhos(id_usuario,id_aparelho) values(3,4);
insert into usuario_aparelhos(id_usuario,id_aparelho) values(2,5);
    
****************end-points***************** 

//lista todos os usuarios cadastrado no sistema, sem parametros
http://localhost/loja/home/listarUsuarios  

//cadastra novo usuario, salva os dados no banco via POST,
//não cadastra usuario novo com email e login ja cadastrado no sistema
http://localhost/loja/home/cadastro

//altera um usuario, recebe um parametro o id do usuario 
http://localhost/loja/home/editCadastro/id

//deleta um usuario, recebe um parametro o id do usuario 
http://localhost/loja/home/delUsuario/id

//gera relatorio dos usuarios com respectivo perfil em PDF 
http://localhost/loja/home/gerarPdfPerfil

//gera relatorio dos usuarios com respectivo aparelho em PDF 
http://localhost/loja/home/gerarPdfAparelho

//gera relatorio dos usuarios com respectivo perfil em CSV e faz o seu download automatico
http://localhost/loja/home/gerarCsvPerfil

//gera relatorio dos usuarios com respectivo aparelho em CSV e faz o seu download automatico
http://localhost/loja/home/gerarCsvAparelho

//gera relatorio dos usuarios com respectivo perfil em TXT e faz o seu download automatico
http://localhost/loja/home/gerarTxtPerfil

//gera relatorio dos usuarios com respectivo aparelho em TXT e faz o seu download automatico
http://localhost/loja/home/gerarTxtAparelho


