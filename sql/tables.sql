-- Creamos el eschema para el OLTP
CREATE SCHEMA EXPOUCV_G30030004;

-- Definimos donde se crearan las tablas directamente dentro del eschema
SET search_path TO expoucv_g30030004;

--Creacion de las tablas
--Tablas que no dependen de otras
--Tipo evento
CREATE TABLE TIPO_EVENTO (
	cod_tipo_evento INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nb_tipo_evento VARCHAR(100) NOT NULL
);

--Categoria
CREATE TABLE CATEGORIA (
	cod_categoria INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nb_categoria VARCHAR(100) NOT NULL
);

--Tipo stand
CREATE TABLE TIPO_STAND (
	cod_tipo_stand INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nb_tipo_stand VARCHAR(100) NOT NULL
);

--Pais
CREATE TABLE PAIS (
	cod_pais INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nb_pais VARCHAR(100) NOT NULL
);

--Cliente
CREATE TABLE CLIENTE (
	cod_cliente INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nb_cliente VARCHAR(100) NOT NULL,
	ci_rif VARCHAR(20) NOT NULL,
	telefono VARCHAR(20),
	direccion VARCHAR(255),
	email VARCHAR(100)
);

--Leyenda estrellas
CREATE TABLE LEYENDA_ESTRELLAS (
	cod_leyenda_estrellas INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nb_descripcion VARCHAR(100) NOT NULL
);

--Visitante
CREATE TABLE VISITANTE (
	cod_visitante INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	cedula VARCHAR(20) NOT NULL,
	nb_visitante VARCHAR(100) NOT NULL,
	sexo CHAR(1),
	email VARCHAR(100)
);

--Tablas que si depende de otras
--Subcategoria, tiene referencia a tabla categoria
CREATE TABLE SUBCATEGORIA (
	cod_sub_categoria INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nb_sub_categoria VARCHAR(100) NOT NULL,
	cod_categoria INT NOT NULL,

	CONSTRAINT fk_categoria
		FOREIGN KEY (cod_categoria)
		REFERENCES CATEGORIA(cod_categoria)
);

--Ciudad, tiene refencia a tabla pais
CREATE TABLE CIUDAD (
	cod_ciudad INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nb_ciudad VARCHAR (100) NOT NULL,
	cod_pais INT NOT NULL,

	CONSTRAINT fk_pais
		FOREIGN KEY (cod_pais)
		REFERENCES PAIS(cod_pais)
);

--Sede, tiene referencia a tabla ciudad
CREATE TABLE SEDE (
	cod_sede INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nb_sede VARCHAR(100) NOT NULL,
	cod_ciudad INT NOT NULL,

	CONSTRAINT fk_ciudad
		FOREIGN KEY (cod_ciudad)
		REFERENCES CIUDAD(cod_ciudad )
);

--Evento, tiene refencia de tabla Tipo_evento y sede 
CREATE TABLE EVENTO (
	cod_evento INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nb_evento VARCHAR(100) NOT NULL,
	fecha_inicia DATE NOT NULL,
	fecha_fin DATE NOT NULL,
	descripcion VARCHAR(255),
	cod_sede INT NOT NULL,
	email VARCHAR(100),
	cod_tipo_evento INT NOT NULL,

	CONSTRAINT fk_sede
		FOREIGN KEY (cod_sede)
		REFERENCES SEDE(cod_sede),
	CONSTRAINT fk_tipo_evento
		FOREIGN KEY(cod_tipo_evento)
		REFERENCES TIPO_EVENTO(cod_tipo_evento)
);

--Contrato, tiene refencia de tabla cliente, subcategoria, evento, tipo stand
CREATE TABLE CONTRATO (
	nro_stand INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	cod_evento INT NOT NULL,
	cod_tipo_stand INT NOT NULL,
	fecha_alquiler DATE NOT NULL,
	cod_cliente INT NOT NULL,
	mts2 DECIMAL(10,2) NOT NULL,
	Monto DECIMAL(12,2) NOT NULL,
	cod_sub_categoria INT NOT NULL,

	CONSTRAINT fk_evento
		FOREIGN KEY (cod_evento)
		REFERENCES EVENTO(cod_evento),
	CONSTRAINT fk_tipo_stand
		FOREIGN KEY (cod_tipo_stand)
		REFERENCES TIPO_STAND(cod_tipo_stand),
	CONSTRAINT fk_cliente
		FOREIGN KEY (cod_cliente)
		REFERENCES CLIENTE(cod_cliente),
	CONSTRAINT fk_sub_categoria
		FOREIGN KEY (cod_sub_categoria)
		REFERENCES SUBCATEGORIA(cod_sub_categoria) 
);

--Evento Stand, tiene referencia de tabla tipo stand y evento
CREATE TABLE EVENTO_ESTAND (
	cod_evento INT NOT NULL,
	cod_tipo_stand INT NOT NULL,
	cantidad_estimada INT NOT NULL,
	mts2 DECIMAL(10,2) NOT NULL,
	precio DECIMAL(12,2) NOT NULL,

	CONSTRAINT pk_evento_stand
		GENERATED ALWAYS AS IDENTITY PRIMARY KEY (cod_evento, cod_tipo_stand),
	CONSTRAINT fk_evento
		FOREIGN KEY (cod_evento)
		REFERENCES EVENTO(cod_evento),
	CONSTRAINT fk_tipo_stand
		FOREIGN KEY (cod_tipo_stand)
		REFERENCES TIPO_STAND(cod_tipo_stand)
);

--Entrada, tiene referencia de la tabla Leyenda_estrella, evento y visitante
CREATE TABLE ENTRADA (
	nro_entrada INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	cod_evento INT NOT NULL,
	fecha_entrada DATE NOT NULL,
	hora_entrada TIME NOT NULL,
	cod_visitante INT NOT NULL,
	recomienda_amigo INT NOT NULL,
	calificacion INT NOT NULL,
	cod_leyenda_estrellas INT NOT NULL,

	CONSTRAINT fk_evento
		FOREIGN KEY (cod_evento)
		REFERENCES EVENTO(cod_evento),
	CONSTRAINT fk_visitante
		FOREIGN KEY (cod_visitante)
		REFERENCES VISITANTE(cod_visitante),
	CONSTRAINT fk_leyenda_estrellas
		FOREIGN KEY (cod_leyenda_estrellas)
		REFERENCES LEYENDA_ESTRELLAS(cod_leyenda_estrellas)
);
