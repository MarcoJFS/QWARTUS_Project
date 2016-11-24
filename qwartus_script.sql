DROP DATABASE IF EXISTS qwartus;

CREATE DATABASE qwartus;

USE qwartus;

DROP TABLE IF EXISTS utilizador;
DROP TABLE IF EXISTS registado;
DROP TABLE IF EXISTS administrador;
DROP TABLE IF EXISTS anuncio;
DROP TABLE IF EXISTS imagem;




CREATE TABLE utilizador(
	id_utilizador					SMALLINT		NOT NULL	AUTO_INCREMENT		PRIMARY KEY,
    primeiro_nome					VARCHAR(20),
    ultimo_nome						VARCHAR(20),
    email							VARCHAR(50),
    password						VARCHAR(20),
    contacto						INT(9)
);

CREATE TABLE administrador(
	id_administrador				SMALLINT		NOT NULL	AUTO_INCREMENT		PRIMARY KEY,
    ce_id_utilizador				SMALLINT,
    FOREIGN KEY(ce_id_utilizador)	REFERENCES utilizador(id_utilizador)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE registado(
	id_registado					SMALLINT		NOT NULL	AUTO_INCREMENT		PRIMARY KEY,
    ce_id_utilizador				SMALLINT,
    FOREIGN KEY(ce_id_utilizador)	REFERENCES utilizador(id_utilizador)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE anuncio(
	id_anuncio						SMALLINT		NOT NULL	AUTO_INCREMENT		PRIMARY KEY,
    ce_id_registado					SMALLINT,		
    preco							NUMERIC,
	distrito						VARCHAR(20),
	concelho						VARCHAR(20),
    descricao						TEXT,
    FOREIGN KEY(ce_id_registado)	REFERENCES registado(id_registado)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE imagem(
	id_imagem						SMALLINT		NOT NULL	AUTO_INCREMENT		PRIMARY KEY,
    ce_id_anuncio					SMALLINT,
    caminho							TEXT,
    FOREIGN KEY(ce_id_anuncio)		REFERENCES anuncio(id_anuncio)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);