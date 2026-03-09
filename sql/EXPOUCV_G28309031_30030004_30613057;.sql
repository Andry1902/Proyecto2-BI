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
    CONSTRAINT pk_evento_stand PRIMARY KEY (cod_evento, cod_tipo_stand),
    
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

-- 1. Insertar PAIS (Sin incluir cod_pais)
INSERT INTO PAIS (nb_pais) VALUES
('Venezuela'),
('Colombia'),
('Argentina'),
('España'),
('México');

-- 2. Insertar CATEGORIA
INSERT INTO CATEGORIA (nb_categoria) VALUES
('Tecnología e Innovación'),
('Gastronomía y Alimentos'),
('Educación y Carreras'),
('Artes e Industrias Creativas'),
('Salud y Bienestar');

-- 3. Insertar TIPO_STAND
INSERT INTO TIPO_STAND (nb_tipo_stand) VALUES
('Básico 2x2'), 
('Premium 3x3'), 
('Isla Central'), 
('Corner'), 
('Stand Exterior'),
('Pabellón Corporativo'), 
('Mesa de Exhibición'), 
('Stand Doble Altura'), 
('Módulo Informativo'),
('Showroom');

INSERT INTO TIPO_EVENTO (nb_tipo_evento) VALUES 
('Exposición Comercial'),
('Congreso Académico'),
('Feria Industrial'),
('Convención Corporativa'),
('Seminario de Innovación'),
('Simposio Especializado'),
('Festival Gastronómico');

INSERT INTO CLIENTE (nb_cliente, ci_rif, telefono, direccion, email) VALUES
('Alimentos Polar', 'J-000030623', '0212-2021111', 'Los Cortijos, Caracas', 'contacto@polar.com'),
('Banco de Venezuela', 'G-200099976', '0500-6425883', 'Av. Universidad, Caracas', 'atencion@bdv.com'),
('Mercado Libre Venezuela', 'J-306760041', '0212-7102000', 'Chacao, Caracas', 'info@mercadolibre.com.ve'),
('Farmatodo', 'J-000214151', '0800-3276286', 'Los Olivos, Caracas', 'servicio@farmatodo.com'),
('Cantv', 'G-200070501', '0800-1001000', 'Av. Libertador, Caracas', 'soporte@cantv.com.ve'),
('Movistar Venezuela', 'J-303390011', '0414-2001111', 'Torre Telefonica, Caracas', 'ayuda@movistar.com.ve'),
('Digitel', 'J-304689713', '0412-1212121', 'La Castellana, Caracas', 'ventas@digitel.com.ve'),
('Banesco Banco Universal', 'J-070133805', '0212-5011111', 'Ciudad Banesco, Caracas', 'cliente@banesco.com'),
('Toyota de Venezuela', 'J-000135243', '0293-4001111', 'Cumaná, Edo. Sucre', 'ventas@toyota.com.ve'),
('Ron Santa Teresa', 'J-000327177', '0244-4002000', 'El Consejo, Edo. Aragua', 'export@ronsantateresa.com'),
('Cervecería Regional', 'J-000620281', '0261-7201111', 'Maracaibo, Edo. Zulia', 'info@regional.com.ve'),
('Sigo S.A.', 'J-001062010', '0295-4001000', 'Porlamar, Nueva Esparta', 'atencion@sigo.com.ve'),
('Traki', 'J-302334011', '0212-2411111', 'El Recreo, Caracas', 'ventas@traki.com'),
('Avior Airlines', 'J-302094183', '0501-2846700', 'Barcelona, Edo. Anzoátegui', 'reservas@avior.com.ve'),
('Laser Airlines', 'J-300843654', '0212-2020000', 'Maiquetía, Edo. La Guaira', 'contacto@laser.com.ve'),
('EPA Ferretería', 'J-002220015', '0500-3720000', 'Valencia, Edo. Carabobo', 'servicio@epa.com.ve'),
('Soloson Import', 'J-301234567', '0212-9912233', 'Las Mercedes, Caracas', 'info@soloson.com'),
('Inversiones El Recreo', 'J-305554443', '0212-7060111', 'Sabana Grande, Caracas', 'admin@elrecreo.com.ve'),
('Locatel', 'J-003332221', '0212-2031000', 'Boleíta Norte, Caracas', 'pedidos@locatel.com.ve'),
('Arturo''s Venezuela', 'J-000998877', '0212-2634455', 'La Trinidad, Caracas', 'arturos@pollo.com'),
('Chocolates El Rey', 'J-000456789', '0212-2415566', 'Boleíta Sur, Caracas', 'rey@chocolate.com'),
('Cines Unidos', 'J-000112233', '0212-6102233', 'Centro Lido, Caracas', 'cine@cinesunidos.com'),
('Cinex', 'J-000445566', '0212-2771122', 'El Hatillo, Caracas', 'atencion@cinex.com.ve'),
('Cacao de Origen', 'J-402233445', '0212-9934455', 'Hacienda La Trinidad, Caracas', 'info@cacaodeorigen.com'),
('Automercados Plaza''s', 'J-000778899', '0212-9051111', 'Terrazas del Avila, Caracas', 'plazas@automercados.com'),
('Excelsior Gama', 'J-000121314', '0212-2571122', 'Los Dos Caminos, Caracas', 'gama@excelsior.com'),
('Hispana de Seguros', 'J-000556677', '0212-2013344', 'Altamira, Caracas', 'seguros@hispana.com'),
('Seguros Caracas', 'J-000889900', '0212-2091122', 'La Castellana, Caracas', 'cliente@seguroscaracas.com'),
('Nestlé Venezuela', 'J-000141516', '0800-6378531', 'El Rosal, Caracas', 'nestle@ve.nestle.com'),
('Mondelēz Venezuela', 'J-000171819', '0212-2015566', 'San Diego, Carabobo', 'mondelez@latam.com'),
('Procter & Gamble', 'J-000202122', '0212-9031122', 'La Tahona, Caracas', 'pg@venezuela.com'),
('Empresas 1BC', 'J-000232425', '0212-4011122', 'Bello Monte, Caracas', 'contacto@1bc.com'),
('Noticias UCV', 'G-200000001', '0212-6051111', 'Ciudad Universitaria, Caracas', 'prensa@ucv.ve'),
('Cámara de Comercio Caracas', 'J-000262728', '0212-5711122', 'Los Caobos, Caracas', 'info@camaradecaracas.com'),
('IVC Network', 'J-405566778', '0212-9511122', 'Chacao, Caracas', 'ivc@comunicaciones.com'),
('NetUno', 'J-302223334', '0500-6388660', 'Los Palos Grandes, Caracas', 'soporte@netuno.net'),
('Inter', 'J-301112223', '0500-4683700', 'Barquisimeto, Lara', 'atencion@inter.com.ve'),
('SimpleTV', 'J-500123456', '0212-8211122', 'Torre DirecTV, Caracas', 'ayuda@simpletv.com.ve'),
('Cervecería Tovar', 'J-308877665', '0244-1234455', 'Colonia Tovar, Aragua', 'info@tovar.com'),
('Avelina', 'J-401122334', '0212-3344556', 'Guatire, Miranda', 'ventas@avelina.com'),
('Pastas Capri', 'J-000334455', '0212-4455667', 'Carapita, Caracas', 'calidad@capri.com'),
('Minalba', 'J-000556644', '0212-1112233', 'Antímano, Caracas', 'aguas@polar.com'),
('Ron Carúpano', 'J-000667788', '0294-3312211', 'Carúpano, Sucre', 'ron@carupano.com'),
('Bodegas Pomar', 'J-000778811', '0252-4212233', 'Carora, Lara', 'pomar@vinos.com'),
('Bera Motorcycles', 'J-309988776', '0243-5566778', 'Maracay, Aragua', 'ventas@beramotos.com.ve'),
('Empire Keeway', 'J-310112233', '0239-1223344', 'Charallave, Miranda', 'info@empire.com'),
('Sansui Venezuela', 'J-311445566', '0212-5566778', 'Boleíta Norte, Caracas', 'tecnico@sansui.com.ve'),
('Siragon', 'J-312778899', '0241-8711122', 'Valencia, Carabobo', 'soporte@siragon.com'),
('Síragon Home', 'J-313001122', '0241-8711123', 'Sambil Valencia, Carabobo', 'home@siragon.com'),
('Daka', 'J-314223344', '0500-3252000', 'Bello Monte, Caracas', 'ventas@daka.com.ve');


