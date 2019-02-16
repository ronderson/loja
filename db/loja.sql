toc.dat                                                                                             0000600 0004000 0002000 00000022725 13431701104 0014441 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       /                     w           loja    11.1    11.1 !    !           0    0    ENCODING    ENCODING         SET client_encoding = 'LATIN1';
                       false         "           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         #           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false         $           1262    16394    loja    DATABASE     �   CREATE DATABASE loja WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE loja;
             postgres    false         �            1259    16397 	   aparelhos    TABLE     �   CREATE TABLE public.aparelhos (
    id_aparelho integer NOT NULL,
    descricao_aparelho character varying(15) NOT NULL,
    codigo_aparelho character varying(100)
);
    DROP TABLE public.aparelhos;
       public         postgres    false         �            1259    16395    aparelhos_id_parelhos_seq    SEQUENCE     �   CREATE SEQUENCE public.aparelhos_id_parelhos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.aparelhos_id_parelhos_seq;
       public       postgres    false    197         %           0    0    aparelhos_id_parelhos_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.aparelhos_id_parelhos_seq OWNED BY public.aparelhos.id_aparelho;
            public       postgres    false    196         �            1259    16405    perfil    TABLE     o   CREATE TABLE public.perfil (
    id_perfil integer NOT NULL,
    nome_perfil character varying(60) NOT NULL
);
    DROP TABLE public.perfil;
       public         postgres    false         �            1259    16403    perfil_id_perfil_seq    SEQUENCE     �   CREATE SEQUENCE public.perfil_id_perfil_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.perfil_id_perfil_seq;
       public       postgres    false    199         &           0    0    perfil_id_perfil_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.perfil_id_perfil_seq OWNED BY public.perfil.id_perfil;
            public       postgres    false    198         �            1259    16443    usuario_aparelhos    TABLE     m   CREATE TABLE public.usuario_aparelhos (
    id_usuario integer NOT NULL,
    id_aparelho integer NOT NULL
);
 %   DROP TABLE public.usuario_aparelhos;
       public         postgres    false         �            1259    16464    usuario_perfil    TABLE     h   CREATE TABLE public.usuario_perfil (
    id_usuario integer NOT NULL,
    id_perfil integer NOT NULL
);
 "   DROP TABLE public.usuario_perfil;
       public         postgres    false         �            1259    16413    usuarios    TABLE     �  CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nome_usuario character varying(60) NOT NULL,
    login character varying(12) NOT NULL,
    email character varying(60) NOT NULL,
    senha character varying(45) NOT NULL,
    data_criacao timestamp with time zone NOT NULL,
    tempo_expiracao_senha integer,
    cod_autorizacao character varying(1),
    status_usuario character varying(1),
    cod_pessoa integer
);
    DROP TABLE public.usuarios;
       public         postgres    false         �            1259    16411    usuarios_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.usuarios_id_usuario_seq;
       public       postgres    false    201         '           0    0    usuarios_id_usuario_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;
            public       postgres    false    200         �
           2604    16400    aparelhos id_aparelho    DEFAULT     ~   ALTER TABLE ONLY public.aparelhos ALTER COLUMN id_aparelho SET DEFAULT nextval('public.aparelhos_id_parelhos_seq'::regclass);
 D   ALTER TABLE public.aparelhos ALTER COLUMN id_aparelho DROP DEFAULT;
       public       postgres    false    197    196    197         �
           2604    16408    perfil id_perfil    DEFAULT     t   ALTER TABLE ONLY public.perfil ALTER COLUMN id_perfil SET DEFAULT nextval('public.perfil_id_perfil_seq'::regclass);
 ?   ALTER TABLE public.perfil ALTER COLUMN id_perfil DROP DEFAULT;
       public       postgres    false    198    199    199         �
           2604    16416    usuarios id_usuario    DEFAULT     z   ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);
 B   ALTER TABLE public.usuarios ALTER COLUMN id_usuario DROP DEFAULT;
       public       postgres    false    201    200    201                   0    16397 	   aparelhos 
   TABLE DATA               U   COPY public.aparelhos (id_aparelho, descricao_aparelho, codigo_aparelho) FROM stdin;
    public       postgres    false    197       2840.dat           0    16405    perfil 
   TABLE DATA               8   COPY public.perfil (id_perfil, nome_perfil) FROM stdin;
    public       postgres    false    199       2842.dat           0    16443    usuario_aparelhos 
   TABLE DATA               D   COPY public.usuario_aparelhos (id_usuario, id_aparelho) FROM stdin;
    public       postgres    false    202       2845.dat           0    16464    usuario_perfil 
   TABLE DATA               ?   COPY public.usuario_perfil (id_usuario, id_perfil) FROM stdin;
    public       postgres    false    203       2846.dat           0    16413    usuarios 
   TABLE DATA               �   COPY public.usuarios (id_usuario, nome_usuario, login, email, senha, data_criacao, tempo_expiracao_senha, cod_autorizacao, status_usuario, cod_pessoa) FROM stdin;
    public       postgres    false    201       2844.dat (           0    0    aparelhos_id_parelhos_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.aparelhos_id_parelhos_seq', 5, true);
            public       postgres    false    196         )           0    0    perfil_id_perfil_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.perfil_id_perfil_seq', 4, true);
            public       postgres    false    198         *           0    0    usuarios_id_usuario_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 108, true);
            public       postgres    false    200         �
           2606    16402    aparelhos aparelhos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.aparelhos
    ADD CONSTRAINT aparelhos_pkey PRIMARY KEY (id_aparelho);
 B   ALTER TABLE ONLY public.aparelhos DROP CONSTRAINT aparelhos_pkey;
       public         postgres    false    197         �
           2606    16410    perfil perfil_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT perfil_pkey PRIMARY KEY (id_perfil);
 <   ALTER TABLE ONLY public.perfil DROP CONSTRAINT perfil_pkey;
       public         postgres    false    199         �
           2606    16418    usuarios usuarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public         postgres    false    201         �
           2606    16451 4   usuario_aparelhos usuario_aparelhos_id_aparelho_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_aparelhos
    ADD CONSTRAINT usuario_aparelhos_id_aparelho_fkey FOREIGN KEY (id_aparelho) REFERENCES public.aparelhos(id_aparelho);
 ^   ALTER TABLE ONLY public.usuario_aparelhos DROP CONSTRAINT usuario_aparelhos_id_aparelho_fkey;
       public       postgres    false    2709    197    202         �
           2606    16446 3   usuario_aparelhos usuario_aparelhos_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_aparelhos
    ADD CONSTRAINT usuario_aparelhos_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);
 ]   ALTER TABLE ONLY public.usuario_aparelhos DROP CONSTRAINT usuario_aparelhos_id_usuario_fkey;
       public       postgres    false    2713    202    201         �
           2606    16472 ,   usuario_perfil usuario_perfil_id_perfil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT usuario_perfil_id_perfil_fkey FOREIGN KEY (id_perfil) REFERENCES public.perfil(id_perfil);
 V   ALTER TABLE ONLY public.usuario_perfil DROP CONSTRAINT usuario_perfil_id_perfil_fkey;
       public       postgres    false    199    203    2711         �
           2606    16467 -   usuario_perfil usuario_perfil_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT usuario_perfil_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);
 W   ALTER TABLE ONLY public.usuario_perfil DROP CONSTRAINT usuario_perfil_id_usuario_fkey;
       public       postgres    false    203    201    2713                                                   2840.dat                                                                                            0000600 0004000 0002000 00000000132 13431701104 0014235 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	aparelho 01	\N
