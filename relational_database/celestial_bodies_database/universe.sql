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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: age; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.age (
    age_id integer NOT NULL,
    larger_than_age_billion integer NOT NULL,
    note text,
    name character varying(10)
);


ALTER TABLE public.age OWNER TO freecodecamp;

--
-- Name: age_distribution_age_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.age_distribution_age_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.age_distribution_age_id_seq OWNER TO freecodecamp;

--
-- Name: age_distribution_age_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.age_distribution_age_id_seq OWNED BY public.age.age_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_count_in_billion integer,
    size_in_light_years integer,
    thinkness_in_light_years integer,
    year_of_existence_in_billions numeric(3,1)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    weight_in_kg character varying(30),
    has_lives boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    weight_in_kg character varying(30),
    has_moon boolean,
    has_lives boolean,
    signal_to_planets text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    weight_in_kg character varying(30),
    surface_temp_kelvin integer,
    galaxy_id integer,
    year_of_existence_in_billion_years numeric(4,3)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_ages; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_ages (
    star_id integer NOT NULL,
    age_id integer NOT NULL,
    star_ages_id integer NOT NULL,
    name character varying(10)
);


ALTER TABLE public.star_ages OWNER TO freecodecamp;

--
-- Name: star_ages_star_ages_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_ages_star_ages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_ages_star_ages_id_seq OWNER TO freecodecamp;

--
-- Name: star_ages_star_ages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_ages_star_ages_id_seq OWNED BY public.star_ages.star_ages_id;


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: age age_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.age ALTER COLUMN age_id SET DEFAULT nextval('public.age_distribution_age_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_ages star_ages_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_ages ALTER COLUMN star_ages_id SET DEFAULT nextval('public.star_ages_star_ages_id_seq'::regclass);


--
-- Data for Name: age; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.age VALUES (1, 5, NULL, NULL);
INSERT INTO public.age VALUES (2, 10, NULL, NULL);
INSERT INTO public.age VALUES (3, 15, NULL, NULL);
INSERT INTO public.age VALUES (4, 0, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100, 100000, 12000, 13.6);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40, 60000, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000, 200000, 1000, 10.0);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', NULL, 76900, NULL, 0.4);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', NULL, 94900, NULL, 13.3);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', NULL, 60000, NULL, 13.3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth''s Moon', '7.3 * 10^22', false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, false, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', NULL, false, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', NULL, false, 5);
INSERT INTO public.moon VALUES (6, 'Europa', NULL, false, 5);
INSERT INTO public.moon VALUES (7, 'Titan', NULL, false, 6);
INSERT INTO public.moon VALUES (8, 'Enceladus', NULL, false, 6);
INSERT INTO public.moon VALUES (9, 'Mimas', NULL, false, 6);
INSERT INTO public.moon VALUES (10, 'Titania', NULL, false, 7);
INSERT INTO public.moon VALUES (11, 'Oberon', NULL, false, 7);
INSERT INTO public.moon VALUES (12, 'Miranda', NULL, false, 7);
INSERT INTO public.moon VALUES (13, 'Triton', NULL, false, 8);
INSERT INTO public.moon VALUES (14, 'Nereid', NULL, false, 8);
INSERT INTO public.moon VALUES (15, 'Io', NULL, false, 5);
INSERT INTO public.moon VALUES (16, 'Amalthea', NULL, false, 5);
INSERT INTO public.moon VALUES (17, 'Himalia', NULL, false, 5);
INSERT INTO public.moon VALUES (18, 'Elara', NULL, false, 5);
INSERT INTO public.moon VALUES (19, 'Pasiphae', NULL, false, 5);
INSERT INTO public.moon VALUES (20, 'Sinope', NULL, false, 5);
INSERT INTO public.moon VALUES (21, 'Lysithea', NULL, false, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'The Earth', '5.792 * 10^24', true, true, 'We need to cold the Earth', 1);
INSERT INTO public.planet VALUES (2, 'Mercury', '3.3 * 10^23', false, false, '"Of all planets, Mercury is the one most like moon"- Patrick Symmes', 1);
INSERT INTO public.planet VALUES (3, 'Venus', '4.87 * 10^24', false, false, '"Venus, thou shining star, the jewel of the sky" - John Dryden', 1);
INSERT INTO public.planet VALUES (4, 'Mars', '6.39 * 10^23', true, false, '"Mars is there, waiting to be reached" -  Buzz Aldrin', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', '1.89 * 10^27', true, false, '"Jupiter is like a whole miniature solar system" - Carolyn Porco', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', '5.68 * 10^26', false, false, '"Saturn, the jewel of the solar system." - Alan Stern', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', '8.86 * 10^25', true, false, '"Uranus is a geometric planet" -  Jean-Pierre Lebreton', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', '1.02 * 10^26', true, false, '"Neptune, the windy jewel of the outer solar system" - Mark Showalter', 1);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1b', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1c', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1e', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1f', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1g', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (16, 'TRAPPIST-1h', NULL, NULL, NULL, NULL, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', '1.989 * 10^30', 5772, 1, 4.603);
INSERT INTO public.star VALUES (3, 'Alpha Certauri', '2.188 * 10^30', 5778, 1, NULL);
INSERT INTO public.star VALUES (4, 'Kepler-186', '1.082 * 10^30', 3755, 1, 4.000);
INSERT INTO public.star VALUES (5, 'HD 10180', '2.109 * 10^30', 5911, 1, 7.300);
INSERT INTO public.star VALUES (6, 'TRAPPIST-1', '1.77 * 10^29', 2550, 1, 7.605);
INSERT INTO public.star VALUES (7, 'WASP-47', '2.203 * 10^30', 5576, 1, 6.500);


--
-- Data for Name: star_ages; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_ages VALUES (1, 4, 1, NULL);
INSERT INTO public.star_ages VALUES (4, 4, 2, NULL);
INSERT INTO public.star_ages VALUES (5, 2, 3, NULL);
INSERT INTO public.star_ages VALUES (6, 2, 4, NULL);
INSERT INTO public.star_ages VALUES (7, 2, 5, NULL);


--
-- Name: age_distribution_age_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.age_distribution_age_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_ages_star_ages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_ages_star_ages_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: age ages_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.age
    ADD CONSTRAINT ages_pkey PRIMARY KEY (age_id);


--
-- Name: galaxy galaxi_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxi_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_unique_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_unique_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star_ages star_ages_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_ages
    ADD CONSTRAINT star_ages_pkey PRIMARY KEY (star_ages_id);


--
-- Name: star star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_key UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: age unique_age; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.age
    ADD CONSTRAINT unique_age UNIQUE (age_id);


--
-- Name: star_ages unique_star_ages_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_ages
    ADD CONSTRAINT unique_star_ages_id UNIQUE (star_ages_id);


--
-- Name: star m_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT m_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star_ages planet_ages_age_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_ages
    ADD CONSTRAINT planet_ages_age_id_fkey FOREIGN KEY (age_id) REFERENCES public.age(age_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star_ages star_ages_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_ages
    ADD CONSTRAINT star_ages_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

