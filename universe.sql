--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years character varying(10),
    galaxy_type_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    revolution_period_in_days integer,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    distance_from_earth_km numeric(13,2),
    star_id integer NOT NULL,
    has_satellites boolean,
    total_satellites integer DEFAULT 0,
    revolution_period_in_days integer,
    rotation_period_in_hours integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years character varying(10),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'andromeda_galaxy', 'Is a barred spiral galaxy and the nearest major galaxy to the Milky Way', '1x10^4', NULL);
INSERT INTO public.galaxy VALUES (1, 'milky_way', 'Is the galaxy that includes de the Solar System', '1,3x10^4', NULL);
INSERT INTO public.galaxy VALUES (4, 'small_magellanic_cloud', 'Is a dwarf galaxy near the Milky Way', '1,3x10^4', NULL);
INSERT INTO public.galaxy VALUES (3, 'large_magellanic_cloud', 'Is a spiral satellite galaxy of the Milky Way', '1,3x10^4', NULL);
INSERT INTO public.galaxy VALUES (5, 'triangulum_galaxy', 'Is a spiral galaxy and the third-largest member of the Local Group of galaxies', '1,1x10^4', NULL);
INSERT INTO public.galaxy VALUES (6, 'phoenix_cluster', 'Is a massive galaxy cluster located at southern constellation of Phoenix', 'unknown', NULL);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'spiral', 'Spiral galaxies are surrounded by halos, mixtures of old stars, star clusters, and dark matter');
INSERT INTO public.galaxy_type VALUES (2, 'elliptical', 'Elliptical galaxies have shapes that range from completely round to oval');
INSERT INTO public.galaxy_type VALUES (3, 'lenticular', 'Lenticular galaxies are a kind of cross between spirals and ellipticals');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 3, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'deimos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'phobos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'io', 5, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'europa', 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'ganymede', 5, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'callisto', 5, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'iapetus', 6, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'rhea', 6, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'dione', 6, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'tethys', 6, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'mymas', 6, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'titan', 6, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'titania', 7, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'oberon', 7, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'umbriel', 7, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'ariel', 7, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'miranda', 7, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'enceladus', 6, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'triton', 8, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', 'The closest planet to the sun and the smallest of solar system', false, 77700000.00, 1, false, 0, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'venus', 'A planet drier than Earth and ninety times dense atmosphere', false, 38000000.00, 1, false, 0, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'earth', 'The only planet with life and geological activity known in universe ', true, 0.00, 1, true, 1, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'mars', 'Has an atmosphere of mostly co² and 0,6% pressure of Earth', false, 225000000.00, 1, true, 2, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'jupiter', 'The gaseous planet composed of hydrogen and helium', false, 778000000.00, 1, true, 95, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'saturn', 'Similar to Jupiter but easily identified by its ring system', false, 1350000000.00, 1, true, 145, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'uranus', 'Has the lowest mass of the Jovian planets (14 Earths)', false, 3200000000.00, 1, true, 27, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'neptune', 'The last planet of the solar system with a mass of 17 Earths', false, 4500000000.00, 1, true, 14, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'pluto', 'One of the dwarf planets outside of the solar system', false, 7500000000.00, 1, true, 5, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'makemake', 'Although smaller than Pluto, is the largest in Kuiper belt', false, 7850000000.00, 1, true, 1, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'haumea', 'Uniquely among the dwarf planets, Haumea possesses a ring system', false, 7360000000.00, 1, true, 2, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'quaoa', 'Is the second-largest known object in the classical Kuiper belt', false, 6500000000.00, 1, true, 1, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 'Is a yellow dwarf star and the heart of our solar system', '4,6x10^3', 1);
INSERT INTO public.star VALUES (2, 'antares', 'Is the brightest star in the constellation of Scorpius', '1,1x10', 1);
INSERT INTO public.star VALUES (3, 'canopus', 'Is the brightest star in the southern constellation of Carina and the second brightest in night sky', '4x10', 1);
INSERT INTO public.star VALUES (4, 'alphard', 'Is the brightest star in constellation of Hydra', '4,2x10^2', 1);
INSERT INTO public.star VALUES (5, 'regulus', 'Is the brightest in constellation Leon', '5x10', 1);
INSERT INTO public.star VALUES (6, 'sirius', 'The brightest star in night sky and a binary type star', '2,4x10^2', 1);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 3, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

