--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-06-07 23:08:02

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS tlallidb;
--
-- TOC entry 4896 (class 1262 OID 16417)
-- Name: tlallidb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE tlallidb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';


ALTER DATABASE tlallidb OWNER TO postgres;

\connect tlallidb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 4896
-- Name: DATABASE tlallidb; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE tlallidb IS 'DB de PostgeSQL para Tlalli Store';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16825)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    addressid bigint NOT NULL,
    line1 text NOT NULL,
    country text,
    state text,
    city text,
    postal_code text
);


ALTER TABLE public.address OWNER TO postgres;

--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.address IS 'Dirección del pedido';


--
-- TOC entry 218 (class 1259 OID 16824)
-- Name: address_addressid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_addressid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.address_addressid_seq OWNER TO postgres;

--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 218
-- Name: address_addressid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_addressid_seq OWNED BY public.address.addressid;


--
-- TOC entry 225 (class 1259 OID 19205)
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    addressid bigint NOT NULL,
    line1 character varying(255),
    country character varying(255),
    state character varying(255),
    city character varying(255),
    postal_code boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "purchasePurchaseid" bigint
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 19183)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    productid bigint NOT NULL,
    categories integer,
    "desc" character varying(255),
    color character varying(255),
    img character varying(255),
    "inStock" boolean,
    price numeric(10,2),
    sizenum public.enum_products_sizenum,
    title character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    __v integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 19232)
-- Name: productspurchase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productspurchase (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "productProductid" bigint NOT NULL,
    "purchasePurchaseid" bigint NOT NULL
);


ALTER TABLE public.productspurchase OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16816)
-- Name: purchase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase (
    purchaseid bigint NOT NULL,
    userid bigint,
    addressid bigint,
    totalamount numeric(8,2) NOT NULL,
    statusenum text,
    "createdAt" time with time zone,
    "updatedAt" time with time zone
);


ALTER TABLE public.purchase OWNER TO postgres;

--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE purchase; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.purchase IS 'Guarda las compras';


--
-- TOC entry 216 (class 1259 OID 16815)
-- Name: purchase_purchaseid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchase_purchaseid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.purchase_purchaseid_seq OWNER TO postgres;

--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 216
-- Name: purchase_purchaseid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchase_purchaseid_seq OWNED BY public.purchase.purchaseid;


--
-- TOC entry 224 (class 1259 OID 19195)
-- Name: purchases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchases (
    purchaseid bigint NOT NULL,
    userid bigint,
    addressid bigint,
    totalamount numeric(10,2),
    statusenum public.enum_purchases_statusenum,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "userUserid" bigint
);


ALTER TABLE public.purchases OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 19166)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 19217)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "roleId" integer NOT NULL,
    "userUserid" bigint NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 19159)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid bigint NOT NULL,
    username character varying(255),
    password character varying(255),
    type character varying(255),
    email character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 4723 (class 2604 OID 16828)
-- Name: address addressid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address ALTER COLUMN addressid SET DEFAULT nextval('public.address_addressid_seq'::regclass);


--
-- TOC entry 4722 (class 2604 OID 16819)
-- Name: purchase purchaseid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase ALTER COLUMN purchaseid SET DEFAULT nextval('public.purchase_purchaseid_seq'::regclass);


--
-- TOC entry 4727 (class 2606 OID 16832)
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (addressid);


--
-- TOC entry 4737 (class 2606 OID 19211)
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (addressid);


--
-- TOC entry 4733 (class 2606 OID 19189)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);


--
-- TOC entry 4741 (class 2606 OID 19236)
-- Name: productspurchase productspurchase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productspurchase
    ADD CONSTRAINT productspurchase_pkey PRIMARY KEY ("productProductid", "purchasePurchaseid");


--
-- TOC entry 4725 (class 2606 OID 16823)
-- Name: purchase purchase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (purchaseid);


--
-- TOC entry 4735 (class 2606 OID 19199)
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (purchaseid);


--
-- TOC entry 4731 (class 2606 OID 19170)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4739 (class 2606 OID 19221)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY ("roleId", "userUserid");


--
-- TOC entry 4729 (class 2606 OID 19165)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- TOC entry 4743 (class 2606 OID 19212)
-- Name: addresses addresses_purchasePurchaseid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT "addresses_purchasePurchaseid_fkey" FOREIGN KEY ("purchasePurchaseid") REFERENCES public.purchases(purchaseid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4746 (class 2606 OID 19237)
-- Name: productspurchase productspurchase_productProductid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productspurchase
    ADD CONSTRAINT "productspurchase_productProductid_fkey" FOREIGN KEY ("productProductid") REFERENCES public.products(productid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4747 (class 2606 OID 19242)
-- Name: productspurchase productspurchase_purchasePurchaseid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productspurchase
    ADD CONSTRAINT "productspurchase_purchasePurchaseid_fkey" FOREIGN KEY ("purchasePurchaseid") REFERENCES public.purchases(purchaseid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4742 (class 2606 OID 19200)
-- Name: purchases purchases_userUserid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT "purchases_userUserid_fkey" FOREIGN KEY ("userUserid") REFERENCES public.users(userid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4744 (class 2606 OID 19222)
-- Name: user_roles user_roles_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT "user_roles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4745 (class 2606 OID 19227)
-- Name: user_roles user_roles_userUserid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT "user_roles_userUserid_fkey" FOREIGN KEY ("userUserid") REFERENCES public.users(userid) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2024-06-07 23:08:02

--
-- PostgreSQL database dump complete
--