2	aparelho 02	\N
3	aparelho 03	\N
4	aparelho 04	\N
5	aparelho 05	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                      2842.dat                                                                                            0000600 0004000 0002000 00000000062 13431701104 0014241 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Administrador
2	Diretor
3	Coordenador
4	RH
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                              2845.dat                                                                                            0000600 0004000 0002000 00000000043 13431701104 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        106	1
107	2
106	3
107	4
108	5
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             2846.dat                                                                                            0000600 0004000 0002000 00000000027 13431701104 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        106	1
107	3
108	4
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         2844.dat                                                                                            0000600 0004000 0002000 00000000563 13431701104 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        106	Usuario 01	usuario.01	usuario01@hotmail.com	e10adc3949ba59abbe56e057f20f883e	2019-02-15 23:00:28.798918-03	\N	\N	1	\N
107	Usuario 02	usuario.02	usuario02@hotmail.com	e10adc3949ba59abbe56e057f20f883e	2019-02-15 23:04:44.004208-03	\N	\N	1	\N
108	Usuario 03	usuario.03	usuario03@hotmail.com	d41d8cd98f00b204e9800998ecf8427e	2019-02-15 23:05:19.487887-03	\N	\N	0	\N
\.


                                                                                                                                             restore.sql                                                                                         0000600 0004000 0002000 00000020401 13431701104 0015353 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE loja;
--
-- Name: loja; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE loja WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


ALTER DATABASE loja OWNER TO postgres;