INSERT INTO VISITANTE (cedula, nb_visitante, sexo, email) VALUES
('V-18234567', 'Alejandro Rodriguez', 'M', 'alejandro.rod@gmail.com'),
('V-20123456', 'Maria Eugenia Lopez', 'F', 'marialopez88@hotmail.com'),
('E-25456789', 'Carlos Eduardo Perez', 'M', 'carlosedu@yahoo.com'),
('V-19876543', 'Gabriela Blanco', 'F', 'gaby.blanco@outlook.com'),
('V-22334455', 'Ricardo Jose Gomez', 'M', 'ricardog@protonmail.com'),
('V-27112233', 'Daniela Martinez', 'F', 'danimart@gmail.com'),
('V-15887766', 'Jose Gregorio Hernandez', 'M', 'josegh@hotmail.com'),
('E-21998877', 'Valentina Sanchez', 'F', 'valen.sanchez@gmail.com'),
('V-24556677', 'Luis Alberto Garcia', 'M', 'luis.garcia.ve@gmail.com'),
('V-26334411', 'Andrea Carolina Diaz', 'F', 'andreadiaz@outlook.com'),
('V-20111222', 'Manuel Silva', 'M', 'msilva@gmail.com'),
('V-18555444', 'Patricia Castillo', 'F', 'pcastillo_ucv@gmail.com'),
('V-23777888', 'Francisco Javier Ruiz', 'M', 'fj.ruiz@hotmail.com'),
('E-28111999', 'Isabella Torres', 'F', 'isatorres@gmail.com'),
('V-21000333', 'Miguel Angel Castro', 'M', 'mangelc@gmail.com'),
('V-19444555', 'Adriana Morales', 'F', 'amorales_design@gmail.com'),
('V-22888777', 'Roberto Guzman', 'M', 'robguzman@gmail.com'),
('V-26999000', 'Sofia Mendoza', 'F', 'sofia.m@outlook.com'),
('E-17333222', 'Fernando Colina', 'M', 'fcolina@yahoo.es'),
('V-24111000', 'Natalia Rivas', 'F', 'nrivas@gmail.com'),
('V-25222333', 'Humberto Leon', 'M', 'hleon_it@gmail.com'),
('V-20666777', 'Camila Salazar', 'F', 'csalazar@gmail.com'),
('V-19777888', 'Eduardo Machado', 'M', 'emachado@hotmail.com'),
('V-28444333', 'Lucia Fernandez', 'F', 'luciaf_99@gmail.com'),
('V-16111000', 'Oscar Enrique Mora', 'M', 'oscarmora@gmail.com'),
('V-23555444', 'Mariana Suarez', 'F', 'marianas@gmail.com'),
('V-21333222', 'Rafael Gonzalez', 'M', 'rgonzalez_ve@gmail.com'),
('V-25888999', 'Beatriz Peña', 'F', 'b_pena@gmail.com'),
('V-18999000', 'Jorge Luis Herrera', 'M', 'jorgeherrera@gmail.com'),
('E-27666555', 'Victoria Gil', 'F', 'vicky.gil@outlook.com'),
('E-20444555', 'Andres Eloy Blanco', 'M', 'aeb@gmail.com'),
('V-22111000', 'Elena Quiroz', 'F', 'elenita.q@gmail.com'),
('V-24888777', 'Gustavo Adolfo Lopez', 'M', 'gustavoal@gmail.com'),
('V-26000111', 'Paola Vasquez', 'F', 'paola.v@hotmail.com'),
('V-15333444', 'Ramon Antonio Sosa', 'M', 'ramonsosa@gmail.com'),
('V-23222111', 'Claudia Jimenez', 'F', 'clau.jimenez@gmail.com'),
('E-19111222', 'Juan Carlos Medina', 'M', 'jcmedina@gmail.com'),
('V-28999000', 'Antonella Rossi', 'F', 'anrossi@gmail.com'),
('V-21777888', 'Santiago Ortega', 'M', 'sortega@gmail.com'),
('V-25111000', 'Estefania Cabrera', 'F', 'estefy.cab@gmail.com'),
('V-18444333', 'Leonardo Da Silva', 'M', 'leo.dasilva@gmail.com'),
('V-20555444', 'Mayerling Flores', 'F', 'mayerflores@gmail.com'),
('E-22666555', 'Samuel David Araujo', 'M', 'samuelaraujo@gmail.com'),
('V-24333222', 'Raquel Benitez', 'F', 'rbenitez@outlook.com'),
('V-26777888', 'Victor Hugo Arias', 'M', 'vharias@gmail.com'),
('E-17888999', 'Monica Duarte', 'F', 'monica.duarte@gmail.com'),
('V-19000111', 'Alvaro Uzcategui', 'M', 'auzcategui@gmail.com'),
('V-23444555', 'Barbara Velasquez', 'F', 'barbara.v@hotmail.com'),
('V-21555666', 'Julio Cesar Ferrer', 'M', 'jcferrer@gmail.com'),
('V-25666777', 'Lorena Padrino', 'F', 'lpadrino@gmail.com'),
('V-16555444', 'Enrique Isea', 'M', 'eisea@gmail.com'),
('V-28222111', 'Flavia Briceño', 'F', 'fbriceno@gmail.com'),
('E-20777888', 'Ruben Blades', 'M', 'rblades@gmail.com'),
('V-22444333', 'Tatiana Molero', 'F', 'tmolero@gmail.com'),
('V-24000111', 'Gerardo Parra', 'M', 'gparra@gmail.com'),
('V-26111222', 'Yelitza Reyes', 'F', 'yreyes@gmail.com'),
('V-17000111', 'Felix Hernandez', 'M', 'felixh@gmail.com'),
('V-19222333', 'Carmen Alicia Melendez', 'F', 'carmela@gmail.com'),
('V-23888999', 'Renato Rivera', 'M', 'rrivera@gmail.com'),
('V-21222333', 'Silvia Guerra', 'F', 'sguerra@gmail.com'),
('E-25000111', 'Mauricio Macri', 'M', 'mmacri@gmail.com'),
('V-27333444', 'Ximena Duque', 'F', 'xiduque@gmail.com'),
('V-18777888', 'Pedro Infante', 'M', 'pinfante@gmail.com'),
('V-20888999', 'Karina Mendoza', 'F', 'karinam@gmail.com'),
('V-22555666', 'Fabian Casas', 'M', 'fcasas@gmail.com'),
('V-24777888', 'Dayana Mendoza', 'F', 'dayanam@gmail.com'),
('E-26555444', 'Sebastian Yatra', 'M', 'syatra@gmail.com'),
('V-17666555', 'Irene Saez', 'F', 'isaez@gmail.com'),
('E-19555444', 'Geronimo Gil', 'M', 'ggil@gmail.com'),
('V-23111000', 'Milagros Coromoto', 'F', 'mcoromoto@gmail.com'),
('V-21888999', 'Wilmer Valderrama', 'M', 'wilmerv@gmail.com'),
('E-25555444', 'Chiquinquira Delgado', 'F', 'chiquid@gmail.com'),
('V-28555666', 'Nacho Mendoza', 'M', 'nachom@gmail.com'),
('V-20222333', 'Greeicy Rendon', 'F', 'greeicyr@gmail.com'),
('V-22999000', 'Tomas Rincon', 'M', 'trincon@gmail.com'),
('V-24666555', 'Deyna Castellanos', 'F', 'deynac@gmail.com'),
('E-26222111', 'Salomon Rondon', 'M', 'srondon@gmail.com'),
('V-17444333', 'Maite Delgado', 'F', 'maited@gmail.com'),
('V-19666777', 'Edgar Ramirez', 'M', 'edramirez@gmail.com'),
('V-23000111', 'Gaby Espino', 'F', 'gabyespino@gmail.com'),
('V-21111222', 'Winston Vallenilla', 'M', 'winstonv@gmail.com'),
('E-25999000', 'Catherine Fulop', 'F', 'cfulop@gmail.com'),
('V-28000111', 'Juan Arango', 'M', 'jarango@gmail.com'),
('V-20333444', 'Rosmeri Marval', 'F', 'rosmerim@gmail.com'),
('V-22777888', 'Aran de las Casas', 'M', 'aranc@gmail.com'),
('V-24222111', 'Sheryl Rubio', 'F', 'sherylr@gmail.com'),
('E-26444555', 'Lasso Muse', 'M', 'lasso@gmail.com'),
('V-17111000', 'Viviana Gibelli', 'F', 'vgibelli@gmail.com'),
('V-19333222', 'Daniel Sarcos', 'M', 'dsarcos@gmail.com'),
('V-23666777', 'Erika de la Vega', 'F', 'erikadv@gmail.com'),
('V-21444555', 'Luis Chataing', 'M', 'chataing@gmail.com'),
('V-25333222', 'Mariangel Ruiz', 'F', 'mariangelr@gmail.com'),
('E-28777888', 'Oscarcito Perez', 'M', 'oscarcito@gmail.com'),
('V-20999000', 'Sascha Barboza', 'F', 'saschafitness@gmail.com'),
('V-22000111', 'Irrael Gomez', 'M', 'irraelg@gmail.com'),
('V-24999000', 'Kerly Ruiz', 'F', 'kerlyr@gmail.com'),
('V-26888777', 'Jose Ramon Barreto', 'M', 'joseramonb@gmail.com'),
('E-17222333', 'Caterina Valentino', 'F', 'cvalen@gmail.com'),
('E-19999000', 'Henrique Lazo', 'M', 'hlazo@gmail.com'),
('E-23999000', 'Veruzhka Ramirez', 'F', 'vramirez@gmail.com');

