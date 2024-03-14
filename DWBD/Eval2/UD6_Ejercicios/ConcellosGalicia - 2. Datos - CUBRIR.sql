#*******************************************************************************************
#	UTILIZACIÓN DE LA BASE DE DATOS 'ConcellosGalicia'
#*******************************************************************************************
	USE ConcellosGalicia;
#*******************************************************************************************
#	DATOS DE LAS PROVINCIAS
#		El índice empecerá desde el número 10
#*******************************************************************************************
	INSERT INTO Provincia( nombre )	VALUES( 'A Coruña' );
	INSERT INTO Provincia( nombre )	VALUES( 'Lugo' );
	INSERT INTO Provincia( nombre )	VALUES( 'Ourense' );
	INSERT INTO Provincia( nombre )	VALUES( 'Pontevedra' );    
#*******************************************************************************************
#	DATOS DE LAS COMARCAS
#		El índice empecerá desde el número 100
#*******************************************************************************************
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Arzúa', 10 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Barbanza', 10 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'A Barcala', 10 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Bergantiños', 10 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Betanzos', 10 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'A Coruña', 10 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Eume', 10 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Ferrol', 10 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Fisterra', 10 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Muros', 10 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Noia', 10 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Ordes', 10 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Ortegal', 10 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Santiago', 10 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'O Sar', 10 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Terra de Melide', 10 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Terra de Soneira', 10 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Xallas', 10 );

    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Os Ancares', 11 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Chantada', 11 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'A Fonsagrada', 11 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Lugo', 11 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'A Mariña Central', 11 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'A Mariña Occidental', 11 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'A Mariña Oriental', 11 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Meira', 11 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Quiroga', 11 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Sarria', 11 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Terra Chá', 11 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Terra de Lemos', 11 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'A Ulloa', 11 );

    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Allariz-Maceda', 12 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Baixa Limia', 12 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'O Carballiño', 12 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'A Limia', 12 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Ourense', 12 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'O Ribadeo', 12 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Terra de Caldelas', 12 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Terra de Celanova', 12 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Terra de Trives', 12 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Valdeorras', 12 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Verín', 12 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Viana', 12 );

    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'O Baixo Miño', 13 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Caldas', 13 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'O Condado', 13 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Deza', 13 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'O Morrazo', 13 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'A Paradanta', 13 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Pontevedra', 13 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'O Salnés', 13 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Tabeirós-Terra de Montes', 13 );
    INSERT INTO	Comarca( nombre, idProvincia )	VALUES ( 'Vigo', 13 );

