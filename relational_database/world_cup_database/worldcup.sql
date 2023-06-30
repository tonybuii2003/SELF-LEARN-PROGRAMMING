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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(100) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (16, 2018, 'Final', 58, 59, 4, 2);
INSERT INTO public.games VALUES (17, 2018, 'Third Place', 60, 61, 2, 0);
INSERT INTO public.games VALUES (18, 2018, 'Semi-Final', 59, 61, 2, 1);
INSERT INTO public.games VALUES (19, 2018, 'Semi-Final', 58, 60, 1, 0);
INSERT INTO public.games VALUES (20, 2018, 'Quarter-Final', 59, 62, 3, 2);
INSERT INTO public.games VALUES (21, 2018, 'Quarter-Final', 61, 63, 2, 0);
INSERT INTO public.games VALUES (22, 2018, 'Quarter-Final', 60, 64, 2, 1);
INSERT INTO public.games VALUES (23, 2018, 'Quarter-Final', 58, 65, 2, 0);
INSERT INTO public.games VALUES (24, 2018, 'Eighth-Final', 61, 66, 2, 1);
INSERT INTO public.games VALUES (25, 2018, 'Eighth-Final', 63, 67, 1, 0);
INSERT INTO public.games VALUES (26, 2018, 'Eighth-Final', 60, 68, 3, 2);
INSERT INTO public.games VALUES (27, 2018, 'Eighth-Final', 64, 69, 2, 0);
INSERT INTO public.games VALUES (28, 2018, 'Eighth-Final', 59, 70, 2, 1);
INSERT INTO public.games VALUES (29, 2018, 'Eighth-Final', 62, 71, 2, 1);
INSERT INTO public.games VALUES (30, 2018, 'Eighth-Final', 65, 72, 2, 1);
INSERT INTO public.games VALUES (31, 2018, 'Eighth-Final', 58, 73, 4, 3);
INSERT INTO public.games VALUES (32, 2014, 'Final', 74, 73, 1, 0);
INSERT INTO public.games VALUES (33, 2014, 'Third Place', 75, 64, 3, 0);
INSERT INTO public.games VALUES (34, 2014, 'Semi-Final', 73, 75, 1, 0);
INSERT INTO public.games VALUES (35, 2014, 'Semi-Final', 74, 64, 7, 1);
INSERT INTO public.games VALUES (36, 2014, 'Quarter-Final', 75, 76, 1, 0);
INSERT INTO public.games VALUES (37, 2014, 'Quarter-Final', 73, 60, 1, 0);
INSERT INTO public.games VALUES (38, 2014, 'Quarter-Final', 64, 66, 2, 1);
INSERT INTO public.games VALUES (39, 2014, 'Quarter-Final', 74, 58, 1, 0);
INSERT INTO public.games VALUES (40, 2014, 'Eighth-Final', 64, 77, 2, 1);
INSERT INTO public.games VALUES (41, 2014, 'Eighth-Final', 66, 65, 2, 0);
INSERT INTO public.games VALUES (42, 2014, 'Eighth-Final', 58, 78, 2, 0);
INSERT INTO public.games VALUES (43, 2014, 'Eighth-Final', 74, 79, 2, 1);
INSERT INTO public.games VALUES (44, 2014, 'Eighth-Final', 75, 69, 2, 1);
INSERT INTO public.games VALUES (45, 2014, 'Eighth-Final', 76, 80, 2, 1);
INSERT INTO public.games VALUES (46, 2014, 'Eighth-Final', 73, 67, 1, 0);
INSERT INTO public.games VALUES (47, 2014, 'Eighth-Final', 60, 81, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (58, 'France');
INSERT INTO public.teams VALUES (59, 'Croatia');
INSERT INTO public.teams VALUES (60, 'Belgium');
INSERT INTO public.teams VALUES (61, 'England');
INSERT INTO public.teams VALUES (62, 'Russia');
INSERT INTO public.teams VALUES (63, 'Sweden');
INSERT INTO public.teams VALUES (64, 'Brazil');
INSERT INTO public.teams VALUES (65, 'Uruguay');
INSERT INTO public.teams VALUES (66, 'Colombia');
INSERT INTO public.teams VALUES (67, 'Switzerland');
INSERT INTO public.teams VALUES (68, 'Japan');
INSERT INTO public.teams VALUES (69, 'Mexico');
INSERT INTO public.teams VALUES (70, 'Denmark');
INSERT INTO public.teams VALUES (71, 'Spain');
INSERT INTO public.teams VALUES (72, 'Portugal');
INSERT INTO public.teams VALUES (73, 'Argentina');
INSERT INTO public.teams VALUES (74, 'Germany');
INSERT INTO public.teams VALUES (75, 'Netherlands');
INSERT INTO public.teams VALUES (76, 'Costa Rica');
INSERT INTO public.teams VALUES (77, 'Chile');
INSERT INTO public.teams VALUES (78, 'Nigeria');
INSERT INTO public.teams VALUES (79, 'Algeria');
INSERT INTO public.teams VALUES (80, 'Greece');
INSERT INTO public.teams VALUES (81, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 47, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 81, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

