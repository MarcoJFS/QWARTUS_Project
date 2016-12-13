DROP DATABASE IF EXISTS qwartus;

CREATE DATABASE qwartus;

USE qwartus;

DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS registado;
DROP TABLE IF EXISTS administrador;
DROP TABLE IF EXISTS anuncio;
DROP TABLE IF EXISTS imagem;
DROP TABLE IF EXISTS concelhos;
DROP TABLE IF EXISTS distritos;
DROP TABLE IF EXISTS session;

DROP VIEW IF EXISTS anuncios;



CREATE TABLE user(
	id						SMALLINT		NOT NULL	AUTO_INCREMENT		PRIMARY KEY,
    username				VARCHAR(255)	NOT NULL	UNIQUE,
    auth_key				VARCHAR(32)		NOT NULL,
    password_hash			VARCHAR(255)	NOT NULL,
    password_reset_token	VARCHAR(255)	UNIQUE,
    email					VARCHAR(255)	NOT NULL	UNIQUE,
    
    status					SMALLINT		NOT NULL
	default 10,
    created_at				INT 			NOT NULL,
    updated_at				INT				NOT NULL,
    
    primeiro_nome			VARCHAR(20),
    ultimo_nome				VARCHAR(20),
    contacto				INT(9)
);

CREATE TABLE administrador(
	id_administrador				SMALLINT		NOT NULL	AUTO_INCREMENT		PRIMARY KEY,
    ce_id_utilizador				SMALLINT,
    FOREIGN KEY(ce_id_utilizador)	REFERENCES user(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE registado(
	id_registado					SMALLINT		NOT NULL	AUTO_INCREMENT		PRIMARY KEY,
    ce_id_utilizador				SMALLINT,
    FOREIGN KEY(ce_id_utilizador)	REFERENCES user(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE distritos(
	id_distritos					SMALLINT		NOT NULL	AUTO_INCREMENT		PRIMARY KEY,
    nome_distritos					VARCHAR(20)		NOT NULL
);

CREATE TABLE concelhos(
	id_concelhos					SMALLINT		NOT NULL	AUTO_INCREMENT		PRIMARY KEY,
    nome_concelhos					VARCHAR(20),
    ce_id_distritos					SMALLINT,
    FOREIGN KEY(ce_id_distritos)	REFERENCES distritos(id_distritos)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE anuncio(
	id_anuncio						SMALLINT		NOT NULL	AUTO_INCREMENT		PRIMARY KEY,
    ce_id_registado					SMALLINT,
    asunto							varchar(255),
    preco							NUMERIC,
    descricao						TEXT,
    id_distrito						SMALLINT,
    id_concelho						SMALLINT,
    FOREIGN KEY(ce_id_registado)	REFERENCES registado(id_registado)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    FOREIGN KEY(id_distrito)	REFERENCES distritos(id_distritos)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    FOREIGN KEY(id_concelho)	REFERENCES concelhos(id_concelhos)
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

CREATE TABLE session(
	id								SMALLINT		NOT NULL	AUTO_INCREMENT		PRIMARY KEY,
    accessToken						VARCHAR(255),
    creationDate					DATETIME		NOT NULL,
    valid							INT,
    userId							SMALLINT,
    FOREIGN KEY(userId)				REFERENCES user(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

/*Distritos inseridos */
INSERT INTO distritos (nome_distritos) VALUES("Aveiro");
INSERT INTO distritos (nome_distritos) VALUES("Beja");
INSERT INTO distritos (nome_distritos) VALUES("Braga");
INSERT INTO distritos (nome_distritos) VALUES("Bragança");
INSERT INTO distritos (nome_distritos) VALUES("Castelo Branco");
INSERT INTO distritos (nome_distritos) VALUES("Coimbra");
INSERT INTO distritos (nome_distritos) VALUES("Évora");
INSERT INTO distritos (nome_distritos) VALUES("Faro");
INSERT INTO distritos (nome_distritos) VALUES("Guarda");
INSERT INTO distritos (nome_distritos) VALUES("Leiria");
INSERT INTO distritos (nome_distritos) VALUES("Lisboa");
INSERT INTO distritos (nome_distritos) VALUES("Portalegre");
INSERT INTO distritos (nome_distritos) VALUES("Porto");
INSERT INTO distritos (nome_distritos) VALUES("Santarém");
INSERT INTO distritos (nome_distritos) VALUES("Setúbal");
INSERT INTO distritos (nome_distritos) VALUES("Viana do Castelo");
INSERT INTO distritos (nome_distritos) VALUES("Vila Real");
INSERT INTO distritos (nome_distritos) VALUES("Viseu");

/*Concelhos inseridos*/
/**Concelhos de Aveiro*/
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Águeda", 1);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Albergaria-a-Velha", 1);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Anadia", 1);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Arouca", 1);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Aveiro", 1);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Castelo de Paiva", 1);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Espinho", 1);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Estarreja", 1);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Ílhavo", 1);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Mealhada", 1);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Murtosa", 1);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Oliveira de Azeméis", 1);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Oliveira do Bairro", 1);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Ovar", 1);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Santa Maria da Feira", 1);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("São João da Madeira", 1);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Sever do Vouga", 1);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vagos", 1);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vale de Cambra", 1);

