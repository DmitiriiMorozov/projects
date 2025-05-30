PGDMP      ;        	        }            postgres    17.4    17.4 "    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    5    postgres    DATABASE     n   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru-RU';
    DROP DATABASE postgres;
                     postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                        postgres    false    4841                        2615    2200    ecommerce-data-analysis    SCHEMA     )   CREATE SCHEMA "ecommerce-data-analysis";
 '   DROP SCHEMA "ecommerce-data-analysis";
                     pg_database_owner    false            �           0    0     SCHEMA "ecommerce-data-analysis"    COMMENT     S   COMMENT ON SCHEMA "ecommerce-data-analysis" IS 'ecommerce data analysis project.';
                        pg_database_owner    false    5            �            1259    16565 
   categories    TABLE     y   CREATE TABLE "ecommerce-data-analysis".categories (
    category_id integer NOT NULL,
    name character varying(255)
);
 1   DROP TABLE "ecommerce-data-analysis".categories;
       ecommerce-data-analysis         heap r       postgres    false    5            �            1259    16570 	   customers    TABLE     �   CREATE TABLE "ecommerce-data-analysis".customers (
    customer_id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    registration_date integer
);
 0   DROP TABLE "ecommerce-data-analysis".customers;
       ecommerce-data-analysis         heap r       postgres    false    5            �            1259    16597    order_items    TABLE     �   CREATE TABLE "ecommerce-data-analysis".order_items (
    order_item_id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer,
    price integer
);
 2   DROP TABLE "ecommerce-data-analysis".order_items;
       ecommerce-data-analysis         heap r       postgres    false    5            �            1259    16587    orders    TABLE     �   CREATE TABLE "ecommerce-data-analysis".orders (
    order_id integer NOT NULL,
    customer_id integer,
    order_date integer,
    status character varying(255)
);
 -   DROP TABLE "ecommerce-data-analysis".orders;
       ecommerce-data-analysis         heap r       postgres    false    5            �            1259    16622    payments    TABLE     �   CREATE TABLE "ecommerce-data-analysis".payments (
    payment_id integer NOT NULL,
    order_id integer,
    payment_date integer,
    amount integer,
    payment_method character varying(255)
);
 /   DROP TABLE "ecommerce-data-analysis".payments;
       ecommerce-data-analysis         heap r       postgres    false    5            �            1259    16577    products    TABLE     �   CREATE TABLE "ecommerce-data-analysis".products (
    product_id integer NOT NULL,
    name character varying(255),
    price integer,
    category_id integer
);
 /   DROP TABLE "ecommerce-data-analysis".products;
       ecommerce-data-analysis         heap r       postgres    false    5            �            1259    16612    returns    TABLE     �   CREATE TABLE "ecommerce-data-analysis".returns (
    return_id integer NOT NULL,
    order_item_id integer,
    return_date integer,
    reason character varying(255)
);
 .   DROP TABLE "ecommerce-data-analysis".returns;
       ecommerce-data-analysis         heap r       postgres    false    5            �          0    16565 
   categories 
   TABLE DATA           J   COPY "ecommerce-data-analysis".categories (category_id, name) FROM stdin;
    ecommerce-data-analysis               postgres    false    217    -       �          0    16570 	   customers 
   TABLE DATA           c   COPY "ecommerce-data-analysis".customers (customer_id, name, email, registration_date) FROM stdin;
    ecommerce-data-analysis               postgres    false    218   �-       �          0    16597    order_items 
   TABLE DATA           n   COPY "ecommerce-data-analysis".order_items (order_item_id, order_id, product_id, quantity, price) FROM stdin;
    ecommerce-data-analysis               postgres    false    221   �2       �          0    16587    orders 
   TABLE DATA           ^   COPY "ecommerce-data-analysis".orders (order_id, customer_id, order_date, status) FROM stdin;
    ecommerce-data-analysis               postgres    false    220   /8       �          0    16622    payments 
   TABLE DATA           q   COPY "ecommerce-data-analysis".payments (payment_id, order_id, payment_date, amount, payment_method) FROM stdin;
    ecommerce-data-analysis               postgres    false    223   A:       �          0    16577    products 
   TABLE DATA           [   COPY "ecommerce-data-analysis".products (product_id, name, price, category_id) FROM stdin;
    ecommerce-data-analysis               postgres    false    219   =       �          0    16612    returns 
   TABLE DATA           c   COPY "ecommerce-data-analysis".returns (return_id, order_item_id, return_date, reason) FROM stdin;
    ecommerce-data-analysis               postgres    false    222   �@       9           2606    16569    categories categories_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY "ecommerce-data-analysis".categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);
 W   ALTER TABLE ONLY "ecommerce-data-analysis".categories DROP CONSTRAINT categories_pkey;
       ecommerce-data-analysis                 postgres    false    217            ;           2606    16576    customers customers_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY "ecommerce-data-analysis".customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 U   ALTER TABLE ONLY "ecommerce-data-analysis".customers DROP CONSTRAINT customers_pkey;
       ecommerce-data-analysis                 postgres    false    218            A           2606    16601    order_items order_items_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY "ecommerce-data-analysis".order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);
 Y   ALTER TABLE ONLY "ecommerce-data-analysis".order_items DROP CONSTRAINT order_items_pkey;
       ecommerce-data-analysis                 postgres    false    221            ?           2606    16591    orders orders_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY "ecommerce-data-analysis".orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 O   ALTER TABLE ONLY "ecommerce-data-analysis".orders DROP CONSTRAINT orders_pkey;
       ecommerce-data-analysis                 postgres    false    220            E           2606    16626    payments payments_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY "ecommerce-data-analysis".payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);
 S   ALTER TABLE ONLY "ecommerce-data-analysis".payments DROP CONSTRAINT payments_pkey;
       ecommerce-data-analysis                 postgres    false    223            =           2606    16581    products products_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY "ecommerce-data-analysis".products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 S   ALTER TABLE ONLY "ecommerce-data-analysis".products DROP CONSTRAINT products_pkey;
       ecommerce-data-analysis                 postgres    false    219            C           2606    16616    returns returns_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY "ecommerce-data-analysis".returns
    ADD CONSTRAINT returns_pkey PRIMARY KEY (return_id);
 Q   ALTER TABLE ONLY "ecommerce-data-analysis".returns DROP CONSTRAINT returns_pkey;
       ecommerce-data-analysis                 postgres    false    222            H           2606    16602 %   order_items order_items_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "ecommerce-data-analysis".order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES "ecommerce-data-analysis".orders(order_id);
 b   ALTER TABLE ONLY "ecommerce-data-analysis".order_items DROP CONSTRAINT order_items_order_id_fkey;
       ecommerce-data-analysis               postgres    false    220    4671    221            I           2606    16607 '   order_items order_items_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "ecommerce-data-analysis".order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES "ecommerce-data-analysis".products(product_id);
 d   ALTER TABLE ONLY "ecommerce-data-analysis".order_items DROP CONSTRAINT order_items_product_id_fkey;
       ecommerce-data-analysis               postgres    false    219    221    4669            G           2606    16592    orders orders_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "ecommerce-data-analysis".orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES "ecommerce-data-analysis".customers(customer_id);
 [   ALTER TABLE ONLY "ecommerce-data-analysis".orders DROP CONSTRAINT orders_customer_id_fkey;
       ecommerce-data-analysis               postgres    false    218    4667    220            K           2606    16627    payments payments_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "ecommerce-data-analysis".payments
    ADD CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES "ecommerce-data-analysis".orders(order_id);
 \   ALTER TABLE ONLY "ecommerce-data-analysis".payments DROP CONSTRAINT payments_order_id_fkey;
       ecommerce-data-analysis               postgres    false    223    220    4671            F           2606    16582 "   products products_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "ecommerce-data-analysis".products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES "ecommerce-data-analysis".categories(category_id);
 _   ALTER TABLE ONLY "ecommerce-data-analysis".products DROP CONSTRAINT products_category_id_fkey;
       ecommerce-data-analysis               postgres    false    4665    219    217            J           2606    16617 "   returns returns_order_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "ecommerce-data-analysis".returns
    ADD CONSTRAINT returns_order_item_id_fkey FOREIGN KEY (order_item_id) REFERENCES "ecommerce-data-analysis".order_items(order_item_id);
 _   ALTER TABLE ONLY "ecommerce-data-analysis".returns DROP CONSTRAINT returns_order_item_id_fkey;
       ecommerce-data-analysis               postgres    false    221    222    4673            �   S   x��I� �s�c���/���� �_�\�-Y�p�+�)ao��p�e�p�D�-h�Son������L_�ё� ^=r      �   �  x�eV�n�H}.���\�<��$J6�QXm�վv�;�ݨ��e�~O<@�%JB�\unEB+/�����UյX�0�vF�f#��+�V�]aJ��e��w��W��ko9</�e�o��gQF�R+�8�%^,�;8��l�W�����zM�.��1����M?T�����@}q:O�)�boU�8~�6-w���<���^��N�zx(G3ze�'��tQ�Ʋ�m-wy�޻�,���&Z���\�#k�J�-��t��-���)�1�{���������fӰ�cu���WƜ�CՒ����J���
