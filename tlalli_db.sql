-- Table: public.products

CREATE TYPE sizenum AS ENUM ('125Ml.', '250Ml.', '500Ml.', '1000Ml.');

-- DROP TABLE IF EXISTS public.products;

CREATE TABLE public.productos
(
    _id bigserial NOT NULL,
    categories integer NOT NULL,
    color text,
    "desc" text,
    img text,
    "inStock" boolean,
    price numeric(10),
    size text,
    title sizenum,
    "createdAt" time with time zone,
    "updatedAt" time with time zone,
    PRIMARY KEY (_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.productos
    OWNER to postgres;

COMMENT ON TABLE public.productos
    IS 'Para manejo de productos en Tlalli Store';


-- Table: public.roles

-- DROP TABLE IF EXISTS public.roles;
	
CREATE TABLE IF NOT EXISTS public.roles
(
	id SERIAL  NOT NULL,
	name  text COLLATE pg_catalog."default" NOT NULL,	
	CONSTRAINT products_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.roles
    OWNER to postgres;

COMMENT ON TABLE public.roles
    IS 'Manejo de roles en Tlalli Store';