-- INSERT LEYENDA_ESTRELLAS
INSERT INTO LEYENDA_ESTRELLAS (nb_descripcion) VALUES
  ('Muy Malo'), --Codigo 1 (1 estrella)
  ('Malo'), --Codigo 2 (2 estrellas)
  ('Regular'), --Codigo 3 (3 estrellas)
  ('Bueno'), --Codigo 4 (4 estrellas)
  ('Excelente'); --Codigo 5 (5 estrellas)
-- INSERT CIUDAD
INSERT INTO CIUDAD (nb_ciudad, cod_pais) VALUES
-- Venezuela (10)
('Caracas', 1),
('Maracaibo', 1),
('Valencia', 1),
('Barquisimeto', 1),
('Maracay', 1),
('Puerto La Cruz', 1),
('San Cristobal', 1),
('Ciudad Guayana', 1),
('Maturin', 1),
('Merida', 1),

-- Colombia (10)
('Bogota', 2),
('Medellin', 2),
('Cali', 2),
('Barranquilla', 2),
('Cartagena', 2),
('Bucaramanga', 2),
('Pereira', 2),
('Manizales', 2),
('Santa Marta', 2),
('Cucuta', 2),

-- Argentina (10)
('Buenos Aires', 3),
('Cordoba', 3),
('Rosario', 3),
('Mendoza', 3),
('La Plata', 3),
('Mar del Plata', 3),
('Salta', 3),
('San Miguel de Tucuman', 3),
('Neuquen', 3),
('Santa Fe', 3),

-- España (10)
('Madrid', 4),
('Barcelona', 4),
('Valencia', 4),
('Sevilla', 4),
('Zaragoza', 4),
('Malaga', 4),
('Bilbao', 4),
('Murcia', 4),
('Palma de Mallorca', 4),
('Alicante', 4),

-- México (10)
('Ciudad de Mexico', 5),
('Guadalajara', 5),
('Monterrey', 5),
('Puebla', 5),
('Tijuana', 5),
('Merida', 5),
('Cancun', 5),
('Queretaro', 5),
('Leon', 5),
('Toluca', 5);
-- SUBCATEGORIA
INSERT INTO SUBCATEGORIA (nb_sub_categoria, cod_categoria) VALUES

-- Tecnología e Innovación
('Desarrollo de Software', 1),
('Inteligencia Artificial y Robótica', 1),

-- Gastronomía y Alimentos
('Cocina Internacional', 2),
('Emprendimientos Gastronómicos', 2),

-- Educación y Carreras
('Universidades y Postgrados', 3),
('Formación Técnica y Profesional', 3),

-- Artes e Industrias Creativas
('Diseño Gráfico y Multimedia', 4),
('Producción Audiovisual', 4),

-- Salud y Bienestar
('Medicina Preventiva', 5),
('Fitness y Vida Activa', 5);
-- SEDE
-- =============================================
-- SECCIÓN DE SEDES CORREGIDA
-- =============================================

-- Venezuela
INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Centro de Convenciones Caracas', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Caracas';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Hotel Eurobuilding Caracas', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Caracas';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Centro de Convenciones Sambil Maracaibo', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Maracaibo';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Forum de Valencia', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Valencia';

-- Colombia
INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Corferias', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Bogota';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Plaza Mayor Medellin', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Medellin';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Centro de Eventos Valle del Pacifico', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Cali';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Puerta de Oro Centro de Eventos', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Barranquilla';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Centro de Convenciones Cartagena de Indias', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Cartagena';

-- Argentina
INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'La Rural Predio Ferial', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Buenos Aires';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Centro Costa Salguero', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Buenos Aires';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Centro de Convenciones Cordoba', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Cordoba';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Metropolitano Rosario', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Rosario';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Centro de Congresos y Exposiciones Emilio Civit', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Mendoza';

-- España
INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'IFEMA Madrid', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Madrid';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Palacio de Congresos Madrid', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Madrid';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Fira Barcelona Montjuïc', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Barcelona';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Fira Barcelona Gran Via', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Barcelona';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Feria Valencia', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Valencia';

