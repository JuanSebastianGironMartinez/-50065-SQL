use deliverydb_gironmartinez;

CREATE TABLE CLIENTE (
	id_cliente INT NOT NULL AUTO_INCREMENT UNIQUE,
	primer_nombre VARCHAR(100) NOT NULL,
	segundo_nombre VARCHAR(100),
	apellido_paterno VARCHAR(100) NOT NULL,
	apellido_materno VARCHAR(100),
	direccion VARCHAR(100) NOT NULL,
	telefono VARCHAR(100) NOT NULL UNIQUE,
	correo_electronico VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (id_clente)
    );
    
CREATE TABLE PEDIDO (
	id_pedido INT NOT NULL UNIQUE AUTO_INCREMENT,
    fecha_pedido DATETIME NOT NULL,
    distancia_rest DECIMAL(10,2) NOT NULL,
    distancia_cliente DECIMAL(10,2) NOT NULL,
    ganancia_base DECIMAL(10,2) NOT NULL,
    propina DECIMAL(10,2),
    id_rest INT NOT NULL,
    id_repartidor INT NOT NULL,
    id_cliente INT NOT NULL,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_rest) REFERENCES RESTAURANTE (id_rest),
    FOREIGN KEY (id_repartidor) REFERENCES REPARTIDOR (id_repartidor),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE (id_cliente)
    );
    
CREATE TABLE RESTAURANTE (
	id_rest INT NOT NULL UNIQUE AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    direccion VARCHAR(100) NOT NULL UNIQUE,
    id_tipo_rest INT NOT NULL,
    id_producto INT NOT NULL,
    PRIMARY KEY (id_rest),
    FOREIGN KEY (id_tipo_rest) REFERENCES TIPO_DE_RESTAURANTE (id_tipo_rest),
    FOREIGN KEY (id_producto) REFERENCES PRODUCTO (id_producto)
    );
    
CREATE TABLE REPARTIDOR (
	id_repartidor INT NOT NULL UNIQUE AUTO_INCREMENT,
    primer_nombre VARCHAR(100) NOT NULL,
    segundo_nombre VARCHAR(100),
    apellid_paterno VARCHAR(100) NOT NULL,
    apellido_materno VARCHAR(100),
    direccion VARCHAR(100) NOT NULL,
    telefono INT NOT NULL UNIQUE,
    correo_electronico VARCHAR(100) NOT NULL UNIQUE,
    statuses VARCHAR(100) NOT NULL,
    numero_cuenta INT(20) NOT NULL UNIQUE,
    id_tipo_vehiculo INT NOT NULL,
    PRIMARY KEY (id_repartidor),
    FOREIGN KEY (id_tipo_vehiculo) REFERENCES TIPO_DE_VEHICULO (id_tipo_vehiculo)
    );
    
CREATE TABLE PROMOS_PRODUCTO (
	id_promo_producto INT NOT NULL UNIQUE AUTO_INCREMENT,
	statuses_promo_producto BOOLEAN NOT NULL,
	nombre_promo VARCHAR(40) NOT NULL,
	codigo_promocion VARCHAR(40) NOT NULL,
	porc_descuento DECIMAL(3,2) NOT NULL,
	dia_inicio DATETIME NOT NULL,
	dia_fin DATETIME NOT NULL,
	PRIMARY KEY (id_promo_producto)
	);
        
CREATE TABLE PROMOS_REPARTIDORES (
    id_promo_reapartidor INT NOT NULL UNIQUE AUTO_INCREMENT,
    statuses_promo_repartidor BOOLEAN NOT NULL,
    nombre_promo VARCHAR(40) NOT NULL,
    codigo_promocion VARCHAR(40) NOT NULL,
    monto_promo INT NOT NULL,
    dia_inicio DATETIME NOT NULL,
    dia_fin DATETIME NOT NULL,
    PRIMARY KEY (id_promo_repartidor)
    );
    
CREATE TABLE METRICAS (
	id_metrica INT NOT NULL UNIQUE AUTO_INCREMENT,
    tasa_aceptacion DECIMAL(3,2) NOT NULL,
    tasa_finalizacion DECIMAL (3,2) NOT NULL,
    satisfaccion_cliente DECIMAL (3,2) NOT NULL,
    reservas_completadas INT NOT NULL,
    horas_alta_demanda TIME NOT NULL,
    id_repartidor INT NOT NULL,
    PRIMARY KEY (id_metrica),
    FOREIGN KEY (id_repartidor) REFERENCES REPARTIDOR (id_repartidor)
    );
    
CREATE TABLE TIPO_DE_VEHICULO (
	id_tipo_vehiculo INT NOT NULL UNIQUE AUTO_INCREMENT,
    patente VARCHAR(40),
    descripcion VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_tipo_vehiculo)
    );
    
CREATE TABLE RESERVAS (
	id_reserva INT NOT NULL UNIQUE AUTO_INCREMENT,
    dia_inicio DATETIME NOT NULL,
    dia_fin DATETIME NOT NULL,
    PRIMARY KEY (id_reserva),
    id_repartidor INT NOT NULL,
    FOREIGN KEY (id_repartidor) REFERENCES REPARTIDOR (id_repartidor)
    );
    
CREATE TABLE MEDIO_DE_PAGO (
	id_medio_pago INT NOT NULL UNIQUE AUTO_INCREMENT,
    numero_tarjeta INT(20) NOT NULL UNIQUE,
    id_entidad_financiera VARCHAR(40) NOT NULL,
    tipo_tarjeta VARCHAR(40) NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    cod_seguridad INT(3) NOT NULL,
    monto_cobrado DECIMAL(7,2) NOT NULL,
    id_pedido INT NOT NULL,
    PRIMARY KEY (id_medio_pago),
    FOREIGN KEY (id_entidad_financiera) REFERENCES ENTIDADES_FINANCIERAS(id_entidad_financiera),
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO (id_pedido)
    );
    
CREATE TABLE TIPO_DE_RESATURANTE (
	id_tipo_rest INT NOT NULL UNIQUE AUTO_INCREMENT,
    descripcion VARCHAR(40),
    PRIMARY KEY (id_tipo_rest)
    );
    
CREATE TABLE PRODUCTO (
	id_producto INT NOT NULL UNIQUE AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    id_promo_producto INT NOT NULL,
    PRIMARY KEY (id_producto),
    FOREIGN KEY (id_promo_producto) REFERENCES PROMOS_PRODUCTO (id_promo_producto)
    );
    
CREATE TABLE BALANCES (
	id_balance INT NOT NULL UNIQUE AUTO_INCREMENT,
    ganancia_base DECIMAL(6,2) NOT NULL,
    propina DECIMAL (5,2),
    total DECIMAL(7,2) NOT NULL,
    id_repartidor INT NOT NULL,
    PRIMARY KEY (id_balance),
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO (id_pedido)
    );
    
CREATE TABLE ENTIDADES_FINANCIERAS (
	id_entidad_financiera INT NOT NULL UNIQUE AUTO_INCREMENT,
    descripcion VARCHAR(40) NOT NULL,
    PRIMARY KEY (id_entidad_financiera)
    );
    
    CREATE TABLE TABLA_PUENTE (
	id_restaurante INT NOT NULL,
    id_producto INT NOT NULL
    );
    