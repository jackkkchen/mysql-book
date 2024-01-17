--
-- PostgreSQL database dump
--

-- Dumped from database version 10.23
-- Dumped by pg_dump version 10.23

-- Started on 2024-01-10 14:17:39

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

DROP DATABASE IF EXISTS "sdoh";
--
-- TOC entry 2909 (class 1262 OID 33987)
-- Name: sdoh; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "sdoh" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


\connect "sdoh"

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
-- TOC entry 2910 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA "public"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA "public" IS 'standard public schema';


--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "plpgsql" WITH SCHEMA "pg_catalog";


--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION "plpgsql"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "plpgsql" IS 'PL/pgSQL procedural language';


--
-- TOC entry 522 (class 1247 OID 33990)
-- Name: region_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."region_type" AS ENUM (
    'Northeast',
    'Midwest',
    'South',
    'West'
);


--
-- TOC entry 525 (class 1247 OID 34000)
-- Name: var_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "public"."var_type" AS ENUM (
    'num',
    'char'
);


SET default_with_oids = false;

--
-- TOC entry 211 (class 1259 OID 34091)
-- Name: census_tract_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."census_tract_data" (
    "census_tract_data_id" bigint NOT NULL,
    "tractfips" character(11) NOT NULL,
    "var_id" bigint NOT NULL,
    "domain_id" bigint NOT NULL,
    "topic_id" bigint NOT NULL,
    "year" smallint NOT NULL,
    "value" character(20)
);


--
-- TOC entry 2912 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE "census_tract_data"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."census_tract_data" IS 'Census Tract level data';


--
-- TOC entry 210 (class 1259 OID 34089)
-- Name: census_track_data_census_track_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."census_track_data_census_track_data_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2913 (class 0 OID 0)
-- Dependencies: 210
-- Name: census_track_data_census_track_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."census_track_data_census_track_data_id_seq" OWNED BY "public"."census_tract_data"."census_tract_data_id";


--
-- TOC entry 199 (class 1259 OID 34024)
-- Name: census_tract; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."census_tract" (
    "tractfips" character(11) NOT NULL,
    "countyfips" character(5) NOT NULL
);


--
-- TOC entry 2914 (class 0 OID 0)
-- Dependencies: 199
-- Name: TABLE "census_tract"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."census_tract" IS 'Census tract related info';


--
-- TOC entry 198 (class 1259 OID 34017)
-- Name: county; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."county" (
    "countyfips" character(5) NOT NULL,
    "statefips" character(2) NOT NULL,
    "county" character(40) NOT NULL
);


--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 198
-- Name: TABLE "county"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."county" IS 'County related info
';


--
-- TOC entry 209 (class 1259 OID 34078)
-- Name: county_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."county_data" (
    "county_data_id" bigint NOT NULL,
    "countyfips" character(5) NOT NULL,
    "var_id" bigint NOT NULL,
    "domain_id" bigint NOT NULL,
    "topic_id" bigint NOT NULL,
    "year" smallint NOT NULL,
    "value" character(20)
);


--
-- TOC entry 2916 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE "county_data"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."county_data" IS 'County level data
';


--
-- TOC entry 208 (class 1259 OID 34076)
-- Name: county_data_county_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."county_data_county_data_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 208
-- Name: county_data_county_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."county_data_county_data_id_seq" OWNED BY "public"."county_data"."county_data_id";


--
-- TOC entry 205 (class 1259 OID 34052)
-- Name: data_source; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."data_source" (
    "data_source_id" bigint NOT NULL,
    "data_source_name" character varying NOT NULL
);


--
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE "data_source"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."data_source" IS 'Data source related info';


--
-- TOC entry 204 (class 1259 OID 34050)
-- Name: data_source_data_source_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."data_source_data_source_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 204
-- Name: data_source_data_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."data_source_data_source_id_seq" OWNED BY "public"."data_source"."data_source_id";


