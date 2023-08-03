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
    name character varying(255) NOT NULL,
    diameter integer,
    distance integer,
    constellation character varying(255)
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
    name character varying(255),
    planet_id integer NOT NULL,
    radius numeric,
    year_discovered integer
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(255),
    galaxy_id integer NOT NULL,
    constellation character varying(255),
    type character varying(255)
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255),
    radius numeric,
    is_habitable boolean,
    star_id integer NOT NULL
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
    name character varying(255),
    comment text,
    has_planetary_system boolean,
    galaxy_id integer NOT NULL
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
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 0, 'Sagittarius');
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 14000, 158000, 'Dorado/Mensa');
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 220000, 2500000, 'Andromeda');
INSERT INTO public.galaxy VALUES (4, 'Pinwheel Galaxy', 170000, 20870000, 'Ursa Major');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 50000, 29350000, 'Virgo');
INSERT INTO public.galaxy VALUES (6, 'Tadpole Galaxy', 280000, 420000000, 'Draco');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1738, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 6, 11.267, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, 6.2, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 7, 1821.6, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 7, 1560.8, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 7, 2634.1, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 7, 2410.3, 1610);
INSERT INTO public.moon VALUES (8, 'Amalthea', 7, 83.5, 1892);
INSERT INTO public.moon VALUES (9, 'Mimas', 8, 198.2, 1789);
INSERT INTO public.moon VALUES (10, 'Enceladus', 8, 252.1, 1789);
INSERT INTO public.moon VALUES (11, 'Tethys', 8, 533.1, 1684);
INSERT INTO public.moon VALUES (12, 'Dione', 8, 561.4, 1684);
INSERT INTO public.moon VALUES (13, 'Ariel', 9, 578.9, 1851);
INSERT INTO public.moon VALUES (14, 'Umbriel', 9, 584.7, 1851);
INSERT INTO public.moon VALUES (15, 'Titania', 9, 788.9, 1787);
INSERT INTO public.moon VALUES (16, 'Oberon', 9, 761.4, 1787);
INSERT INTO public.moon VALUES (17, 'Miranda', 9, 235.8, 1948);
INSERT INTO public.moon VALUES (18, 'Triton', 10, 1353.4, 1846);
INSERT INTO public.moon VALUES (19, 'Nereid', 10, 170, 1949);
INSERT INTO public.moon VALUES (20, 'Naiad', 10, 33, 1989);
INSERT INTO public.moon VALUES (21, 'Thalassa', 10, 41, 1989);
INSERT INTO public.moon VALUES (22, 'Despina', 10, 78, 1989);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (2, 'Helix Nebula', 1, 'Aquarius', 'Planetary Nebula');
INSERT INTO public.nebula VALUES (3, 'Eagle Nebula', 1, 'Serpens', 'Emission Nebula');
INSERT INTO public.nebula VALUES (1, 'Orion Nebula', 1, 'Orion', 'Emission Nebula');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 3959, true, 1);
INSERT INTO public.planet VALUES (4, 'Mercury', 1516, false, 1);
INSERT INTO public.planet VALUES (5, 'Venus', 3760, false, 1);
INSERT INTO public.planet VALUES (6, 'Mars', 2106, false, 1);
INSERT INTO public.planet VALUES (7, 'Jupiter', 43441, false, 1);
INSERT INTO public.planet VALUES (8, 'Saturn', 36184, false, 1);
INSERT INTO public.planet VALUES (9, 'Uranus', 15759, false, 1);
INSERT INTO public.planet VALUES (10, 'Neptune', 15299, false, 1);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 7454.1, false, 3);
INSERT INTO public.planet VALUES (12, 'Gliese 667 Cc', 9811.3, false, 4);
INSERT INTO public.planet VALUES (13, 'Kepler-22b', 15290, false, 5);
INSERT INTO public.planet VALUES (14, 'Proxima Centauri b', 107280, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Betelgeuse is a red supergiant star of spectral type M1-2 and one of the largest visible to the naked eye. It is usually the tenth-brightest star in the night sky and, after Rigel, the second-brightest in the constellation of Orion.', false, 1);
INSERT INTO public.star VALUES (1, 'Sol', NULL, true, 1);
INSERT INTO public.star VALUES (3, 'Kepler-186', 'Kepler-186 is a main-sequence M1-type dwarf star, located 178.5 parsecs away in the constellation of Cygnus. The star is slightly cooler than the sun, with roughly half its metallicity. It is known to have five planets, including the first Earth-sized world discovered in the habitable zone: Kepler-186f. The star hosts four other planets discovered so far, though they all orbit interior to the habitable zone.', true, 1);
INSERT INTO public.star VALUES (4, 'Gliese 667 C', 'Gliese 667 C is the smallest star in the system, with only around 33% of the mass of the Sun and 34% of the Sun`s radius, orbiting approximately 230 AU from the Gliese 667 AB pair. It is a red dwarf with a stellar classification of M1.5. This star is radiating only 1.4% of the Sun`s luminosity from its outer atmosphere at a relatively cool effective temperature of 3,440 K.', true, 1);
INSERT INTO public.star VALUES (5, 'Kepler-22', 'Kepler-22 is a Sun-like star in the northern constellation of Cygnus, the swan, that is orbited by a planet found to be unequivocally within the star`s habitable zone. It is located at the celestial coordinates: Right Ascension 19h 16m 52.2s, Declination +47° 53′ 3.9″. With an apparent visual magnitude of 11.7, this star is too faint to be seen with the naked eye.', true, 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Proxima Centauri is a small, low-mass star located 4.2465 light-years (1.3020 pc) away from the Sun in the southern constellation of Centaurus. Its Latin name means the nearest [star] of Centaurus. It was discovered in 1915 by Robert Innes and is the nearest-known star to the Sun.', true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key1 UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: nebula nebula_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

