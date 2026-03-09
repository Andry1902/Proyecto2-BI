CREATE TABLE fact_evento_stand (
    sk_evento NUMERIC NOT NULL,
    sk_tipo_stand NUMERIC NOT NULL,
    cantidad_estimada NUMERIC,
    mts2 NUMERIC(10,4),
    precio NUMERIC(10,4),
    PRIMARY KEY (sk_evento, sk_tipo_stand)
);


CREATE TABLE fact_visita (
    sk_evento NUMERIC NOT NULL,
    sk_visitante NUMERIC NOT NULL,
    sk_fecha_entrada NUMERIC NOT NULL,
    sk_leyenda_estrellas NUMERIC NOT NULL,
    num_entrada NUMERIC NOT NULL,
    hora_entrada TIME,
    cantidad_visita NUMERIC,
    calificacion NUMERIC,
    recomienda_amigo NUMERIC,
    PRIMARY KEY (sk_evento, sk_visitante, sk_fecha_entrada, sk_leyenda_estrellas, num_entrada)
);


CREATE TABLE fact_alquiler (
    num_contrato NUMERIC NOT NULL, -- PK Generada por Pentaho
    sk_evento NUMERIC NOT NULL,
    sk_cliente NUMERIC NOT NULL,
    sk_fecha_alquiler NUMERIC NOT NULL,
    sk_tipo_stand NUMERIC NOT NULL,
    sk_categoria NUMERIC NOT NULL,
    nro_stand NUMERIC,
    mts2 NUMERIC(10,2),
    monto NUMERIC(10,2),
    cantidad NUMERIC,
    
    PRIMARY KEY (num_contrato)
);


CREATE TABLE fact_evento (
    sk_evento INT,
    sk_sede INT,
    sk_fecha_evento INT,
    cantidad_evento INT,            -- Entradas vendidas
    cantidad_estim_visitante INT,   
    meta_ingreso DECIMAL(18, 2),    -- Cantidad estimada * Precio

	PRIMARY KEY (sk_evento, sk_sede,sk_fecha_evento)
);