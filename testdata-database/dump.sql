--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17 (Debian 14.17-1.pgdg120+1)
-- Dumped by pg_dump version 14.17 (Debian 14.17-1.pgdg120+1)

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
-- Name: metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metadata (
    key text NOT NULL,
    value text NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.metadata OWNER TO postgres;

--
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name text NOT NULL,
    rating real NOT NULL,
    icon integer NOT NULL,
    races_count integer DEFAULT 0 NOT NULL,
    season integer DEFAULT 1 NOT NULL,
    transfered boolean DEFAULT false NOT NULL
);


ALTER TABLE public.players OWNER TO postgres;

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.players ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: players_races; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players_races (
    id integer NOT NULL,
    user_id integer NOT NULL,
    race_id integer NOT NULL,
    old_rating real DEFAULT 1000 NOT NULL,
    new_rating real DEFAULT 1000 NOT NULL,
    rating_diff real DEFAULT 0 NOT NULL
);


ALTER TABLE public.players_races OWNER TO postgres;

--
-- Name: players_races_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.players_races ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.players_races_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: races; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.races (
    id integer NOT NULL,
    ranking integer[] NOT NULL,
    date timestamp without time zone NOT NULL,
    season integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.races OWNER TO postgres;

--
-- Name: races_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.races ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.races_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metadata (key, value, updated_at) FROM stdin;
version	v2	2025-02-21 11:28:45.605522
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (id, name, rating, icon, races_count, season, transfered) FROM stdin;
13	Gurjot 	939	29	3	2	f
18	Farouk	945	13	3	2	f
19	Florent	985	35	1	2	f
14	Phillippe	1066	24	18	2	f
12	Vincent	1045	38	25	2	f
11	Le S	952	40	18	2	f
17	Nicolas	841	38	14	2	f
4	Le S	943	40	4	1	t
16	Cedric	966	49	4	2	f
3	Arnaud Bebou	1064	43	1	1	t
8	Youcef	999	12	2	1	t
10	Hamza	1051	53	18	2	f
2	Hamza	1015	53	5	1	t
5	Vincent	1015	38	3	1	t
7	Cedric	973	49	3	1	t
6	Phillippe	991	24	5	1	t
9	Arnaud Bebou	1118	43	14	2	f
15	Youcef	1092	12	16	2	f
\.


--
-- Data for Name: players_races; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players_races (id, user_id, race_id, old_rating, new_rating, rating_diff) FROM stdin;
1	4	1	1000	1024	24
2	6	1	1000	1008	8
3	2	1	1000	992	-8
4	5	1	1000	976	-24
5	4	2	1024	1044	20
6	2	2	992	1001	9
7	5	2	976	972	-4
8	6	2	1008	983	-25
9	3	3	1000	1022	22
10	5	3	972	983	11
11	2	3	1001	991	-10
12	6	3	983	960	-23
13	6	4	960	988	28
14	7	4	1000	1005	5
15	2	4	991	982	-9
16	5	4	983	959	-24
17	5	5	959	989	30
18	3	5	1022	1025	3
19	7	5	1005	995	-10
20	2	5	982	960	-22
21	3	6	1025	1046	21
22	2	6	960	976	16
23	4	6	1044	1029	-15
24	7	6	995	973	-22
25	3	7	1046	1064	18
26	5	7	989	1001	12
27	4	7	1029	1018	-11
28	6	7	988	968	-20
29	6	8	968	996	28
30	2	8	976	987	11
31	5	8	1001	991	-10
32	4	8	1018	989	-29
33	5	9	991	1015	24
34	8	9	1000	998	-2
35	2	9	987	988	1
36	4	9	989	966	-23
37	2	10	988	1012	24
38	6	10	996	1002	6
39	4	10	966	962	-4
40	8	10	998	972	-26
41	8	11	972	999	27
42	2	11	1012	1015	3
43	6	11	1002	991	-11
44	4	11	962	943	-19
45	9	12	1064	1081	17
46	10	12	1015	1025	10
47	12	12	1015	1009	-6
48	13	12	1000	980	-20
49	16	13	973	994	21
50	10	13	1025	1037	12
51	12	13	1009	1000	-9
52	17	13	1000	976	-24
53	9	14	1081	1093	12
54	12	14	1000	1010	10
55	14	14	991	987	-4
56	17	14	976	958	-18
57	11	15	943	971	28
58	14	15	987	991	4
59	17	15	958	952	-6
60	13	15	980	954	-26
61	10	16	1037	1056	19
62	15	16	999	1009	10
63	12	16	1010	1002	-8
64	18	16	1000	978	-22
65	15	17	1009	1033	24
66	12	17	1002	1012	10
67	10	17	1056	1040	-16
68	18	17	978	960	-18
69	10	18	1040	1051	11
70	15	18	1033	1045	12
71	12	18	1012	1004	-8
72	18	18	960	945	-15
73	12	19	1004	1030	26
74	15	19	1045	1048	3
75	10	19	1051	1037	-14
76	11	19	971	955	-16
77	14	20	991	1018	27
78	15	20	1048	1044	-4
79	10	20	1037	1014	-23
80	9	21	1093	1108	15
81	14	21	1018	1030	12
82	15	21	1044	1036	-8
83	10	21	1014	995	-19
84	15	22	1036	1050	14
85	14	22	1030	1045	15
86	12	22	1030	1021	-9
87	10	22	995	976	-19
88	9	23	1108	1121	13
89	12	23	1021	1032	11
90	10	23	976	978	2
91	15	23	1050	1024	-26
92	15	24	1024	1048	24
93	9	24	1121	1108	-13
94	10	24	978	967	-11
95	9	25	1108	1115	7
96	10	25	967	979	12
97	11	25	955	953	-2
98	17	25	952	935	-17
99	9	26	1115	1122	7
100	10	26	979	989	10
101	11	26	953	951	-2
102	17	26	935	920	-15
103	11	27	951	979	28
104	10	27	989	994	5
105	12	27	1032	1014	-18
106	17	27	920	905	-15
107	12	28	1014	1032	18
108	10	28	994	994	0
109	11	28	979	961	-18
110	9	29	1122	1134	12
111	14	29	1045	1053	8
112	15	29	1048	1039	-9
113	11	29	961	950	-11
114	14	30	1053	1067	14
115	15	30	1039	1039	0
116	11	30	950	948	-2
117	17	30	905	894	-11
118	15	31	1039	1053	14
119	11	31	948	961	13
120	12	31	1032	1015	-17
121	17	31	894	883	-11
122	9	32	1134	1141	7
123	12	32	1015	1023	8
124	11	32	961	961	0
125	13	32	954	939	-15
126	11	33	961	996	35
127	15	33	1053	1056	3
128	14	33	1067	1052	-15
129	12	33	1023	1000	-23
130	10	34	994	1012	18
131	9	34	1141	1137	-4
132	19	34	1000	985	-15
133	10	35	1012	1042	30
134	14	35	1052	1059	7
135	9	35	1137	1115	-22
136	16	35	994	979	-15
137	9	36	1115	1122	7
138	12	36	1000	1007	7
139	16	36	979	973	-6
140	17	36	883	875	-8
141	14	37	1059	1071	12
142	12	37	1007	1011	4
143	16	37	973	966	-7
144	17	37	875	866	-9
145	15	38	1056	1078	22
146	10	38	1042	1051	9
147	12	38	1011	1009	-2
148	14	38	1071	1042	-29
153	9	40	1122	1133	11
154	11	40	996	1012	16
155	14	40	1042	1026	-16
156	12	40	1009	998	-11
157	14	41	1026	1042	16
158	12	41	998	1003	5
159	11	41	1012	999	-13
160	17	41	866	858	-8
161	15	42	1078	1094	16
162	9	42	1133	1118	-15
163	12	42	1003	1006	3
164	17	42	858	854	-4
165	15	43	1094	1092	-2
166	12	43	1006	1019	13
167	14	43	1042	1049	7
168	11	43	999	981	-18
169	14	44	1049	1065	16
170	11	44	981	977	-4
171	12	44	1019	1008	-11
172	12	45	1008	1031	23
173	14	45	1065	1057	-8
174	11	45	977	963	-14
175	12	46	1031	1047	16
176	14	46	1057	1053	-4
177	11	46	963	957	-6
178	17	46	854	847	-7
179	14	47	1053	1066	13
180	12	47	1047	1045	-2
181	11	47	957	952	-5
182	17	47	847	841	-6
\.


--
-- Data for Name: races; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.races (id, ranking, date, season) FROM stdin;
1	{4,6,2,5}	2025-02-26 12:02:54	1
2	{4,2,5,6}	2025-02-26 12:15:47	1
3	{3,5,2,6}	2025-02-26 12:27:53	1
4	{6,7,2,5}	2025-02-26 12:39:26	1
5	{5,3,7,2}	2025-02-26 12:50:49	1
6	{3,2,4,7}	2025-02-26 13:02:51	1
7	{3,5,4,6}	2025-02-27 12:04:17	1
8	{6,2,5,4}	2025-02-27 12:16:14	1
9	{5,8,2,4}	2025-02-27 12:30:32	1
10	{2,6,4,8}	2025-02-27 12:43:01	1
11	{8,2,6,4}	2025-02-27 12:57:27	1
12	{9,10,12,13}	2025-03-05 12:16:14	2
13	{16,10,12,17}	2025-03-05 12:29:42	2
14	{9,12,14,17}	2025-03-05 12:41:47	2
15	{11,14,17,13}	2025-03-05 12:55:27	2
16	{10,15,12,18}	2025-03-06 12:07:04	2
17	{15,12,10,18}	2025-03-06 12:21:50	2
18	{10,15,12,18}	2025-03-06 12:35:53	2
19	{12,15,10,11}	2025-03-06 12:47:55	2
20	{14,15,10}	2025-03-12 12:06:48	2
21	{9,14,15,10}	2025-03-12 12:23:02	2
22	{15,14,12,10}	2025-03-12 12:35:31	2
23	{9,12,10,15}	2025-03-12 12:47:54	2
24	{15,9,10}	2025-03-12 13:00:43	2
25	{9,10,11,17}	2025-03-13 12:03:40	2
26	{9,10,11,17}	2025-03-13 12:16:23	2
27	{11,10,12,17}	2025-03-13 12:28:30	2
28	{12,10,11}	2025-03-13 12:41:56	2
29	{9,14,15,11}	2025-03-19 12:02:28	2
30	{14,15,11,17}	2025-03-19 12:15:11	2
31	{15,11,12,17}	2025-03-19 12:28:01	2
32	{9,12,11,13}	2025-03-19 12:43:17	2
33	{11,15,14,12}	2025-03-19 12:55:50	2
34	{10,9,19}	2025-03-20 12:00:19	2
35	{10,14,9,16}	2025-03-20 12:12:45	2
36	{9,12,16,17}	2025-03-24 14:50:56	2
37	{14,12,16,17}	2025-03-24 14:52:14	2
38	{15,10,12,14}	2025-03-24 14:53:30	2
40	{9,11,14,12}	2025-03-26 12:28:29	2
41	{14,12,11,17}	2025-03-26 12:29:44	2
42	{15,9,12,17}	2025-03-26 12:30:08	2
43	{15,12,14,11}	2025-03-26 12:42:52	2
44	{14,11,12}	2025-03-27 12:09:44	2
45	{12,14,11}	2025-03-27 12:23:00	2
46	{12,14,11,17}	2025-03-27 12:34:46	2
47	{14,12,11,17}	2025-03-27 12:48:01	2
\.


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.players_id_seq', 19, true);


--
-- Name: players_races_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.players_races_id_seq', 182, true);


--
-- Name: races_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.races_id_seq', 47, true);


--
-- Name: metadata metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_pkey PRIMARY KEY (key);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: players_races players_races_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players_races
    ADD CONSTRAINT players_races_pkey PRIMARY KEY (id);


--
-- Name: races races_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.races
    ADD CONSTRAINT races_pkey PRIMARY KEY (id);


--
-- Name: players_races players_races_race_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players_races
    ADD CONSTRAINT players_races_race_id_fkey FOREIGN KEY (race_id) REFERENCES public.races(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: players_races players_races_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players_races
    ADD CONSTRAINT players_races_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.players(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--
