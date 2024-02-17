--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Homebrew)
-- Dumped by pg_dump version 15.4 (Homebrew)

-- Started on 2023-11-07 11:51:18 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 3703 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 33929)
-- Name: authors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.authors (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    public_name text
);


--
-- TOC entry 214 (class 1259 OID 33928)
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3704 (class 0 OID 0)
-- Dependencies: 214
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- TOC entry 223 (class 1259 OID 33983)
-- Name: book_authors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.book_authors (
    book_id bigint NOT NULL,
    author_id bigint NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 33968)
-- Name: book_genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.book_genres (
    book_id bigint NOT NULL,
    genre_id bigint NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 33959)
-- Name: books; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.books (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    title text
);


--
-- TOC entry 220 (class 1259 OID 33958)
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3705 (class 0 OID 0)
-- Dependencies: 220
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- TOC entry 217 (class 1259 OID 33939)
-- Name: genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genres (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    name text
);


--
-- TOC entry 216 (class 1259 OID 33938)
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3706 (class 0 OID 0)
-- Dependencies: 216
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- TOC entry 226 (class 1259 OID 34006)
-- Name: subscribe_author; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subscribe_author (
    subscribe_id bigint NOT NULL,
    author_id bigint NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 34021)
-- Name: subscribe_book; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subscribe_book (
    subscribe_id bigint NOT NULL,
    book_id bigint NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 34036)
-- Name: subscribe_subscriber; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subscribe_subscriber (
    subscribe_id bigint NOT NULL,
    subscriber_id bigint NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 33949)
-- Name: subscribers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subscribers (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    email text,
    full_name text
);


--
-- TOC entry 218 (class 1259 OID 33948)
-- Name: subscribers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subscribers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3707 (class 0 OID 0)
-- Dependencies: 218
-- Name: subscribers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subscribers_id_seq OWNED BY public.subscribers.id;


--
-- TOC entry 225 (class 1259 OID 33999)
-- Name: subscribes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subscribes (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    subscriber_id bigint
);


--
-- TOC entry 224 (class 1259 OID 33998)
-- Name: subscribes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subscribes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3708 (class 0 OID 0)
-- Dependencies: 224
-- Name: subscribes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subscribes_id_seq OWNED BY public.subscribes.id;


--
-- TOC entry 3501 (class 2604 OID 33932)
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- TOC entry 3504 (class 2604 OID 33962)
-- Name: books id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- TOC entry 3502 (class 2604 OID 33942)
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- TOC entry 3503 (class 2604 OID 33952)
-- Name: subscribers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscribers ALTER COLUMN id SET DEFAULT nextval('public.subscribers_id_seq'::regclass);


--
-- TOC entry 3505 (class 2604 OID 34002)
-- Name: subscribes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscribes ALTER COLUMN id SET DEFAULT nextval('public.subscribes_id_seq'::regclass);


--
-- TOC entry 3684 (class 0 OID 33929)
-- Dependencies: 215
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.authors VALUES (5, '2023-11-07 11:04:42.077401+01', '2023-11-07 11:05:30.849769+01', '2023-11-07 11:05:59.641734+01', 'test author');
INSERT INTO public.authors VALUES (6, '2023-11-07 11:06:47.652076+01', '2023-11-07 11:06:47.652076+01', NULL, 'naim frasher');
INSERT INTO public.authors VALUES (7, '2023-11-07 11:06:55.696682+01', '2023-11-07 11:06:55.696682+01', NULL, 'gjergj fishta');
INSERT INTO public.authors VALUES (8, '2023-11-07 11:07:04.063434+01', '2023-11-07 11:07:04.063434+01', NULL, 'author test');


--
-- TOC entry 3692 (class 0 OID 33983)
-- Dependencies: 223
-- Data for Name: book_authors; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.book_authors VALUES (1, 6);
INSERT INTO public.book_authors VALUES (2, 6);
INSERT INTO public.book_authors VALUES (3, 6);
INSERT INTO public.book_authors VALUES (4, 6);
INSERT INTO public.book_authors VALUES (5, 6);
INSERT INTO public.book_authors VALUES (6, 6);
INSERT INTO public.book_authors VALUES (7, 6);
INSERT INTO public.book_authors VALUES (8, 6);
INSERT INTO public.book_authors VALUES (9, 6);


--
-- TOC entry 3691 (class 0 OID 33968)
-- Dependencies: 222
-- Data for Name: book_genres; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.book_genres VALUES (1, 2);
INSERT INTO public.book_genres VALUES (1, 3);
INSERT INTO public.book_genres VALUES (2, 2);
INSERT INTO public.book_genres VALUES (2, 3);
INSERT INTO public.book_genres VALUES (3, 2);
INSERT INTO public.book_genres VALUES (3, 3);
INSERT INTO public.book_genres VALUES (4, 2);
INSERT INTO public.book_genres VALUES (4, 3);
INSERT INTO public.book_genres VALUES (5, 2);
INSERT INTO public.book_genres VALUES (5, 3);
INSERT INTO public.book_genres VALUES (6, 2);
INSERT INTO public.book_genres VALUES (6, 3);
INSERT INTO public.book_genres VALUES (7, 2);
INSERT INTO public.book_genres VALUES (7, 3);
INSERT INTO public.book_genres VALUES (8, 2);
INSERT INTO public.book_genres VALUES (8, 3);
INSERT INTO public.book_genres VALUES (9, 2);
INSERT INTO public.book_genres VALUES (9, 3);


