--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    tries integer NOT NULL,
    player_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    username character varying(25) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 7, 253);
INSERT INTO public.games VALUES (2, 195, 256);
INSERT INTO public.games VALUES (3, 712, 256);
INSERT INTO public.games VALUES (4, 714, 257);
INSERT INTO public.games VALUES (5, 648, 257);
INSERT INTO public.games VALUES (6, 572, 256);
INSERT INTO public.games VALUES (7, 369, 256);
INSERT INTO public.games VALUES (8, 424, 256);
INSERT INTO public.games VALUES (9, 412, 258);
INSERT INTO public.games VALUES (10, 841, 258);
INSERT INTO public.games VALUES (11, 102, 259);
INSERT INTO public.games VALUES (12, 670, 259);
INSERT INTO public.games VALUES (13, 144, 258);
INSERT INTO public.games VALUES (14, 453, 258);
INSERT INTO public.games VALUES (15, 868, 258);
INSERT INTO public.games VALUES (16, 659, 260);
INSERT INTO public.games VALUES (17, 275, 260);
INSERT INTO public.games VALUES (18, 176, 261);
INSERT INTO public.games VALUES (19, 410, 261);
INSERT INTO public.games VALUES (20, 167, 260);
INSERT INTO public.games VALUES (21, 782, 260);
INSERT INTO public.games VALUES (22, 604, 260);
INSERT INTO public.games VALUES (23, 918, 264);
INSERT INTO public.games VALUES (24, 626, 264);
INSERT INTO public.games VALUES (25, 581, 265);
INSERT INTO public.games VALUES (26, 744, 265);
INSERT INTO public.games VALUES (27, 852, 264);
INSERT INTO public.games VALUES (28, 79, 264);
INSERT INTO public.games VALUES (29, 672, 264);
INSERT INTO public.games VALUES (30, 184, 266);
INSERT INTO public.games VALUES (31, 839, 266);
INSERT INTO public.games VALUES (32, 182, 267);
INSERT INTO public.games VALUES (33, 461, 267);
INSERT INTO public.games VALUES (34, 427, 266);
INSERT INTO public.games VALUES (35, 231, 266);
INSERT INTO public.games VALUES (36, 661, 266);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (232, 'Tony');
INSERT INTO public.players VALUES (233, 'user_1689934949914');
INSERT INTO public.players VALUES (234, 'user_1689934949913');
INSERT INTO public.players VALUES (235, 'user_1689934981396');
INSERT INTO public.players VALUES (236, 'user_1689934981395');
INSERT INTO public.players VALUES (237, 'user_1689934985153');
INSERT INTO public.players VALUES (238, 'user_1689934985152');
INSERT INTO public.players VALUES (239, 'user_1689935125423');
INSERT INTO public.players VALUES (240, 'user_1689935125422');
INSERT INTO public.players VALUES (241, 'user_1689935131045');
INSERT INTO public.players VALUES (242, 'user_1689935131044');
INSERT INTO public.players VALUES (243, 'user_1689935243632');
INSERT INTO public.players VALUES (244, 'user_1689935243631');
INSERT INTO public.players VALUES (245, 'user_1689935355258');
INSERT INTO public.players VALUES (246, 'user_1689935355257');
INSERT INTO public.players VALUES (247, 'user_1689935359926');
INSERT INTO public.players VALUES (248, 'user_1689935359925');
INSERT INTO public.players VALUES (249, 'user_1689935437415');
INSERT INTO public.players VALUES (250, 'user_1689935437414');
INSERT INTO public.players VALUES (251, 'user_1689936854421');
INSERT INTO public.players VALUES (252, 'user_1689936854420');
INSERT INTO public.players VALUES (253, 'Hao');
INSERT INTO public.players VALUES (254, 'user_1689936924643');
INSERT INTO public.players VALUES (255, 'user_1689936924642');
INSERT INTO public.players VALUES (256, 'user_1689937241374');
INSERT INTO public.players VALUES (257, 'user_1689937241373');
INSERT INTO public.players VALUES (258, 'user_1689937340818');
INSERT INTO public.players VALUES (259, 'user_1689937340817');
INSERT INTO public.players VALUES (260, 'user_1689937661844');
INSERT INTO public.players VALUES (261, 'user_1689937661843');
INSERT INTO public.players VALUES (262, 'user_1689937906742');
INSERT INTO public.players VALUES (263, 'user_1689937906741');
INSERT INTO public.players VALUES (264, 'user_1689937979492');
INSERT INTO public.players VALUES (265, 'user_1689937979491');
INSERT INTO public.players VALUES (266, 'user_1689938205550');
INSERT INTO public.players VALUES (267, 'user_1689938205549');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 36, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 267, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: games games_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- PostgreSQL database dump complete
--

