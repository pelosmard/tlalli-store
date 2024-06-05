-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


DROP TABLE IF EXISTS public.products;

CREATE TABLE public.products (
    productId bigint NOT NULL,
    categories text,
    "desc" text,
    img text,
    "inStock" boolean,
    price numeric(8,2),
    size text,
    title text,
    "createdAt" time with time zone,
    "updatedAt" time with time zone,
	PRIMARY KEY (productId)
);

ALTER TABLE public.products OWNER TO postgres;

COMMENT ON TABLE public.products
    IS 'Para manejo de productos en Tlalli Store';

CREATE SEQUENCE public.products_productId_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.products_productId_seq OWNER TO postgres;

ALTER SEQUENCE public.products_productId_seq OWNED BY public.products.productId;



DROP TABLE IF EXISTS public.roles;

CREATE TABLE public.roles (
    idrole bigint NOT NULL,
    namerole text NOT NULL,
	PRIMARY KEY (idrole)
);

COMMENT ON TABLE public.roles
    IS 'Manejo de roles en Tlalli Store';

CREATE SEQUENCE public.roles_idrole_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.roles_idrole_seq OWNER TO postgres;

ALTER SEQUENCE public.roles_idrole_seq OWNED BY public.roles.idrole;


DROP TABLE IF EXISTS public.users;

CREATE TABLE public.users (
	userid bigint NOT NULL,
    username text NOT NULL,
    password text,
    type text,
    email text,
	PRIMARY KEY (userid)
);

COMMENT ON TABLE public.users
    IS 'Usuarios del Tlalli Store';

CREATE SEQUENCE public.users_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.users_userid_seq OWNER TO postgres;

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;



DROP TABLE IF EXISTS public.purchase;

CREATE TABLE IF NOT EXISTS public.purchase
(
    purchaseid bigserial NOT NULL,
    userid bigint,
    addressid bigint,
    totalamount numeric(8, 2) NOT NULL,
    statusenum text,
    "createdAt" time with time zone,
    "updatedAt" time with time zone,
    PRIMARY KEY (purchaseid)
);

COMMENT ON TABLE public.purchase
    IS 'Guarda las compras';

DROP TABLE IF EXISTS public.address;

CREATE TABLE IF NOT EXISTS public.address
(
    addressid bigserial NOT NULL,
    line1 text NOT NULL,
    country text,
    state text,
    city text,
    postal_code text,
    PRIMARY KEY (addressid)
);

COMMENT ON TABLE public.address
    IS 'Dirección del pedido';

DROP TABLE IF EXISTS public.productspurchase;

CREATE TABLE IF NOT EXISTS public.productspurchase
(
    purchaseid bigint NOT NULL,
    productid bigint NOT NULL,
    title text,
    img text,
    quantity integer,
    sizenum text,
    price numeric(10, 2),
    PRIMARY KEY (purchaseid, productid)
);

COMMENT ON TABLE public.productspurchase
    IS 'Productos de esa órden de compra';

ALTER TABLE IF EXISTS public.users
    ADD FOREIGN KEY (userid)
    REFERENCES public.purchase (userid) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.purchase
    ADD FOREIGN KEY (addressid)
    REFERENCES public.address (addressid) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.purchase
    ADD FOREIGN KEY (purchaseid)
    REFERENCES public.productspurchase (purchaseid) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.productspurchase
    ADD FOREIGN KEY (productid)
    REFERENCES public.products ("productId") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;