#*******************************************************************************************
#	DATOS DE LOS CONCELLOS
#		El índice empecerá desde el número 1000
#*******************************************************************************************
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Arzúa'							, 155.48	, 100 );	# Arzúa
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Boimorto'						,  82.34	, 100 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'O Pino'						, 132.15	, 100 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Touro'							, 115.34	, 100 );

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Boiro'							,  86.58	, 101 );	# Barbanza
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Pobra do Caramiñal'			,  32.51	, 101 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Rizanxo'						,  58.79	, 101 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Ribeira'						,  68.83	, 101 );

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Baña'						,  98.19	, 102 );	# A Barcala
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Negreira'						, 115.1		, 102 );

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cabana de Bergantiños'			, 100.23	, 103 );	# Bergantiños
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Carballo'						, 186.09	, 103 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Coristanco'					, 141.28	, 103 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Laracha'						, 125.95	, 103 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Laxe'							,  36.78	, 103 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Malpica de Bergantiños'		,  61.22	, 103 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Ponteceso'						,  91.97	, 103 );

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Aranga'						, 119.59	, 104 );	# Betanzos
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Betanzos'						,  24.21	, 104 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Coirós'						,  33.6		, 104 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Curtis'						, 116.7		, 104 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Irixoa'						,  68.59	, 104 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Miño'							,  32.97	, 104 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Oza-Cesuras'					, 151.62	, 104 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Paderne'						,  39.83	, 104 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Vilarmaior'					,  30.35	, 104 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Vilasantar'					,  59.17	, 104 );
    
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Abegondo'						,  83.9		, 105 );	# A Coruña
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Arteixo'						,  93.68	, 105 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Bergondo'						,  32.72	, 105 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cambre'						,  40.74	, 105 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Carral'						,  48.03	, 105 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Coruña'						,  37.83	, 105 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Culleredo'						,  61.73	, 105 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Oleiros'						,  43.66	, 105 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Sada'							,  27.49	, 105 );

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cabanas'						,  30.3		, 106 );	# EUME
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Capela'						,  58		, 106 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Monfero'						, 171.67	, 106 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Pontedueme'					,  29.26	, 106 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Pontes de García Rodríguez'	, 249.37	, 106 );

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Ares'							,  18.31	, 107 );	# FERROL
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cedeira'						,  85.42	, 107 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Fene'							,  26.31	, 107 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Ferrol'						,  82.65	, 107 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Moeche'						,  48.5		, 107 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Mugardos'						,  12.77	, 107 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Narón'							,  66.91	, 107 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Neda'							,  24.46	, 107 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'San Sadurniño'					,  98.98	, 107 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'As Somozas'					,  70.91	, 107 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Valdomiño'						,  88.22	, 107 );

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cee'							,  57.45	, 108 );	# FISTERRA
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Corcubión'						,   6.52	, 108 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Dumbría'						, 125.19	, 108 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Fisterra'						,  29.43	, 108 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Muxía'							, 121.19	, 108 );

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Carnota'						,  70.9		, 109 );	# MUROS
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Muros'							,  72.91	, 109 );

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Lousame'						,  93.65	, 110 );	# NOIA
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Noia'							,  37.21	, 110 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Outes'							,  99.74	, 110 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Porto do Son'					,  94.58	, 110 );

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cerceda'						, 111.27	, 111 );	# ORDES
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Frades'						,  81.56	, 111 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Mesía'							, 107.21	, 111 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Ordes'							, 157.23	, 111 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Oroso'							,  72.59	, 111 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Tordoia'						, 124.55	, 111 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Trazo'							, 101.3		, 111 );
    
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cariño'						,  47.19	, 112 );	# ORTEGAL
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cerdido'						,  52.72	, 112 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Mañon'							,  82.21	, 112 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Ortiguiera'					, 209.6 	, 112 );

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Ames'							,  80.1 	, 113 );	# SANTIAGO
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Boqueixón'						,  73.18	, 113 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Brión'							,  74.73	, 113 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Santiago de Compostela'		, 220.01	, 113 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Teo'							,  79.25	, 113 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Val do Dubra'					, 108.64	, 113 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'VEdra'							,  52.78	, 113 );

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Dobro'							,  36.12	, 114 );	# O SAR
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Padrón'						,  48.37	, 114 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Rois'							,  92.93	, 114 );

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Melide'						, 101.3		, 115 );	# TERRA DE MELIDE
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Santiso'						,  67.39	, 115 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Sobrado'						, 120.57	, 115 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Toques'						,  77.93	, 115 );

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Camariñas'						,  51.6 	, 116 );	# TERRA DE SONEIRA
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Vimianzo'						, 187.27	, 116 );
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Zas'							, 133.29	, 116 );

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Mazaricos'						, 187.3 	, 117 );	# XALLAS
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Santa Comba'					, 203.7 	, 117 );

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Baralla'						, 141.16	, 118 );	# OS ANCARES
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Becerreá'						, 172.05	, 118 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cervantes'						, 277.63	, 118 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Navia de Suarna'				, 243.85	, 118 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'As Nogais'						, 110.34	, 118 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Pedrafita do Cebreiro'			, 104.91	, 118 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Carballedo'					, 138.85	, 119 );	# CHANTADA
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Chantada'						, 176.73	, 119 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Taboada'						, 146.67	, 119 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Baleira'						, 168.82	, 120 );	# A FONSAGRADA
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Fonsagrada'					, 438.42	, 120 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Negueira de Muñiz'				,  72.27	, 120 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Castroverde'					, 174.15	, 121 );	# LUGO
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'O Corgo'						, 157.39	, 121 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Friol'							, 292.29	, 121 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Guntín'						, 154.78	, 121 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Lugo'							, 329.78	, 121 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Outiero de Rei'				, 134.2 	, 121 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Portomarín'					, 115.1 	, 121 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Rábade'						,   5.17	, 121 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Alfoz'							,  77.5 	, 122 );	# A MARIÑA CENTRAL
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Burela'						,   7.78	, 122 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Foz'							, 100.29	, 122 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Lourenzá'						,  62.64	, 122 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Mondoñedo'						, 142.69	, 122 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'O Valadouro'					, 110.45	, 122 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cervo'							,  77.86	, 123 );	# A MARIÑA OCCIDENTAL
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Ourol'							, 142.07	, 123 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'O Vicedo'						,  75.96	, 123 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Viveiro'						, 109.34	, 123 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Xove'							,  89.12	, 123 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Barreiros'						,  72.42	, 124 );	# A MARIÑA ORIENTAL
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Pontenova'					, 135.8 	, 124 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Ribadeo'						, 109.14	, 124 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Trabada'						,  82.59	, 124 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Meira'							,  46.55	, 125 );	# MEIRA
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Pol'							, 125.9 	, 125 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Ribeira de Piquín'				,  72.99	, 125 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Riotorto'						,  66.33	, 125 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Folgoso do courel'				, 193.32	, 126 );	# QUIROGA
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Quiroga'						, 317.38	, 126 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Ribas do Sil'					,  67.78	, 126 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'O Incio'						, 146.09	, 127 );	# SARRIA
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Láncara'						, 121.61	, 127 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Paradela'						, 121.12	, 127 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'O Páramo'						,  74.8 	, 127 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Samos'							, 136.77	, 127 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Sarria'						, 184.62	, 127 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Triacastela'					,  51.18	, 127 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Abadín'						, 196.04	, 128 );	# TERRA CHÁ
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Begonte'						, 126.8 	, 128 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Castro de Rei'					, 176.97	, 128 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cospeito'						, 144.79	, 128 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Guitiriz'						, 293.97	, 128 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Muras'							, 163.82	, 128 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Pastoriza'					, 174.99	, 128 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Vilalba'						, 379.36	, 128 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Xermade'						, 166.27	, 128 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Bóveda'						,  91.11	, 129 );	# TERRA DE LEMOS
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Monforte de Lemos'				, 199.52	, 129 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Pantón'						, 143.24	, 129 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Pobra do Brollón'			, 176.71	, 129 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'O Saviñao'						, 196.55	, 129 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Sober'							, 133.35	, 129 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Antas de Ulla'					, 103.6 	, 130 );	# A ULLOA
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Monterroso'					, 114.59	, 130 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Palas de Rei'					, 199.68	, 130 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Allariz'						,  86   	, 131 );	# ALLARIZ-MACEDA
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Baños de Molgas'				,  67.64	, 131 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Maceda'						, 101.93	, 131 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Paderne de Allariz'			,  38.76	, 131 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Xunqueira de Ambía'			,  60.21	, 131 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Xunqueira de Espadanedo'		,  27.65	, 131 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Bande'							,  98.96	, 132 );	# BAIXA LIMIA
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Entrimo'						,  84.52	, 132 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Lobeira'						,  68.88	, 132 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Lobios'						, 168.38	, 132 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Muíños'						, 109.56	, 132 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Beariz'						,  55.97	, 133 );	# O CARBALLIÑO
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Boborás'						,  87.82	, 133 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'O Carballiño'					,  54.33	, 133 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'O Irixo'						, 121.05	, 133 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Maside'						,  40.04	, 133 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Piñor'							,  52.69	, 133 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Punxín'						,  17.08	, 133 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'San Amaro'						,  29.03	, 133 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'San Cristovo de Cea'			,  94.44	, 133 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Baltar'						,  94.71	, 134 );	# A LIMIA
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Os Blancos'					,  47.56	, 134 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Calvos de Randín'				,  97.87	, 134 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Porqueira'						,  43.4 	, 134 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Rairiz de Veiga'				,  72.11	, 134 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Sandiás'						,  52.84	, 134 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Sarreaus'						,  77.29	, 134 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Trasmiras'						,  56.74	, 134 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Vilar de Barrio'				, 106.74	, 134 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Vilar de Santos'				,  20.7 	, 134 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Xinzo de Limia'				, 132.67	, 134 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Amoeiro'						,  39.68	, 135 );	# OURENSE
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Barbadás'						,  30.24	, 135 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Coles'							,  38.11	, 135 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Esgos'							,  37.79	, 135 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Nogueira de Ramuín'			,  98.31	, 135 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Ourense'						,  84.55	, 135 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Pereiro de Aguiar'				,  60.89	, 135 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Peroxa'						,  54.52	, 135 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'San Cibrao das Viñas'			,  39.48	, 135 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Taboadela'						,  25.19	, 135 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Toén'							,  58.29	, 135 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Vilamarín'						,  56.09	, 135 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Arnoia'						,  20.69	, 136 );	# O RIBEIRO
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Avión'							, 121.13	, 136 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Beade'							,   6.4 	, 136 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Carballeda de Avia'			,  46.37	, 136 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Castrelo de Miño'				,  39.74	, 136 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cenlle'						,  29.03	, 136 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cortegada'						,  26.89	, 136 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Leiro'							,  38.25	, 136 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Melón'							,  53.25	, 136 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Ribadavia'						,  25.16	, 136 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Castro Caldelas'				,  87.61	, 137 );	# TERRA DE CALDELAS
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Montederramo'					, 135.57	, 137 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Parada de Sil'					,  62.43	, 137 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Teixeira'					,  27.64	, 137 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Bola'						,  34.9 	, 138 );	# TERRA DE CELANOVA
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cartelle'						,  94.29	, 138 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Celanova'						,  66.31	, 138 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Gomesende'						,  28.31	, 138 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Merca'						,  50.99	, 138 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Padrenda'						,  57.04	, 138 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Pontedeva'						,   9.86	, 138 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Quintela de Leirado'			,  31.26	, 138 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Ramirás'						,  40.66	, 138 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Verea'							,  94.23	, 138 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Chandrexa de Queixa'			, 171.81	, 139 );	# TERRA DE TRIVES
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Manzaneda'						, 114.57	, 139 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Pobra de Trives'				,  84.2 	, 139 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'San Xoán de Río'				,  61.14	, 139 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'O Barco de Valdeorras'			,  85.43	, 140 );	# VALDEORRAS
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'O Bolo'						,  91.17	, 140 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Carballeda de Valdeorras'		, 222.69	, 140 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Larouco'						,  23.69	, 140 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Petín'							,  30.48	, 140 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Rúa'							,  35.91	, 140 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Rubiá'							, 100.79	, 140 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Veiga'						, 290.49	, 140 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Vilamartín de Valdeorras'		,  88.26	, 140 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Catrelo do Val'				, 122.05	, 141 );	# VERÍN
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cualedro'						, 117.77	, 141 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Laza'							, 215.91	, 141 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Monterrei'						, 119.14	, 141 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Oímbra'						,  71.48	, 141 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Riós'							, 114.27	, 141 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Verín'							,  94.11	, 141 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Vilardevós'					, 152.55	, 141 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Gudiña'						, 171.42	, 142 );	# VIANA
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Mezquita'					, 104.27	, 142 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Viana do Bolo'					, 270.41	, 142 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Vilariño de Conso'				, 200.23	, 142 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Guarda'						,  20.5 	, 143 );	# O BIAXO MIÑO
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Oia'							,  83.3 	, 143 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'O Rosal'						,  44.13	, 143 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Tomiño'						, 106.61	, 143 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Tui'							,  68.32	, 143 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Caldas de Reis'				,  68.25	, 144 );	# CALDAS
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Catoira'						,  29.44	, 144 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cuntis'						,  79.88	, 144 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Moraña'						,  41.24	, 144 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Pontecesures'					,   6.69	, 144 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Portas'						,  22.71	, 144 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Valga'							,  40.64	, 144 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Mondariz'						,  82.33	, 145 );	# O CONDADO
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Mondariz-Balneario'			,   2.31	, 145 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'As Neves'						,  65.84	, 145 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Ponteareas'					, 125.53	, 145 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Salvaterra do Miño'			,  62.54	, 145 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Agolada'						, 147.85	, 146 );	# DEZA
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Dozón'							,  74.1 	, 146 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Lalín'							, 326.96	, 146 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Rodeiro'						, 154.91	, 146 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Silleda'						, 167.96	, 146 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Vila de Cruces'				, 154.96	, 146 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Bueu'							,  30.84	, 147 );	# O MORRAZO
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cangas'						,  38.08	, 147 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Marín'							,  36.66	, 147 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Moaña'							,  35.06	, 147 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Arbo'							,  42.66	, 148 );	# A PARADANTA
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Cañiza'						, 105.04	, 148 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Covelo'						, 134.7 	, 148 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Crecente'						,  57.46	, 148 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Barro'							,  37.55	, 149 );	# PONTEVEDRA
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Campo Lameiro'					,  63.77	, 149 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cerdedo-Cotobade'				, 213.27	, 149 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Lama'						, 111.76	, 149 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Poio'							,  33.93	, 149 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Ponte Caldelas'				,  87   	, 149 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Pontevedra'					, 118.47	, 149 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Vilaboa'						,  36.9 	, 149 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Cambados'						,  23.44	, 150 );	# O SALNÉS
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'O Grove'						,  21.89	, 150 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Illa de Arousa'				,   6.91	, 150 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Meaño'							,  27.77	, 150 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Meis'							,  52.39	, 150 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Ribadumia'						,  19.71	, 150 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Sanxenxo'						,  45.08	, 150 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Vilagarcía de Arousa'			,  44.24	, 150 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Vilanova de Arousa'			,  33.65	, 150 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'A Estrada'						, 280.74	, 151 );	# TABEIRÓS-TERRA DE MONTES
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Forcarei'						, 169.66	, 151 );	

    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Baiona'						,  34.47	, 152 );	# VIGO
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Fornelo de Montes'				,  79.01	, 152 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Gondomar'						,  74.51	, 152 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Mos'							,  53.29	, 152 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Nigrán'						,  34.77	, 152 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Pazos de Borbén'				,  49.99	, 152 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'O Porriño'						,  61.17	, 152 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Redondela'						,  52.08	, 152 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Salceda de Caselas'			,  35.92	, 152 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Soutomaior'					,  24.99	, 152 );	
    INSERT INTO Concello( nombre, superficie, idComarca )	VALUES( 'Vigo'							, 109.06	, 152 );	