--
-- TOC entry 201 (class 1259 OID 34031)
-- Name: domain; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."domain" (
    "domain_id" bigint NOT NULL,
    "domain_name" character varying NOT NULL
);


--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE "domain"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."domain" IS 'Domain related info';


--
-- TOC entry 200 (class 1259 OID 34029)
-- Name: domain_domain_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."domain_domain_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 200
-- Name: domain_domain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."domain_domain_id_seq" OWNED BY "public"."domain"."domain_id";


--
-- TOC entry 196 (class 1259 OID 34005)
-- Name: state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."state" (
    "statefips" character(2) NOT NULL,
    "state_name" character(32) NOT NULL,
    "region" "public"."region_type",
    "is_territory" boolean NOT NULL
);


--
-- TOC entry 2922 (class 0 OID 0)
-- Dependencies: 196
-- Name: TABLE "state"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."state" IS 'State related info
';


--
-- TOC entry 203 (class 1259 OID 34042)
-- Name: topic; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."topic" (
    "topic_id" bigint NOT NULL,
    "topic_name" character(50) NOT NULL,
    "domain_id" bigint NOT NULL
);


--
-- TOC entry 2923 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE "topic"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."topic" IS 'Topic related info';


--
-- TOC entry 202 (class 1259 OID 34040)
-- Name: topic_topic_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."topic_topic_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2924 (class 0 OID 0)
-- Dependencies: 202
-- Name: topic_topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."topic_topic_id_seq" OWNED BY "public"."topic"."topic_id";


--
-- TOC entry 207 (class 1259 OID 34065)
-- Name: variable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."variable" (
    "var_id" bigint NOT NULL,
    "topic_id" bigint NOT NULL,
    "var_name" character(64) NOT NULL,
    "var_label" character varying,
    "var_type" "public"."var_type" NOT NULL,
    "var_length" smallint NOT NULL,
    "var_format" character(5) NOT NULL,
    "data_source_id" bigint NOT NULL
);


--
-- TOC entry 2925 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE "variable"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."variable" IS 'Variable related info';


--
-- TOC entry 206 (class 1259 OID 34063)
-- Name: variable_var_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."variable_var_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 206
-- Name: variable_var_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."variable_var_id_seq" OWNED BY "public"."variable"."var_id";


--
-- TOC entry 197 (class 1259 OID 34012)
-- Name: zipcode; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."zipcode" (
    "zipcode" character(5) NOT NULL,
    "statefips" character(2) NOT NULL,
    "zcta" character(5),
    "is_point_zip" boolean NOT NULL
);


--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 197
-- Name: TABLE "zipcode"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."zipcode" IS 'Zipcode related info
';


--
-- TOC entry 213 (class 1259 OID 34104)
-- Name: zipcode_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."zipcode_data" (
    "zipcode_data_id" bigint NOT NULL,
    "zipcode" character(5) NOT NULL,
    "var_id" bigint NOT NULL,
    "domain_id" bigint NOT NULL,
    "topic_id" bigint NOT NULL,
    "year" smallint NOT NULL,
    "value" character(20)
);


--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE "zipcode_data"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE "public"."zipcode_data" IS 'Zipcode level data';


--
-- TOC entry 212 (class 1259 OID 34102)
-- Name: zipcode_data_zipcode_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."zipcode_data_zipcode_data_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 212
-- Name: zipcode_data_zipcode_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."zipcode_data_zipcode_data_id_seq" OWNED BY "public"."zipcode_data"."zipcode_data_id";


--
-- TOC entry 2736 (class 2604 OID 34094)
-- Name: census_tract_data census_tract_data_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."census_tract_data" ALTER COLUMN "census_tract_data_id" SET DEFAULT "nextval"('"public"."census_track_data_census_track_data_id_seq"'::"regclass");


