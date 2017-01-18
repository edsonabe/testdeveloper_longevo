--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: chamados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE chamados (
    pk_chamado integer NOT NULL,
    fk_pedido integer NOT NULL,
    titulo character varying(255) NOT NULL,
    observacao text NOT NULL
);


ALTER TABLE chamados OWNER TO postgres;

--
-- Name: chamados_pk_chamado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE chamados_pk_chamado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chamados_pk_chamado_seq OWNER TO postgres;

--
-- Name: chamados_pk_chamado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE chamados_pk_chamado_seq OWNED BY chamados.pk_chamado;


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE clientes (
    pk_cliente integer NOT NULL,
    nome character varying(255) NOT NULL,
    email character varying(255) NOT NULL
);


ALTER TABLE clientes OWNER TO postgres;

--
-- Name: clientes_pk_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clientes_pk_cliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clientes_pk_cliente_seq OWNER TO postgres;

--
-- Name: clientes_pk_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clientes_pk_cliente_seq OWNED BY clientes.pk_cliente;


--
-- Name: pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pedidos (
    pk_pedido integer NOT NULL,
    fk_cliente integer NOT NULL,
    numero_pedido integer NOT NULL
);


ALTER TABLE pedidos OWNER TO postgres;

--
-- Name: pedidos_pk_pedido_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pedidos_pk_pedido_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pedidos_pk_pedido_seq OWNER TO postgres;

--
-- Name: pedidos_pk_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pedidos_pk_pedido_seq OWNED BY pedidos.pk_pedido;


--
-- Name: teste; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE teste (
    cli_codigo integer NOT NULL,
    cli_nome character varying(30) NOT NULL
);


ALTER TABLE teste OWNER TO postgres;

--
-- Name: teste_cli_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE teste_cli_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teste_cli_codigo_seq OWNER TO postgres;

--
-- Name: teste_cli_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE teste_cli_codigo_seq OWNED BY teste.cli_codigo;


--
-- Name: chamados pk_chamado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY chamados ALTER COLUMN pk_chamado SET DEFAULT nextval('chamados_pk_chamado_seq'::regclass);


--
-- Name: clientes pk_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientes ALTER COLUMN pk_cliente SET DEFAULT nextval('clientes_pk_cliente_seq'::regclass);


--
-- Name: pedidos pk_pedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidos ALTER COLUMN pk_pedido SET DEFAULT nextval('pedidos_pk_pedido_seq'::regclass);


--
-- Name: teste cli_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY teste ALTER COLUMN cli_codigo SET DEFAULT nextval('teste_cli_codigo_seq'::regclass);


--
-- Data for Name: chamados; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO chamados (pk_chamado, fk_pedido, titulo, observacao) VALUES (5, 6, 'Titulo de teste 1', 'Observação 1');
INSERT INTO chamados (pk_chamado, fk_pedido, titulo, observacao) VALUES (6, 7, 'Titulo de teste 2', 'Observação 2');
INSERT INTO chamados (pk_chamado, fk_pedido, titulo, observacao) VALUES (7, 8, 'Titulo de teste 3', 'Observação 3');
INSERT INTO chamados (pk_chamado, fk_pedido, titulo, observacao) VALUES (8, 9, 'Titulo de teste 4', 'Observação 4');
INSERT INTO chamados (pk_chamado, fk_pedido, titulo, observacao) VALUES (9, 10, 'Titulo de teste 5', 'Observação 5');
INSERT INTO chamados (pk_chamado, fk_pedido, titulo, observacao) VALUES (10, 11, 'Titulo de teste 6', 'Observação 6 usando o mesmo cliente para um novo chamado');
INSERT INTO chamados (pk_chamado, fk_pedido, titulo, observacao) VALUES (11, 12, 'Titulo de teste 7', 'Observação 7');
INSERT INTO chamados (pk_chamado, fk_pedido, titulo, observacao) VALUES (12, 13, 'Titulo de teste 8', 'Observação 8');
INSERT INTO chamados (pk_chamado, fk_pedido, titulo, observacao) VALUES (13, 14, 'Titulo de teste 9', 'Observação 9');
INSERT INTO chamados (pk_chamado, fk_pedido, titulo, observacao) VALUES (14, 15, 'Titulo de teste 10', 'Observação 10');


