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
-- Name: history; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.history (
    name character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.history OWNER TO freecodecamp;

--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.history VALUES ('user_1719406176044', 2, 294);
INSERT INTO public.history VALUES ('user_1719406176045', 5, 331);
INSERT INTO public.history VALUES ('user_1719406233359', 2, 103);
INSERT INTO public.history VALUES ('user_1719406233360', 5, 226);
INSERT INTO public.history VALUES ('Amos', 2, 10);
INSERT INTO public.history VALUES ('user_1719406401456', 2, 617);
INSERT INTO public.history VALUES ('user_1719406401457', 5, 13);


--
-- Name: history history_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_name_key UNIQUE (name);


--
-- PostgreSQL database dump complete
--

