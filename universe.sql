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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60),
    galaxy_types character varying(60),
    discovered_year integer NOT NULL,
    discription text NOT NULL
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
    name character varying(60),
    is_spherical boolean,
    closest_planet character varying(60) NOT NULL,
    distance_from_earth numeric,
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
    name character varying(60),
    planet_types character varying(60),
    distance_from_earth integer,
    has_life boolean NOT NULL,
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
-- Name: solarjunction; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solarjunction (
    star_id numeric NOT NULL,
    galaxy_id numeric,
    planet_id numeric NOT NULL,
    moon_id numeric,
    solarjunction_id integer NOT NULL,
    name character varying(60)
);


ALTER TABLE public.solarjunction OWNER TO freecodecamp;

--
-- Name: solarjunction_solarjunction_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solarjunction_solarjunction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solarjunction_solarjunction_id_seq OWNER TO freecodecamp;

--
-- Name: solarjunction_solarjunction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solarjunction_solarjunction_id_seq OWNED BY public.solarjunction.solarjunction_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60),
    star_types character varying(60) NOT NULL,
    distance_from_earth numeric,
    discovered_year integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

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
-- Name: solarjunction solarjunction_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solarjunction ALTER COLUMN solarjunction_id SET DEFAULT nextval('public.solarjunction_solarjunction_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'andromeda', 'spiral', 1612, 'The Andromeda Galaxy is also of particular importance to astronomers since it bears a lot of similarities to our own galaxy');
INSERT INTO public.galaxy VALUES (2, 'milky way', 'spiral', 1610, 'The Milky Way is the galaxy that includes our solar system');
INSERT INTO public.galaxy VALUES (3, 'Phonix Dwarf', 'irregular', 1976, 'The phonix dwarf is a galaxy discovered as a mistaken global cluster.');
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 'Barred spiral', 1779, 'The phonix dwarf is a galaxy discovered as a mistaken global cluster.');
INSERT INTO public.galaxy VALUES (6, 'GN-z11', 'red shift', 2015, 'GN-Z11 was the oldest and most distant known galaxy.');
INSERT INTO public.galaxy VALUES (7, 'pinwheel', 'spiral', 1781, 'Located 25 million light years away from sun.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', true, 'Earth', 3844000, 1);
INSERT INTO public.moon VALUES (2, 'phobos', false, 'Mars', 9378, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 'Mars', 23459, 4);
INSERT INTO public.moon VALUES (4, 'Europa', true, 'Jupyter', 1383, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', true, 'Jupyter', 628.3, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', true, 'Jupyter', 628300000, 5);
INSERT INTO public.moon VALUES (7, 'Io', true, 'Jupyter', 365, 5);
INSERT INTO public.moon VALUES (8, 'Cyllene', true, 'Jupyter', 45554, 5);
INSERT INTO public.moon VALUES (9, 'Thebe', false, 'Jupyter', 365, 5);
INSERT INTO public.moon VALUES (10, 'Titan', true, 'Saturn', 759220, 8);
INSERT INTO public.moon VALUES (11, 'Enceladus', true, 'Saturn', 84000, 5);
INSERT INTO public.moon VALUES (12, 'mimas', true, 'Saturn', 790, 8);
INSERT INTO public.moon VALUES (13, 'dione', true, 'Saturn', 84000, 5);
INSERT INTO public.moon VALUES (14, 'miranda', true, 'uranus', 18, 6);
INSERT INTO public.moon VALUES (15, 'Oberon', true, 'Uranus', 84000, 6);
INSERT INTO public.moon VALUES (16, 'Titania', true, 'uranus', 18, 6);
INSERT INTO public.moon VALUES (17, 'Umbriel', true, 'Uranus', 84000, 6);
INSERT INTO public.moon VALUES (18, 'triton', true, 'Neptune', 120, 7);
INSERT INTO public.moon VALUES (19, 'hippcomp', true, 'neptune', 840, 7);
INSERT INTO public.moon VALUES (20, 'Charon', true, 'pluto', 120, 12);
INSERT INTO public.moon VALUES (21, 'nix', false, 'pluto', 828, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'terrestrial planet', 0, true, 1);
INSERT INTO public.planet VALUES (2, 'mercury', 'rocky planet', 187, false, 1);
INSERT INTO public.planet VALUES (3, 'venus', 'terrestrial', 257, false, 1);
INSERT INTO public.planet VALUES (4, 'mars', 'rocky planet', 102, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupyter', 'gas gaint', 605, false, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 'ice gaint', 3, false, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 'ice gaint', 4, false, 1);
INSERT INTO public.planet VALUES (8, 'Saturn', 'gas gaint', 1, false, 1);
INSERT INTO public.planet VALUES (9, 'kepler62f', 'exoplanet', 1207, false, NULL);
INSERT INTO public.planet VALUES (10, 'kepler-22b', 'exoplanet', 587, false, NULL);
INSERT INTO public.planet VALUES (11, 'kepler-69c', 'exoplanet', 2707, false, NULL);
INSERT INTO public.planet VALUES (12, 'pluto', 'Dwarf planet', 5, false, 1);


--
-- Data for Name: solarjunction; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solarjunction VALUES (2, 2, 1, NULL, 1, NULL);
INSERT INTO public.solarjunction VALUES (2, 2, 2, NULL, 2, NULL);
INSERT INTO public.solarjunction VALUES (2, 2, 3, NULL, 3, NULL);
INSERT INTO public.solarjunction VALUES (2, 2, 4, NULL, 4, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'SUN', 'G2V', 149.98, 450, 2);
INSERT INTO public.star VALUES (2, 'proxima centuri', 'm5.5ve', 4.246, 1915, 2);
INSERT INTO public.star VALUES (3, 'Tau Ceti', 'G8.5V', 11.9, 2012, 2);
INSERT INTO public.star VALUES (4, 'Aldebaran', 'LB', 65.23, 1782, 2);
INSERT INTO public.star VALUES (5, 'lalande 21185', 'MV', 8.307, 1801, 2);
INSERT INTO public.star VALUES (6, 'Absolutno', 'MV', 32.616, 1990, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: solarjunction_solarjunction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solarjunction_solarjunction_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: solarjunction solarjunction_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solarjunction
    ADD CONSTRAINT solarjunction_moon_id_key UNIQUE (moon_id);


--
-- Name: solarjunction solarjunction_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solarjunction
    ADD CONSTRAINT solarjunction_pkey PRIMARY KEY (solarjunction_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