--
-- TOC entry 2735 (class 2604 OID 34081)
-- Name: county_data county_data_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."county_data" ALTER COLUMN "county_data_id" SET DEFAULT "nextval"('"public"."county_data_county_data_id_seq"'::"regclass");


--
-- TOC entry 2733 (class 2604 OID 34055)
-- Name: data_source data_source_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."data_source" ALTER COLUMN "data_source_id" SET DEFAULT "nextval"('"public"."data_source_data_source_id_seq"'::"regclass");


--
-- TOC entry 2731 (class 2604 OID 34034)
-- Name: domain domain_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."domain" ALTER COLUMN "domain_id" SET DEFAULT "nextval"('"public"."domain_domain_id_seq"'::"regclass");


--
-- TOC entry 2732 (class 2604 OID 34045)
-- Name: topic topic_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."topic" ALTER COLUMN "topic_id" SET DEFAULT "nextval"('"public"."topic_topic_id_seq"'::"regclass");


--
-- TOC entry 2734 (class 2604 OID 34068)
-- Name: variable var_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."variable" ALTER COLUMN "var_id" SET DEFAULT "nextval"('"public"."variable_var_id_seq"'::"regclass");


--
-- TOC entry 2737 (class 2604 OID 34107)
-- Name: zipcode_data zipcode_data_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."zipcode_data" ALTER COLUMN "zipcode_data_id" SET DEFAULT "nextval"('"public"."zipcode_data_zipcode_data_id_seq"'::"regclass");


--
-- TOC entry 2775 (class 2606 OID 34096)
-- Name: census_tract_data pk_census_track_data_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."census_tract_data"
    ADD CONSTRAINT "pk_census_track_data_id" PRIMARY KEY ("census_tract_data_id");


--
-- TOC entry 2768 (class 2606 OID 34083)
-- Name: county_data pk_county_data_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."county_data"
    ADD CONSTRAINT "pk_county_data_id" PRIMARY KEY ("county_data_id");


--
-- TOC entry 2745 (class 2606 OID 34021)
-- Name: county pk_countyfips; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."county"
    ADD CONSTRAINT "pk_countyfips" PRIMARY KEY ("countyfips");


--
-- TOC entry 2755 (class 2606 OID 34060)
-- Name: data_source pk_data_source_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."data_source"
    ADD CONSTRAINT "pk_data_source_id" PRIMARY KEY ("data_source_id");


--
-- TOC entry 2749 (class 2606 OID 34039)
-- Name: domain pk_domain_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."domain"
    ADD CONSTRAINT "pk_domain_id" PRIMARY KEY ("domain_id");


--
-- TOC entry 2739 (class 2606 OID 34009)
-- Name: state pk_statefips; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."state"
    ADD CONSTRAINT "pk_statefips" PRIMARY KEY ("statefips");


--
-- TOC entry 2751 (class 2606 OID 34047)
-- Name: topic pk_topic_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."topic"
    ADD CONSTRAINT "pk_topic_id" PRIMARY KEY ("topic_id");


--
-- TOC entry 2747 (class 2606 OID 34028)
-- Name: census_tract pk_tractfips; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."census_tract"
    ADD CONSTRAINT "pk_tractfips" PRIMARY KEY ("tractfips");


--
-- TOC entry 2759 (class 2606 OID 34073)
-- Name: variable pk_var_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."variable"
    ADD CONSTRAINT "pk_var_id" PRIMARY KEY ("var_id");


--
-- TOC entry 2743 (class 2606 OID 34016)
-- Name: zipcode pk_zipcode; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."zipcode"
    ADD CONSTRAINT "pk_zipcode" PRIMARY KEY ("zipcode");


--
-- TOC entry 2782 (class 2606 OID 34109)
-- Name: zipcode_data pk_zipcode_data_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."zipcode_data"
    ADD CONSTRAINT "pk_zipcode_data_id" PRIMARY KEY ("zipcode_data_id");