--
-- TOC entry 3690 (class 0 OID 33959)
-- Dependencies: 221
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.books VALUES (1, '2023-11-07 11:22:32.622402+01', '2023-11-07 11:22:32.622402+01', NULL, 'book 1');
INSERT INTO public.books VALUES (2, '2023-11-07 11:23:24.686427+01', '2023-11-07 11:23:24.686427+01', NULL, 'book 2');
INSERT INTO public.books VALUES (3, '2023-11-07 11:25:35.939646+01', '2023-11-07 11:25:35.939646+01', NULL, 'book 3');
INSERT INTO public.books VALUES (4, '2023-11-07 11:26:54.623677+01', '2023-11-07 11:26:54.623677+01', NULL, 'book 4');
INSERT INTO public.books VALUES (5, '2023-11-07 11:28:53.195269+01', '2023-11-07 11:28:53.195269+01', NULL, 'book 5');
INSERT INTO public.books VALUES (6, '2023-11-07 11:33:52.113544+01', '2023-11-07 11:33:52.113544+01', NULL, 'book 6');
INSERT INTO public.books VALUES (7, '2023-11-07 11:34:35.303766+01', '2023-11-07 11:34:35.303766+01', NULL, 'book 7');
INSERT INTO public.books VALUES (8, '2023-11-07 11:35:05.521035+01', '2023-11-07 11:35:05.521035+01', NULL, 'book 8');
INSERT INTO public.books VALUES (9, '2023-11-07 11:38:47.578776+01', '2023-11-07 11:38:47.578776+01', NULL, 'book 9');


--
-- TOC entry 3686 (class 0 OID 33939)
-- Dependencies: 217
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.genres VALUES (2, '2023-11-07 10:48:30.922907+01', '2023-11-07 10:48:30.922907+01', NULL, 'action');
INSERT INTO public.genres VALUES (3, '2023-11-07 10:48:40.723217+01', '2023-11-07 10:48:40.723217+01', NULL, 'fiction');
INSERT INTO public.genres VALUES (4, '2023-11-07 10:48:46.906012+01', '2023-11-07 10:48:46.906012+01', NULL, 'horror');
INSERT INTO public.genres VALUES (5, '2023-11-07 10:49:16.189228+01', '2023-11-07 10:49:16.189228+01', NULL, 'sience fiction');


--
-- TOC entry 3695 (class 0 OID 34006)
-- Dependencies: 226
-- Data for Name: subscribe_author; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.subscribe_author VALUES (3, 6);
INSERT INTO public.subscribe_author VALUES (3, 8);


--
-- TOC entry 3696 (class 0 OID 34021)
-- Dependencies: 227
-- Data for Name: subscribe_book; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3697 (class 0 OID 34036)
-- Dependencies: 228
-- Data for Name: subscribe_subscriber; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3688 (class 0 OID 33949)
-- Dependencies: 219
-- Data for Name: subscribers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.subscribers VALUES (2, '2023-11-07 11:08:59.918066+01', '2023-11-07 11:08:59.918066+01', NULL, 's1@mail.com', 's1');
INSERT INTO public.subscribers VALUES (3, '2023-11-07 11:09:13.882288+01', '2023-11-07 11:09:13.882288+01', NULL, 's2@mail.com', 's2');
INSERT INTO public.subscribers VALUES (1, '2023-11-07 11:08:12.387026+01', '2023-11-07 11:08:28.399893+01', NULL, 'test1@mail.com', 'test');


--
-- TOC entry 3694 (class 0 OID 33999)
-- Dependencies: 225
-- Data for Name: subscribes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.subscribes VALUES (3, '2023-11-07 11:19:20.475007+01', '2023-11-07 11:19:20.475007+01', NULL, 1);


--
-- TOC entry 3709 (class 0 OID 0)
-- Dependencies: 214
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.authors_id_seq', 8, true);


--
-- TOC entry 3710 (class 0 OID 0)
-- Dependencies: 220
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.books_id_seq', 9, true);


--
-- TOC entry 3711 (class 0 OID 0)
-- Dependencies: 216
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genres_id_seq', 5, true);


--
-- TOC entry 3712 (class 0 OID 0)
-- Dependencies: 218
-- Name: subscribers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subscribers_id_seq', 3, true);


--
-- TOC entry 3713 (class 0 OID 0)
-- Dependencies: 224
-- Name: subscribes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subscribes_id_seq', 3, true);


