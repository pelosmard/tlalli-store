--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-06-07 11:44:04

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
-- TOC entry 4894 (class 0 OID 16825)
-- Dependencies: 219
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4899 (class 0 OID 19205)
-- Dependencies: 225
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4897 (class 0 OID 19183)
-- Dependencies: 223
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products VALUES (1, 1, 'Prueba artículo 3', 'Blanco', 'http://localhost/images/1_prueba3.jpg', true, 165.00, '500Ml', 'Shampoo con Keratina de 500ML.', '2024-06-06 15:06:40.47395-06', '2024-06-06 15:06:40.47395-06', NULL);
INSERT INTO public.products VALUES (2, 1, 'Prueba artículo 4', 'Azul', 'http://localhost/images/1_prueba4.jpg', true, 135.00, '500Ml', 'Acondicionador con Keratina de 500ML.', '2024-06-06 15:06:40.47395-06', '2024-06-06 15:06:40.47395-06', NULL);
INSERT INTO public.products VALUES (3, 2, 'Prueba artículo Sistema 5', 'Blanco', 'http://localhost/images/1_prueba5.jpg', true, 885.00, '1000Ml', 'Sistema vegano Shampoo con Keratina de 1L.', '2024-06-06 15:06:40.47395-06', '2024-06-06 15:06:40.47395-06', NULL);
INSERT INTO public.products VALUES (4, 2, 'Prueba artículo Sistema 6', 'Azul', 'http://localhost/images/1_prueba6.jpg', true, 835.00, '1000Ml', 'Sistema vegano Acondicionador con Keratina de 1L.', '2024-06-06 15:06:40.47395-06', '2024-06-06 15:06:40.47395-06', NULL);
INSERT INTO public.products VALUES (5, 2, 'Prueba artículo Sistema 7', 'Blanco', 'http://localhost/images/1_prueba7.jpg', true, 885.00, '500Ml', 'Sistema vegano Shampoo con Keratina de 500ML.', '2024-06-06 15:06:40.47395-06', '2024-06-06 15:06:40.47395-06', NULL);
INSERT INTO public.products VALUES (6, 2, 'Prueba artículo Sistema 8', 'Azul', 'http://localhost/images/1_prueba8.jpg', true, 835.00, '500Ml', 'Sistema vegano Acondicionador con Keratina de 500ML.', '2024-06-06 15:06:40.47395-06', '2024-06-06 15:06:40.47395-06', NULL);


--
-- TOC entry 4901 (class 0 OID 19232)
-- Dependencies: 227
-- Data for Name: productspurchase; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4892 (class 0 OID 16816)
-- Dependencies: 217
-- Data for Name: purchase; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4898 (class 0 OID 19195)
-- Dependencies: 224
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4896 (class 0 OID 19166)
-- Dependencies: 222
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles VALUES (1, 'user', '2024-06-06 15:05:45.558-06', '2024-06-06 15:05:45.558-06');
INSERT INTO public.roles VALUES (2, 'moderator', '2024-06-06 15:05:45.559-06', '2024-06-06 15:05:45.559-06');
INSERT INTO public.roles VALUES (3, 'admin', '2024-06-06 15:05:45.559-06', '2024-06-06 15:05:45.559-06');


--
-- TOC entry 4900 (class 0 OID 19217)
-- Dependencies: 226
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4895 (class 0 OID 19159)
-- Dependencies: 221
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 218
-- Name: address_addressid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_addressid_seq', 1, false);


--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 216
-- Name: purchase_purchaseid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_purchaseid_seq', 1, false);


-- Completed on 2024-06-07 11:44:04

--
-- PostgreSQL database dump complete
--

