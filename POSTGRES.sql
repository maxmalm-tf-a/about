--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2015-08-09 22:11:35

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 177 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2022 (class 0 OID 0)
-- Dependencies: 177
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 174 (class 1259 OID 16408)
-- Name: tokens; Type: TABLE; Schema: public; Owner: test; Tablespace: 
--

CREATE TABLE tokens (
    token text NOT NULL,
    validuntil timestamp with time zone,
    userid integer
);


ALTER TABLE tokens OWNER TO test;

--
-- TOC entry 2023 (class 0 OID 0)
-- Dependencies: 174
-- Name: TABLE tokens; Type: COMMENT; Schema: public; Owner: test
--

COMMENT ON TABLE tokens IS 'Store access tokens';


--
-- TOC entry 175 (class 1259 OID 16414)
-- Name: transactions; Type: TABLE; Schema: public; Owner: test; Tablespace: 
--

CREATE TABLE transactions (
    userid integer,
    text text,
    value integer,
    sum integer,
    transactionid integer NOT NULL,
    category text,
    date text
);


ALTER TABLE transactions OWNER TO test;

--
-- TOC entry 176 (class 1259 OID 16427)
-- Name: transactions_transactionid_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE transactions_transactionid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transactions_transactionid_seq OWNER TO test;

--
-- TOC entry 2024 (class 0 OID 0)
-- Dependencies: 176
-- Name: transactions_transactionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE transactions_transactionid_seq OWNED BY transactions.transactionid;


--
-- TOC entry 172 (class 1259 OID 16396)
-- Name: users; Type: TABLE; Schema: public; Owner: test; Tablespace: 
--

CREATE TABLE users (
    userid integer NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE users OWNER TO test;

--
-- TOC entry 2025 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN users.email; Type: COMMENT; Schema: public; Owner: test
--

COMMENT ON COLUMN users.email IS 'Why data type text?

http://stackoverflow.com/a/4849030';


--
-- TOC entry 2026 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN users.password; Type: COMMENT; Schema: public; Owner: test
--

COMMENT ON COLUMN users.password IS 'bcrypt hashed password';


--
-- TOC entry 173 (class 1259 OID 16399)
-- Name: users_userId_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE "users_userId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "users_userId_seq" OWNER TO test;

--
-- TOC entry 2027 (class 0 OID 0)
-- Dependencies: 173
-- Name: users_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE "users_userId_seq" OWNED BY users.userid;


--
-- TOC entry 1895 (class 2604 OID 16429)
-- Name: transactionid; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY transactions ALTER COLUMN transactionid SET DEFAULT nextval('transactions_transactionid_seq'::regclass);


--
-- TOC entry 1894 (class 2604 OID 16401)
-- Name: userid; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY users ALTER COLUMN userid SET DEFAULT nextval('"users_userId_seq"'::regclass);


--
-- TOC entry 1903 (class 2606 OID 16418)
-- Name: token; Type: CONSTRAINT; Schema: public; Owner: test; Tablespace: 
--

ALTER TABLE ONLY tokens
    ADD CONSTRAINT token PRIMARY KEY (token);


--
-- TOC entry 1905 (class 2606 OID 16437)
-- Name: transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: test; Tablespace: 
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (transactionid);


--
-- TOC entry 1897 (class 2606 OID 16422)
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: test; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 1899 (class 2606 OID 16439)
-- Name: users_email_key1; Type: CONSTRAINT; Schema: public; Owner: test; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key1 UNIQUE (email);


--
-- TOC entry 1901 (class 2606 OID 16420)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: test; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- TOC entry 2021 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: test
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM test;
GRANT ALL ON SCHEMA public TO test;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-08-09 22:11:35

--
-- PostgreSQL database dump complete
--