--
-- TOC entry 3507 (class 2606 OID 33936)
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- TOC entry 3521 (class 2606 OID 33987)
-- Name: book_authors book_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT book_authors_pkey PRIMARY KEY (book_id, author_id);


--
-- TOC entry 3519 (class 2606 OID 33972)
-- Name: book_genres book_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.book_genres
    ADD CONSTRAINT book_genres_pkey PRIMARY KEY (book_id, genre_id);


--
-- TOC entry 3516 (class 2606 OID 33966)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- TOC entry 3510 (class 2606 OID 33946)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- TOC entry 3526 (class 2606 OID 34010)
-- Name: subscribe_author subscribe_author_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscribe_author
    ADD CONSTRAINT subscribe_author_pkey PRIMARY KEY (subscribe_id, author_id);


--
-- TOC entry 3528 (class 2606 OID 34025)
-- Name: subscribe_book subscribe_book_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscribe_book
    ADD CONSTRAINT subscribe_book_pkey PRIMARY KEY (subscribe_id, book_id);


--
-- TOC entry 3530 (class 2606 OID 34040)
-- Name: subscribe_subscriber subscribe_subscriber_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscribe_subscriber
    ADD CONSTRAINT subscribe_subscriber_pkey PRIMARY KEY (subscribe_id, subscriber_id);


--
-- TOC entry 3514 (class 2606 OID 33956)
-- Name: subscribers subscribers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (id);


--
-- TOC entry 3524 (class 2606 OID 34004)
-- Name: subscribes subscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscribes
    ADD CONSTRAINT subscribes_pkey PRIMARY KEY (id);


--
-- TOC entry 3508 (class 1259 OID 33937)
-- Name: idx_authors_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_authors_deleted_at ON public.authors USING btree (deleted_at);


--
-- TOC entry 3517 (class 1259 OID 33967)
-- Name: idx_books_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_books_deleted_at ON public.books USING btree (deleted_at);


--
-- TOC entry 3511 (class 1259 OID 33947)
-- Name: idx_genres_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_genres_deleted_at ON public.genres USING btree (deleted_at);


--
-- TOC entry 3512 (class 1259 OID 33957)
-- Name: idx_subscribers_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_subscribers_deleted_at ON public.subscribers USING btree (deleted_at);


--
-- TOC entry 3522 (class 1259 OID 34005)
-- Name: idx_subscribes_deleted_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_subscribes_deleted_at ON public.subscribes USING btree (deleted_at);


--
-- TOC entry 3533 (class 2606 OID 33993)
-- Name: book_authors fk_book_authors_author; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT fk_book_authors_author FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- TOC entry 3534 (class 2606 OID 33988)
-- Name: book_authors fk_book_authors_book; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT fk_book_authors_book FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- TOC entry 3531 (class 2606 OID 33973)
-- Name: book_genres fk_book_genres_book; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.book_genres
    ADD CONSTRAINT fk_book_genres_book FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- TOC entry 3532 (class 2606 OID 33978)
-- Name: book_genres fk_book_genres_genre; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.book_genres
    ADD CONSTRAINT fk_book_genres_genre FOREIGN KEY (genre_id) REFERENCES public.genres(id);


--
-- TOC entry 3535 (class 2606 OID 34016)
-- Name: subscribe_author fk_subscribe_author_author; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscribe_author
    ADD CONSTRAINT fk_subscribe_author_author FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- TOC entry 3536 (class 2606 OID 34011)
-- Name: subscribe_author fk_subscribe_author_subscribe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscribe_author
    ADD CONSTRAINT fk_subscribe_author_subscribe FOREIGN KEY (subscribe_id) REFERENCES public.subscribes(id);


--
-- TOC entry 3537 (class 2606 OID 34031)
-- Name: subscribe_book fk_subscribe_book_book; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscribe_book
    ADD CONSTRAINT fk_subscribe_book_book FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- TOC entry 3538 (class 2606 OID 34026)
-- Name: subscribe_book fk_subscribe_book_subscribe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscribe_book
    ADD CONSTRAINT fk_subscribe_book_subscribe FOREIGN KEY (subscribe_id) REFERENCES public.subscribes(id);


--
-- TOC entry 3539 (class 2606 OID 34041)
-- Name: subscribe_subscriber fk_subscribe_subscriber_subscribe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscribe_subscriber
    ADD CONSTRAINT fk_subscribe_subscriber_subscribe FOREIGN KEY (subscribe_id) REFERENCES public.subscribes(id);


--
-- TOC entry 3540 (class 2606 OID 34046)
-- Name: subscribe_subscriber fk_subscribe_subscriber_subscriber; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscribe_subscriber
    ADD CONSTRAINT fk_subscribe_subscriber_subscriber FOREIGN KEY (subscriber_id) REFERENCES public.subscribers(id);


-- Completed on 2023-11-07 11:51:19 CET

--
-- PostgreSQL database dump complete
--

