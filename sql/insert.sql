SET search_path TO expoucv_g30030004;

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

-- INSERT TIPO_EVENTO
INSERT INTO TIPO_STAND (nb_tipo_stand) VALUES
('Básico'),
('Estándar'),
('Premium'),
('VIP');
-- INSERT LEYENDA_ESTRELLAS
INSERT INTO LEYENDA_ESTRELLA (nb_descripcion) VALUES
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
('Producción Audiovisual', 4)

-- Salud y Bienestar
('Medicina Preventiva', 5),
('Fitness y Vida Activa', 5);
-- SEDE
--Caracas
/*Centro de Convenciones La Carlota — Caracas
Hotel Eurobuilding Caracas — Caracas
Centro de Convenciones Sambil Maracaibo — Maracaibo
Forum de Valencia — Valencia
Centro de Convenciones Metropolitano — Barquisimeto*/
INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Centro de Convenciones Caracas', cod_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Caracas';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Hotel Eurobuilding Caracas', cod_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Caracas';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Centro de Convenciones Sambil Maracaibo', cod_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Maracaibo';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Forum de Valencia', cod_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Valencia';
--Colombia
/*Corferias — Bogota
Plaza Mayor Medellin — Medellin
Centro de Eventos Valle del Pacifico — Cali
Puerta de Oro Centro de Eventos — Barranquilla
Centro de Convenciones Cartagena de Indias — Cartagena*/
INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Plaza Mayor Medellin', nb_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Bogota';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Centro de Eventos Valle del Pacifico', nb_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Medellin';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Puerta de Oro Centro de Eventos', nb_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Cali';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Puerta de Oro Centro de Eventos', nb_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Barranquilla';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Centro de Convenciones Cartagena de Indias', nb_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Cartagena';

--Argentina
/*La Rural Predio Ferial — Buenos Aires
Centro Costa Salguero — Buenos Aires
Centro de Convenciones Cordoba — Cordoba
Metropolitano Rosario — Rosario
Centro de Congresos y Exposiciones Emilio Civit — Mendoza*/
INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'La Rural Predio Ferial', nb_ciudad
FROM CIUDAD WHERE nb_ciudad= 'Buenos Aires';


INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Centro Costa Salguero', nb_ciudad
FROM CIUDAD WHERE nb_ciudad= 'Buenos Aires';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Centro de Convenciones Cordoba', nb_ciudad
FROM CIUDAD WHERE nb_ciudad= 'Cordoba';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Metropolitano Rosario', nb_ciudad
FROM CIUDAD WHERE nb_ciudad= 'Rosario';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Centro de Congresos y Exposiciones Emilio Civit', nb_ciudad
FROM CIUDAD WHERE nb_ciudad= 'Mendoza';
--ESPAÑA
/*IFEMA Madrid — Madrid
Palacio de Congresos Madrid — Madrid
Fira Barcelona Montjuïc — Barcelona
Fira Barcelona Gran Via — Barcelona
Feria Valencia — Valencia*/
INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'IFEMA', nb_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Madrid';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Palacio de Congresos Madrid', nb_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Madrid';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Fira Barcelona Montjuïc', nb_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Barcelona';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Fira Barcelona Gran Via', nb_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Barcelona';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Feria Valencia', nb_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Valencia';
--Mexico
/*Centro Citibanamex — Ciudad de Mexico
World Trade Center CDMX — Ciudad de Mexico
Expo Guadalajara — Guadalajara
Cintermex — Monterrey
Centro Expositor Puebla — Puebla*/
INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Centro Citibanamex', nb_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Ciudad de Mexico';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'World Trade Center CDMX', nb_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Ciudad de Mexico';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Expo Guadalajara', nb_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Guadalajara';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Cintermex', nb_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Monterrey';

INSERT INTO SEDE (nb_sede, cod_ciudad)
SELECT 'Centro Expositor Puebla', nb_ciudad
FROM CIUDAD WHERE nb_ciudad = 'Puebla';
-- EVENTO
-- EVENTO_STAND
-- CONTRATO
-- ENTRADA
