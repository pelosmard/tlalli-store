--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-06-07 23:08:47

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

INSERT INTO public.products VALUES (8, 2, 'Sistema Tratamienta alopecia', 'Blanco', 'http://localhost:8080/Sistema1.png', true, 1850.00, '500Ml', 'Sistema Tratamienta alopecia', '2024-06-06 15:06:40.47395-06', '2024-06-06 15:06:40.47395-06', NULL);
INSERT INTO public.products VALUES (1, 1, 'Acondicionador 1 Litro', 'Blanco', 'http://localhost:8080/Acondicionador_1l.png', true, 220.00, '500Ml', 'Acondicionador 1 Litro', '2024-06-06 15:06:40.47395-06', '2024-06-06 15:06:40.47395-06', NULL);
INSERT INTO public.products VALUES (6, 1, 'Shampoo 500 MiliLitros', 'Blanco', 'http://localhost:8080/Shampoo_500.png', true, 140.00, '500Ml', 'Shampoo_500 MiliLitros', '2024-06-06 15:06:40.47395-06', '2024-06-06 15:06:40.47395-06', NULL);
INSERT INTO public.products VALUES (2, 1, 'acondicionador 250 MiliLitros', 'Blanco', 'http://localhost:8080/Acondicionador_250.png', true, 80.00, '250Ml', 'acondicionador 250 MiliLitros', '2024-06-06 15:06:40.47395-06', '2024-06-06 15:06:40.47395-06', NULL);
INSERT INTO public.products VALUES (3, 1, 'Acondicionador_500 MiliLitros', 'Blanco', 'http://localhost:8080/Acondicionador_500.png', true, 130.00, '500Ml', 'Acondicionador_500 MiliLitros', '2024-06-06 15:06:40.47395-06', '2024-06-06 15:06:40.47395-06', NULL);
INSERT INTO public.products VALUES (4, 1, 'Shampoo 1 Litro', 'Blanco', 'http://localhost:8080/Shampoo_1l.png', true, 285.00, '500Ml', 'Shampoo 1 Litro', '2024-06-06 15:06:40.47395-06', '2024-06-06 15:06:40.47395-06', NULL);
INSERT INTO public.products VALUES (5, 1, 'Shampoo 250 MiliLitros', 'Blanco', 'http://localhost:8080/Shampoo_250.png', true, 85.00, '250Ml', 'Shampoo 250 MiliLitros', '2024-06-06 15:06:40.47395-06', '2024-06-06 15:06:40.47395-06', NULL);
INSERT INTO public.products VALUES (7, 2, 'Sistema Alaciado en casa', 'Blanco', 'http://localhost:8080/Sistema2.png', true, 1750.00, '500Ml', 'Sistema Alaciado en casa', '2024-06-06 15:06:40.47395-06', '2024-06-06 15:06:40.47395-06', NULL);


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


-- Completed on 2024-06-07 23:08:47

--
-- PostgreSQL database dump complete
--

