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