--
-- TOC entry 2757 (class 2606 OID 34062)
-- Name: data_source uk_data_source_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."data_source"
    ADD CONSTRAINT "uk_data_source_name" UNIQUE ("data_source_name");


--
-- TOC entry 2741 (class 2606 OID 34011)
-- Name: state uk_state_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."state"
    ADD CONSTRAINT "uk_state_name" UNIQUE ("state_name");


--
-- TOC entry 2753 (class 2606 OID 34049)
-- Name: topic uk_topic_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."topic"
    ADD CONSTRAINT "uk_topic_name" UNIQUE ("topic_name");


--
-- TOC entry 2761 (class 2606 OID 34075)
-- Name: variable uk_var_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."variable"
    ADD CONSTRAINT "uk_var_name" UNIQUE ("var_name");


--
-- TOC entry 2769 (class 1259 OID 34097)
-- Name: idx_census_track_data_domain_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_census_track_data_domain_id" ON "public"."census_tract_data" USING "btree" ("domain_id");


--
-- TOC entry 2770 (class 1259 OID 34098)
-- Name: idx_census_track_data_topic_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_census_track_data_topic_id" ON "public"."census_tract_data" USING "btree" ("topic_id");


--
-- TOC entry 2771 (class 1259 OID 34099)
-- Name: idx_census_track_data_tractfips; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_census_track_data_tractfips" ON "public"."census_tract_data" USING "btree" ("tractfips");


--
-- TOC entry 2772 (class 1259 OID 34100)
-- Name: idx_census_track_data_var_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_census_track_data_var_id" ON "public"."census_tract_data" USING "btree" ("var_id");


--
-- TOC entry 2773 (class 1259 OID 34101)
-- Name: idx_census_track_data_year; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_census_track_data_year" ON "public"."census_tract_data" USING "btree" ("year");


--
-- TOC entry 2762 (class 1259 OID 34084)
-- Name: idx_county_data_countyfips; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_county_data_countyfips" ON "public"."county_data" USING "btree" ("countyfips");


--
-- TOC entry 2763 (class 1259 OID 34085)
-- Name: idx_county_data_domain_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_county_data_domain_id" ON "public"."county_data" USING "btree" ("domain_id");


--
-- TOC entry 2764 (class 1259 OID 34086)
-- Name: idx_county_data_topic_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_county_data_topic_id" ON "public"."county_data" USING "btree" ("topic_id");


--
-- TOC entry 2765 (class 1259 OID 34087)
-- Name: idx_county_data_var_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_county_data_var_id" ON "public"."county_data" USING "btree" ("var_id");


--
-- TOC entry 2766 (class 1259 OID 34088)
-- Name: idx_county_data_year; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_county_data_year" ON "public"."county_data" USING "btree" ("year");


--
-- TOC entry 2776 (class 1259 OID 34110)
-- Name: idx_zipcode_data_domain_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_zipcode_data_domain_id" ON "public"."zipcode_data" USING "btree" ("domain_id");


--
-- TOC entry 2777 (class 1259 OID 34111)
-- Name: idx_zipcode_data_topic_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_zipcode_data_topic_id" ON "public"."zipcode_data" USING "btree" ("topic_id");


--
-- TOC entry 2778 (class 1259 OID 34112)
-- Name: idx_zipcode_data_var_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_zipcode_data_var_id" ON "public"."zipcode_data" USING "btree" ("var_id");


--
-- TOC entry 2779 (class 1259 OID 34113)
-- Name: idx_zipcode_data_year; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_zipcode_data_year" ON "public"."zipcode_data" USING "btree" ("year");


--
-- TOC entry 2780 (class 1259 OID 34114)
-- Name: idx_zipcode_data_zipcode; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "idx_zipcode_data_zipcode" ON "public"."zipcode_data" USING "btree" ("zipcode");


-- Completed on 2024-01-10 14:17:39

--
-- PostgreSQL database dump complete
--