#*******************************************************************************************
#	DATOS DE LA POBLACION
#*******************************************************************************************
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1000,     2983,     2981 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1001,      971,      972 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1002,     2290,     2349 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1003,     1765,     1730 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1004,     9749,     9206 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1005,     4748,     4543 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1006,     5622,     5382 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1007,    13605,    13234 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1008,     1792,     1597 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1009,     3507,     3268 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1010,     2163,     2022 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1011,    16067,    15347 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1012,     3054,     2824 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1013,     5852,     5669 );
 	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1014,     1493,     1511 );
   	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1015,     2727,     2605 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1016,     2727,     2730 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1017,      892,      941 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1018,     6843,     6187 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1019,      944,      929 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1020,     2033,     2048 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1021,      663,      677 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1022,     3209,     3214 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1023,     2559,     2611 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1024,     1208,     1185 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1025,      593,      626 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1026,      576,      643 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1027,     2793,     2701 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1028,    16622,    16272 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1029,     3486,     3331 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1030,    12630,    11986 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1031,     3342,     3232 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1032,   131662,   113806 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1033,    15938,    14820 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1034,    19091,    17831 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1035,     8376,     8006 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1036,     1714,     1645 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1037,      625,      617 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1038,      931,      977 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1039,     4004,     3683 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1040,     5132,     4900 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1041,     3046,     2951 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1042,     3326,     3324 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1043,     6718,     6114 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1044,    34312,    30473 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1045,      627,      573 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1046,     2684,     2542 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1047,    20062,    18851 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1048,     2581,     2451 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1049,     1417,     1395 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1050,      529,      547 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1051,     3515,     3357 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1052,     3951,     3617 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1053,      811,      795 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1054,     1522,     1405 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1055,     2321,     2393 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1056,     2371,     2193 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1057,     2033,     1821 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1058,     4351,     4048 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1059,     1617,     1618 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1060,     7430,     6810 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1061,     3193,     2957 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1062,     4598,     4557 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1063,     2530,     2466 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1064,     1171,     1135 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1065,     1246,     1233 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1066,     6445,     6160 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1067,     3812,     3718 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1068,     1694,     1534 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1069,     1556,     1503 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1070,     1908,     1855 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1071,      547,      528 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1072,      663,      646 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1073,     2891,     2594 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1074,    16614,    15379 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1075,     2136,     2050 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1076,     4130,     3817 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1077,    52353,    45505 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1078,     9591,     9187 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1079,     1987,     1829 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1080,     2554,     2478 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1081,     1406,     1304 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1082,     4306,     4011 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1083,     2348,     2145 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1084,     3766,     3661 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1085,      735,      794 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1086,      855,      923 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1087,      537,      564 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1088,     2672,     2552 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1089,     3577,     3348 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1090,     2276,     2108 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1091,     1997,     1809 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1092,     4821,     4538 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1093,     1166,     1279 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1094,     1412,     1414 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1095,      546,      742 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1096,      457,      584 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1097,      477,      541 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1098,      431,      512 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1099,     1058,     1065 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1100,     4203,     3931 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1101,     1400,     1289 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1102,      549,      641 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1103,     1577,     1751 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1104,      103,      120 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1105,     1266,     1343 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1106,     1674,     1766 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1107,     1808,     1874 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1108,     1284,     1354 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1109,    52574,    45039 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1110,     2531,     2685 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1111,      665,      717 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1112,      770,      754 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1113,      829,      781 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1114,     4711,     4717 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1115,     5198,     4880 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1116,     1097,     1032 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1117,     1851,     1629 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1118,     1025,      935 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1119,     2121,     2071 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1120,      478,      506 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1121,      845,      812 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1122,     7827,     7485 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1123,     1636,     1724 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1124,     1543,     1458 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1125,     1149,     1058 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1126,     5194,     4677 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1127,      576,      538 );
   	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1128,      855,      876 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1129,      818,      816 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1130,      243,      270 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1131,      606,      607 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1132,      477,      512 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1133,     1670,     1481 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1134,      465,      481 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1135,      750,      771 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1136,     1246,     1305 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1137,      862,      861 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1138,      672,      675 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1139,      574,      648 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1140,     6811,     6446 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1141,      314,      313 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1142,     1153,     1144 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1143,     1484,     1492 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1144,     2577,     2533 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1145,     2232,     2142 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1146,     2720,     2735 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1147,      301,      310 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1148,     1444,     1474 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1149,     7278,     6728 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1150,      901,      867 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1151,      689,      718 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1152,     9567,     8675 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1153,     1224,     1205 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1154,      821,      794 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1155,     1784,     1805 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1156,     1143,     1100 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1157,      981,      954 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1158,     1791,     1771 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1159,     1637,     1679 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1160,     3180,     3134 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1161,      740,      743 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1162,     1433,     1416 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1163,      699,      674 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1164,      677,      689 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1165,      373,      365 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1166,      735,      755 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1167,      589,      539 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1168,      386,      383 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1169,      834,      838 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1170,      715,      732 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1171,      531,      440 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1172,     1154,     1052 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1173,     7449,     6462 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1174,      727,      674 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1175,     1368,     1350 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1176,      565,      597 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1177,      364,      340 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1178,      546,      502 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1179,     1056,     1016 );
   	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1180,      423,      496 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1181,      341,      404 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1182,      350,      367 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1183,      446,      381 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1184,      598,      625 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1185,      616,      565 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1186,      567,      547 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1187,      629,      632 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1188,      622,      636 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1189,      407,      384 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1190,     4939,     4682 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1191,     1154,     1179 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1192,     5627,     5395 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1193,     1531,     1594 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1194,      545,      564 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1195,     1014,     1053 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1196,    57188,    47408 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1197,     3117,     3353 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1198,      920,      906 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1199,     2728,     2781 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1200,      714,      738 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1201,     1156,     1218 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1202,      904,      978 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1203,      479,      473 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1204,      948,      790 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1205,      181,      198 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1206,      639,      610 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1207,      653,      668 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1208,      552,      542 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1209,      538,      523 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1210,      767,      743 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1211,      587,      548 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1212,     2554,     2451 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1213,      583,      599 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1214,      327,      378 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1215,      256,      288 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1216,      164,      172 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1217,      567,      508 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1218,     1305,     1265 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1219,     2999,     2653 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1220,      351,      342 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1221,      971,      968 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1222,      854,      799 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1223,      250,      241 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1224,      342,      272 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1225,      802,      705 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1226,      473,      441 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1227,      219,      263 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1228,      431,      415 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1229,     1015,     1000 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1230,      243,      262 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1231,     6888,     6496 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1232,      408,      420 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1233,      701,      759 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1234,      219,      208 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1235,      443,      436 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1236,     2136,     2109 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1237,      708,      682 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1238,      434,      452 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1239,      897,      940 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1240,      490,      489 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1241,      779,      860 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1242,      590,      632 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1243,     1221,     1280 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1244,      777,      936 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1245,      710,      749 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1246,     7100,     6544 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1247,      843,      938 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1248,      607,      625 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1249,      478,      528 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1250,     1372,     1415 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1251,      220,      293 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1252,     5095,     4896 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1253,     1567,     1537 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1254,     3237,     3139 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1255,     6838,     6892 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1256,     8952,     8446 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1257,     5060,     4728 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1258,     1712,     1604 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1259,     2429,     2214 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1260,     2123,     1998 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1261,     1570,     1511 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1262,     1475,     1385 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1263,     2933,     2835 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1264,     2217,     2177 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1265,      332,      343 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1266,     1920,     1850 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1267,    11821,    11121 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1268,     5021,     5027 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1269,     1113,     1115 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1270,      507,      550 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1271,    10344,     9855 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1272,     1169,     1192 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1273,     4549,     4296 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1274,     2566,     2531 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1275,     6098,     5889 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1276,    13443,    13265 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1277,    12153,    12095 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1278,    10027,     9469 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1279,     1249,     1350 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1280,     2603,     2512 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1281,     1191,     1264 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1282,     1009,      952 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1283,     1844,     1778 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1284,      938,      831 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1285,     2939,     2780 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1286,     1215,     1195 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1287,     8684,     8546 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1288,     2863,     2685 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1289,    43800,    39314 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1290,     3040,     2915 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1291,     7073,     6600 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1292,     5450,     5249 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1293,     2516,     2435 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1294,     2723,     2591 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1295,     2485,     2311 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1296,     2641,     2516 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1297,     8924,     8711 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1298,    19546,    17999 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1299,     5310,     4996 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1300,    10525,     9736 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1301,     1711,     1557 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1302,     6243,     6043 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1303,      828,      766 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1304,     7483,     7437 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1305,     7692,     7498 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1306,     9148,     8857 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1307,     1516,     1459 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1308,    10297,     9915 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1309,    15042,    14150 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1310,     4614,     4635 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1311,     3749,     3733 );
	INSERT INTO Poblacion( año, idConcello, mujeres, hombres )	VALUES ( 2021, 1312,   155203,   138634 );