-- México
INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Centro Citibanamex', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Ciudad de Mexico';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'World Trade Center CDMX', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Ciudad de Mexico';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Expo Guadalajara', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Guadalajara';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Cintermex', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Monterrey';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Centro Expositor Puebla', cod_ciudad FROM CIUDAD WHERE nb_ciudad = 'Puebla';
-- EVENTO
INSERT INTO EVENTO (nb_evento, fecha_inicia, fecha_fin, descripcion, cod_sede, email, cod_tipo_evento) VALUES
('Expo Tecno 2016', '2016-03-15', '2016-03-20', 'Innovación tecnológica', 1, 'info@tecno.ve', 1),
('Feria Gastronómica CCS', '2016-04-10', '2016-04-15', 'Sabores del mundo', 2, 'gastro@euro.ve', 7),
('Congreso Médico Bogotá', '2016-05-05', '2016-05-08', 'Avances en salud', 5, 'salud@corferias.co', 2),
('Expo Mueble Medellín', '2016-06-12', '2016-06-18', 'Diseño de interiores', 6, 'mueble@plazamayor.co', 1),
('Feria del Libro BA', '2016-07-20', '2016-08-05', 'Cultura literaria', 10, 'libros@larural.ar', 1),
('Auto Show CDMX', '2016-08-15', '2016-08-22', 'Exhibición automotriz', 21, 'autos@citibanamex.mx', 1),
('Semana de la Moda Madrid', '2016-09-10', '2016-09-15', 'Tendencias europeas', 16, 'moda@ifema.es', 1),
('Expo Construcción Cali', '2016-10-05', '2016-10-10', 'Materiales y equipos', 7, 'constru@valle.co', 3),
('Congreso Minero Monterrey', '2016-11-02', '2016-11-05', 'Industria pesada', 24, 'mineria@cintermex.mx', 2),
('Feria Navideña Valencia', '2016-12-01', '2016-12-20', 'Compras de temporada', 4, 'navidad@forum.ve', 1),
('Expo Agro Rosario', '2016-03-22', '2016-03-28', 'Tecnología de campo', 13, 'agro@metro.ar', 3),
('Boda Expo Barcelona', '2016-05-15', '2016-05-17', 'Planificación de eventos', 18, 'bodas@fira.es', 1),
('Salón del Ocio Bogotá', '2016-10-25', '2016-10-30', 'Videojuegos y cultura pop', 5, 'sofa@corferias.co', 1),
('Expo Artesanía Maracaibo', '2016-11-15', '2016-11-20', 'Talento regional', 3, 'arte@sambil.ve', 1),
('Congreso Educativo Puebla', '2016-06-05', '2016-06-08', 'Nuevas pedagogías', 25, 'edu@puebla.mx', 2),
('Global Tech 2017', '2017-02-10', '2017-02-15', 'Inteligencia Artificial', 16, 'tech@ifema.es', 1),
('Feria Textil Medellín', '2017-01-25', '2017-01-28', 'Colombiatex', 6, 'textil@plazamayor.co', 3),
('Expo Vino Mendoza', '2017-03-05', '2017-03-10', 'Cata y negocios', 14, 'vino@mendoza.ar', 7),
('Congreso de Energía CDMX', '2017-04-12', '2017-04-15', 'Sustentabilidad', 22, 'energia@wtc.mx', 2),
('Feria del Hogar Caracas', '2017-05-20', '2017-06-05', 'Muebles y electrodomésticos', 1, 'hogar@convenciones.ve', 1),
('Expo Turismo Cartagena', '2017-06-15', '2017-06-18', 'Destinos mundiales', 9, 'turismo@cartagena.co', 1),
('Salón Náutico Barcelona', '2017-10-10', '2017-10-15', 'Embarcaciones de lujo', 19, 'nautico@fira.es', 1),
('Expo Franquicias Guadalajara', '2017-09-05', '2017-09-08', 'Modelos de negocio', 23, 'negocios@guadalajara.mx', 1),
('Congreso Farmacéutico Córdoba', '2017-11-20', '2017-11-23', 'Industria médica', 12, 'farma@cordoba.ar', 2),
('Feria del Café Barranquilla', '2017-08-12', '2017-08-15', 'Productores locales', 8, 'cafe@puertadeoro.co', 7),
('Cyber Security Expo Madrid', '2017-04-22', '2017-04-25', 'Seguridad digital', 17, 'cyber@madrid.es', 6),
('Expo Logística Buenos Aires', '2017-05-10', '2017-05-13', 'Transporte y carga', 11, 'logistica@salguero.ar', 1),
('Feria Gastronómica Valencia', '2017-07-01', '2017-07-05', 'Comida mediterránea', 20, 'gastro@feria.es', 7),
('Congreso de Software Cali', '2017-03-28', '2017-03-31', 'Programación avanzada', 7, 'soft@valle.co', 2),
('Expo Belleza Maracaibo', '2017-09-20', '2017-09-24', 'Cosmética y moda', 3, 'belleza@sambil.ve', 1),
('Expo Inmobiliaria 2018', '2018-03-10', '2018-03-15', 'Proyectos residenciales', 21, 'ventas@citibanamex.mx', 1),
('Congreso de Marketing Digital', '2018-05-20', '2018-05-22', 'Tendencias RRSS', 2, 'mkt@euro.ve', 2),
('Feria del Libro Madrid', '2018-06-01', '2018-06-15', 'Cultura literaria', 16, 'libros@ifema.es', 3),
('Expo Carga Bogotá', '2018-08-10', '2018-08-13', 'Logística global', 5, 'log@corferias.co', 1),
('Convención de Ventas Regional', '2018-11-05', '2018-11-07', 'Estrategia anual', 4, 'ventas@forum.ve', 4),
('Expo Empleo Buenos Aires', '2019-02-15', '2019-02-17', 'Oportunidades laborales', 10, 'empleo@larural.ar', 1),
('Congreso de Medicina 2019', '2019-04-10', '2019-04-13', 'Nuevas cirugías', 17, 'med@madrid.es', 2),
('Feria de Tecnología Cali', '2019-06-20', '2019-06-25', 'Gadgets y software', 7, 'tech@valle.co', 3),
('Simposio de Ciberseguridad', '2019-07-15', '2019-07-17', 'Protección de datos', 22, 'cyber@wtc.mx', 6),
('Expo Boda Medellín', '2019-09-05', '2019-09-07', 'Todo para tu evento', 6, 'bodas@plazamayor.co', 1),
('Festival Gourmet Caracas', '2019-10-12', '2019-10-15', 'Cata de vinos', 1, 'gourmet@convenciones.ve', 7),
('Feria de Minería Monterrey', '2019-11-20', '2019-11-23', 'Recursos naturales', 24, 'mine@cintermex.mx', 3),
('Seminario de IA 2019', '2019-05-25', '2019-05-26', 'Futuro del trabajo', 19, 'ia@fira.es', 5),
('Expo Bebé Barranquilla', '2019-03-01', '2019-03-03', 'Maternidad y niños', 8, 'bebe@puertadeoro.co', 1),
('Congreso de Derecho Rosario', '2019-08-14', '2019-08-16', 'Leyes digitales', 13, 'ley@metro.ar', 2),
('Virtual Tech Expo', '2020-05-10', '2020-05-12', 'Evento híbrido tech', 16, 'vtech@ifema.es', 1),
('Reconecta Expo 2021', '2021-09-15', '2021-09-18', 'Reapertura comercial', 5, 're@corferias.co', 1),
('Congreso Salud Post-Pandemia', '2021-11-20', '2021-11-22', 'Nuevos protocolos', 2, 'salud@euro.ve', 2),
('Expo Agro Industrial 2022', '2022-03-05', '2022-03-10', 'Maquinaria pesada', 23, 'agro@guadalajara.mx', 3),
('Cumbre Líderes Latam', '2022-05-12', '2022-05-14', 'Networking corporativo', 10, 'cumbre@larural.ar', 4),
('Feria de Energía Solar', '2022-07-20', '2022-07-22', 'Renovables 2022', 20, 'solar@feria.es', 3),
('Smart Cities Expo 2022', '2022-10-18', '2022-10-20', 'Ciudades del futuro', 18, 'smart@fira.es', 5),
('Congreso de Turismo 2023', '2023-01-25', '2023-01-27', 'Destinos emergentes', 9, 'tur@cartagena.co', 2),
('Expo Construcción 2023', '2023-04-12', '2023-04-16', 'Materiales sostenibles', 25, 'cons@puebla.mx', 1),
('Salón del Automóvil 2023', '2023-06-15', '2023-06-22', 'Lanzamientos eléctricos', 21, 'auto@citibanamex.mx', 1),
('Feria Textil Colombiamoda', '2023-07-25', '2023-07-27', 'Pasarelas y negocios', 6, 'moda@plazamayor.co', 3),
('Convención Bancaria 2023', '2023-09-10', '2023-09-12', 'Fintech y banca', 2, 'banca@euro.ve', 4),
('Expo Logística Maracaibo', '2023-11-05', '2023-11-08', 'Puertos y transporte', 3, 'log@sambil.ve', 1),
('Simposio de Oncología', '2023-05-18', '2023-05-20', 'Investigación médica', 12, 'med@cordoba.ar', 6),
('Festival del Chocolate', '2023-12-01', '2023-12-03', 'Tradición venezolana', 1, 'choc@convenciones.ve', 7),
('Expo IA & Robótica 2024', '2024-02-15', '2024-02-18', 'Automatización 4.0', 16, 'robot@ifema.es', 5),
('Congreso Minero Chile-Arg', '2024-04-22', '2024-04-25', 'Extracción sustentable', 14, 'mine@mendoza.ar', 2),
('Feria de Franquicias 2024', '2024-06-10', '2024-06-12', 'Modelos de inversión', 22, 'franq@wtc.mx', 3),
('Expo Salud Bucal 2024', '2024-08-05', '2024-08-07', 'Odontología moderna', 7, 'salud@valle.co', 1),
('Cumbre de Criptoactivos', '2024-10-15', '2024-10-17', 'Blockchain y futuro', 2, 'crypto@euro.ve', 4),
('Expo Educación 2025', '2025-01-20', '2025-01-23', 'Postgrados y becas', 10, 'edu@larural.ar', 1),
('Salón del Mueble 2025', '2025-03-12', '2025-03-16', 'Hogar inteligente', 24, 'mueble@cintermex.mx', 1),
('Feria de Aeronáutica', '2025-05-08', '2025-05-12', 'Aviación civil', 8, 'aero@puertadeoro.co', 3),
('Congreso de Energías Limpias', '2025-07-15', '2025-07-18', 'H2 Verde', 17, 'green@madrid.es', 2),
('Expo Retail 2025', '2025-09-10', '2025-09-12', 'Comercio electrónico', 21, 'retail@citibanamex.mx', 1);