/*Concelhos de Beja*/
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Aljustrel", 2);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Almodôvar", 2);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Alvito", 2);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Barrancos", 2);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Beja", 2);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Castro Verde", 2);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Cuba", 2);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Ferreira do Alentejo", 2);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Mértola", 2);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Moura", 2);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Odemira", 2);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Ourique", 2);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Serpa", 2);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vidigueira", 2);

/*Concelhos de Braga*/
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Amares", 3);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Barcelos", 3);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Braga", 3);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Cabeceiras de Basto", 3);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Celorico de Basto", 3);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Esposende", 3);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Fafe", 3);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Guimarães", 3);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Póvoa de Lanhoso", 3);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Terras de Bouro", 3);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vieira do Minho", 3);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vila Nova de Famalicão", 3);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vila Verde", 3);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vizela", 3);

/*Concelhos de Bragança*/
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Alfândega da Fé", 4);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Bragança", 4);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Carrazeda de Ansiães", 4);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Freixo de Espada à Cinta", 4);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Macedo de Cavaleiros", 4);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Miranda do Douro", 4);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Mirandela", 4);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Mogadouro", 4);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Torre de Moncorvo", 4);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vila Flor", 4);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vimioso", 4);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vinhais", 4);

/*Concelhos de Castelo Branco*/
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Belmonte", 5);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Castelo Branco", 5);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Covilhã", 5);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Fundão", 5);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Idanha-a-Nova", 5);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Oleiros", 5);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Penamacor", 5);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Proença-a-NovaSertã", 5);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vila de Rei", 5);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vila Velha de Ródão", 5);

/*Concelhos de Coimbra*/
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Arganil", 6);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Cantanhede", 6);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Coimbra", 6);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Condeixa-a-Nova", 6);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Figueira da Foz", 6);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Góis", 6);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Lousã", 6);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Mira", 6);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Miranda do Corvo", 6);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Montemor-o-Velho", 6);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Oliveira do Hospital", 6);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Pampilhosa da Serra", 6);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Penacova", 6);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Penela", 6);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Soure", 6);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Tábua", 6);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vila Nova de Poiares", 6);

/*Concelhos de Evora*/
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Alandroal", 7);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Arraiolos", 7);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Borba", 7);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Estremoz", 7);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Évora", 7);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Montemor-o-Novo", 7);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Mora", 7);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Mourão", 7);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Olivença", 7);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Portel", 7);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Redondo", 7);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Reguengos de Monsaraz", 7);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vendas Novas", 7);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Viana do Alentejo", 7);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vila Viçosa", 7);

/*Concelhos de Faro*/
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Albufeira", 8);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Alcoutim", 8);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Aljezur", 8);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Castro Marim", 8);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Faro", 8);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Lagoa", 8);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Lagos", 8);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Loulé", 8);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Monchique", 8);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Olhão", 8);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Portimão", 8);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("São Brás de Alportel", 8);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Silves", 8);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Tavira", 8);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vila do Bispo", 8);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vila Real de Santo António", 8);

/*Concelhos de Guarda*/
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Aguiar da Beira", 9);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Almeida", 9);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Celorico da Beira", 9);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Figueira de Castelo Rodrigo", 9);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Fornos de Algodres", 9);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Gouveia", 9);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Guarda", 9);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Manteigas", 9);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Mêda", 9);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Pinhel", 9);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Sabugal", 9);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Seia", 9);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Trancoso", 9);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vila Nova de Foz Côa", 9);

/*Concelhos de Leiria*/
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Alcobaça", 10);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Alvaiázere", 10);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Ansião", 10);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Batalha", 10);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Bombarral", 10);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Caldas da Rainha", 10);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Castanheira de Pera", 10);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Figueiró dos Vinhos", 10);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Leiria", 10);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Marinha Grande", 10);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Nazaré", 10);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Óbidos", 10);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Pedrógão Grande", 10);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Peniche", 10);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Pombal", 10);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Porto de Mós", 10);

/*Concelhos de Lisboa*/
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Alenquer", 11);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Amadora", 11);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Arruda dos Vinhos", 11);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Azambuja", 11);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Cadaval", 11);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Cascais", 11);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Lisboa", 11);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Loures", 11);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Lourinhã", 11);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Mafra", 11);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Odivelas", 11);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Oeiras", 11);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Sintra", 11);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Sobral de Monte Agraço", 11);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Torres Vedras", 11);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vila Franca de Xira", 11);