--
-- Name: chamados_pk_chamado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('chamados_pk_chamado_seq', 14, true);


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO clientes (pk_cliente, nome, email) VALUES (9, 'Edson Abe', 'edson@teste.com.br');
INSERT INTO clientes (pk_cliente, nome, email) VALUES (10, 'Cintia', 'cintia@teste.com.br');
INSERT INTO clientes (pk_cliente, nome, email) VALUES (11, 'Marcelo', 'marcelo@teste.com.br');
INSERT INTO clientes (pk_cliente, nome, email) VALUES (12, 'Marina', 'marina@teste.com.br');
INSERT INTO clientes (pk_cliente, nome, email) VALUES (13, 'Karen', 'karen@teste.com.br');
INSERT INTO clientes (pk_cliente, nome, email) VALUES (14, 'Amanda', 'amanda@teste.com.br');
INSERT INTO clientes (pk_cliente, nome, email) VALUES (15, 'Lucas', 'lucas@teste.com.br');
INSERT INTO clientes (pk_cliente, nome, email) VALUES (16, 'Regina', 'regina@teste.com.br');
INSERT INTO clientes (pk_cliente, nome, email) VALUES (17, 'Cecilia', 'cecilia@teste.com.br');


--
-- Name: clientes_pk_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clientes_pk_cliente_seq', 17, true);


--
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pedidos (pk_pedido, fk_cliente, numero_pedido) VALUES (6, 9, 111111);
INSERT INTO pedidos (pk_pedido, fk_cliente, numero_pedido) VALUES (7, 10, 222222);
INSERT INTO pedidos (pk_pedido, fk_cliente, numero_pedido) VALUES (8, 11, 333333);
INSERT INTO pedidos (pk_pedido, fk_cliente, numero_pedido) VALUES (9, 12, 444444);
INSERT INTO pedidos (pk_pedido, fk_cliente, numero_pedido) VALUES (10, 13, 555555);
INSERT INTO pedidos (pk_pedido, fk_cliente, numero_pedido) VALUES (11, 9, 666666);
INSERT INTO pedidos (pk_pedido, fk_cliente, numero_pedido) VALUES (12, 14, 777777);
INSERT INTO pedidos (pk_pedido, fk_cliente, numero_pedido) VALUES (13, 15, 888888);
INSERT INTO pedidos (pk_pedido, fk_cliente, numero_pedido) VALUES (14, 16, 999999);
INSERT INTO pedidos (pk_pedido, fk_cliente, numero_pedido) VALUES (15, 17, 101010);


--
-- Name: pedidos_pk_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pedidos_pk_pedido_seq', 15, true);


--
-- Data for Name: teste; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: teste_cli_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('teste_cli_codigo_seq', 1, true);


--
-- Name: chamados pk_chamado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY chamados
    ADD CONSTRAINT pk_chamado PRIMARY KEY (pk_chamado);


--
-- Name: clientes pk_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT pk_cliente PRIMARY KEY (pk_cliente);


--
-- Name: teste pk_codigo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY teste
    ADD CONSTRAINT pk_codigo PRIMARY KEY (cli_codigo);


--
-- Name: pedidos pk_pedido; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidos
    ADD CONSTRAINT pk_pedido PRIMARY KEY (pk_pedido);


--
-- Name: chamados chamados_fk_pedido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY chamados
    ADD CONSTRAINT chamados_fk_pedido_fkey FOREIGN KEY (fk_pedido) REFERENCES pedidos(pk_pedido) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pedidos pedidos_fk_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidos
    ADD CONSTRAINT pedidos_fk_cliente_fkey FOREIGN KEY (fk_cliente) REFERENCES clientes(pk_cliente) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