INSERT INTO EVENTO_ESTAND (cod_evento, cod_tipo_stand, cantidad_estimada, mts2, precio) VALUES
(1, 2, 10, 9.00, 1500.00),
(1, 3, 5, 25.00, 5000.00),
(2, 1, 20, 4.00, 800.00),
(2, 4, 8, 9.00, 1200.00),
(3, 2, 15, 9.00, 1800.00),
(3, 9, 10, 2.00, 500.00),
(4, 8, 5, 30.00, 6500.00),
(4, 3, 3, 50.00, 9000.00),
(5, 1, 50, 4.00, 600.00),
(5, 7, 20, 2.00, 300.00),
(6, 10, 10, 100.00, 15000.00),
(6, 6, 5, 200.00, 25000.00),
(7, 2, 12, 12.00, 2500.00),
(7, 8, 4, 35.00, 7000.00),
(8, 5, 15, 40.00, 4500.00),
(8, 3, 5, 60.00, 8500.00),
(9, 6, 8, 150.00, 18000.00),
(9, 2, 10, 9.00, 2000.00),
(10, 1, 30, 4.00, 500.00),
(10, 4, 10, 9.00, 950.00),
(11, 5, 20, 100.00, 3500.00),
(11, 10, 5, 80.00, 12000.00),
(12, 2, 15, 9.00, 2200.00),
(12, 4, 10, 12.00, 2800.00),
(13, 1, 40, 4.00, 700.00),
(13, 3, 6, 20.00, 4000.00),
(14, 7, 25, 2.00, 250.00),
(14, 1, 15, 4.00, 450.00),
(15, 9, 12, 2.00, 400.00),
(15, 2, 8, 9.00, 1300.00),
(16, 3, 10, 30.00, 7500.00),
(16, 10, 4, 60.00, 14000.00),
(17, 2, 20, 9.00, 1900.00),
(17, 8, 5, 25.00, 5500.00),
(18, 4, 12, 9.00, 1600.00),
(18, 7, 15, 3.00, 600.00),
(19, 6, 6, 100.00, 12000.00),
(19, 2, 10, 9.00, 2100.00),
(20, 1, 35, 6.00, 850.00),
(20, 3, 8, 25.00, 3800.00),
(21, 1, 40, 4.00, 450.00),
(21, 2, 10, 9.00, 1100.00),
(22, 6, 4, 120.00, 15000.00),
(22, 4, 12, 12.00, 1800.00),
(23, 5, 20, 50.00, 3200.00),
(23, 3, 5, 25.00, 4800.00),
(24, 2, 15, 9.00, 1400.00),
(25, 10, 2, 80.00, 9500.00),
(25, 9, 20, 2.00, 350.00),
(26, 1, 60, 4.00, 400.00),
(27, 3, 8, 30.00, 5500.00),
(27, 2, 12, 9.00, 1650.00),
(28, 7, 30, 2.00, 280.00),
(29, 8, 4, 40.00, 8000.00),
(30, 4, 10, 9.00, 1150.00),
(31, 2, 25, 9.00, 2100.00),
(32, 1, 45, 4.00, 750.00),
(33, 10, 6, 120.00, 18000.00),
(34, 3, 12, 20.00, 4200.00),
(34, 4, 15, 9.00, 1400.00),
(35, 6, 3, 250.00, 35000.00),
(36, 1, 25, 4.00, 550.00),
(37, 2, 18, 9.00, 1900.00),
(38, 7, 20, 3.00, 450.00),
(38, 9, 15, 2.00, 300.00),
(39, 5, 10, 45.00, 3800.00),
(40, 3, 5, 30.00, 6200.00),
(41, 2, 14, 9.00, 1550.00),
(42, 6, 2, 180.00, 22000.00),
(43, 1, 35, 4.00, 600.00),
(44, 4, 12, 12.00, 1750.00),
(45, 10, 5, 90.00, 11000.00),
(46, 3, 7, 25.00, 4900.00),
(47, 8, 6, 50.00, 9200.00),
(48, 1, 50, 4.00, 420.00),
(49, 2, 20, 9.00, 1350.00),
(50, 7, 25, 2.00, 310.00),
(51, 9, 15, 2.00, 290.00),
(52, 4, 10, 9.00, 1200.00),
(53, 2, 30, 9.00, 2300.00),
(54, 5, 12, 30.00, 2800.00),
(55, 3, 6, 40.00, 7800.00),
(56, 1, 40, 4.00, 500.00),
(57, 10, 3, 150.00, 20000.00),
(58, 8, 4, 45.00, 8500.00),
(59, 7, 18, 2.00, 340.00),
(60, 2, 15, 12.00, 2600.00),
(60, 4, 8, 9.00, 1450.00),
(59, 1, 20, 4.00, 480.00),
(58, 2, 10, 9.00, 1500.00);

-- CONTRATO