s�^KW�m�F�=�݆i�Q2��N���i4~����h.�}%c�b7ڟ!��$���iES47֔Vm`���<JRza5<}�ˎ��Z�qkc��ԃ� ��V�x�(_��ɖW@�$J&�f�ī=f�ܚ�Zә|�;�wku�c�)��
S=l+M{ t��D�E����Rw:~�&�'�u������9��P������l���Qz�����+���v�2�:6��X�<��Fep�o�gQ��GX���1DrRb+PA[)/�����tL+��P\A�60Z����:�����(��WFw�#�J�-�'�
�FiJ�x;��4ƀɍ9�L�ѷ����LU0N�����z�D�?r�%�����*lyFm<��)�ȧ�}�\A|���I������#x1љ�W�G��N�s�zN�V��vg? =_�� yؾ�τtA/!�D�O�NE:��ނ����v�%H�`����B%<���	16�7�PX�г+�4uy[�FYB��:�xg+��轱�K��ly�ae)�f-Eq�mD����7|��e�ePsȴ�A���A����E`�N8΢��P?�B&�j���-,�.a��tJO'I>�	@N��E�s��NĜi\D|(Z+\���f:��כ���9=b�߆ �ĵ*x:�-��lA�3 �	]H��)���gA�D8��W��@[���Ư�M����I��]@�h��ˀP�G!�&	������
�nwG�t��'��Tp�_R������Xu��(��~?Ų��Z<S�O�_��q��!u��p=oB��������'�R~�_�^��`�䮨U��-�h2��:�R�n��m��}�d��.�އk�Zu�^!_�3Y�J0��
����3�M����I_��h�)>��5)� ͣ�����ϗ�u:�.���u��;��Y8�,��.��� �mI      �   �  x�5�m�E)D�b&�s/��u�9ܞ���^�(
��h��N��h��y���l'\G{'��S��jD�`��5ܯ�N�X��9�8-��߶�er.~����*{����^m��#�O8��f����������ڷs�j����A��n�h���c�$��k��ا���(���o�>~-� X�肓4�ٳ�a�|m��#5|?�Ð�'G`Kd�M�mw�,q�h�` �|cy��N��v���u������A!�Ȏ�S��;@�p��̞up���[�l[w��m!޼�-/��'�������<�AAWT@��d��S��v����z���K���*a� 3�9D���� 5�Bv�Q\\�⦥3��oYɋ1h�ǻ}_'�[�"pRXa%�<�׹���̄r8[�^6��^T�]B��Xc�U���k�~˟���J�!���!�rb�8�ܝ�r�<`��xS��<�Fb�q�Ƹ��yv\U՟X\��>zº �K�65�}��tfv��%ǠbE�i���������$�{�z�X�����Y���eb{va����]9KcI�:	����/��>1˂-���k���/�;
P���ͪKa��Yt.�o����
�`
O�BUb����k��6��J�Ҵ�������K�����?��>6(c���'�A�����WMW�����cvO)���?<_�-���E�\���$0���<��s]L;擔.~�Y��U,���Vv ��e���_��V2o5uy;fU�zv��2�U�=�Ԭ<#��Y�Aw�E)��4.���ǅQ�P:�K{�g����~��������P�əuk��m�V4z*�E�%���9t8�i����d(�Qz�\6^ԉ�1�ԥyk6��������6���A�V��������sQd{L��"�X6���VJ��%<��/A2�Fa���&���oX�kn�85�uGx5͉�QzܪR�#���������Z	G-��a�-R�D��쬓W=I7��HX�U�$��,֝�l8�k.~*�����p�8������O!�_Y7S6앿gJף�2���WM�(E�BFr���lY$��+��/��i��gŉb����͉�4����Q��7r�ͧ��kn9����-����T��I��������"�m`&��&�Ti�_#�D���;.�]t<��D��o������)C7�΁���(N�sy~��W�W���:�*�0�_vWpOp�;�끑Y]���.I�!(2n�EV�-wJ|�֑P��_ ��{s�x��j��--��tW"\���~��|!������ϫ���*�27E����	Y�ZO�)��{���?��x&��h��fu.ngB8�W	%�#>�k�b̈]]E�Ub��u����/c�f�^ k(�������O��?���      �     x�eTAn$1<ӏY��/{YMZ�#��QF���l�n�9�T�#J!(������c��1��ݟO L@J.F��a�A����
�	�QJ�U���q��?�UJS���s���Q��Q-F�]kdz~~������w����e⺊�8�	����Z��N>�x�w�]3����I��S��cr�K$j
]���<�A�������#�r�0j�Ƕs�Y�� [�&_��X��4���9�|?fҋ�ȶ���c�ކ0ᰉo�1�d�pXK�bN�r3�{�J0_��k��`�bN�.��:��*�c��d�v�o�Ua��hy1�TC፳?i���\3�z�ΐx�DNx�R�i
t�YHƽO�M�r1�ر��ļ^`�FS��f�qV3v��؝�ؾ$�OV3���Ow��{A?�=Z�1D�z��煳f���|\���~9��3YcO��Ks��Y����U�����N\6�ż~�:������Z��3s�+�����k۶�0��      �   �  x�eUI�T1\�O�	PI�¦�6 �>l�=��/yR��;�]eW�11�R�����??���*��-6�>>|{�������/o!�6�^�q��L��~�2����"r�w�<����Q��M��A��`��kЈ�HV������oD�q���3�@���{U����$"���~�k�N��|@�i��:8���d.4��^T;�h����
b���l�յBs�{ϫ9 ��}�B�yW5����DV�l*����*�\7T��$�M2ص�>��ֳt|���UR�+��������$��� gM�����Q4ъ��%�c�$�&k����"c�J'm���~�Izگ�-(�Pl���a�B:��U[e�`�ۂ��^~�]P�IxĶQ!$մ��붑N�`}CT'�Zm�BiK����� ��y�c��rvB��\��O�b�kB��+٤�8ԕ
�M.Tz6�B(S�w/�f�ѮsFC�wZ�ް7t?�#��9�Pn���)(��첵�=���/�7�-pP��K��+y�/�c7�tY�S���J�DP9��17`��������S�鞆g��	B��3,[k��M���&��?#��8�-����_�ktx���"�d���BSj���nT�QK9��Y9 �I>�ï$�~E��j�I�:����yH���z~ 0�{z��O��?��#jԂ      �   �  x�U�[o�6���?����v��hں^F��0ZF+X��v��{F� �����̙oF�}�.y�������r�[&��	C?�9����d����TH9�HG��
RS��Z�Z�R"%E�_�\�ZMJD:��������D�缒6I���S)'r:�]�詴��dR+M��>���y�S+�=�����gL�D����]�rtW��-(!YhQ�~�ʲg
1�*�Ǽ�FA[
BE�G��GX�J��|*ϯh	O�uJ�B+��������t�\�+؀OC_�ل������P�לY;�P��nuE�O{z#�z��.P��c�o�ܞ5�{m��X�N�uC��3FұB���p�(�}^Ģt/��.B*ԃ���H�Z���i�h��ԁ�Rە"������'��a��1�9�V<B�G�m�xײm�LVa���3� (9V���5@g:��B���j+�<�a=�Tvuf�ڐ�]����H<��ZP���چ�
��$��"bwV��$0�ݙ"�(�k�[�ű��|�'p�`�0�p�'���|"�o�sh]7,���0*1N�/I& *=ã5^���,8�w��1����=��۸Y��?�ϛ��0��t�;�y ���<\gY��n�ѹ�4�����@Y ���	$/e��{c��nX��;���x��$��q8v �gt�.k�<���!(:^J~��9	��&��% �y�l����1?Ց[�Qw����\"�9N̪<*0��`	y���d�Ma�8F;0Q�Ka�7#��NP�L�jz_[z8�V�տv~�à-7p��ȗ"7(��������Ny�'�)���+q�9��K1�aK���}b|y/6���>���#��E�-+��y� �TX0V��X���xp��#�S��������0|[�I�bf�k�F�#4�$�S��[TJ�ZO[�b��B� �zw�      �   �   x�uP��0;�_�/@u����l��&m�>�0!B��c��V�M���>?�����^v;�}��k�L x�X����q�����n��&R�V�� +� �p��'I��ێkC\�%
���(-N�rM���J�>���"�����'c����     