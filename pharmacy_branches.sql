PGDMP         7    	            {            pharmacy_branches    14.5    14.5 4    8           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            9           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            :           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ;           1262    17828    pharmacy_branches    DATABASE     n   CREATE DATABASE pharmacy_branches WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
 !   DROP DATABASE pharmacy_branches;
                postgres    false            �            1255    17918 #   get_employees_by_branch_id(integer)    FUNCTION     �  CREATE FUNCTION public.get_employees_by_branch_id(branch_id integer) RETURNS TABLE(name character varying, surname character varying, position_title character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY EXECUTE format('SELECT e.name, e.surname, p.title FROM employees e LEFT JOIN positions p ON p.id = e.position_id
								WHERE e.branch_id = %L', branch_id);
END;
$$;
 D   DROP FUNCTION public.get_employees_by_branch_id(branch_id integer);
       public          postgres    false            �            1259    17830    branches    TABLE     �   CREATE TABLE public.branches (
    id integer NOT NULL,
    address character varying(128) NOT NULL,
    time_open time without time zone NOT NULL,
    time_close time without time zone NOT NULL
);
    DROP TABLE public.branches;
       public         heap    postgres    false            �            1259    17829    branches_id_seq    SEQUENCE     �   ALTER TABLE public.branches ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.branches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    210            �            1259    17865 
   categories    TABLE     f   CREATE TABLE public.categories (
    id integer NOT NULL,
    title character varying(64) NOT NULL
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    17864    categories_id_seq    SEQUENCE     �   ALTER TABLE public.categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    17836 	   employees    TABLE     ?  CREATE TABLE public.employees (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    surname character varying(32) DEFAULT ''::character varying,
    password character varying(256) NOT NULL,
    position_id integer NOT NULL,
    branch_id integer NOT NULL,
    login character varying(32) NOT NULL
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    17835    employees_id_seq    SEQUENCE     �   ALTER TABLE public.employees ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    212            �            1259    17843    manufacturers    TABLE       CREATE TABLE public.manufacturers (
    id integer NOT NULL,
    title character varying(64) NOT NULL,
    address character varying(128) DEFAULT 'Адрес не указан'::character varying,
    requisutes character varying(256) DEFAULT ''::character varying
);
 !   DROP TABLE public.manufacturers;
       public         heap    postgres    false            �            1259    17842    manufacturers_id_seq    SEQUENCE     �   ALTER TABLE public.manufacturers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.manufacturers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    17851    medicaments    TABLE     �   CREATE TABLE public.medicaments (
    id integer NOT NULL,
    title character varying(64) NOT NULL,
    description character varying(512),
    category_id integer NOT NULL,
    manufacturer_id integer NOT NULL,
    image_url character varying(512)
);
    DROP TABLE public.medicaments;
       public         heap    postgres    false            �            1259    17850    medicaments_id_seq    SEQUENCE     �   ALTER TABLE public.medicaments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.medicaments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    17871    orders    TABLE     �   CREATE TABLE public.orders (
    id integer NOT NULL,
    branch_id integer NOT NULL,
    employee_id integer NOT NULL,
    amount real NOT NULL,
    date time without time zone NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    17877    orders_details    TABLE     �   CREATE TABLE public.orders_details (
    id integer NOT NULL,
    order_id integer NOT NULL,
    medicament_id integer NOT NULL,
    count integer DEFAULT 1
);
 "   DROP TABLE public.orders_details;
       public         heap    postgres    false            �            1259    17876    orders-details_id_seq    SEQUENCE     �   ALTER TABLE public.orders_details ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."orders-details_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    17870    orders_id_seq    SEQUENCE     �   ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    17859 	   positions    TABLE     e   CREATE TABLE public.positions (
    id integer NOT NULL,
    title character varying(64) NOT NULL
);
    DROP TABLE public.positions;
       public         heap    postgres    false            �            1259    17858    positions_id_seq    SEQUENCE     �   ALTER TABLE public.positions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.positions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            '          0    17830    branches 
   TABLE DATA           F   COPY public.branches (id, address, time_open, time_close) FROM stdin;
    public          postgres    false    210   �>       1          0    17865 
   categories 
   TABLE DATA           /   COPY public.categories (id, title) FROM stdin;
    public          postgres    false    220   :?       )          0    17836 	   employees 
   TABLE DATA           _   COPY public.employees (id, name, surname, password, position_id, branch_id, login) FROM stdin;
    public          postgres    false    212   W?       +          0    17843    manufacturers 
   TABLE DATA           G   COPY public.manufacturers (id, title, address, requisutes) FROM stdin;
    public          postgres    false    214   �?       -          0    17851    medicaments 
   TABLE DATA           f   COPY public.medicaments (id, title, description, category_id, manufacturer_id, image_url) FROM stdin;
    public          postgres    false    216   @       3          0    17871    orders 
   TABLE DATA           J   COPY public.orders (id, branch_id, employee_id, amount, date) FROM stdin;
    public          postgres    false    222   9@       5          0    17877    orders_details 
   TABLE DATA           L   COPY public.orders_details (id, order_id, medicament_id, count) FROM stdin;
    public          postgres    false    224   V@       /          0    17859 	   positions 
   TABLE DATA           .   COPY public.positions (id, title) FROM stdin;
    public          postgres    false    218   s@       <           0    0    branches_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.branches_id_seq', 3, true);
          public          postgres    false    209            =           0    0    categories_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categories_id_seq', 1, false);
          public          postgres    false    219            >           0    0    employees_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.employees_id_seq', 1, true);
          public          postgres    false    211            ?           0    0    manufacturers_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.manufacturers_id_seq', 1, false);
          public          postgres    false    213            @           0    0    medicaments_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.medicaments_id_seq', 1, false);
          public          postgres    false    215            A           0    0    orders-details_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."orders-details_id_seq"', 1, false);
          public          postgres    false    223            B           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 1, false);
          public          postgres    false    221            C           0    0    positions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.positions_id_seq', 1, true);
          public          postgres    false    217            �           2606    17834    branches branches_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.branches DROP CONSTRAINT branches_pkey;
       public            postgres    false    210            �           2606    17869    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    220            �           2606    17841    employees employees_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    212            �           2606    17849     manufacturers manufacturers_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.manufacturers DROP CONSTRAINT manufacturers_pkey;
       public            postgres    false    214            �           2606    17857    medicaments medicaments_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.medicaments
    ADD CONSTRAINT medicaments_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.medicaments DROP CONSTRAINT medicaments_pkey;
       public            postgres    false    216            �           2606    17882 "   orders_details orders-details_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.orders_details
    ADD CONSTRAINT "orders-details_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.orders_details DROP CONSTRAINT "orders-details_pkey";
       public            postgres    false    224            �           2606    17875    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    222            �           2606    17863    positions positions_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.positions DROP CONSTRAINT positions_pkey;
       public            postgres    false    218            �           2606    17888     employees FK_branch_id__branches    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "FK_branch_id__branches" FOREIGN KEY (branch_id) REFERENCES public.branches(id) NOT VALID;
 L   ALTER TABLE ONLY public.employees DROP CONSTRAINT "FK_branch_id__branches";
       public          postgres    false    210    212    3205            �           2606    17903    orders FK_branch_id__branches    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_branch_id__branches" FOREIGN KEY (branch_id) REFERENCES public.branches(id) NOT VALID;
 I   ALTER TABLE ONLY public.orders DROP CONSTRAINT "FK_branch_id__branches";
       public          postgres    false    210    222    3205            �           2606    17893 &   medicaments FK_category_id__categories    FK CONSTRAINT     �   ALTER TABLE ONLY public.medicaments
    ADD CONSTRAINT "FK_category_id__categories" FOREIGN KEY (category_id) REFERENCES public.categories(id) NOT VALID;
 R   ALTER TABLE ONLY public.medicaments DROP CONSTRAINT "FK_category_id__categories";
       public          postgres    false    216    3215    220            �           2606    17908     orders FK_employee_id__employees    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_employee_id__employees" FOREIGN KEY (employee_id) REFERENCES public.employees(id) NOT VALID;
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT "FK_employee_id__employees";
       public          postgres    false    222    3207    212            �           2606    17898 -   medicaments FK_manufacturer_id__manufacturers    FK CONSTRAINT     �   ALTER TABLE ONLY public.medicaments
    ADD CONSTRAINT "FK_manufacturer_id__manufacturers" FOREIGN KEY (manufacturer_id) REFERENCES public.manufacturers(id) NOT VALID;
 Y   ALTER TABLE ONLY public.medicaments DROP CONSTRAINT "FK_manufacturer_id__manufacturers";
       public          postgres    false    214    216    3209            �           2606    17913 "   orders_details FK_order_id__orders    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_details
    ADD CONSTRAINT "FK_order_id__orders" FOREIGN KEY (order_id) REFERENCES public.orders(id) NOT VALID;
 N   ALTER TABLE ONLY public.orders_details DROP CONSTRAINT "FK_order_id__orders";
       public          postgres    false    3217    222    224            �           2606    17883 #   employees FK_position_id__positions    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT "FK_position_id__positions" FOREIGN KEY (position_id) REFERENCES public.positions(id) NOT VALID;
 O   ALTER TABLE ONLY public.employees DROP CONSTRAINT "FK_position_id__positions";
       public          postgres    false    212    218    3213            '   <   x�3��|a���.츰�¾�.l�د�pa���������qA\1z\\\ 	�      1      x������ � �      )   �   x��;
�@ ��s���d7�������B��X��"�r�w$�)f8�7�8�'	~�����<}Aԯ�Jך���=����з�ݥinY�h-8++� �2��%%uTсd҈ UPǹa�/�y$>�٧�s������7b      +      x������ � �      -      x������ � �      3      x������ � �      5      x������ � �      /   5   x�3估����6\�ta����};/츰S�b�����{�b���� �,     