INSERT INTO CONTRATO (cod_evento, cod_tipo_stand, fecha_alquiler, cod_cliente, mts2, Monto, cod_sub_categoria) VALUES
(1, 2, '2016-01-15', 1, 9.00, 1500.00, 1),
(1, 3, '2016-01-20', 2, 25.00, 5000.00, 2),
(2, 1, '2016-02-10', 3, 4.00, 800.00, 3),
(2, 4, '2016-02-15', 4, 9.00, 1200.00, 4),
(3, 2, '2016-03-01', 5, 9.00, 1800.00, 9),
(4, 8, '2016-04-12', 1, 30.00, 6500.00, 7),
(5, 1, '2016-05-20', 2, 4.00, 600.00, 5),
(6, 10, '2016-06-15', 3, 100.00, 15000.00, 1),
(7, 2, '2016-07-10', 4, 12.00, 2500.00, 7),
(8, 5, '2016-08-05', 5, 40.00, 4500.00, 1),
(16, 3, '2016-12-10', 1, 30.00, 7500.00, 2),
(16, 10, '2016-12-15', 2, 60.00, 14000.00, 1),
(17, 2, '2017-01-05', 3, 9.00, 1900.00, 7),
(18, 4, '2017-02-12', 4, 9.00, 1600.00, 3),
(19, 6, '2017-03-01', 5, 100.00, 12000.00, 1),
(20, 1, '2017-04-20', 1, 6.00, 850.00, 4),
(11, 5, '2016-02-15', 2, 100.00, 3500.00, 1),
(12, 2, '2016-04-10', 3, 9.00, 2200.00, 8),
(13, 3, '2016-09-01', 4, 20.00, 4000.00, 6),
(14, 7, '2016-10-15', 5, 2.00, 250.00, 8),
(21, 1, '2018-01-10', 1, 4.00, 450.00, 1),
(21, 2, '2018-01-12', 2, 9.00, 1100.00, 2),
(22, 6, '2018-04-05', 3, 120.00, 15000.00, 1),
(23, 5, '2018-06-20', 4, 50.00, 3200.00, 1),
(24, 2, '2018-10-15', 5, 9.00, 1400.00, 9),
(25, 10, '2018-12-01', 1, 80.00, 9500.00, 1),
(26, 1, '2019-01-15', 2, 4.00, 400.00, 5),
(27, 3, '2019-03-20', 3, 30.00, 5500.00, 1),
(28, 7, '2019-06-10', 4, 2.00, 280.00, 3),
(29, 8, '2019-08-05', 5, 40.00, 8000.00, 7),
(31, 2, '2020-03-01', 1, 9.00, 2100.00, 2),
(33, 10, '2020-09-15', 2, 120.00, 18000.00, 1),
(34, 3, '2021-01-10', 3, 20.00, 4200.00, 1),
(35, 6, '2021-04-20', 4, 250.00, 35000.00, 1),
(37, 2, '2022-02-15', 5, 9.00, 1900.00, 7),
(40, 3, '2022-11-01', 1, 30.00, 6200.00, 1),
(42, 6, '2023-02-10', 2, 180.00, 22000.00, 1),
(45, 10, '2023-08-01', 3, 90.00, 11000.00, 1),
(47, 8, '2023-09-15', 4, 50.00, 9200.00, 1),
(50, 7, '2023-11-10', 5, 2.00, 310.00, 3),
(51, 9, '2024-01-05', 1, 2.00, 290.00, 1),
(53, 2, '2024-03-20', 2, 9.00, 2300.00, 2),
(55, 3, '2024-08-15', 3, 40.00, 7800.00, 1),
(57, 10, '2024-12-01', 4, 150.00, 20000.00, 1),
(58, 8, '2025-02-10', 5, 45.00, 8500.00, 1),
(60, 2, '2025-07-20', 1, 12.00, 2600.00, 7),
(59, 1, '2025-08-01', 2, 4.00, 480.00, 5),
(58, 2, '2025-01-15', 3, 9.00, 1500.00, 1),
(38, 9, '2021-12-10', 4, 2.00, 300.00, 10),
(10, 4, '2016-11-01', 5, 9.00, 950.00, 3),
(15, 2, '2016-05-01', 1, 9.00, 1300.00, 5),
(15, 9, '2016-05-05', 2, 2.00, 400.00, 6),
(30, 4, '2018-10-01', 3, 9.00, 1150.00, 4),
(27, 2, '2019-02-15', 4, 9.00, 1650.00, 1),
(14, 1, '2016-10-20', 5, 4.00, 450.00, 8),
(31, 2, '2020-02-10', 1, 9.00, 2100.00, 2),
(32, 1, '2020-04-01', 2, 4.00, 750.00, 3),
(34, 4, '2020-12-15', 3, 9.00, 1400.00, 1),
(36, 1, '2021-08-01', 4, 4.00, 550.00, 9),
(38, 7, '2021-11-20', 5, 3.00, 450.00, 10),
(41, 2, '2023-03-01', 1, 9.00, 1550.00, 2),
(43, 1, '2023-05-15', 2, 4.00, 600.00, 4),
(44, 4, '2023-06-20', 3, 12.00, 1750.00, 3),
(46, 3, '2023-09-01', 4, 25.00, 4900.00, 1),
(48, 1, '2023-11-05', 5, 4.00, 420.00, 6),
(49, 2, '2023-12-10', 1, 9.00, 1350.00, 5),
(50, 7, '2023-12-20', 2, 2.00, 310.00, 3),
(52, 4, '2024-03-01', 3, 9.00, 1200.00, 1),
(54, 5, '2024-06-15', 4, 30.00, 2800.00, 1),
(56, 1, '2024-11-20', 5, 4.00, 500.00, 9),
(59, 7, '2025-07-10', 1, 2.00, 340.00, 5),
(60, 4, '2025-08-05', 2, 9.00, 1450.00, 7),
(1, 1, '2016-01-25', 3, 4.00, 700.00, 1),
(6, 1, '2016-07-01', 4, 4.00, 800.00, 2),
(16, 2, '2016-12-20', 5, 9.00, 1800.00, 1),
(21, 3, '2018-02-01', 1, 20.00, 4000.00, 2),
(25, 2, '2018-12-10', 2, 9.00, 1600.00, 1),
(35, 3, '2021-04-25', 3, 25.00, 5000.00, 2),
(45, 3, '2023-08-10', 4, 20.00, 4500.00, 1),
(55, 2, '2024-08-20', 5, 9.00, 2000.00, 1),
(10, 1, '2016-11-05', 1, 4.00, 400.00, 3),
(12, 4, '2016-04-15', 2, 12.00, 2800.00, 8),
(18, 7, '2017-02-20', 3, 3.00, 600.00, 4),
(23, 3, '2018-06-25', 4, 25.00, 4800.00, 1),
(34, 1, '2021-01-15', 5, 4.00, 650.00, 2),
(47, 1, '2023-09-20', 1, 4.00, 500.00, 1),
(58, 2, '2025-02-15', 2, 9.00, 1500.00, 1),
(59, 1, '2025-08-05', 3, 4.00, 480.00, 5),
(20, 3, '2017-04-25', 4, 25.00, 3800.00, 4),
(19, 2, '2017-03-05', 5, 9.00, 2100.00, 1),
(17, 8, '2017-01-10', 1, 25.00, 5500.00, 7),
(9, 2, '2016-10-15', 2, 9.00, 2000.00, 1),
(7, 8, '2016-07-15', 3, 35.00, 7000.00, 7),
(4, 3, '2016-04-15', 4, 50.00, 9000.00, 7),
(11, 10, '2016-02-20', 5, 80.00, 12000.00, 1),
(13, 1, '2016-09-10', 1, 4.00, 700.00, 6),
(22, 4, '2018-04-10', 2, 12.00, 1800.00, 1),
(27, 3, '2019-03-25', 3, 30.00, 5500.00, 1),
(38, 1, '2021-11-25', 4, 4.00, 500.00, 10),
(60, 2, '2025-08-10', 5, 12.00, 2600.00, 7);


-- ENTRADA

