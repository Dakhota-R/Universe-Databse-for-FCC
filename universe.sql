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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    type character varying(30),
    radius_in_ly integer,
    age_in_bn_yrs integer,
    star_count_in_bns integer,
    additional_notes text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_cluster (
    name character varying(30) NOT NULL,
    galaxy_cluster_id integer NOT NULL,
    distance_in_mpc integer
);


ALTER TABLE public.galaxy_cluster OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_cluster_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_cluster_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_cluster_cluster_id_seq OWNED BY public.galaxy_cluster.galaxy_cluster_id;


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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    type character varying(30),
    radius_in_miles integer,
    age_in_bn_yrs numeric(3,1),
    life_possible boolean,
    additional_notes text,
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    type character varying(30),
    radius_in_miles integer,
    age_in_bn_yrs numeric(3,1),
    moon_count integer,
    life_possible boolean,
    additional_notes text,
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    type character varying(30),
    radius_in_miles integer,
    age_in_bn_yrs numeric(3,1),
    planet_count integer,
    additional_notes text,
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
-- Name: galaxy_cluster galaxy_cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster ALTER COLUMN galaxy_cluster_id SET DEFAULT nextval('public.galaxy_cluster_cluster_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'Spiral', 52850, 14, 400, NULL);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 'Spiral', 110000, 10, 1000, NULL);
INSERT INTO public.galaxy VALUES ('Canis Major', 3, 'Irregular', 5000, 0, 1, NULL);
INSERT INTO public.galaxy VALUES ('Draco II', 4, 'Satellite Dwarf', 600, 10, 0, NULL);
INSERT INTO public.galaxy VALUES ('Triangulum', 5, 'Spiral', NULL, 0, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Centaurus A', 6, 'Elliptical', NULL, 13, NULL, NULL);


--
-- Data for Name: galaxy_cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_cluster VALUES ('Norma Cluster', 1, 68);
INSERT INTO public.galaxy_cluster VALUES ('Coma Cluster', 2, 1);
INSERT INTO public.galaxy_cluster VALUES ('Globular Cluster', 3, 13);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, NULL, NULL, NULL, false, NULL, 1);
INSERT INTO public.moon VALUES ('Phobos', 2, NULL, NULL, NULL, false, NULL, 4);
INSERT INTO public.moon VALUES ('Deimos', 3, NULL, NULL, NULL, false, NULL, 4);
INSERT INTO public.moon VALUES ('Europa', 4, NULL, NULL, NULL, true, NULL, 5);
INSERT INTO public.moon VALUES ('Ganymede', 5, NULL, NULL, NULL, false, NULL, 5);
INSERT INTO public.moon VALUES ('Io', 6, NULL, NULL, NULL, false, NULL, 5);
INSERT INTO public.moon VALUES ('Callisto', 7, NULL, NULL, NULL, false, NULL, 5);
INSERT INTO public.moon VALUES ('Kallichore', 8, NULL, NULL, NULL, false, NULL, 5);
INSERT INTO public.moon VALUES ('Enceladus', 9, NULL, NULL, NULL, true, NULL, 6);
INSERT INTO public.moon VALUES ('Titan', 10, NULL, NULL, NULL, false, NULL, 6);
INSERT INTO public.moon VALUES ('Mimas', 11, NULL, NULL, NULL, false, NULL, 6);
INSERT INTO public.moon VALUES ('Hyperion', 12, NULL, NULL, NULL, false, NULL, 6);
INSERT INTO public.moon VALUES ('Tethys', 13, NULL, NULL, NULL, false, NULL, 6);
INSERT INTO public.moon VALUES ('Lapetus', 14, NULL, NULL, NULL, false, NULL, 6);
INSERT INTO public.moon VALUES ('Titania', 15, NULL, NULL, NULL, true, NULL, 7);
INSERT INTO public.moon VALUES ('Oberon', 16, NULL, NULL, NULL, true, NULL, 7);
INSERT INTO public.moon VALUES ('Umbriel', 17, NULL, NULL, NULL, false, NULL, 7);
INSERT INTO public.moon VALUES ('Ariel', 18, NULL, NULL, NULL, false, NULL, 7);
INSERT INTO public.moon VALUES ('Miranda', 19, NULL, NULL, NULL, false, NULL, 7);
INSERT INTO public.moon VALUES ('Puck', 20, NULL, NULL, NULL, false, NULL, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, NULL, NULL, NULL, NULL, true, NULL, 1);
INSERT INTO public.planet VALUES ('Mercury', 2, NULL, NULL, NULL, NULL, false, NULL, 1);
INSERT INTO public.planet VALUES ('Venus', 3, NULL, NULL, NULL, NULL, false, NULL, 1);
INSERT INTO public.planet VALUES ('Mars', 4, NULL, NULL, NULL, NULL, false, NULL, 1);
INSERT INTO public.planet VALUES ('Jupiter', 5, NULL, NULL, NULL, NULL, false, NULL, 1);
INSERT INTO public.planet VALUES ('Saturn', 6, NULL, NULL, NULL, NULL, false, NULL, 1);
INSERT INTO public.planet VALUES ('Uranus', 7, NULL, NULL, NULL, NULL, false, NULL, 1);
INSERT INTO public.planet VALUES ('Neptune', 8, NULL, NULL, NULL, NULL, false, NULL, 1);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 9, NULL, NULL, NULL, NULL, false, NULL, 2);
INSERT INTO public.planet VALUES ('Proxima Centauri d', 10, NULL, NULL, NULL, NULL, true, NULL, 2);
INSERT INTO public.planet VALUES ('Proxima Centauri c', 11, NULL, NULL, NULL, NULL, false, NULL, 2);
INSERT INTO public.planet VALUES ('Saffar', 12, NULL, NULL, NULL, NULL, false, NULL, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 'Yellow Dwarf', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES ('Proxima Centauri', 2, 'Red Dwarf', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES ('Xi Andromedae', 3, 'Red Clump Giant', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES ('Gamma Andromedae', 4, 'Bright Giant', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES ('Acrux', 6, 'Binary', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES ('PSR 1257+12', 7, 'Pulsar', NULL, NULL, NULL, NULL, 1);


--
-- Name: galaxy_cluster_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_cluster_cluster_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy_cluster galaxy_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_pkey PRIMARY KEY (galaxy_cluster_id);


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
-- Name: galaxy_cluster unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