\connect loja

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: aparelhos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aparelhos (
    id_aparelho integer NOT NULL,
    descricao_aparelho character varying(15) NOT NULL,
    codigo_aparelho character varying(100)
);


ALTER TABLE public.aparelhos OWNER TO postgres;

--
-- Name: aparelhos_id_parelhos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aparelhos_id_parelhos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aparelhos_id_parelhos_seq OWNER TO postgres;

--
-- Name: aparelhos_id_parelhos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aparelhos_id_parelhos_seq OWNED BY public.aparelhos.id_aparelho;


--
-- Name: perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perfil (
    id_perfil integer NOT NULL,
    nome_perfil character varying(60) NOT NULL
);


ALTER TABLE public.perfil OWNER TO postgres;

--
-- Name: perfil_id_perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perfil_id_perfil_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perfil_id_perfil_seq OWNER TO postgres;

--
-- Name: perfil_id_perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perfil_id_perfil_seq OWNED BY public.perfil.id_perfil;


--
-- Name: usuario_aparelhos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_aparelhos (
    id_usuario integer NOT NULL,
    id_aparelho integer NOT NULL
);


ALTER TABLE public.usuario_aparelhos OWNER TO postgres;

--
-- Name: usuario_perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_perfil (
    id_usuario integer NOT NULL,
    id_perfil integer NOT NULL
);


ALTER TABLE public.usuario_perfil OWNER TO postgres;

--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nome_usuario character varying(60) NOT NULL,
    login character varying(12) NOT NULL,
    email character varying(60) NOT NULL,
    senha character varying(45) NOT NULL,
    data_criacao timestamp with time zone NOT NULL,
    tempo_expiracao_senha integer,
    cod_autorizacao character varying(1),
    status_usuario character varying(1),
    cod_pessoa integer
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_usuario_seq OWNER TO postgres;

--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- Name: aparelhos id_aparelho; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aparelhos ALTER COLUMN id_aparelho SET DEFAULT nextval('public.aparelhos_id_parelhos_seq'::regclass);


--
-- Name: perfil id_perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil ALTER COLUMN id_perfil SET DEFAULT nextval('public.perfil_id_perfil_seq'::regclass);


--
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- Data for Name: aparelhos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aparelhos (id_aparelho, descricao_aparelho, codigo_aparelho) FROM stdin;
\.
COPY public.aparelhos (id_aparelho, descricao_aparelho, codigo_aparelho) FROM '$$PATH$$/2840.dat';

--
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.perfil (id_perfil, nome_perfil) FROM stdin;
\.
COPY public.perfil (id_perfil, nome_perfil) FROM '$$PATH$$/2842.dat';

--
-- Data for Name: usuario_aparelhos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_aparelhos (id_usuario, id_aparelho) FROM stdin;
\.
COPY public.usuario_aparelhos (id_usuario, id_aparelho) FROM '$$PATH$$/2845.dat';

--
-- Data for Name: usuario_perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_perfil (id_usuario, id_perfil) FROM stdin;
\.
COPY public.usuario_perfil (id_usuario, id_perfil) FROM '$$PATH$$/2846.dat';

--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id_usuario, nome_usuario, login, email, senha, data_criacao, tempo_expiracao_senha, cod_autorizacao, status_usuario, cod_pessoa) FROM stdin;
\.
COPY public.usuarios (id_usuario, nome_usuario, login, email, senha, data_criacao, tempo_expiracao_senha, cod_autorizacao, status_usuario, cod_pessoa) FROM '$$PATH$$/2844.dat';

--
-- Name: aparelhos_id_parelhos_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aparelhos_id_parelhos_seq', 5, true);


--
-- Name: perfil_id_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perfil_id_perfil_seq', 4, true);


--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 108, true);


--
-- Name: aparelhos aparelhos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aparelhos
    ADD CONSTRAINT aparelhos_pkey PRIMARY KEY (id_aparelho);


--
-- Name: perfil perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT perfil_pkey PRIMARY KEY (id_perfil);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- Name: usuario_aparelhos usuario_aparelhos_id_aparelho_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_aparelhos
    ADD CONSTRAINT usuario_aparelhos_id_aparelho_fkey FOREIGN KEY (id_aparelho) REFERENCES public.aparelhos(id_aparelho);


--
-- Name: usuario_aparelhos usuario_aparelhos_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_aparelhos
    ADD CONSTRAINT usuario_aparelhos_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- Name: usuario_perfil usuario_perfil_id_perfil_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT usuario_perfil_id_perfil_fkey FOREIGN KEY (id_perfil) REFERENCES public.perfil(id_perfil);


--
-- Name: usuario_perfil usuario_perfil_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT usuario_perfil_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               