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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22),
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 1000
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1679851568680', 5, 220);
INSERT INTO public.users VALUES ('marjut', 1, 1000);
INSERT INTO public.users VALUES ('user_1679830207808', 1, 1000);
INSERT INTO public.users VALUES ('user_1679830207807', 1, 1000);
INSERT INTO public.users VALUES ('kuku', 1, 1000);
INSERT INTO public.users VALUES ('user_1679849978725', 1, 1000);
INSERT INTO public.users VALUES ('user_1679849978724', 1, 1000);
INSERT INTO public.users VALUES ('user_1679939054058', 5, 33);
INSERT INTO public.users VALUES ('', 1, 1000);
INSERT INTO public.users VALUES ('', 1, 1000);
INSERT INTO public.users VALUES ('', 1, 1000);
INSERT INTO public.users VALUES ('', 1, 1000);
INSERT INTO public.users VALUES ('keijo', 3, 5);
INSERT INTO public.users VALUES ('user_1679851795861', 2, 153);
INSERT INTO public.users VALUES ('user_1679851436548', 2, 476);
INSERT INTO public.users VALUES ('user_1679938934871', 2, 223);
INSERT INTO public.users VALUES ('user_1679851795862', 5, 32);
INSERT INTO public.users VALUES ('user_1679851436549', 5, 389);
INSERT INTO public.users VALUES ('ilka', 1, 1000);
INSERT INTO public.users VALUES ('user_1679939355813', 2, 403);
INSERT INTO public.users VALUES ('user_1679939132879', 2, 224);
INSERT INTO public.users VALUES ('user_1679851517381', 2, 21);
INSERT INTO public.users VALUES ('user_1679939633381', 2, 500);
INSERT INTO public.users VALUES ('user_1679938934872', 5, 23);
INSERT INTO public.users VALUES ('user_1679851517382', 5, 395);
INSERT INTO public.users VALUES ('user_1679852305214', 2, 157);
INSERT INTO public.users VALUES ('user_1679939355814', 5, 211);
INSERT INTO public.users VALUES ('user_1679939132880', 5, 8);
INSERT INTO public.users VALUES ('user_1679852305215', 5, 144);
INSERT INTO public.users VALUES ('user_1679851551054', 2, 627);
INSERT INTO public.users VALUES ('user_1679851551055', 5, 96);
INSERT INTO public.users VALUES ('user_1679938953197', 2, 534);
INSERT INTO public.users VALUES ('user_1679938501564', 2, 55);
INSERT INTO public.users VALUES ('user_1679939633382', 5, 205);
INSERT INTO public.users VALUES ('user_1679938953198', 5, 76);
INSERT INTO public.users VALUES ('user_1679851568679', 2, 380);
INSERT INTO public.users VALUES ('user_1679939702761', 0, 1000);
INSERT INTO public.users VALUES ('user_1679938501565', 5, 112);
INSERT INTO public.users VALUES ('user_1679939138401', 2, 280);
INSERT INTO public.users VALUES ('user_1679939013674', 2, 287);
INSERT INTO public.users VALUES ('user_1679938592470', 2, 431);
INSERT INTO public.users VALUES ('user_1679939382228', 2, 178);
INSERT INTO public.users VALUES ('user_1679939138402', 5, 113);
INSERT INTO public.users VALUES ('user_1679939013675', 5, 46);
INSERT INTO public.users VALUES ('user_1679938592471', 5, 347);
INSERT INTO public.users VALUES ('user_1679938789270', 2, 328);
INSERT INTO public.users VALUES ('user_1679939382229', 5, 131);
INSERT INTO public.users VALUES ('user_1679938789271', 5, 221);
INSERT INTO public.users VALUES ('user_1679939028548', 2, 524);
INSERT INTO public.users VALUES ('user_1679939702762', 3, 49);
INSERT INTO public.users VALUES ('user_1679939028549', 5, 517);
INSERT INTO public.users VALUES ('user_1679939174469', 2, 376);
INSERT INTO public.users VALUES ('user_1679938828161', 2, 552);
INSERT INTO public.users VALUES ('user_1679938828162', 5, 233);
INSERT INTO public.users VALUES ('user_1679939174470', 5, 414);
INSERT INTO public.users VALUES ('user_1679939037881', 2, 505);
INSERT INTO public.users VALUES ('user_1679939554453', 2, 288);
INSERT INTO public.users VALUES ('user_1679938861091', 2, 150);
INSERT INTO public.users VALUES ('user_1679939037882', 5, 52);
INSERT INTO public.users VALUES ('user_1679938861092', 5, 98);
INSERT INTO public.users VALUES ('user_1679939554454', 5, 413);
INSERT INTO public.users VALUES ('user_1679938910520', 2, 94);
INSERT INTO public.users VALUES ('user_1679939187361', 2, 37);
INSERT INTO public.users VALUES ('user_1679939045836', 2, 691);
INSERT INTO public.users VALUES ('user_1679938910521', 5, 305);
INSERT INTO public.users VALUES ('user_1679939045837', 5, 267);
INSERT INTO public.users VALUES ('user_1679939187362', 5, 22);
INSERT INTO public.users VALUES ('user_1679939580196', 2, 123);
INSERT INTO public.users VALUES ('user_1679939054057', 2, 437);
INSERT INTO public.users VALUES ('user_1679939580197', 4, 136);
INSERT INTO public.users VALUES ('user_1679939203878', 2, 424);
INSERT INTO public.users VALUES ('user_1679939203879', 5, 310);
INSERT INTO public.users VALUES ('flatus', 1, 1000);
INSERT INTO public.users VALUES ('user_1679939617348', 2, 193);
INSERT INTO public.users VALUES ('user_1679939617349', 4, 259);


--
-- PostgreSQL database dump complete
--