INSERT INTO ENTRADA (cod_evento, fecha_entrada, hora_entrada, cod_visitante, recomienda_amigo, calificacion, cod_leyenda_estrellas) VALUES
--NOTA: CALIFICACION Y COD_ESTRELLAS DEBERIAN SER IGUALES?? 
(1, '2016-03-15', '09:30:00', 1, 1, 5, 1),
(1, '2016-03-15', '10:15:00', 2, 1, 4, 2),
(1, '2016-03-16', '11:00:00', 3, 0, 3, 3),
(2, '2016-04-10', '14:20:00', 4, 1, 5, 4),
(2, '2016-04-10', '15:45:00', 5, 1, 5, 5),
(5, '2016-07-20', '09:00:00', 6, 1, 4, 4),
(5, '2016-07-21', '10:30:00', 7, 1, 5, 2),
(5, '2016-07-22', '11:15:00', 8, 0, 2, 4),
(10, '2016-12-05', '16:00:00', 9, 1, 4, 4),
(10, '2016-12-06', '17:30:00', 10, 1, 3, 1),
(16, '2017-02-10', '08:45:00', 11, 1, 5, 2),
(16, '2017-02-11', '09:20:00', 33, 1, 4, 3),
(21, '2018-03-11', '10:00:00', 22, 1, 5, 4),
(21, '2018-03-12', '11:30:00', 44, 0, 3, 5),
(30, '2018-12-02', '13:35:45', 57, 1, 5, 1),
(30, '2018-12-03', '14:45:00', 66, 1, 5, 2),
(35, '2021-04-21', '09:15:00', 74, 0, 1, 3),
(35, '2021-04-22', '10:20:00', 88, 1, 3, 4),
(40, '2022-11-05', '11:00:00', 91, 1, 5, 5),
(40, '2022-11-06', '12:30:00', 10, 1, 4, 4),
(1, '2016-03-17', '14:00:00', 44, 1, 4, 3),
(2, '2016-04-11', '16:00:00', 67, 1, 5, 4),
(3, '2016-05-06', '09:45:00', 26, 0, 3, 2),
(7, '2016-09-11', '12:00:00', 37, 1, 4, 4),
(8, '2016-10-06', '13:45:00', 51, 0, 2, 5),
(9, '2016-11-03', '14:30:00', 73, 1, 5, 4),
(11, '2016-03-23', '15:15:00', 49, 1, 4, 3),
(12, '2016-05-16', '09:30:00', 100, 1, 5, 4),
(13, '2016-10-26', '10:15:00', 24, 0, 3, 5),
(14, '2016-11-16', '11:00:00', 44, 1, 4, 4),
(15, '2016-06-06', '12:45:00', 67, 1, 5, 3),
(17, '2017-01-26', '14:30:00', 89, 1, 4, 2),
(18, '2017-03-06', '15:15:00', 19, 0, 3, 5),
(19, '2017-04-13', '16:00:00', 34, 1, 5, 4),
(20, '2017-05-21', '09:00:00', 54, 1, 4, 3),
(22, '2018-04-06', '10:30:00', 73, 0, 2, 5),
(23, '2018-06-21', '11:15:00', 95, 1, 5, 4),
(24, '2018-10-16', '12:00:00', 10, 1, 4, 3),
(25, '2018-12-02', '13:45:00', 24, 1, 5, 5),
(26, '2019-01-16', '14:30:00', 44, 0, 3, 2),
(27, '2019-03-21', '15:15:00', 66, 1, 4, 4),
(28, '2019-06-11', '16:00:00', 81, 1, 5, 5),
(29, '2019-08-06', '09:30:00', 14, 1, 4, 3),
(33, '2020-09-16', '10:15:00', 33, 0, 2, 5),
(42, '2023-02-11', '11:00:00', 57, 1, 5, 4),
(45, '2023-08-02', '12:45:00', 78, 1, 4, 3),
(50, '2023-11-11', '14:30:00', 93, 0, 3, 2),
(60, '2025-07-21', '15:15:00', 100, 1, 5, 1),
(16, '2017-02-12', '11:00:00', 59, 1, 4, 3),
(17, '2017-01-27', '10:30:00', 24, 1, 5, 4),
(18, '2017-03-07', '15:00:00', 74, 0, 3, 5),
(19, '2017-04-14', '09:45:00', 93, 1, 5, 1),
(20, '2017-05-22', '11:20:00', 71, 1, 4, 3),
(21, '2018-03-13', '14:00:00', 36, 1, 4, 5),
(22, '2018-04-07', '16:30:00', 69, 1, 5, 4),
(24, '2018-10-17', '12:15:00', 10, 1, 4, 1),
(25, '2018-12-03', '09:30:00', 44, 1, 5, 5),
(26, '2019-01-17', '11:45:00', 26, 1, 3, 2),
(27, '2019-03-22', '15:20:00', 5, 0, 4, 4),
(28, '2019-06-12', '17:00:00', 7, 1, 5, 5),
(29, '2019-08-07', '10:10:00', 9, 1, 5, 3),
(30, '2018-12-04', '13:30:00', 1, 1, 4, 2),
(31, '2020-03-02', '11:00:00', 34, 1, 5, 4),
(33, '2020-09-17', '15:45:00', 65, 0, 2, 5),
(34, '2021-01-11', '10:20:00', 84, 1, 4, 3),
(35, '2021-04-23', '14:30:00', 100, 1, 5, 1),
(37, '2022-02-16', '16:00:00', 27, 1, 4, 1),
(40, '2022-11-07', '11:15:00', 55, 1, 5, 4),
(42, '2023-02-12', '10:45:00', 71, 0, 3, 5),
(45, '2023-08-03', '12:00:00', 93, 1, 4, 3),
(47, '2023-09-16', '14:50:00', 1, 1, 5, 1),
(50, '2023-11-12', '16:10:00', 44, 1, 4, 5),
(51, '2024-02-16', '10:00:00', 62, 1, 5, 4),
(53, '2024-03-21', '11:30:00', 86, 1, 4, 3),
(55, '2024-08-16', '13:45:00', 11, 0, 3, 2),
(57, '2024-12-02', '15:20:00', 32, 1, 5, 1),
(58, '2025-02-11', '09:15:00', 53, 1, 4, 3),
(60, '2025-07-22', '11:00:00', 74, 1, 5, 4),
(59, '2025-09-11', '14:30:00', 97, 1, 4, 3),
(1, '2016-03-18', '16:00:00', 38, 1, 5, 5),
(1, '2016-03-19', '17:20:00', 24, 1, 4, 3),
(2, '2016-04-12', '11:30:00', 45, 1, 5, 4),
(2, '2016-04-13', '12:45:00', 66, 1, 3, 1),
(5, '2016-07-23', '10:00:00', 87, 1, 5, 4),
(5, '2016-07-24', '14:15:00', 13, 0, 4, 3),
(10, '2016-12-07', '15:30:00', 30, 1, 5, 5),
(10, '2016-12-08', '16:45:00', 50, 1, 4, 3),
(3, '2016-05-07', '10:00:00', 70, 1, 4, 5),
(4, '2016-06-14', '11:30:00', 90, 1, 5, 4),
(6, '2016-08-17', '14:00:00', 18, 1, 4, 3),
(7, '2016-09-12', '16:15:00', 28, 0, 3, 5),
(8, '2016-10-07', '09:45:00', 41, 1, 4, 3),
(9, '2016-11-04', '11:20:00', 60, 1, 5, 4),
(11, '2016-03-24', '13:00:00', 84, 1, 4, 5),
(12, '2016-05-17', '15:30:00', 12, 1, 5, 4),
(13, '2016-10-27', '17:00:00', 34, 0, 2, 5),
(14, '2016-11-17', '10:30:00', 5, 1, 4, 3),
(21, '2018-03-14', '09:15:00', 55, 1, 5, 4),
(21, '2018-03-14', '14:30:00', 86, 1, 4, 3),
(22, '2018-04-08', '11:00:00', 21, 0, 3, 5),
(23, '2018-06-23', '18:20:00', 42, 1, 5, 4),
(24, '2018-10-18', '10:45:00', 67, 1, 4, 3),
(25, '2018-12-04', '15:30:00', 13, 1, 5, 5),
(26, '2019-01-18', '09:00:00', 31, 1, 2, 5),
(27, '2019-03-23', '12:00:00', 79, 0, 4, 3),
(28, '2019-06-13', '14:15:00', 97, 1, 5, 4),
(29, '2019-08-08', '16:50:00', 12, 1, 4, 5),
(30, '2018-12-03', '14:30:00', 3, 1, 4, 4),
(31, '2020-03-03', '10:30:00', 2, 1, 5, 4),
(32, '2020-04-02', '11:15:00', 42, 0, 3, 5),
(33, '2020-09-18', '15:00:00', 5, 1, 4, 3),
(34, '2021-01-12', '09:45:00', 81, 1, 5, 4),
(35, '2021-04-24', '14:00:00', 15, 1, 4, 1),
(36, '2021-08-02', '16:30:00', 35, 0, 3, 4),
(40, '2022-11-08', '11:00:00', 64, 1, 5, 3),
(42, '2023-02-13', '13:20:00', 97, 1, 4, 5),
(45, '2023-08-04', '10:00:00', 11, 1, 5, 4),
(48, '2023-11-06', '15:45:00', 70, 1, 4, 3),
(51, '2024-02-17', '09:30:00', 20, 1, 5, 4),
(52, '2024-03-02', '11:20:00', 40, 1, 4, 5),
(53, '2024-03-22', '14:10:00', 17, 0, 3, 4),
(54, '2024-06-16', '16:00:00', 63, 1, 5, 3),
(55, '2024-08-17', '10:45:00', 50, 1, 4, 5),
(56, '2024-11-21', '09:15:00', 84, 1, 5, 4),
(57, '2024-12-03', '12:30:00', 67, 0, 4, 3),
(58, '2025-02-12', '15:00:00', 19, 1, 5, 4),
(59, '2025-09-12', '11:45:00', 91, 1, 4, 5),
(60, '2025-07-23', '13:00:00', 7, 1, 5, 4),
(1, '2016-03-18', '18:00:00', 32, 1, 5, 1),
(1, '2016-03-19', '19:30:00', 52, 1, 5, 3),
(2, '2016-04-12', '14:00:00', 74, 1, 4, 5),
(2, '2016-04-13', '15:30:00', 98, 0, 3, 5),
(3, '2016-05-07', '11:00:00', 16, 1, 4, 1),
(4, '2016-06-14', '10:20:00', 24, 1, 5, 4),
(5, '2016-07-23', '09:45:00', 49, 1, 4, 3),
(6, '2016-08-17', '16:00:00', 63, 1, 5, 1),
(7, '2016-09-12', '17:30:00', 82, 0, 2, 5),
(8, '2016-10-07', '11:15:00', 14, 1, 5, 1),
(9, '2016-11-04', '14:45:00', 13, 1, 4, 5),
(10, '2016-12-07', '18:00:00', 2, 1, 5, 4),
(16, '2017-02-13', '10:00:00', 4, 1, 4, 5),
(17, '2017-01-28', '15:20:00', 64, 1, 5, 3),
(19, '2017-04-15', '09:00:00', 85, 1, 5, 4),
(20, '2017-05-23', '11:30:00', 13, 0, 3, 5),
(35, '2021-04-25', '16:00:00', 28, 1, 4, 3),
(45, '2023-08-05', '09:45:00', 38, 1, 5, 4),
(58, '2025-02-13', '14:00:00', 17, 1, 4, 5),
(60, '2025-07-24', '17:30:00', 59, 1, 5, 4),
(21, '2018-03-15', '16:45:00', 14, 1, 5, 3),
(22, '2018-04-09', '14:20:00', 32, 1, 4, 5),
(23, '2018-06-24', '15:10:00', 54, 0, 2, 3),
(24, '2018-10-19', '11:30:00', 73, 1, 5, 4),
(25, '2018-12-05', '13:00:00', 94, 1, 4, 5),
(26, '2019-01-19', '10:15:00', 10, 1, 3, 5),
(31, '2020-03-04', '14:50:00', 20, 1, 5, 4),
(33, '2020-09-19', '16:00:00', 40, 1, 4, 1),
(35, '2021-04-26', '12:30:00', 60, 0, 2, 3),
(40, '2022-11-09', '15:20:00', 80, 1, 5, 4),
(1, '2016-03-16', '13:00:00', 50, 1, 5, 1),
(2, '2016-04-11', '10:45:00', 77, 1, 4, 5),
(5, '2016-07-21', '15:30:00', 97, 1, 5, 4),
(10, '2016-12-06', '16:20:00', 16, 1, 4, 5),
(1, '2016-03-17', '18:10:00', 10, 1,5, 3),
(16, '2017-02-14', '09:00:00', 27, 1, 4, 5),
(17, '2017-01-29', '11:45:00', 46, 1, 5, 3),
(19, '2017-04-16', '14:15:00', 64, 1, 3, 5),
(21, '2018-03-16', '17:00:00', 87, 1, 4, 5),
(22, '2018-04-10', '10:30:00', 15, 0, 2, 3),
(51, '2024-02-18', '11:15:00', 1, 1, 5, 1),
(52, '2024-03-03', '15:40:00', 35, 1, 4, 5),
(53, '2024-03-23', '09:50:00', 55, 1, 5, 4),
(57, '2024-12-04', '14:20:00', 72, 1, 4, 5),
(60, '2025-07-25', '16:35:00', 97, 1, 5, 4),
(45, '2023-08-01', '09:10:00', 18, 1, 5, 3),
(45, '2023-08-01', '09:15:00', 29, 1, 4, 5),
(45, '2023-08-01', '09:30:00', 37, 1, 5, 1),
(45, '2023-08-01', '10:00:00', 47, 0, 3, 5),
(45, '2023-08-01', '10:15:00', 55, 1, 4, 3),
(15, '2016-06-07', '11:00:00', 62, 1, 5, 1),
(28, '2019-06-14', '15:45:00', 81, 1, 4, 5),
(38, '2021-11-16', '10:30:00', 13, 1, 5, 4),
(44, '2023-06-16', '12:20:00', 20, 0, 3, 5),
(47, '2023-10-06', '14:50:00', 45, 1, 5, 4),
(54, '2024-06-17', '16:00:00', 65, 1, 4, 5),
(58, '2025-02-14', '11:15:00', 86, 1, 5, 3),
(3, '2016-05-08', '09:45:00', 10, 1, 4, 5),
(4, '2016-06-15', '14:30:00', 16, 1, 5, 3),
(6, '2016-08-18', '17:20:00', 34, 0, 3, 5),
(11, '2016-03-25', '10:00:00', 15, 1, 4, 3),
(12, '2016-05-18', '12:15:00', 27, 1, 5, 4),
(13, '2016-10-28', '15:30:00', 95, 1, 4, 5),
(14, '2016-11-18', '11:45:00', 17, 0, 2, 3),
(18, '2017-03-08', '14:00:00', 26, 1, 5, 4),
(19, '2017-04-16', '10:30:00', 48, 1, 4, 1),
(20, '2017-05-24', '16:45:00', 62, 1, 5, 3),
(37, '2022-02-17', '11:10:00', 83, 1, 4, 5),
(42, '2023-02-14', '13:00:00', 10, 1, 5, 1),
(59, '2025-09-13', '15:30:00', 100, 1, 4, 1),
(1, '2016-03-15', '10:00:00', 12, 1, 5, 5),
(2, '2016-04-10', '11:00:00', 23, 1, 4, 4),
(3, '2016-05-06', '09:30:00', 25, 1, 5, 5),
(4, '2016-06-13', '14:00:00', 39, 0, 3, 3),
(5, '2016-07-20', '10:15:00', 43, 1, 4, 4),
(6, '2016-08-16', '11:00:00', 46, 1, 5, 5),
(7, '2016-09-11', '12:30:00', 56, 1, 4, 4),
(8, '2016-10-06', '13:45:00', 58, 0, 2, 2),
(9, '2016-11-03', '15:20:00', 61, 1, 5, 5),
(10, '2016-12-05', '16:00:00', 68, 1, 4, 4),
(11, '2016-03-23', '09:00:00', 72, 1, 5, 5),
(12, '2016-05-16', '10:45:00', 75, 1, 4, 4),
(13, '2016-10-26', '11:30:00', 76, 0, 3, 3),
(14, '2016-11-16', '12:15:00', 80, 1, 5, 5),
(15, '2016-06-06', '13:00:00', 85, 1, 4, 4),
(16, '2017-02-10', '14:50:00', 92, 1, 5, 5),
(17, '2017-01-26', '15:30:00', 96, 0, 2, 2),
(18, '2017-03-06', '09:10:00', 99, 1, 4, 4),
(19, '2017-04-13', '10:20:00', 29, 1, 5, 5),
(20, '2017-05-21', '11:40:00', 47, 1, 4, 4),
(21, '2018-03-11', '12:10:00', 52, 0, 3, 3),
(22, '2018-04-06', '13:00:00', 63, 1, 5, 5),
(23, '2018-06-21', '14:20:00', 77, 1, 4, 4),
(24, '2018-10-16', '15:50:00', 82, 1, 5, 5),
(25, '2018-12-02', '16:30:00', 98, 0, 3, 3),
(26, '2019-01-16', '10:00:00', 16, 1, 4, 4);
