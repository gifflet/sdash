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

