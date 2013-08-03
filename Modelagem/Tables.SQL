USE DATABASE SAD;

DROP TABLE Tipo_Devices;
DROP TABLE Device_Cron;
DROP TABLE Cron;
DROP TABLE Historico_Devices;
DROP TABLE Comodo;
DROP TABLE Devices;

CREATE TABLE Tipo_Devices ( 
	id integer NOT NULL,
	nm_tipo text NOT NULL,
	dt_cadastro timestamp NOT NULL,
	fg_status boolean NOT NULL
);

CREATE SEQUENCE Device_Cron_id_seq INCREMENT 1 START 1;

CREATE TABLE Device_Cron ( 
	id integer DEFAULT NEXTVAL('"Device_Cron_id_seq"'::TEXT) NOT NULL,
	id_device integer NOT NULL,
	id_cron integer NOT NULL
);

CREATE SEQUENCE Cron_id_seq INCREMENT 1 START 1;

CREATE TABLE Cron ( 
	id integer DEFAULT NEXTVAL('"Cron_id_seq"'::TEXT) NOT NULL,
	dt_inicial timestamp NOT NULL,
	dt_final timestamp NOT NULL,
	dt_cadastro timestamp NOT NULL,
	fg_tatus integer NOT NULL
);

CREATE SEQUENCE Historico_Devices_id_seq INCREMENT 1 START 1;

CREATE TABLE Historico_Devices ( 
	id integer DEFAULT NEXTVAL('"Historico_Devices_id_seq"'::TEXT) NOT NULL,
	id_device integer NOT NULL,
	vl_device numeric(10,2) NOT NULL,
	dt_cadastro timestamp NOT NULL,
	fg_status boolean NOT NULL
);

CREATE SEQUENCE Comodo_id_seq INCREMENT 1 START 1;

CREATE TABLE Comodo ( 
	id integer DEFAULT NEXTVAL('"Comodo_id_seq"'::TEXT) NOT NULL,
	nm_comodo text NOT NULL,
	dt_cadastro timestamp NOT NULL,
	fg_status boolean NOT NULL
);

CREATE SEQUENCE Devices_id_seq INCREMENT 1 START 1;

CREATE TABLE Devices ( 
	id integer DEFAULT NEXTVAL('"Devices_id_seq"'::TEXT) NOT NULL,
	id_comodo integer NOT NULL,
	nm_device text NOT NULL,
	nm_apelido text NOT NULL,
	id_tipo integer NOT NULL,
	vl_calibracao numeric(10,2) NULL,
	dt_cadastro timestamp NOT NULL,
	fg_status boolean NOT NULL
);

ALTER TABLE Tipo_Devices ADD CONSTRAINT PK_Tipo_Devices 
	PRIMARY KEY (id);


ALTER TABLE Device_Cron ADD CONSTRAINT PK_Device_Cron 
	PRIMARY KEY (id, id_cron);


ALTER TABLE Cron ADD CONSTRAINT PK_Cron 
	PRIMARY KEY (id);


ALTER TABLE Historico_Devices ADD CONSTRAINT PK_Historico_Devices 
	PRIMARY KEY (id);


ALTER TABLE Comodo ADD CONSTRAINT PK_Comodo 
	PRIMARY KEY (id);


ALTER TABLE Devices ADD CONSTRAINT PK_Devices 
	PRIMARY KEY (id);


ALTER TABLE Tipo_Devices ADD CONSTRAINT FK_Tipo_Devices_Devices 
	FOREIGN KEY (id) REFERENCES Devices (id_tipo);

ALTER TABLE Cron ADD CONSTRAINT FK_Cron_Device_Cron 
	FOREIGN KEY (id) REFERENCES Device_Cron (id, id_cron);

ALTER TABLE Devices ADD CONSTRAINT FK_Devices_Comodo 
	FOREIGN KEY (id_comodo) REFERENCES Comodo (id);