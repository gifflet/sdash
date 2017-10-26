-- Table: disciplina

-- DROP TABLE disciplina;

CREATE TABLE disciplina
(
  id serial NOT NULL,
  nome character varying(30) NOT NULL,
  professor character varying(30) NOT NULL,
  semestre character varying(30) NOT NULL,
  situacao character varying(30) NOT NULL,
  nota1 double precision,
  nota2 double precision,
  nota3 double precision,
  nota4 double precision,
  nota5 double precision,
  resultado double precision,
  idusuario integer,
  CONSTRAINT disciplina_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE disciplina
  OWNER TO postgres;

-- Table: tarefa

-- DROP TABLE tarefa;

CREATE TABLE tarefa
(
  id serial NOT NULL,
  nome character varying(30) NOT NULL,
  disciplina character varying(30) NOT NULL,
  situacao character varying(30) NOT NULL,
  mensagem character varying NOT NULL,
  finalizacao character varying(30) NOT NULL,
  auth character varying(30),
  idusuario integer,
  CONSTRAINT tarefa_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tarefa
  OWNER TO postgres;

-- Table: usuario

-- DROP TABLE usuario;

CREATE TABLE usuario
(
  id serial NOT NULL,
  nome character varying(50),
  email character varying(30) NOT NULL,
  senha character varying(32) NOT NULL,
  CONSTRAINT usuario_pkey PRIMARY KEY (id),
  CONSTRAINT usuario_email_key UNIQUE (email)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE usuario
  OWNER TO postgres;