/*Concelhos de Portalegra*/
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Alter do Chão", 12);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Arronches", 12);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Avis", 12);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Campo Maior", 12);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Castelo de Vide", 12);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Crato", 12);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Elvas", 12);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Fronteira", 12);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Marvão", 12);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Monforte", 12);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Nisa", 12);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Ponte de Sor", 12);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Portalegre", 12);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Sousel", 12);

/*Concelhos de Porto*/
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Amarante", 13);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Baião", 13);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Felgueiras", 13);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Gondomar", 13);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Lousada", 13);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Maia", 13);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Marco de Canaveses", 13);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Matosinhos", 13);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Paços de Ferreira", 13);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Paredes", 13);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Penafiel", 13);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Porto", 13);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Póvoa de Varzim", 13);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Santo Tirso", 13);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Trofa", 13);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Valongo", 13);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vila do Conde", 13);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vila Nova de Gaia", 13);

/*Concelhos de Santarém*/
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Abrantes", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Alcanena", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Almeirim", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Alpiarça", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Benavente", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Cartaxo", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Chamusca", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Constância", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Coruche", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Entroncamento", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Ferreira do Zêzere", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Golegã", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Mação", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Ourém", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Rio Maior", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Salvaterra de Magos", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Santarém", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Sardoal", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Tomar", 14);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vila Nova da Barquinha", 14);

/*Concelhos de Setubal*/
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Alcácer do Sal", 15);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Alcochete", 15);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Almada", 15);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Barreiro", 15);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Grândola", 15);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Moita", 15);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Montijo", 15);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Palmela", 15);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Santiago do Cacém", 15);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Seixal", 15);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Sesimbra", 15);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Setúbal", 15);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Sines", 15);

/*Concelhos de Viana do Castelo*/
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Arcos de Valdevez", 16);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Caminha", 16);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Melgaço", 16);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Monção", 16);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Paredes de Coura", 16);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Ponte da Barca", 16);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Ponte de Lima", 16);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Valença", 16);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Viana do Castelo", 16);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vila Nova de Cerveira", 16);

/*Vila Real*/
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Alijó", 17);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Boticas", 17);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Chaves", 17);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Mesão Frio", 17);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Mondim de Basto", 17);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Montalegre", 17);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Murça", 17);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Peso da Régua", 17);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Ribeira de Pena", 17);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Sabrosa", 17);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Santa Marta de Penaguião", 17);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Valpaços", 17);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vila Pouca de Aguiar", 17);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vila Real", 17);

/*Concelhos de Viseu*/
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Armamar", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Carregal do Sal", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Castro Daire", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Cinfães", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Lamego", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Mangualde", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Moimenta da Beira", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Mortágua", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Nelasa", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Oliveira de Frades", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Penalva do Castelo", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Penedono", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Resende", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Santa Comba Dão", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("São João da Pesqueira", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("São Pedro do Sul", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Sátão", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Sernancelhe", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Tabuaço", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Tarouca", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Tondela", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vila Nova de Paiva", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Viseu", 18);
INSERT INTO concelhos (nome_concelhos, ce_id_distritos) VALUES("Vouzela", 18);

/*anuncios inseridos */
INSERT INTO anuncio(asunto,preco,descricao,id_distrito,id_concelho) values('T1',21,'asdadvahdvadasdvajsghdvasdvashjd',1,1);
INSERT INTO anuncio(asunto,preco,descricao,id_distrito,id_concelho) values('T2',22,'asdadvahdvadasdvajsghdvasdvashjd',2,1);
INSERT INTO anuncio(asunto,preco,descricao,id_distrito,id_concelho) values('T3',23,'asdadvahdvadasdvajsghdvasdvashjd',2,1);

/*imagens dos anuncios inseridos */
INSERT INTO imagem(ce_id_anuncio,caminho) values(1,'../web/css/images/img.jpg');
INSERT INTO imagem(ce_id_anuncio,caminho) values(1,'../web/css/images/img2.png');
INSERT INTO imagem(ce_id_anuncio,caminho) values(2,'../web/css/images/qwartus.png');
INSERT INTO imagem(ce_id_anuncio,caminho) values(3,'../web/css/images/imgBack.jpg');

CREATE VIEW anuncios AS
	SELECT *
	FROM anuncio JOIN distritos JOIN concelhos JOIN imagem
	WHERE distritos.id_distritos=concelhos.ce_id_distritos AND distritos.id_distritos=anuncio.id_distrito AND anuncio.id_anuncio=imagem.ce_id_anuncio
	GROUP BY anuncio.id_anuncio