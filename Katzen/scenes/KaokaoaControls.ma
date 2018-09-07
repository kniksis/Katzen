//Maya ASCII 2018 scene
//Name: KaokaoaControls.ma
//Last modified: Thu, Sep 06, 2018 03:29:35 PM
//Codeset: 1252
requires maya "2018";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2018";
fileInfo "version" "2018";
fileInfo "cutIdentifier" "201706261615-f9658c4cfc";
fileInfo "osv" "Microsoft Windows 8 Business Edition, 64-bit  (Build 9200)\n";
fileInfo "license" "student";
createNode transform -n "Kaokaoa_ctrls";
	rename -uid "050CC099-4416-D2A5-637D-08856E24AFA3";
createNode transform -n "Kaokaoa_ctrl_master_crv_gp" -p "Kaokaoa_ctrls";
	rename -uid "DFF0B455-4524-997C-8DC2-DCAC15DDB0EE";
	setAttr ".rp" -type "double3" -1.0658141036401503e-14 49 1 ;
	setAttr ".sp" -type "double3" -1.0658141036401503e-14 49 1 ;
createNode transform -n "Kaokaoa_ctrl_master_crv" -p "Kaokaoa_ctrl_master_crv_gp";
	rename -uid "01A8D2DF-4DD9-533C-E9D5-629DA200643A";
	addAttr -ci true -sn "IKBracoEsqFilho" -ln "IKBracoEsqFilho" -nn "IK Braco Esq Filho - Ombro: 0 / Root: 5 / Master: 10" 
		-min 0 -max 10 -at "double";
	addAttr -ci true -sn "IKBracoDirFilho" -ln "IKBracoDirFilho" -nn "IK Braco Dir Filho - Ombro: 0 / Root: 5 / Master: 10" 
		-min 0 -max 10 -at "double";
	addAttr -ci true -sn "IKPernasEsqFilho" -ln "IKPernasEsqFilho" -nn "IK Pernas Esq Filho - Root: 0 / Master: 5" 
		-min 0 -max 5 -at "double";
	addAttr -ci true -sn "IKPernasDirFilho" -ln "IKPernasDirFilho" -nn "IK Pernas Dir Filho - Root: 0 / Master: 5" 
		-min 0 -max 5 -at "double";
	addAttr -ci true -sn "BlendPernaEsq" -ln "BlendPernaEsq" -nn "Blend Perna Esq - IK: 0 / FK: 10" 
		-min 0 -max 10 -at "double";
	addAttr -ci true -sn "BlendPernaDir" -ln "BlendPernaDir" -nn "Blend Perna Dir - IK: 0 / FK: 10" 
		-min 0 -max 10 -at "double";
	addAttr -ci true -sn "BlendBracoEsq" -ln "BlendBracoEsq" -nn "Blend Braco Esq - IK: 0 / FK: 10" 
		-min 0 -max 10 -at "double";
	addAttr -ci true -sn "BlendBracoDir" -ln "BlendBracoDir" -nn "Blend Braco Dir - IK: 0 / FK: 10" 
		-min 0 -max 10 -at "double";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".rp" -type "double3" -1.0658141036401504e-14 49.000000000000007 1.0000000000000002 ;
	setAttr ".sp" -type "double3" -1.0658141036401504e-14 49.000000000000007 1.0000000000000002 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0 1 1 ;
	setAttr -k on ".IKBracoEsqFilho" 5;
	setAttr -k on ".IKBracoDirFilho" 5;
	setAttr -k on ".IKPernasEsqFilho" 5;
	setAttr -k on ".IKPernasDirFilho" 5;
	setAttr -k on ".BlendPernaEsq";
	setAttr -k on ".BlendPernaDir";
	setAttr -k on ".BlendBracoEsq";
	setAttr -k on ".BlendBracoDir";
createNode nurbsCurve -n "Kaokaoa_ctrl_master_crvShape" -p "Kaokaoa_ctrl_master_crv";
	rename -uid "4F2A6C83-4920-F276-114F-5EBB410DDB7A";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 32 0 no 3
		33 0 0.19603428065912118 0.39206856131824236 0.58810284197736351 0.78413712263648472
		 0.98017140329560593 1.176205683954727 1.3722399646138481 1.5682742452729692 1.7643085259320903
		 1.9603428065912114 2.1563770872503327 2.352411367909454 2.5484456485685754 2.7444799292276967
		 2.9405142098868176 3.1365484905459384 3.3325827712050593 3.5286170518641802 3.7246513325233011
		 3.9206856131824224 4.1167198938415437 4.3127541745006646 4.5087884551597854 4.7048227358189063
		 4.9008570164780272 5.0968912971371481 5.2929255777962689 5.4889598584553898 5.6849941391145107
		 5.8810284197736316 6.0770627004327524 6.2730969810918733
		33
		2.4577474900517207e-15 1.6668602205253724e-14 -37.852678754863327
		-11.855764993325611 1.4210854715202007e-14 -31.126317569940351
		-7.544577723025391 1.4210854715202007e-14 -31.126317569940351
		-7.5445777230254114 1.4210854715202007e-14 -29.100514074526583
		-21.555936351501153 1.4210854715202007e-14 -21.55593635150117
		-29.100514074526554 1.4210854715202007e-14 -7.5445777230254256
		-30.717209300889134 1.4210854715202007e-14 -7.544577723025423
		-30.717209300889124 1.4690337464470526e-14 -11.855764993325646
		-38.261787023914536 1.4210854715202004e-14 -7.1283482034456856e-15
		-30.717209300889134 1.4210854715202004e-14 12.933561810900667
		-30.717209300889124 1.4210854715202004e-14 7.5445777230253821
		-29.100514074526544 1.4210854715202004e-14 7.5445777230253928
		-21.555936351501138 1.4210854715202004e-14 21.555936351501131
		-7.5445777230254052 1.4210854715202004e-14 29.100514074526533
		-7.5445777230254052 1.4210854715202004e-14 30.717209300889117
		-11.85576499332563 1.4210854715202004e-14 30.717209300889103
		-4.6858575492703396e-15 1.1753107225150286e-14 38.261787023914515
		11.855764993325622 1.4210854715202004e-14 30.717209300889103
		7.544577723025391 1.4210854715202004e-14 30.717209300889113
		7.544577723025391 1.4210854715202004e-14 29.100514074526522
		21.555936351501124 1.4210854715202004e-14 21.555936351501121
		29.100514074526526 1.4210854715202004e-14 7.5445777230253883
		30.717209300889106 1.4210854715202004e-14 7.5445777230253883
		30.717209300889106 1.4210854715202004e-14 12.933561810900677
		38.261787023914508 1.4210854715202004e-14 7.8136420431415543e-15
		30.717209300889106 1.4690337464470523e-14 -11.855764993325629
		30.717209300889106 1.4210854715202004e-14 -7.5445777230253963
		29.100514074526526 1.4210854715202004e-14 -7.5445777230253936
		21.555936351501131 1.4210854715202004e-14 -21.555936351501135
		7.5445777230253936 1.4210854715202004e-14 -29.10051407452654
		7.544577723025391 1.4210854715202004e-14 -31.126317569940309
		11.85576499332562 1.4210854715202004e-14 -31.126317569940298
		1.4712352815754146e-14 1.6668602205253718e-14 -37.852678754863277
		;
createNode transform -n "Kaokaoa_ctrl_root_crv_gp" -p "Kaokaoa_ctrl_master_crv";
	rename -uid "32337905-4A64-C5E5-8019-5D8102729E83";
	setAttr ".rp" -type "double3" -1.0658141036401503e-14 49 1 ;
	setAttr ".sp" -type "double3" -1.0658141036401503e-14 49 1 ;
createNode transform -n "Kaokaoa_ctrl_root_crv" -p "Kaokaoa_ctrl_root_crv_gp";
	rename -uid "A82E28F4-41D9-04CD-4E3A-21B5965CD084";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".rp" -type "double3" 3.944304526105059e-31 49.000000000000014 1.0000000000000018 ;
	setAttr ".sp" -type "double3" 3.944304526105059e-31 49.000000000000014 1.0000000000000018 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0 1 1 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_root_crvShape" -p "Kaokaoa_ctrl_root_crv";
	rename -uid "5C0AF003-4234-9508-A986-079BD9D9058C";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 19 0 no 3
		20 0 0.32918918056146779 0.65837836112293546 0.98756754168440308 1.3167567222458707
		 1.6459459028073384 1.9751350833688059 2.3043242639302735 2.633513444491741 2.9627026250532085
		 3.291891805614676 3.6210809861761435 3.950270166737611 4.2794593472990785 4.608648527860546
		 4.9378377084220135 5.267026888983481 5.5962160695449485 5.9254052501064161 6.2545944306678836
		
		20
		-10.516060992907894 47.999999999999986 -7.0000013222350894
		-10.516060992907896 40.000000000000007 -7.9999986777649177
		-2.2204460492503131e-15 31.999999999999968 -6.0000013222350859
		10.516060992907892 40.000000000000007 -7.9999986777649177
		10.516060992907892 47.999999999999986 -7.0000013222350921
		-10.516060992907896 47.999999999999986 -7.0000013222350912
		-10.516060992907896 47.999999999999986 10.999998677764902
		-10.516060992907896 40.000000000000007 11.999998677764898
		-10.516060992907896 40.000000000000007 -7.9999986777649177
		-10.516060992907896 40.000000000000014 11.999998677764884
		-2.2204460492503131e-15 31.999999999999993 9.9999986777648875
		-2.2204460492503131e-15 31.999999999999979 -6.0000013222350876
		-2.2204460492503131e-15 31.999999999999993 9.9999986777648946
		10.516060992907892 40 11.999998677764898
		10.516060992907892 40 -7.9999986777649177
		10.516060992907892 40 11.999998677764898
		10.516060992907892 47.999999999999986 10.999998677764902
		10.516060992907892 47.999999999999986 -7.0000013222350894
		10.516060992907892 47.999999999999986 10.999998677764891
		-10.516060992907894 47.999999999999986 10.999998677764898
		;
createNode transform -n "Kaokaoa_ctrl_barriga_crv_gp" -p "Kaokaoa_ctrl_root_crv";
	rename -uid "0EE6EF72-4564-1D4E-02B8-B3BC5AB7EA7B";
	setAttr ".rp" -type "double3" -1.0658141036401503e-14 49 1 ;
	setAttr ".sp" -type "double3" -1.0658141036401503e-14 49 1 ;
createNode transform -n "Kaokaoa_ctrl_barriga_crv" -p "Kaokaoa_ctrl_barriga_crv_gp";
	rename -uid "6E843970-4E11-5F5F-E39D-959EF1CBDFD0";
	setAttr ".rp" -type "double3" -1.0658141036401503e-14 49 1 ;
	setAttr ".sp" -type "double3" -1.0658141036401503e-14 49 1 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 1 0 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_barriga_crvShape" -p "Kaokaoa_ctrl_barriga_crv";
	rename -uid "AB17DBAE-43A0-BBDA-957E-17834F0F6E25";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		10.038165832201775 48.999998773483739 -6.6968053876423257
		2.5379601127801607e-15 49.000001226522706 -6.7391938388420245
		-10.03816583220177 48.999998773483739 -6.6968053876423239
		-10.080217470873031 48.999998773480371 3.4217611167279207
		-9.171950243428828 48.999998773478559 8.1702559611417254
		-3.5409899028002373e-15 48.999998773477301 11.970590426153981
		9.1719502434288245 48.999998773478559 8.1702559611417289
		10.080217470873031 48.999998773480371 3.421761116727926
		10.038165832201775 48.999998773483739 -6.6968053876423257
		2.5379601127801607e-15 49.000001226522706 -6.7391938388420245
		-10.03816583220177 48.999998773483739 -6.6968053876423239
		;
createNode transform -n "Kaokaoa_ctrl_peito_A_crv_gp" -p "Kaokaoa_ctrl_barriga_crv";
	rename -uid "D0287917-4771-D9E4-014F-419680811150";
	setAttr ".rp" -type "double3" 9.6458189268529455e-15 57.844791412353516 -0.16722868382930756 ;
	setAttr ".sp" -type "double3" 9.6458189268529455e-15 57.844791412353516 -0.16722868382930756 ;
createNode transform -n "Kaokaoa_ctrl_peito_A_crv" -p "Kaokaoa_ctrl_peito_A_crv_gp";
	rename -uid "37A9D2AE-47FD-E88C-B529-F69B31D54679";
	setAttr ".rp" -type "double3" 9.6458189268529455e-15 57.844791412353516 -0.16722868382930756 ;
	setAttr ".sp" -type "double3" 9.6458189268529455e-15 57.844791412353516 -0.16722868382930756 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 1 0 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_peito_A_crvShape" -p "Kaokaoa_ctrl_peito_A_crv";
	rename -uid "AE7644FE-4BA0-32CC-D275-A380CCC9B4DF";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		10.947870829195201 55.99999995975606 -9.2145782769529596
		-5.7420243674666652e-07 55.999999824323751 -9.2627906192192206
		-10.947871977600105 55.99999969085993 -9.2145234138178331
		-10.993734532589547 55.999999925245255 2.3008150981939526
		-10.003155877863762 56.000000063447608 8.4781738205763695
		-5.7420243618895578e-07 56.000000274535878 12.80308325826125
		10.003154729458938 56.000000309140091 8.4781236917028231
		10.993733384184965 56.000000195267823 2.3007600052275214
		10.947870829195201 55.99999995975606 -9.2145782769529596
		-5.7420243674666652e-07 55.999999824323751 -9.2627906192192206
		-10.947871977600105 55.99999969085993 -9.2145234138178331
		;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 1 0 ;
createNode transform -n "Kaokaoa_ctrl_ombro_esq_crv_gp" -p "Kaokaoa_ctrl_peito_A_crv";
	rename -uid "4B384966-4F7E-D5AD-1FBF-069AC6FED392";
	setAttr ".rp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
	setAttr ".sp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
createNode transform -n "Kaokaoa_ctrl_ombro_esq_crv" -p "Kaokaoa_ctrl_ombro_esq_crv_gp";
	rename -uid "98217847-4A69-B7CF-C14E-2FB112FA49B9";
	setAttr ".rp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
	setAttr ".sp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_ombro_esq_crvShape" -p "Kaokaoa_ctrl_ombro_esq_crv";
	rename -uid "8FCFA4ED-41BD-BB42-29DD-23B6F5FC717E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		7.1625952538039872 66.683959239813021 -6.0839506525860969
		6.2069901950152762 61.43586877084627 -9.0658605135242176
		7.9703582460669011 56.82032868228044 -6.8642665836741408
		11.879622020205064 55.918989690601776 -2.3688239315797572
		9.4605694894679555 56.945540356372845 8.5743737051611255
		8.2023121121900253 60.799702362915937 8.1375846445223345
		8.2787225947031793 66.287282393567551 3.5750900833742412
		8.6037008123545178 68.611582852375051 -1.9609800713857268
		7.1625952538039872 66.683959239813021 -6.0839506525860969
		6.2069901950152762 61.43586877084627 -9.0658605135242176
		7.9703582460669011 56.82032868228044 -6.8642665836741408
		;
createNode transform -n "Kaokaoa_Braco_A_esq_crv_FK_gp" -p "Kaokaoa_ctrl_ombro_esq_crv";
	rename -uid "F991A367-421C-1499-B43F-1CBAD0D21642";
	setAttr ".rp" -type "double3" 9.4597644805908203 62.559860229492188 -3.1267976760864258 ;
	setAttr ".sp" -type "double3" 9.4597644805908203 62.559860229492188 -3.1267976760864258 ;
createNode transform -n "Kaokaoa_Braco_A_esq_crv_FK" -p "Kaokaoa_Braco_A_esq_crv_FK_gp";
	rename -uid "432B588F-485A-EA27-68D1-1C85B58EC7B1";
	setAttr ".rp" -type "double3" 9.4597644805908221 62.559860229492188 -3.1267976760864267 ;
	setAttr ".sp" -type "double3" 9.4597644805908221 62.559860229492188 -3.1267976760864267 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode nurbsCurve -n "Kaokaoa_Braco_A_esq_crv_FKShape" -p "Kaokaoa_Braco_A_esq_crv_FK";
	rename -uid "10558FF1-4075-E097-4F3E-6FAC26629BFD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		10.227175739556573 56.338535838459535 -3.2202741942849853
		8.7968515894320767 61.79581993151929 -3.0535743285254959
		9.3462066297850495 67.03722316909645 -3.1176008231180212
		13.85408971523032 67.218464535673064 -3.6429877418599874
		17.973321395721999 66.093128448961096 -4.1230779303442864
		20.89782094062658 61.688152794690716 -4.4639239051780759
		17.897640233060393 56.95428337719229 -4.1142574058969874
		13.714283489520451 56.422011638740038 -3.6266935388173334
		10.227175739556573 56.338535838459535 -3.2202741942849853
		8.7968515894320767 61.79581993151929 -3.0535743285254959
		9.3462066297850495 67.03722316909645 -3.1176008231180212
		;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode transform -n "Kaokaoa_ctrl_cotovelo_esq_crv_FK_gp" -p "Kaokaoa_Braco_A_esq_crv_FK";
	rename -uid "8F91EBBC-4A6E-8ABD-0715-0391FCC87647";
	setAttr ".rp" -type "double3" 19.573843002319336 61.650009155273438 -4.302213191986084 ;
	setAttr ".sp" -type "double3" 19.573843002319336 61.650009155273438 -4.302213191986084 ;
createNode transform -n "Kaokaoa_ctrl_cotovelo_esq_crv_FK" -p "Kaokaoa_ctrl_cotovelo_esq_crv_FK_gp";
	rename -uid "9BD01EEA-4044-9FEE-1D8F-A88F0B09B8C1";
	setAttr ".rp" -type "double3" 19.573843002319336 61.650009155273438 -4.302213191986084 ;
	setAttr ".sp" -type "double3" 19.573843002319336 61.650009155273438 -4.302213191986084 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_cotovelo_esq_crv_FKShape" -p "Kaokaoa_ctrl_cotovelo_esq_crv_FK";
	rename -uid "D5233624-4B4C-0487-F2F3-6A8904FA1C1B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		20.537223361092753 65.460341142564118 -4.2202328941275056
		24.843969668902588 65.908413589406024 -3.8537380098073881
		29.325895883839642 64.297021840002174 -3.4723345897733844
		30.3657095605727 61.743811185709419 -3.3838475668081158
		28.515938731366326 58.571028657196891 -3.5412573528128268
		24.797241668200289 57.017872682185263 -3.8577109807305159
		20.442003523883141 58.000878193226114 -4.228333318486162
		19.573275319596412 61.556189231950526 -4.3022617932068989
		20.537223361092753 65.460341142564118 -4.2202328941275056
		24.843969668902588 65.908413589406024 -3.8537380098073881
		29.325895883839642 64.297021840002174 -3.4723345897733844
		;
createNode transform -n "Kaokaoa_ctrl_pulso_esq_crv_FK_gp" -p "Kaokaoa_ctrl_cotovelo_esq_crv_FK";
	rename -uid "0C11182A-410B-1406-0C6A-7AB3702EAD02";
	setAttr ".rp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".sp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
createNode transform -n "Kaokaoa_ctrl_pulso_esq_crv_FK" -p "Kaokaoa_ctrl_pulso_esq_crv_FK_gp";
	rename -uid "76FDF0C5-474F-49DC-7B0D-3E9CFF1E0BB2";
	setAttr ".rp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".sp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_pulso_esq_crv_FKShape" -p "Kaokaoa_ctrl_pulso_esq_crv_FK";
	rename -uid "B7AFC6A5-47E4-8BE2-0E00-5EB9A47D52F2";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		30.000001822926286 62.999999999999986 -5.1620469965131317
		29.999998663882792 60.999998986387595 -9.1620469965131317
		29.999998315716304 58.999999999999986 -5.1620469965131317
		29.99999481487529 54.999999999999993 -3.1620469965131326
		29.999999719155159 58.999999999999986 -1.1620469965131328
		30.000002825021497 61.000001013612376 2.8379530034868634
		30.000003226365575 62.999999999999986 -1.1620469965131328
		30.00000518512471 66.999999999999986 -3.1620469965131326
		30.000001822926286 62.999999999999986 -5.1620469965131317
		29.999998663882792 60.999998986387595 -9.1620469965131317
		29.999998315716304 58.999999999999986 -5.1620469965131317
		;
createNode transform -n "Kaokaoa_ctrl_mao_esq_crv_gp" -p "Kaokaoa_ctrl_ombro_esq_crv";
	rename -uid "2B3E9978-4D2C-DA1A-0EB1-569FB776E2FA";
	setAttr ".rp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".sp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
createNode transform -n "Kaokaoa_ctrl_mao_esq_crv" -p "Kaokaoa_ctrl_mao_esq_crv_gp";
	rename -uid "15EF863C-4776-B8D4-DB03-EF90663EE283";
	addAttr -ci true -sn "Polegar" -ln "Polegar" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "Polegar1" -ln "Polegar1" -dv 5 -min 0 -max 25 -at "double";
	addAttr -ci true -sn "Polegar2" -ln "Polegar2" -dv 5 -min 0 -max 25 -at "double";
	addAttr -ci true -sn "Polegar3" -ln "Polegar3" -dv 5 -min 0 -max 25 -at "double";
	addAttr -ci true -sn "PolegarAmplitude" -ln "PolegarAmplitude" -dv 15 -min 0 -max 
		25 -at "double";
	addAttr -ci true -sn "Indicador" -ln "Indicador" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "Indicado1" -ln "Indicado1" -nn "Indicador 1" -min 0 -max 25 
		-at "double";
	addAttr -ci true -sn "Indicador2" -ln "Indicador2" -min 0 -max 25 -at "double";
	addAttr -ci true -sn "Indicador3" -ln "Indicador3" -min 0 -max 25 -at "double";
	addAttr -ci true -sn "IndicadorAmplitude" -ln "IndicadorAmplitude" -min 0 -max 25 
		-at "double";
	addAttr -ci true -sn "Medio" -ln "Medio" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "Medio1" -ln "Medio1" -min 0 -max 25 -at "double";
	addAttr -ci true -sn "Medio2" -ln "Medio2" -min 0 -max 25 -at "double";
	addAttr -ci true -sn "Medio3" -ln "Medio3" -min 0 -max 25 -at "double";
	addAttr -ci true -sn "MedioAmplitude" -ln "MedioAmplitude" -min 0 -max 25 -at "double";
	addAttr -ci true -sn "Anelar" -ln "Anelar" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "Anelar1" -ln "Anelar1" -min 0 -max 25 -at "double";
	addAttr -ci true -sn "Anelar2" -ln "Anelar2" -min 0 -max 25 -at "double";
	addAttr -ci true -sn "Anelar3" -ln "Anelar3" -min 0 -max 25 -at "double";
	addAttr -ci true -sn "AnelarAmplitude" -ln "AnelarAmplitude" -min 0 -max 25 -at "double";
	setAttr ".rp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".sp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 0 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
	setAttr -k on ".Polegar";
	setAttr -k on ".Polegar1" 10;
	setAttr -k on ".Polegar2" 10;
	setAttr -k on ".Polegar3" 10;
	setAttr -k on ".PolegarAmplitude" 10;
	setAttr -k on ".Indicador";
	setAttr -k on ".Indicado1" 10;
	setAttr -k on ".Indicador2" 10;
	setAttr -k on ".Indicador3" 10;
	setAttr -k on ".IndicadorAmplitude" 10;
	setAttr -k on ".Medio";
	setAttr -k on ".Medio1" 10;
	setAttr -k on ".Medio2" 10;
	setAttr -k on ".Medio3" 10;
	setAttr -k on ".MedioAmplitude" 10;
	setAttr -k on ".Anelar";
	setAttr -k on ".Anelar1" 10;
	setAttr -k on ".Anelar2" 10;
	setAttr -k on ".Anelar3" 10;
	setAttr -k on ".AnelarAmplitude" 10;
createNode nurbsCurve -n "Kaokaoa_ctrl_mao_esq_crvShape" -p "Kaokaoa_ctrl_mao_esq_crv";
	rename -uid "F70027E3-46E4-8054-AD04-A59D86FC9C0D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 3 0 no 3
		4 0 1.7320508075688772 3.4641016151377544 5.1961524227066311
		4
		29.999999999999964 65.99999705427723 -3.000000000000004
		38.999999999999957 66.000002945722628 2
		38.999999999999972 66.000002945722628 -8
		29.999999999999964 65.99999705427723 -3.0000000000000067
		;
createNode transform -n "Kaokaoa_ctrl_mao_stick_esq_crv_gp" -p "Kaokaoa_ctrl_mao_esq_crv";
	rename -uid "34343E69-49CB-9C8B-742B-D2B31973F1A6";
	setAttr ".rp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".sp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
createNode transform -n "Kaokaoa_ctrl_mao_stick_esq_crv" -p "Kaokaoa_ctrl_mao_stick_esq_crv_gp";
	rename -uid "01EC036C-4986-C06D-9386-0C9EE0F22EF9";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".t" -type "double3" 0 0 1.4654943925052066e-14 ;
	setAttr ".rp" -type "double3" 36 66 -3 ;
	setAttr ".sp" -type "double3" 36 66 -3 ;
	setAttr ".mntl" -type "double3" -6 0 -5 ;
	setAttr ".mxtl" -type "double3" 3 0 5 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_mao_stick_esq_crvShape" -p "Kaokaoa_ctrl_mao_stick_esq_crv";
	rename -uid "E8145795-4D4F-DF83-6858-B08616347419";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 12 0 no 3
		13 0 0.51763809020504148 1.035276180410083 1.5529142706151244 2.0705523608201659
		 2.5881904510252074 3.1058285412302489 3.6234666314352904 4.1411047216403318 4.6587428118453733
		 5.1763809020504148 5.6940189922554563 6.2116570824604977
		13
		36.75 66 -3.25
		36.25 66 -3.25
		36.25 66 -3.75
		35.75 66 -3.75
		35.75 66 -3.25
		35.25 66 -3.25
		35.25 66 -2.75
		35.75 66 -2.75
		35.75 66 -2.25
		36.25 66 -2.25
		36.25 66 -2.75
		36.75 66 -2.75
		36.75 66 -3.25
		;
createNode parentConstraint -n "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1" -p
		 "Kaokaoa_ctrl_mao_esq_crv_gp";
	rename -uid "AF375AD4-48FB-E050-7CF9-CAA397BA277D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Mao_A_Esq_jntW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 5.1763168329443943e-07 -1.7842799451273095e-06 
		-1.1810866151762411e-07 ;
	setAttr ".tg[0].tor" -type "double3" 0.3604398880056271 2.7478153558409852 -1.2152551763810706 ;
	setAttr ".lr" -type "double3" 3.1557065980145834e-15 4.8026686291142219e-15 -4.7521959596085737e-16 ;
	setAttr ".rst" -type "double3" -3.5527136788005009e-15 -1.4210854715202004e-14 0 ;
	setAttr ".rsrr" -type "double3" 1.2424041724466862e-17 -7.9591517297365832e-16 3.1060104311167156e-18 ;
	setAttr -k on ".w0";
createNode transform -n "Kaokaoa_ctrl_cotovelo_esq_crv_IK_gp" -p "Kaokaoa_ctrl_ombro_esq_crv";
	rename -uid "0ACFF801-4FCA-894C-4EEB-FD890D1FD7C8";
	setAttr ".rp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
	setAttr ".sp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
createNode transform -n "Kaokaoa_ctrl_cotovelo_esq_crv_IK" -p "Kaokaoa_ctrl_cotovelo_esq_crv_IK_gp";
	rename -uid "6E3D800B-400C-08B9-92A2-16A20EB61648";
	setAttr ".rp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
	setAttr ".sp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 0 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_cotovelo_esq_crv_IKShape" -p "Kaokaoa_ctrl_cotovelo_esq_crv_IK";
	rename -uid "E57E9975-4147-6612-1C1A-BAA363B2E000";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 0.99999999999999989 1.9999999999999998 2.9999999999999996 3.9999999999999996
		 4.9999999999999991 5.9999999999999991
		7
		5.8921987351624674 61.495355821005717 -8.9223548271630264
		5.3271863365896683 66.482277653715158 -8.9068272513319773
		3.3604434934546608 66.482059356148326 -8.9068412193835336
		2.7902011600686056 61.468981974181503 -8.9224605278178242
		3.3552135596092731 56.48206014147236 -8.9379881011245015
		5.3219564008085456 56.482276868391111 -8.9379741381216817
		5.8921987351624683 61.495355821005703 -8.9223548271630264
		;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode transform -n "Kaokaoa_ctrl_twist_braco_esq_crv_IK_gp" -p "Kaokaoa_ctrl_cotovelo_esq_crv_IK";
	rename -uid "163C14E9-4BFB-B605-EFD0-23A14910AC14";
	setAttr ".rp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
	setAttr ".sp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
createNode transform -n "Kaokaoa_ctrl_twist_braco_esq_crv_IK" -p "Kaokaoa_ctrl_twist_braco_esq_crv_IK_gp";
	rename -uid "0EA177CF-462B-4334-F392-959A500BF41E";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rp" -type "double3" 4.3458427507189485 61.479969091121788 -8.9224076787526165 ;
	setAttr ".sp" -type "double3" 4.3458427507189485 61.479969091121788 -8.9224076787526165 ;
	setAttr ".mntl" -type "double3" 0 -4.1 0 ;
	setAttr ".mxtl" -type "double3" 0 3.9 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_twist_braco_esq_crv_IKShape" -p "Kaokaoa_ctrl_twist_braco_esq_crv_IK";
	rename -uid "7A6536EB-48D5-8BA2-A49C-F2AD8F062A67";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 10 0 no 3
		11 0 0.61803398874989479 1.2360679774997898 1.8541019662496847 2.4721359549995796
		 3.0901699437494745 3.7082039324993694 4.3262379212492643 4.9442719099991592 5.5623058987490541
		 6.180339887498949
		11
		4.3458427507189432 62.463504570769828 -8.922407678752613
		4.1229095923866153 61.807814251004444 -8.9224076787526094
		3.3623072710708515 61.807814251004444 -8.922407678752613
		4.0179975908362451 61.479969091121745 -8.9224076787526094
		3.6901524309535461 60.721240113311666 -8.922407678752613
		4.3458427507189406 61.152123931239032 -8.9224076787526094
		5.0015330704843359 60.721240113311666 -8.9224076787526094
		4.6736879106016387 61.479969091121745 -8.9224076787526094
		5.3293782303670332 61.807814251004444 -8.9224076787526094
		4.5687759090512685 61.807814251004444 -8.922407678752613
		4.3458427507189432 62.463504570769828 -8.922407678752613
		;
createNode transform -n "Kaokaoa_ctrl_ombro_dir_crv_gp" -p "Kaokaoa_ctrl_peito_A_crv";
	rename -uid "E224BA1A-44AC-93C9-B82F-058BB60FCCA6";
	setAttr ".t" -type "double3" -2.1316282072803006e-14 0 0 ;
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr ".s" -type "double3" 1 1 -1 ;
	setAttr ".rp" -type "double3" 3.8995771408081055 64.039398193359375 3.0622196197509766 ;
	setAttr ".rpt" -type "double3" -7.7991542816162109 0 -6.1244392395019549 ;
	setAttr ".sp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
	setAttr ".spt" -type "double3" 0 0 6.1244392395019531 ;
createNode transform -n "Kaokaoa_ctrl_ombro_dir_crv" -p "Kaokaoa_ctrl_ombro_dir_crv_gp";
	rename -uid "FCC6D345-43C7-A40C-F17B-52B654CFCB2E";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
	setAttr ".sp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0.44499999 0.491 1 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_ombro_dir_crvShape" -p "Kaokaoa_ctrl_ombro_dir_crv";
	rename -uid "9D6E667E-4049-DFFB-8E1E-44882A806D31";
	setAttr -k off ".v";
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		7.1625952538039872 66.683959239813021 -6.0839506525860969
		6.2069901950152762 61.43586877084627 -9.0658605135242176
		7.9703582460669011 56.82032868228044 -6.8642665836741408
		11.879622020205064 55.918989690601776 -2.3688239315797572
		9.4605694894679555 56.945540356372845 8.5743737051611255
		8.2023121121900253 60.799702362915937 8.1375846445223345
		8.2787225947031793 66.287282393567551 3.5750900833742412
		8.6037008123545178 68.611582852375051 -1.9609800713857268
		7.1625952538039872 66.683959239813021 -6.0839506525860969
		6.2069901950152762 61.43586877084627 -9.0658605135242176
		7.9703582460669011 56.82032868228044 -6.8642665836741408
		;
createNode transform -n "Kaokaoa_Braco_A_dir_crv_FK_gp" -p "Kaokaoa_ctrl_ombro_dir_crv";
	rename -uid "344007F4-4DDC-1E71-5107-BDA25805ECCF";
	setAttr ".rp" -type "double3" 9.4597644805908203 62.559860229492188 -3.1267976760864258 ;
	setAttr ".sp" -type "double3" 9.4597644805908203 62.559860229492188 -3.1267976760864258 ;
createNode transform -n "Kaokaoa_Braco_A_dir_crv_FK" -p "Kaokaoa_Braco_A_dir_crv_FK_gp";
	rename -uid "E2683951-4C34-81ED-24B1-B28F96D081CD";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rp" -type "double3" 9.4597644805908221 62.559860229492188 -3.1267976760864267 ;
	setAttr ".sp" -type "double3" 9.4597644805908221 62.559860229492188 -3.1267976760864267 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0.44499999 0.491 1 ;
createNode nurbsCurve -n "Kaokaoa_Braco_A_dir_crv_FKShape" -p "Kaokaoa_Braco_A_dir_crv_FK";
	rename -uid "8B9B4FBF-4F19-44E0-C512-67B420BB3A1D";
	setAttr -k off ".v";
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		10.227175739556573 56.338535838459535 -3.2202741942849853
		8.7968515894320767 61.79581993151929 -3.0535743285254959
		9.3462066297850495 67.03722316909645 -3.1176008231180212
		13.85408971523032 67.218464535673064 -3.6429877418599874
		17.973321395721999 66.093128448961096 -4.1230779303442864
		20.89782094062658 61.688152794690716 -4.4639239051780759
		17.897640233060393 56.95428337719229 -4.1142574058969874
		13.714283489520451 56.422011638740038 -3.6266935388173334
		10.227175739556573 56.338535838459535 -3.2202741942849853
		8.7968515894320767 61.79581993151929 -3.0535743285254959
		9.3462066297850495 67.03722316909645 -3.1176008231180212
		;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode transform -n "Kaokaoa_ctrl_cotovelo_dir_crv_FK_gp" -p "Kaokaoa_Braco_A_dir_crv_FK";
	rename -uid "F698CF6D-4203-3665-86DA-158D2243DA82";
	setAttr ".rp" -type "double3" 19.573843002319336 61.650009155273438 -4.302213191986084 ;
	setAttr ".sp" -type "double3" 19.573843002319336 61.650009155273438 -4.302213191986084 ;
createNode transform -n "Kaokaoa_ctrl_cotovelo_dir_crv_FK" -p "Kaokaoa_ctrl_cotovelo_dir_crv_FK_gp";
	rename -uid "3EC233B2-4E3B-D958-D245-74A6F19EC37F";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rp" -type "double3" 19.573843002319336 61.650009155273438 -4.302213191986084 ;
	setAttr ".sp" -type "double3" 19.573843002319336 61.650009155273438 -4.302213191986084 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0.44499999 0.491 1 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_cotovelo_dir_crv_FKShape" -p "Kaokaoa_ctrl_cotovelo_dir_crv_FK";
	rename -uid "9022B78C-4441-072B-06AE-0594E47BDA14";
	setAttr -k off ".v";
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		20.537223361092753 65.460341142564118 -4.2202328941275056
		24.843969668902588 65.908413589406024 -3.8537380098073881
		29.325895883839642 64.297021840002174 -3.4723345897733844
		30.3657095605727 61.743811185709419 -3.3838475668081158
		28.515938731366326 58.571028657196891 -3.5412573528128268
		24.797241668200289 57.017872682185263 -3.8577109807305159
		20.442003523883141 58.000878193226114 -4.228333318486162
		19.573275319596412 61.556189231950526 -4.3022617932068989
		20.537223361092753 65.460341142564118 -4.2202328941275056
		24.843969668902588 65.908413589406024 -3.8537380098073881
		29.325895883839642 64.297021840002174 -3.4723345897733844
		;
createNode transform -n "Kaokaoa_ctrl_pulso_dir_crv_FK_gp" -p "Kaokaoa_ctrl_cotovelo_dir_crv_FK";
	rename -uid "F30B42EB-437C-C6D1-CF76-7BBD7AF7AF73";
	setAttr ".rp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".sp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
createNode transform -n "Kaokaoa_ctrl_pulso_dir_crv_FK" -p "Kaokaoa_ctrl_pulso_dir_crv_FK_gp";
	rename -uid "7918DC59-44E9-F0C8-362B-CC89874888E5";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".sp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0.44499999 0.491 1 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_pulso_dir_crv_FKShape" -p "Kaokaoa_ctrl_pulso_dir_crv_FK";
	rename -uid "B4409EB4-47C0-1916-C0F0-1BBE1DD635F2";
	setAttr -k off ".v";
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		30.000001822926286 62.999999999999986 -5.1620469965131317
		29.999998663882792 60.999998986387595 -9.1620469965131317
		29.999998315716304 58.999999999999986 -5.1620469965131317
		29.99999481487529 54.999999999999993 -3.1620469965131326
		29.999999719155159 58.999999999999986 -1.1620469965131328
		30.000002825021497 61.000001013612376 2.8379530034868634
		30.000003226365575 62.999999999999986 -1.1620469965131328
		30.00000518512471 66.999999999999986 -3.1620469965131326
		30.000001822926286 62.999999999999986 -5.1620469965131317
		29.999998663882792 60.999998986387595 -9.1620469965131317
		29.999998315716304 58.999999999999986 -5.1620469965131317
		;
createNode transform -n "Kaokaoa_ctrl_mao_dir_crv_gp" -p "Kaokaoa_ctrl_ombro_dir_crv";
	rename -uid "5CCD1D39-483E-BA7B-2F06-0AAB0B154B3D";
	setAttr ".rp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".sp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
createNode transform -n "Kaokaoa_ctrl_mao_dir_crv" -p "Kaokaoa_ctrl_mao_dir_crv_gp";
	rename -uid "E89CEB08-41E1-43E8-2264-A18116531998";
	addAttr -ci true -sn "Polegar" -ln "Polegar" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "Polegar1" -ln "Polegar1" -dv 5 -min 0 -max 25 -at "double";
	addAttr -ci true -sn "Polegar2" -ln "Polegar2" -dv 5 -min 0 -max 25 -at "double";
	addAttr -ci true -sn "Polegar3" -ln "Polegar3" -dv 5 -min 0 -max 25 -at "double";
	addAttr -ci true -sn "PolegarAmplitude" -ln "PolegarAmplitude" -dv 15 -min 0 -max 
		25 -at "double";
	addAttr -ci true -sn "Indicador" -ln "Indicador" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "Indicado1" -ln "Indicado1" -nn "Indicador 1" -min 0 -max 25 
		-at "double";
	addAttr -ci true -sn "Indicador2" -ln "Indicador2" -min 0 -max 25 -at "double";
	addAttr -ci true -sn "Indicador3" -ln "Indicador3" -min 0 -max 25 -at "double";
	addAttr -ci true -sn "IndicadorAmplitude" -ln "IndicadorAmplitude" -min 0 -max 25 
		-at "double";
	addAttr -ci true -sn "Medio" -ln "Medio" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "Medio1" -ln "Medio1" -min 0 -max 25 -at "double";
	addAttr -ci true -sn "Medio2" -ln "Medio2" -min 0 -max 25 -at "double";
	addAttr -ci true -sn "Medio3" -ln "Medio3" -min 0 -max 25 -at "double";
	addAttr -ci true -sn "MedioAmplitude" -ln "MedioAmplitude" -min 0 -max 25 -at "double";
	addAttr -ci true -sn "Anelar" -ln "Anelar" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "Anelar1" -ln "Anelar1" -min 0 -max 25 -at "double";
	addAttr -ci true -sn "Anelar2" -ln "Anelar2" -min 0 -max 25 -at "double";
	addAttr -ci true -sn "Anelar3" -ln "Anelar3" -min 0 -max 25 -at "double";
	addAttr -ci true -sn "AnelarAmplitude" -ln "AnelarAmplitude" -min 0 -max 25 -at "double";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".sp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 0 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0.44499999 0.491 1 ;
	setAttr -k on ".Polegar";
	setAttr -k on ".Polegar1" 10;
	setAttr -k on ".Polegar2" 10;
	setAttr -k on ".Polegar3" 10;
	setAttr -k on ".PolegarAmplitude" 10;
	setAttr -k on ".Indicador";
	setAttr -k on ".Indicado1" 10;
	setAttr -k on ".Indicador2" 10;
	setAttr -k on ".Indicador3" 10;
	setAttr -k on ".IndicadorAmplitude" 10;
	setAttr -k on ".Medio";
	setAttr -k on ".Medio1" 10;
	setAttr -k on ".Medio2" 10;
	setAttr -k on ".Medio3" 10;
	setAttr -k on ".MedioAmplitude" 10;
	setAttr -k on ".Anelar";
	setAttr -k on ".Anelar1" 10;
	setAttr -k on ".Anelar2" 10;
	setAttr -k on ".Anelar3" 10;
	setAttr -k on ".AnelarAmplitude" 10;
createNode nurbsCurve -n "Kaokaoa_ctrl_mao_dir_crvShape" -p "Kaokaoa_ctrl_mao_dir_crv";
	rename -uid "416B7B26-4A4B-F682-EA61-6DA2D69FBDBF";
	setAttr -k off ".v";
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 3 0 no 3
		4 0 1.7320508075688772 3.4641016151377544 5.1961524227066311
		4
		29.999999999999964 65.99999705427723 -3.000000000000004
		38.999999999999957 66.000002945722628 2
		38.999999999999972 66.000002945722628 -8
		29.999999999999964 65.99999705427723 -3.0000000000000067
		;
createNode transform -n "Kaokaoa_ctrl_mao_stick_dir_crv_gp" -p "Kaokaoa_ctrl_mao_dir_crv";
	rename -uid "4A9592A5-40C9-0FAE-C49E-5CB1B4589893";
	setAttr ".rp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".sp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
createNode transform -n "Kaokaoa_ctrl_mao_stick_dir_crv" -p "Kaokaoa_ctrl_mao_stick_dir_crv_gp";
	rename -uid "8F2A60D4-457C-7A70-3B5B-FBB401D2E329";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".t" -type "double3" 0 0 1.4654943925052066e-14 ;
	setAttr ".rp" -type "double3" 36 66 -3 ;
	setAttr ".sp" -type "double3" 36 66 -3 ;
	setAttr ".mntl" -type "double3" -6 0 -5 ;
	setAttr ".mxtl" -type "double3" 3 0 5 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0.44499999 0.491 1 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_mao_stick_dir_crvShape" -p "Kaokaoa_ctrl_mao_stick_dir_crv";
	rename -uid "9EA7D827-49EF-FFE1-3E19-2F86950E48AC";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 12 0 no 3
		13 0 0.51763809020504148 1.035276180410083 1.5529142706151244 2.0705523608201659
		 2.5881904510252074 3.1058285412302489 3.6234666314352904 4.1411047216403318 4.6587428118453733
		 5.1763809020504148 5.6940189922554563 6.2116570824604977
		13
		36.75 66 -3.25
		36.25 66 -3.25
		36.25 66 -3.75
		35.75 66 -3.75
		35.75 66 -3.25
		35.25 66 -3.25
		35.25 66 -2.75
		35.75 66 -2.75
		35.75 66 -2.25
		36.25 66 -2.25
		36.25 66 -2.75
		36.75 66 -2.75
		36.75 66 -3.25
		;
createNode parentConstraint -n "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1" -p
		 "Kaokaoa_ctrl_mao_dir_crv_gp";
	rename -uid "938A4A4D-4933-F195-FBCE-5597E4495829";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Mao_A_Dir_jntW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 3.4658840526446966e-06 5.0012046727943016e-05 
		-4.0121028037631845e-06 ;
	setAttr ".tg[0].tor" -type "double3" 0.36043988800591181 2.7478153558410554 -1.215255176381048 ;
	setAttr ".lr" -type "double3" -2.2730975013303552e-05 1.9407262517092748e-06 4.4186625051617063e-07 ;
	setAttr ".rst" -type "double3" 0 7.1054273576010019e-15 -1.3322676295501878e-15 ;
	setAttr ".rsrr" -type "double3" 6.2120208622334312e-18 -7.765026077791789e-19 -2.0189067802258652e-16 ;
	setAttr -k on ".w0";
createNode transform -n "Kaokaoa_ctrl_cotovelo_dir_crv_IK_gp" -p "Kaokaoa_ctrl_ombro_dir_crv";
	rename -uid "3F28FBEE-4BF3-1BB7-B382-E8A5F4305F32";
	setAttr ".t" -type "double3" 4.4408920985006262e-16 0 -1.3322676295501877e-15 ;
	setAttr ".rp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
	setAttr ".sp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
createNode transform -n "Kaokaoa_ctrl_cotovelo_dir_crv_IK" -p "Kaokaoa_ctrl_cotovelo_dir_crv_IK_gp";
	rename -uid "3E7C3F08-4EDF-A694-01CE-72AC4EF42953";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
	setAttr ".sp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 0 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0.44499999 0.491 1 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_cotovelo_dir_crv_IKShape" -p "Kaokaoa_ctrl_cotovelo_dir_crv_IK";
	rename -uid "107C6180-4CA2-3659-C830-30827C196AC6";
	setAttr -k off ".v";
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 0.99999999999999989 1.9999999999999998 2.9999999999999996 3.9999999999999996
		 4.9999999999999991 5.9999999999999991
		7
		5.8921987351624674 61.495355821005717 -8.9223548271630264
		5.3271863365896683 66.482277653715158 -8.9068272513319773
		3.3604434934546608 66.482059356148326 -8.9068412193835336
		2.7902011600686056 61.468981974181503 -8.9224605278178242
		3.3552135596092731 56.48206014147236 -8.9379881011245015
		5.3219564008085456 56.482276868391111 -8.9379741381216817
		5.8921987351624683 61.495355821005703 -8.9223548271630264
		;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode transform -n "Kaokaoa_ctrl_twist_braco_dir_crv_IK_gp" -p "Kaokaoa_ctrl_cotovelo_dir_crv_IK";
	rename -uid "B38E8DA5-4343-B2BF-4D17-5DB9C1A11F30";
	setAttr ".rp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
	setAttr ".sp" -type "double3" 3.8995771408081055 64.039398193359375 -3.0622196197509766 ;
createNode transform -n "Kaokaoa_ctrl_twist_braco_dir_crv_IK" -p "Kaokaoa_ctrl_twist_braco_dir_crv_IK_gp";
	rename -uid "D4AEE08D-4878-A3A9-5E5E-94A65D9349B1";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rp" -type "double3" 4.3458427507189485 61.479969091121788 -8.9224076787526165 ;
	setAttr ".sp" -type "double3" 4.3458427507189485 61.479969091121788 -8.9224076787526165 ;
	setAttr ".mntl" -type "double3" 0 -4.1 0 ;
	setAttr ".mxtl" -type "double3" 0 3.9 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0.44499999 0.491 1 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_twist_braco_dir_crv_IKShape" -p "Kaokaoa_ctrl_twist_braco_dir_crv_IK";
	rename -uid "85D59BC7-41A8-79FE-61B3-96B540F15C61";
	setAttr -k off ".v";
	setAttr ".ovv" no;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 10 0 no 3
		11 0 0.61803398874989479 1.2360679774997898 1.8541019662496847 2.4721359549995796
		 3.0901699437494745 3.7082039324993694 4.3262379212492643 4.9442719099991592 5.5623058987490541
		 6.180339887498949
		11
		4.3458427507189432 62.463504570769828 -8.922407678752613
		4.1229095923866153 61.807814251004444 -8.9224076787526094
		3.3623072710708515 61.807814251004444 -8.922407678752613
		4.0179975908362451 61.479969091121745 -8.9224076787526094
		3.6901524309535461 60.721240113311666 -8.922407678752613
		4.3458427507189406 61.152123931239032 -8.9224076787526094
		5.0015330704843359 60.721240113311666 -8.9224076787526094
		4.6736879106016387 61.479969091121745 -8.9224076787526094
		5.3293782303670332 61.807814251004444 -8.9224076787526094
		4.5687759090512685 61.807814251004444 -8.922407678752613
		4.3458427507189432 62.463504570769828 -8.922407678752613
		;
createNode transform -n "Kaokaoa_ctrl_pescoco_crv_gp" -p "Kaokaoa_ctrl_peito_A_crv";
	rename -uid "8E2E0AD5-48BD-6F79-92B6-4A8934D37626";
	setAttr ".rp" -type "double3" 8.6045579366614451e-15 66.461051940917969 -2.2876846790313721 ;
	setAttr ".sp" -type "double3" 8.6045579366614451e-15 66.461051940917969 -2.2876846790313721 ;
createNode transform -n "Kaokaoa_ctrl_pescoco_crv" -p "Kaokaoa_ctrl_pescoco_crv_gp";
	rename -uid "134D7D2F-49E5-69C5-9737-6FAFDED2AF24";
	setAttr ".rp" -type "double3" 8.6045579366614451e-15 66.461051940917969 -2.2876846790313721 ;
	setAttr ".sp" -type "double3" 8.6045579366614451e-15 66.461051940917969 -2.2876846790313721 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 1 0 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_pescoco_crvShape" -p "Kaokaoa_ctrl_pescoco_crv";
	rename -uid "EC8D39F6-4743-3FD4-D5A8-41A3A5CE0B20";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.8207178837076698 68.564839236706035 -6.405809014813145
		3.8400912002618028e-16 68.045067821203219 -9.0136477612090111
		-5.8207178837076698 68.564839236706035 -6.405809014813145
		-7.638677861884295 68.487437447528521 0.21226518735932604
		-4.92515876801329 65.809802500277058 5.2595980897575858
		-6.8965547516838342e-16 64.629121848569383 7.1895393563384564
		4.92515876801329 65.809802500277058 5.2595980897575894
		7.638677861884295 68.487437447528521 0.21226518735932604
		5.8207178837076698 68.564839236706035 -6.405809014813145
		3.8400912002618028e-16 68.045067821203219 -9.0136477612090111
		-5.8207178837076698 68.564839236706035 -6.405809014813145
		;
createNode transform -n "Kaokaoa_ctrl_cabeca_crv_gp" -p "Kaokaoa_ctrl_pescoco_crv";
	rename -uid "E08834B2-4794-2305-A45E-BC945EB122F2";
	setAttr ".rp" -type "double3" -1.7581535931439872e-14 70.31121826171875 -2.5274057388305664 ;
	setAttr ".sp" -type "double3" -1.7581535931439872e-14 70.31121826171875 -2.5274057388305664 ;
createNode transform -n "Kaokaoa_ctrl_cabeca_crv" -p "Kaokaoa_ctrl_cabeca_crv_gp";
	rename -uid "FCF1BF4A-4705-8CEE-CD42-4EA15FABD457";
	addAttr -ci true -sn "Seriedade" -ln "Seriedade" -min 0 -max 10 -at "double";
	addAttr -ci true -sn "Desespero" -ln "Desespero" -min 0 -max 10 -at "double";
	addAttr -ci true -sn "Surpresa" -ln "Surpresa" -min 0 -max 10 -at "double";
	addAttr -ci true -sn "Euforia" -ln "Euforia" -min 0 -max 10 -at "double";
	setAttr ".rp" -type "double3" -1.7581535931439872e-14 70.31121826171875 -2.5274057388305664 ;
	setAttr ".sp" -type "double3" -1.7581535931439872e-14 70.31121826171875 -2.5274057388305664 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 1 0 ;
	setAttr -k on ".Seriedade";
	setAttr -k on ".Desespero";
	setAttr -k on ".Surpresa";
	setAttr -k on ".Euforia";
createNode nurbsCurve -n "Kaokaoa_ctrl_cabeca_crvShape" -p "Kaokaoa_ctrl_cabeca_crv";
	rename -uid "25C55E50-4188-0D13-33D6-2695053E3E36";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		10.647237756702284 69.549646813733872 3.6785219229770405
		18.146851852922541 76.615517416931851 -15.967025427006501
		12.868281479192147 93.162305519696361 -12.003948198380334
		1.6489212588235865e-15 85.251684354637959 17.352792276473227
		-12.868281479192174 93.162305519696361 -12.003948198380337
		-18.146851852922605 76.615517416931837 -15.967025427006508
		-10.64723775670228 69.549646813733887 3.6785219229770361
		1.5574448174165995e-15 67.186484245815819 14.29633174481499
		10.647237756702284 69.549646813733872 3.6785219229770405
		18.146851852922541 76.615517416931851 -15.967025427006501
		12.868281479192147 93.162305519696361 -12.003948198380334
		;
createNode transform -n "Kaokaoa_ctrl_boca_crv_gp" -p "Kaokaoa_ctrl_cabeca_crv";
	rename -uid "ECF5D576-475B-D04E-F8B9-2F8084CDBCC1";
	setAttr ".rp" -type "double3" -8.6665467723568302e-16 73.322822570800781 -0.82281684875488281 ;
	setAttr ".sp" -type "double3" -8.6665467723568302e-16 73.322822570800781 -0.82281684875488281 ;
createNode transform -n "Kaokaoa_ctrl_boca_crv" -p "Kaokaoa_ctrl_boca_crv_gp";
	rename -uid "CD1ADE84-479F-85A2-BD41-39B1875EAB93";
	addAttr -ci true -sn "LinguaDE" -ln "LinguaDE" -nn "Lingua Direita Esqierda" -min 
		-10 -max 10 -at "double";
	addAttr -ci true -sn "LinguaBC" -ln "LinguaBC" -nn "Lingua  Baixo Cima" -min 0 -max 
		10 -at "double";
	addAttr -ci true -sn "LinguaEst" -ln "LinguaEst" -nn "Lingua Esticamento" -min 0 
		-max 10 -at "double";
	addAttr -ci true -sn "UvulaDE" -ln "UvulaDE" -nn "Uvula Direita Esquerda" -min -1 
		-max 1 -at "double";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".rp" -type "double3" -8.6665467723568302e-16 73.322822570800781 -0.82281684875488281 ;
	setAttr ".sp" -type "double3" -8.6665467723568302e-16 73.322822570800781 -0.82281684875488281 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0 1 1 ;
	setAttr -k on ".LinguaDE";
	setAttr -k on ".LinguaBC";
	setAttr -k on ".LinguaEst";
	setAttr -k on ".UvulaDE";
createNode nurbsCurve -n "Kaokaoa_ctrl_boca_crvShape" -p "Kaokaoa_ctrl_boca_crv";
	rename -uid "3F9AAECE-4F51-4A25-B27F-91BDA1FF15D9";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.1902703765291793 70.889607356668463 9.0051772067900266
		11.84660874648791 72.334405188305368 3.0641345954038384
		8.7676882333892721 75.330898485232339 -9.2575162071911148
		8.6796736859742592e-15 76.189075606860143 -12.786360683605622
		-8.7676882333892614 75.330898485232339 -9.2575162071911148
		-11.846608746487902 72.334405188305368 3.0641345954038361
		-5.1902703765291687 70.889607356668463 9.0051772067900266
		6.4426039669112754e-15 69.949494741991472 12.870942354686168
		5.1902703765291793 70.889607356668463 9.0051772067900266
		11.84660874648791 72.334405188305368 3.0641345954038384
		8.7676882333892721 75.330898485232339 -9.2575162071911148
		;
createNode transform -n "Kaokaoa_ctrl_nariz_crv_gp" -p "Kaokaoa_ctrl_cabeca_crv";
	rename -uid "FE4C7B7B-439D-6CFF-06B5-48A5528DA021";
	setAttr ".rp" -type "double3" -2.1886358963227673e-14 74.850753784179688 11.549552917480469 ;
	setAttr ".sp" -type "double3" -2.1886358963227673e-14 74.850753784179688 11.549552917480469 ;
createNode transform -n "Kaokaoa_ctrl_nariz_crv" -p "Kaokaoa_ctrl_nariz_crv_gp";
	rename -uid "F1E16B46-4896-5101-87EE-DB9AAE7991C7";
	setAttr ".rp" -type "double3" -2.192023858705195e-14 74.850753784179688 11.549552917480469 ;
	setAttr ".sp" -type "double3" -2.192023858705195e-14 74.850753784179688 11.549552917480469 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0 1 1 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_nariz_crvShape" -p "Kaokaoa_ctrl_nariz_crv";
	rename -uid "7E58E72B-4894-1966-EB0A-8FB57C4F9F8E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.9717124344872081 76.968549283461456 9.2470324076294883
		-7.3459216391602266e-15 78.449874643527764 10.819487520071721
		-2.9717124344872232 76.968549283461456 9.2470324076294883
		-3.5005576326319239 75.505888662457053 10.073941986167535
		-2.6698730248601801 73.509952316525371 11.213337985087247
		-7.9703804166425929e-15 71.561148499713681 11.887506027498338
		2.669873024860165 73.509952316525371 11.213337985087247
		3.5452618411958823 75.505888662457053 10.073941986167535
		2.9717124344872081 76.968549283461456 9.2470324076294883
		-7.3459216391602266e-15 78.449874643527764 10.819487520071721
		-2.9717124344872232 76.968549283461456 9.2470324076294883
		;
createNode transform -n "Kaokaoa_ctrl_cintura_crv_gp" -p "Kaokaoa_ctrl_root_crv";
	rename -uid "E522C65E-4259-FF60-2241-92A52B0AC6DE";
	setAttr ".rp" -type "double3" 0 49 1 ;
	setAttr ".sp" -type "double3" 0 49 1 ;
createNode transform -n "Kaokaoa_ctrl_cintura_crv" -p "Kaokaoa_ctrl_cintura_crv_gp";
	rename -uid "9A0DC242-4A03-3689-393E-7CB560E2AC24";
	setAttr ".rp" -type "double3" 0 49 1 ;
	setAttr ".sp" -type "double3" 0 49 1 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 1 0 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_cintura_crvShape" -p "Kaokaoa_ctrl_cintura_crv";
	rename -uid "D693D3B5-4825-16E6-97AF-D1872D4EB642";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		10.075356984471256 41.621234312511753 -8.0113580455155411
		2.547363191249483e-15 45.06963708905942 -8.0595194117038353
		-10.075356984471254 41.62123431251176 -8.0113580455155393
		-10.117564423407531 41.621233929039086 3.4852636267816939
		-9.2059320886995248 41.621233723326569 9.6525843125857662
		-3.5541091814474649e-15 41.621233579301773 13.970489181182293
		9.2059320886995213 41.621233723326561 9.6525843125857715
		10.117564423407531 41.621233929039079 3.4852636267816992
		10.075356984471256 41.621234312511753 -8.0113580455155411
		2.547363191249483e-15 45.06963708905942 -8.0595194117038353
		-10.075356984471254 41.62123431251176 -8.0113580455155393
		;
createNode transform -n "Kaokaoa_ctrl_perna_A_esq_crv_FK_gp" -p "Kaokaoa_ctrl_cintura_crv";
	rename -uid "B3F3515B-4B68-EDB1-4FE0-3F881781A1BE";
	setAttr ".rp" -type "double3" 4.825446605682373 40.811904907226563 0.79033619165420532 ;
	setAttr ".sp" -type "double3" 4.825446605682373 40.811904907226563 0.79033619165420532 ;
createNode transform -n "Kaokaoa_ctrl_perna_A_esq_crv_FK" -p "Kaokaoa_ctrl_perna_A_esq_crv_FK_gp";
	rename -uid "3EA46FBE-4EDC-1AF4-4203-E5B0D83BE107";
	setAttr ".rp" -type "double3" 4.8254466056823739 40.81190490722657 0.79033619165420532 ;
	setAttr ".sp" -type "double3" 4.8254466056823739 40.81190490722657 0.79033619165420532 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_perna_A_esq_crv_FKShape" -p "Kaokaoa_ctrl_perna_A_esq_crv_FK";
	rename -uid "C47D4E1C-499D-3097-DF64-6C9000A56136";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.2668861248378276 23.347938368986775 -7.8608451079871795
		5.0489664223668669 32.224362146240445 -5.4019595630664234
		4.8469437836027192 40.453245582170993 -8.8019472909182355
		4.6541000378441924 48.308286674113447 -2.7728038562500168
		4.7098232577968453 46.038533082617015 11.773541725520772
		5.1376748757839641 28.610983115551058 9.9364244691069263
		5.2674661970092691 23.324270322676263 9.6827476353668569
		5.2598335628709005 23.635183720931419 0.76266975761501088
		5.2668861248378276 23.347938368986775 -7.8608451079871795
		5.0489664223668669 32.224362146240445 -5.4019595630664234
		4.8469437836027192 40.453245582170993 -8.8019472909182355
		;
createNode transform -n "Kaokaoa_ctrl_perna_B_esq_crv_FK_gp" -p "Kaokaoa_ctrl_perna_A_esq_crv_FK";
	rename -uid "1235B897-4D59-1C62-02B8-AE98F4FFD0FF";
	setAttr ".rp" -type "double3" 5.2629880905151367 24.1392822265625 2.3092942237854004 ;
	setAttr ".sp" -type "double3" 5.2629880905151367 24.1392822265625 2.3092942237854004 ;
createNode transform -n "Kaokaoa_ctrl_perna_B_esq_crv_FK" -p "Kaokaoa_ctrl_perna_B_esq_crv_FK_gp";
	rename -uid "D5F57085-4AA9-B7FD-C287-F6A522F6CDDE";
	setAttr ".rp" -type "double3" 5.2629880905151358 24.139282226562507 2.3092942237854004 ;
	setAttr ".sp" -type "double3" 5.2629880905151358 24.139282226562507 2.3092942237854004 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_perna_B_esq_crv_FKShape" -p "Kaokaoa_ctrl_perna_B_esq_crv_FK";
	rename -uid "8FB83157-4654-A28B-EAA2-4B8C958EC998";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.2999363834845177 23.607443397524865 -5.4601842171049189
		5.2293110789962469 24.426868827143942 3.6680063224644428
		5.2899346780031067 22.818955157497321 9.403644045225878
		5.3690169349406931 12.719757172105691 6.9769986227458034
		5.4754903198264779 6.5612103587625663 3.2851766459373266
		5.5150411049397619 5.8840784624554212 -2.3967220239079507
		5.4382087216321722 6.7132543495071788 -5.0602975449846763
		5.341110964146023 13.388178583079897 -5.4813910045143039
		5.2999363834845177 23.607443397524865 -5.4601842171049189
		5.2293110789962469 24.426868827143942 3.6680063224644428
		5.2899346780031067 22.818955157497321 9.403644045225878
		;
createNode transform -n "Kaokaoa_ctrl_tornozelo_esq_crv_FK_gp" -p "Kaokaoa_ctrl_perna_B_esq_crv_FK";
	rename -uid "3B7CA315-45A4-B8E1-93A6-C3B3D735071C";
	setAttr ".rp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".sp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
createNode transform -n "Kaokaoa_ctrl_tornozelo_esq_crv_FK" -p "Kaokaoa_ctrl_tornozelo_esq_crv_FK_gp";
	rename -uid "521B7AE0-4016-EA6E-7DCD-A59DB50901FF";
	setAttr ".rp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".sp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_tornozelo_esq_crv_FKShape" -p "Kaokaoa_ctrl_tornozelo_esq_crv_FK";
	rename -uid "48859DAB-40B1-9BB5-4899-058B52E4C7E5";
	addAttr -ci true -k true -sn "ll" -ln "lockLength" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		9.0345439477191167 3.3555032984467594 3.4648450674727949
		5.6259022490794761 0.30158764214918943 4.6748175678548494
		1.6504443035242069 3.4916364145864933 3.4899671205302853
		1.0086246829604786 5.2617958946150072 0.75243788230559794
		0.25411129026675816 5.6260142370078778 -3.0784800943329933
		5.6791281321642062 5.7277541725097176 -4.9696208357651122
		11.261532859242854 5.6274258455226409 -3.1669561678454148
		9.9672264688336938 5.2471484769647532 1.0475820724496465
		9.0345439477191167 3.3555032984467594 3.4648450674727949
		5.6259022490794761 0.30158764214918943 4.6748175678548494
		1.6504443035242069 3.4916364145864933 3.4899671205302853
		;
createNode transform -n "Kaokaoa_ctrl_perna_A_dir_crv_FK_gp" -p "Kaokaoa_ctrl_cintura_crv";
	rename -uid "1ED95548-421F-88CD-5C3A-B8BD525B765F";
	setAttr ".t" -type "double3" 7.8886090522101181e-31 0 0 ;
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr ".s" -type "double3" 1 1 -1 ;
	setAttr ".rp" -type "double3" 4.825446605682373 40.811904907226563 -0.79033619165420532 ;
	setAttr ".rpt" -type "double3" -9.6508932113647461 0 1.5806723833084098 ;
	setAttr ".sp" -type "double3" 4.825446605682373 40.811904907226563 0.79033619165420532 ;
	setAttr ".spt" -type "double3" 0 0 -1.5806723833084106 ;
createNode transform -n "Kaokaoa_ctrl_perna_A_dir_crv_FK" -p "Kaokaoa_ctrl_perna_A_dir_crv_FK_gp";
	rename -uid "A154BA08-4AB9-E401-55BE-379FF9EDEF52";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rp" -type "double3" 4.8254466056823739 40.81190490722657 0.79033619165420532 ;
	setAttr ".sp" -type "double3" 4.8254466056823739 40.81190490722657 0.79033619165420532 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0.44499999 0.491 1 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_perna_A_dir_crv_FKShape" -p "Kaokaoa_ctrl_perna_A_dir_crv_FK";
	rename -uid "0AF18B4E-4743-D5C8-E863-729620716180";
	setAttr -k off ".v";
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.2668861248378276 23.347938368986775 -7.8608451079871795
		5.0489664223668669 32.224362146240445 -5.4019595630664234
		4.8469437836027192 40.453245582170993 -8.8019472909182355
		4.6541000378441924 48.308286674113447 -2.7728038562500168
		4.7098232577968453 46.038533082617015 11.773541725520772
		5.1376748757839641 28.610983115551058 9.9364244691069263
		5.2674661970092691 23.324270322676263 9.6827476353668569
		5.2598335628709005 23.635183720931419 0.76266975761501088
		5.2668861248378276 23.347938368986775 -7.8608451079871795
		5.0489664223668669 32.224362146240445 -5.4019595630664234
		4.8469437836027192 40.453245582170993 -8.8019472909182355
		;
createNode transform -n "Kaokaoa_ctrl_perna_B_dir_crv_FK_gp" -p "Kaokaoa_ctrl_perna_A_dir_crv_FK";
	rename -uid "7927897E-452C-4FDD-58F6-D2B4DE4EA6D6";
	setAttr ".rp" -type "double3" 5.2629880905151367 24.1392822265625 2.3092942237854004 ;
	setAttr ".sp" -type "double3" 5.2629880905151367 24.1392822265625 2.3092942237854004 ;
createNode transform -n "Kaokaoa_ctrl_perna_B_dir_crv_FK" -p "Kaokaoa_ctrl_perna_B_dir_crv_FK_gp";
	rename -uid "01F5A3C9-4396-5B42-9E17-28BB2D4CD98B";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rp" -type "double3" 5.2629880905151358 24.139282226562507 2.3092942237854004 ;
	setAttr ".sp" -type "double3" 5.2629880905151358 24.139282226562507 2.3092942237854004 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0.44499999 0.491 1 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_perna_B_dir_crv_FKShape" -p "Kaokaoa_ctrl_perna_B_dir_crv_FK";
	rename -uid "45D1FAA4-4D84-B06A-08D6-C7A66F852DC5";
	setAttr -k off ".v";
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.2999363834845177 23.607443397524865 -5.4601842171049189
		5.2293110789962469 24.426868827143942 3.6680063224644428
		5.2899346780031067 22.818955157497321 9.403644045225878
		5.3690169349406931 12.719757172105691 6.9769986227458034
		5.4754903198264779 6.5612103587625663 3.2851766459373266
		5.5150411049397619 5.8840784624554212 -2.3967220239079507
		5.4382087216321722 6.7132543495071788 -5.0602975449846763
		5.341110964146023 13.388178583079897 -5.4813910045143039
		5.2999363834845177 23.607443397524865 -5.4601842171049189
		5.2293110789962469 24.426868827143942 3.6680063224644428
		5.2899346780031067 22.818955157497321 9.403644045225878
		;
createNode transform -n "Kaokaoa_ctrl_tornozelo_dir_crv_FK_gp" -p "Kaokaoa_ctrl_perna_B_dir_crv_FK";
	rename -uid "417C3C08-4C7C-4D33-D9D3-AAAA2352E85E";
	setAttr ".rp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".sp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
createNode transform -n "Kaokaoa_ctrl_tornozelo_dir_crv_FK" -p "Kaokaoa_ctrl_tornozelo_dir_crv_FK_gp";
	rename -uid "2E3733BA-4021-079D-B7C7-98853F1BD4CD";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".sp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0.44499999 0.491 1 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_tornozelo_dir_crv_FKShape" -p "Kaokaoa_ctrl_tornozelo_dir_crv_FK";
	rename -uid "30BF7FD1-4064-D843-B26F-6CAF9285EE0F";
	addAttr -ci true -k true -sn "ll" -ln "lockLength" -min 0 -max 1 -at "bool";
	setAttr -k off ".v";
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		9.0345439477191167 3.3555032984467594 3.4648450674727949
		5.6259022490794761 0.30158764214918943 4.6748175678548494
		1.6504443035242069 3.4916364145864933 3.4899671205302853
		1.0086246829604786 5.2617958946150072 0.75243788230559794
		0.25411129026675816 5.6260142370078778 -3.0784800943329933
		5.6791281321642062 5.7277541725097176 -4.9696208357651122
		11.261532859242854 5.6274258455226409 -3.1669561678454148
		9.9672264688336938 5.2471484769647532 1.0475820724496465
		9.0345439477191167 3.3555032984467594 3.4648450674727949
		5.6259022490794761 0.30158764214918943 4.6748175678548494
		1.6504443035242069 3.4916364145864933 3.4899671205302853
		;
	setAttr ".oclr" -type "float3" 0.44499999 0.491 1 ;
createNode transform -n "Kaokaoa_ctrl_olhos_crv_gp" -p "Kaokaoa_ctrl_master_crv";
	rename -uid "97D30824-492F-F78D-293F-06BCE896F8EB";
	setAttr ".rp" -type "double3" 0 79 39 ;
	setAttr ".sp" -type "double3" 0 79 39 ;
createNode transform -n "Kaokaoa_ctrl_olhos_crv" -p "Kaokaoa_ctrl_olhos_crv_gp";
	rename -uid "21A7A6C8-4A58-880C-C555-D69CF2F87E6F";
	addAttr -ci true -sn "OlhoFilhoDeCabecaMaster" -ln "OlhoFilhoDeCabecaMaster" -nn "Olho Filho Cabeça :0/ Master :10" 
		-min 0 -max 10 -at "double";
	addAttr -ci true -sn "DuasIris" -ln "DuasIris" -min 0 -max 10 -at "double";
	addAttr -ci true -sn "FecharOlhos" -ln "FecharOlhos" -nn "Fechar Olhos" -min 0 -max 
		10 -at "double";
	setAttr ".rp" -type "double3" -3.0427381258705934e-15 79 39 ;
	setAttr ".sp" -type "double3" -3.0427381258705934e-15 79 39 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0 1 1 ;
	setAttr -k on ".OlhoFilhoDeCabecaMaster";
	setAttr -k on ".DuasIris";
	setAttr -k on ".FecharOlhos";
createNode nurbsCurve -n "Kaokaoa_ctrl_olhos_crvShape" -p "Kaokaoa_ctrl_olhos_crv";
	rename -uid "CAA32F9C-494A-20EB-7CC8-B5A94BD9CA62";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".cc" -type "nurbsCurve" 
		3 12 2 no 3
		17 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
		15
		2.0934065178158927 81.940722589193101 38.999998251917745
		-6.2869002239079432e-15 80.046374463262893 38.999998251917745
		-2.0934065178159007 81.940722589193101 38.999998251917745
		-5.4649280682347623 82.237472284949646 38.999998251917745
		-7.4901208988121484 79.229611390748261 38.999998251917745
		-6.2695566202444324 75.838479165309295 38.999998251917745
		-2.1323541306280283 76.142772461988102 38.999998251917745
		-9.2982357676199129e-15 79.540031509179755 38.999998251917745
		2.1323541306280203 76.142772461988102 38.999998251917745
		6.26955662024442 75.83847916530928 38.999998251917745
		7.490120898812143 79.229611390748246 38.999998251917745
		5.4649280682347561 82.237472284949632 38.999998251917745
		2.0934065178158927 81.940722589193101 38.999998251917745
		-6.2869002239079432e-15 80.046374463262893 38.999998251917745
		-2.0934065178159007 81.940722589193101 38.999998251917745
		;
createNode transform -n "Kaokaoa_ctrl_olho_esq_crv_gp" -p "Kaokaoa_ctrl_olhos_crv";
	rename -uid "DF23E949-4DD5-BD3D-19F1-DDB25E35A827";
	setAttr ".rp" -type "double3" 4 79 39 ;
	setAttr ".sp" -type "double3" 4 79 39 ;
createNode transform -n "Kaokaoa_ctrl_olho_esq_crv" -p "Kaokaoa_ctrl_olho_esq_crv_gp";
	rename -uid "FB797C71-48B8-B23E-5A38-E5A62163683F";
	addAttr -ci true -sn "Iris" -ln "Iris" -nn "Iris" -min 0 -max 10 -at "double";
	addAttr -ci true -sn "Piscar" -ln "Piscar" -min 0 -max 10 -at "double";
	setAttr ".rp" -type "double3" 4 79 39 ;
	setAttr ".sp" -type "double3" 4 79 39 ;
	setAttr ".mnsl" -type "double3" 0.2 0.1 1 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
	setAttr -k on ".Iris";
	setAttr -k on ".Piscar";
createNode nurbsCurve -n "Kaokaoa_ctrl_olho_esq_crvShape" -p "Kaokaoa_ctrl_olho_esq_crv";
	rename -uid "013B3EA5-4760-43A1-AF83-1DA696316944";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		2.3867895069487308 80.61321049305127 38.999999999999993
		4 81.281424158235694 38.999999999999993
		5.6132104930512705 80.61321049305127 38.999999999999993
		6.2814241582356942 79 38.999999999999993
		5.6132104930512705 77.38678950694873 38.999999999999993
		4 76.718575841764306 38.999999999999993
		2.3867895069487308 77.38678950694873 38.999999999999993
		1.7185758417643069 79 38.999999999999993
		2.3867895069487308 80.61321049305127 38.999999999999993
		4 81.281424158235694 38.999999999999993
		5.6132104930512705 80.61321049305127 38.999999999999993
		;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode transform -n "Kaokaoa_ctrl_olho_dir_crv_gp" -p "Kaokaoa_ctrl_olhos_crv";
	rename -uid "A56B82B8-4386-F602-4E39-B09EB3EE9D27";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rp" -type "double3" -4 79 39 ;
	setAttr ".sp" -type "double3" -4 79 39 ;
	setAttr ".oclr" -type "float3" 0 0 1 ;
createNode transform -n "Kaokaoa_ctrl_olho_dir_crv" -p "Kaokaoa_ctrl_olho_dir_crv_gp";
	rename -uid "4ED0C874-4DCC-D8F7-0DF7-8A9AFED87457";
	addAttr -ci true -sn "Iris" -ln "Iris" -min 0 -max 10 -at "double";
	addAttr -ci true -sn "Piscar" -ln "Piscar" -min 0 -max 10 -at "double";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rp" -type "double3" -4 79 39 ;
	setAttr ".sp" -type "double3" -4 79 39 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0.44499999 0.491 1 ;
	setAttr -k on ".Iris";
	setAttr -k on ".Piscar";
createNode nurbsCurve -n "Kaokaoa_ctrl_olho_dir_crvShape" -p "Kaokaoa_ctrl_olho_dir_crv";
	rename -uid "F85FFB5F-4820-9B18-7A83-BAAEB8963648";
	setAttr -k off ".v";
	setAttr ".ovc" 6;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-2.3867895069487299 80.61321049305127 38.999999999999993
		-3.9999999999999996 81.281424158235694 38.999999999999993
		-5.6132104930512696 80.61321049305127 38.999999999999993
		-6.2814241582356924 79 38.999999999999993
		-5.6132104930512696 77.38678950694873 38.999999999999993
		-3.9999999999999996 76.718575841764306 38.999999999999993
		-2.3867895069487299 77.38678950694873 38.999999999999993
		-1.7185758417643062 79 38.999999999999993
		-2.3867895069487299 80.61321049305127 38.999999999999993
		-3.9999999999999996 81.281424158235694 38.999999999999993
		-5.6132104930512696 80.61321049305127 38.999999999999993
		;
	setAttr ".oclr" -type "float3" 0.44700003 0.48953497 1 ;
createNode parentConstraint -n "Kaokaoa_ctrl_olhos_crv_parentConstraint1" -p "Kaokaoa_ctrl_olhos_crv";
	rename -uid "70EF3A05-4E03-17FB-EF76-F4B09FE3F316";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_master_crvW0" -dv 1 
		-min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Kaokaoa_ctrl_cabeca_crvW1" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".tg[0].tot" -type "double3" 7.6154029105309106e-15 29.999999999999993 38 ;
	setAttr ".tg[1].tot" -type "double3" 1.4538797805569278e-14 8.68878173828125 41.527405738830566 ;
	setAttr ".rst" -type "double3" -3.944304526105059e-31 0 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp" -p "Kaokaoa_ctrl_master_crv";
	rename -uid "532327B8-4B6D-7F77-D463-AF91B41FF2DE";
	setAttr ".s" -type "double3" 1 1 -1 ;
	setAttr ".rp" -type "double3" 5.4948153495788574 4.5553369522094727 0.27931928634643555 ;
	setAttr ".rpt" -type "double3" -10.989630699157715 0 -0.55863857269287176 ;
	setAttr ".sp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".spt" -type "double3" 0 0 0.55863857269287109 ;
createNode transform -n "Kaokaoa_ctrl_tornozelo_dir_crv_IK" -p "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp";
	rename -uid "0315223C-4411-3EBD-D2A4-18851721AE98";
	addAttr -ci true -sn "ControlePontaPeDireito" -ln "ControlePontaPeDireito" -min 
		0 -max 10 -at "double";
	addAttr -ci true -sn "TwistPontaPeDireito" -ln "TwistPontaPeDireito" -nn "Twist Ponta Pe Direito" 
		-dv 10 -min 0 -max 20 -at "double";
	addAttr -ci true -sn "ControleDobraPeDireito" -ln "ControleDobraPeDireito" -nn "Controle Dobra Pe Direito" 
		-dv 10 -min 0 -max 20 -at "double";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".t" -type "double3" 1.7261734697707028e-15 0 0 ;
	setAttr ".rp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".sp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0.44499999 0.491 1 ;
	setAttr -k on ".ControlePontaPeDireito";
	setAttr -k on ".TwistPontaPeDireito";
	setAttr -k on ".ControleDobraPeDireito";
createNode nurbsCurve -n "Kaokaoa_ctrl_tornozelo_dir_crv_IKShape" -p "Kaokaoa_ctrl_tornozelo_dir_crv_IK";
	rename -uid "49004157-4579-43B3-2F04-F7BED429D6EF";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 27 0 no 3
		28 0 0.23218582825046044 0.46437165650092083 0.69655748475138124 0.92874331300184165
		 1.1609291412523022 1.3931149695027627 1.6253007977532232 1.8574866260036837 2.0896724542541443
		 2.3218582825046048 2.5540441107550649 2.7862299390055254 3.0184157672559859 3.2506015955064465
		 3.482787423756907 3.7149732520073675 3.947159080257828 4.1793449085082885 4.4115307367587491
		 4.6437165650092096 4.8759023932596701 5.1080882215101306 5.3402740497605912 5.5724598780110517
		 5.8046457062615122 6.0368315345119727 6.2690173627624333
		28
		2.0523541608707876 5.0000000000000027 5.0577866150131774
		0.18635416087078749 5.0000000000000027 2.3744532765554895
		0.18635416087078671 -8.8817841970012523e-16 2.3744532765554913
		0.18635416087078749 5.0000000000000027 2.3744532765554913
		0.18635416087079193 5.0000000000000027 -12.831102308038073
		0.18635416087079026 -8.8817841970012523e-16 -12.831102308038069
		0.18635416087079193 5.0000000000000027 -12.831102308038076
		5.7843541608707891 5.0000000000000027 -15.514435646495766
		5.7843541608707891 -8.8817841970012523e-16 -15.514435646495766
		5.7843541608707891 5.0000000000000018 -15.514435646495766
		11.382354160870786 5.0000000000000018 -11.042213415732945
		11.382354160870783 -8.8817841970012513e-16 -11.042213415732945
		11.382354160870786 5.0000000000000018 -11.042213415732945
		10.44935416087079 5.0000000000000018 1.4800088304029311
		10.44935416087079 -8.8817841970012523e-16 1.4800088304029311
		10.44935416087079 5.0000000000000018 1.4800088304029311
		7.6503541608707861 5.0000000000000018 5.0577866150131809
		7.6503541608707861 -8.8817841970012523e-16 5.0577866150131792
		7.6503541608707861 5.0000000000000018 5.0577866150131792
		2.052354160870788 5.0000000000000027 5.0577866150131774
		2.0523541608707867 -8.8817841970012523e-16 5.0577866150131774
		0.18635416087078505 -8.8817841970012523e-16 2.3744532765554913
		0.1863541608707886 -8.8817841970012523e-16 -12.831102308038073
		5.78435416087079 -8.8817841970012523e-16 -15.514435646495755
		11.38235416087079 -8.8817841970012523e-16 -11.042213415732949
		10.44935416087079 -8.9618604340149781e-16 1.4800088304029302
		7.6503541608707861 -8.4701797637345434e-16 5.0577866150131809
		2.0523541608707876 -8.8817841970012523e-16 5.0577866150131774
		;
createNode transform -n "Kaokaoa_ctrl_joelho_dir_crv_IK_gp" -p "Kaokaoa_ctrl_tornozelo_dir_crv_IK";
	rename -uid "EB79DAA6-4C4E-E34B-7DD8-BF906F1F022E";
	setAttr ".rp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".sp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
createNode transform -n "Kaokaoa_ctrl_joelho_dir_crv_IK" -p "Kaokaoa_ctrl_joelho_dir_crv_IK_gp";
	rename -uid "D4746BDB-4925-EFD3-C785-368FB1A11035";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".sp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 0 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0.44499999 0.491 1 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_joelho_dir_crv_IKShape" -p "Kaokaoa_ctrl_joelho_dir_crv_IK";
	rename -uid "98F510BC-4333-E9F1-958E-69A6AD5344EE";
	setAttr -k off ".v";
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 0.99999999999999989 1.9999999999999998 2.9999999999999996 3.9999999999999996
		 4.9999999999999991 5.9999999999999991
		7
		9.9999998178277245 3.8992665178210628 7.0000058512945067
		10.000000182172293 1.6944016281007594 6.9999941046791463
		5.5372358753975348 1.3529983648666462 6.9999923253343859
		1.0000001822541256 1.6875232332360492 6.9999941512113502
		0.99999981774587443 3.8923893887864121 7.0000058977505688
		5.4896392334628246 4.2341574011015481 7.0000076746656141
		9.9999998178277067 3.8992665571587195 7.0000058512921619
		;
createNode transform -n "Kaokaoa_ctrl_twist_joelho_dir_crv_IK_gp" -p "Kaokaoa_ctrl_joelho_dir_crv_IK";
	rename -uid "7B533FA1-4BEE-58EA-C53F-C6986BCE3DAB";
	setAttr ".rp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".sp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
createNode transform -n "Kaokaoa_ctrl_twist_joelho_dir_crv_IK" -p "Kaokaoa_ctrl_twist_joelho_dir_crv_IK_gp";
	rename -uid "B83E6B92-4A0D-A6BB-9E18-A3A89D0554A3";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rp" -type "double3" 5.4964822752490861 2.8097964323090054 7 ;
	setAttr ".sp" -type "double3" 5.4964822752490861 2.8097964323090054 7 ;
	setAttr ".mntl" -type "double3" -3.2 0 0 ;
	setAttr ".mxtl" -type "double3" 3.2 0 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0.44499999 0.491 1 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_twist_joelho_dir_crv_IKShape" -p "Kaokaoa_ctrl_twist_joelho_dir_crv_IK";
	rename -uid "B73DF4B3-403E-C100-A8BB-848A07D0C696";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 10 0 no 3
		11 0 0.61803398874989479 1.2360679774997898 1.8541019662496847 2.4721359549995796
		 3.0901699437494745 3.7082039324993694 4.3262379212492643 4.9442719099991592 5.5623058987490541
		 6.180339887498949
		11
		5.4964822752490852 3.8987117182203606 7
		5.2178158273336761 3.0790988185136192 7
		4.2670629256889727 3.0790988185136192 7
		5.0866758253957149 2.6692923686602481 7
		4.6768693755423429 1.7208811463976503 7
		5.4964822752490852 2.2594859188068774 7
		6.3160951749558274 1.7208811463976503 7
		5.9062887251024554 2.6692923686602481 7
		6.7259016248091985 3.0790988185136192 7
		5.7751487231644942 3.0790988185136192 7
		5.4964822752490852 3.8987117182203606 7
		;
createNode transform -n "Kaokaoa_Calcanhar_Dir_grp" -p "Kaokaoa_ctrl_tornozelo_dir_crv_IK";
	rename -uid "E7382A56-4E6C-3FA8-43B8-8FA7E5FE7F14";
	setAttr ".t" -type "double3" -3.4206746996428526e-17 0 -4.1891183218419532e-33 ;
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr ".s" -type "double3" 1 1 -1 ;
	setAttr ".rp" -type "double3" -5.5843501091003418 2 0 ;
	setAttr ".rpt" -type "double3" 11.168700218200684 0 6.838856486427906e-16 ;
	setAttr ".sp" -type "double3" -5.5843501091003418 2 0 ;
createNode transform -n "Kaokaoa_Ponta_Pe_Dir_grp" -p "Kaokaoa_Calcanhar_Dir_grp";
	rename -uid "5138BA43-4205-DC2C-CA30-50B374188EED";
	setAttr ".rp" -type "double3" -5.5843501091003418 2 -11 ;
	setAttr ".sp" -type "double3" -5.5843501091003418 2 -11 ;
createNode transform -n "Kaokaoa_Pe_A_Pe_B_Dir_grp" -p "Kaokaoa_Ponta_Pe_Dir_grp";
	rename -uid "2894F2B2-4249-DA6F-FC0B-53A9C2B7F644";
	setAttr ".rp" -type "double3" -5.5843501091003418 2 -4 ;
	setAttr ".sp" -type "double3" -5.5843501091003418 2 -4 ;
createNode ikHandle -n "Kaokaoa_Pe_B_Dir_ikHandle" -p "Kaokaoa_Pe_A_Pe_B_Dir_grp";
	rename -uid "98020E38-41AD-929D-BB2B-70988EBB26F8";
	setAttr ".t" -type "double3" -5.5843500624352318 2.0000000014587145 -4.0000000019274129 ;
	setAttr ".r" -type "double3" 89.999997423926658 -55.454829943949996 90.000002258302686 ;
	setAttr ".roc" yes;
createNode ikHandle -n "Kaokaoa_Pe_C_Dir_ikHandle" -p "Kaokaoa_Pe_A_Pe_B_Dir_grp";
	rename -uid "DB0BE0F1-45BA-2259-F25C-38B8522B4F25";
	setAttr ".t" -type "double3" -5.584350084692268 2.0000000020428925 -7.0000000019274129 ;
	setAttr ".r" -type "double3" -179.9999983321573 -89.9999995747756 0 ;
	setAttr ".roc" yes;
createNode transform -n "Kaokaoa_Perna_Pe_A_Dir_grp" -p "Kaokaoa_Ponta_Pe_Dir_grp";
	rename -uid "D4A2A4A9-46DF-4AC1-C972-D4BA9F05E05F";
	setAttr ".rp" -type "double3" -5.5843501091003418 2 -4 ;
	setAttr ".sp" -type "double3" -5.5843501091003418 2 -4 ;
createNode ikHandle -n "Kaokaoa_Perna_Dir_ikHandle" -p "Kaokaoa_Perna_Pe_A_Dir_grp";
	rename -uid "33EFC3B8-4915-FC56-E118-729575BBE012";
	setAttr ".t" -type "double3" -5.4948200000000078 4.5553400000000011 -0.27931900000000365 ;
	setAttr ".pv" -type "double3" -0.12985681426154519 -0.056459279210147179 1.9949810920359405 ;
	setAttr ".roc" yes;
createNode parentConstraint -n "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1" 
		-p "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp";
	rename -uid "B509155D-46F6-3CA2-11CC-7B9256B6618E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_master_crvW0" -dv 1 
		-min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Kaokaoa_ctrl_root_crvW1" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".tg[0].tot" -type "double3" -5.4948153495788468 -44.444663047790534 -1.2793192863464364 ;
	setAttr ".tg[0].tor" -type "double3" 0 180 0 ;
	setAttr ".tg[1].tot" -type "double3" -5.4948153495788574 -44.444663047790542 -1.279319286346438 ;
	setAttr ".tg[1].tor" -type "double3" 0 180 0 ;
	setAttr ".lr" -type "double3" 0 180 0 ;
	setAttr ".rsrr" -type "double3" 0 180 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp" -p "Kaokaoa_ctrl_master_crv";
	rename -uid "AEB7A97C-4A3F-5462-2679-72B610DFB931";
	setAttr ".rp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".sp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
createNode transform -n "Kaokaoa_ctrl_tornozelo_esq_crv_IK" -p "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp";
	rename -uid "3BD773D5-4442-F1FC-0E53-B193866EC72C";
	addAttr -ci true -sn "ControlePontaPeEsquerdo" -ln "ControlePontaPeEsquerdo" -nn "Controle Ponta Pe Esquerdo" 
		-min 0 -max 10 -at "double";
	addAttr -ci true -sn "TwistPontaPeEsquerdo" -ln "TwistPontaPeEsquerdo" -nn "Twist Ponta Pe Esquerdo" 
		-dv 10 -min 0 -max 20 -at "double";
	addAttr -ci true -sn "ControleDobraPeEsquerdo" -ln "ControleDobraPeEsquerdo" -nn "Controle Dobra Pe Esquerdo" 
		-dv 10 -min 0 -max 20 -at "double";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".sp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
	setAttr -k on ".ControlePontaPeEsquerdo";
	setAttr -k on ".TwistPontaPeEsquerdo";
	setAttr -k on ".ControleDobraPeEsquerdo";
createNode nurbsCurve -n "Kaokaoa_ctrl_tornozelo_esq_crv_IKShape" -p "Kaokaoa_ctrl_tornozelo_esq_crv_IK";
	rename -uid "CC3D53B6-43DD-A28F-439C-39B180ED4A65";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 27 0 no 3
		28 0 0.23218582825046044 0.46437165650092083 0.69655748475138124 0.92874331300184165
		 1.1609291412523022 1.3931149695027627 1.6253007977532232 1.8574866260036837 2.0896724542541443
		 2.3218582825046048 2.5540441107550649 2.7862299390055254 3.0184157672559859 3.2506015955064465
		 3.482787423756907 3.7149732520073675 3.947159080257828 4.1793449085082885 4.4115307367587491
		 4.6437165650092096 4.8759023932596701 5.1080882215101306 5.3402740497605912 5.5724598780110517
		 5.8046457062615122 6.0368315345119727 6.2690173627624333
		28
		2.0523541608707876 5.0000000000000027 5.0577866150131774
		0.18635416087078749 5.0000000000000027 2.3744532765554895
		0.18635416087078671 -8.8817841970012523e-16 2.3744532765554913
		0.18635416087078749 5.0000000000000027 2.3744532765554913
		0.18635416087079193 5.0000000000000027 -12.831102308038073
		0.18635416087079026 -8.8817841970012523e-16 -12.831102308038069
		0.18635416087079193 5.0000000000000027 -12.831102308038076
		5.7843541608707891 5.0000000000000027 -15.514435646495766
		5.7843541608707891 -8.8817841970012523e-16 -15.514435646495766
		5.7843541608707891 5.0000000000000018 -15.514435646495766
		11.382354160870786 5.0000000000000018 -11.042213415732945
		11.382354160870783 -8.8817841970012513e-16 -11.042213415732945
		11.382354160870786 5.0000000000000018 -11.042213415732945
		10.44935416087079 5.0000000000000018 1.4800088304029311
		10.44935416087079 -8.8817841970012523e-16 1.4800088304029311
		10.44935416087079 5.0000000000000018 1.4800088304029311
		7.6503541608707861 5.0000000000000018 5.0577866150131809
		7.6503541608707861 -8.8817841970012523e-16 5.0577866150131792
		7.6503541608707861 5.0000000000000018 5.0577866150131792
		2.052354160870788 5.0000000000000027 5.0577866150131774
		2.0523541608707867 -8.8817841970012523e-16 5.0577866150131774
		0.18635416087078505 -8.8817841970012523e-16 2.3744532765554913
		0.1863541608707886 -8.8817841970012523e-16 -12.831102308038073
		5.78435416087079 -8.8817841970012523e-16 -15.514435646495755
		11.38235416087079 -8.8817841970012523e-16 -11.042213415732949
		10.44935416087079 -8.9618604340149781e-16 1.4800088304029302
		7.6503541608707861 -8.4701797637345434e-16 5.0577866150131809
		2.0523541608707876 -8.8817841970012523e-16 5.0577866150131774
		;
createNode transform -n "Kaokaoa_ctrl_joelho_esq_crv_IK_gp" -p "Kaokaoa_ctrl_tornozelo_esq_crv_IK";
	rename -uid "298D1D79-4664-448B-6023-79917C89ED7F";
	setAttr ".rp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".sp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
createNode transform -n "Kaokaoa_ctrl_joelho_esq_crv_IK" -p "Kaokaoa_ctrl_joelho_esq_crv_IK_gp";
	rename -uid "0253F194-492B-90C1-C9A4-0A88FF0F36E6";
	setAttr ".rp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".sp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 0 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_joelho_esq_crv_IKShape" -p "Kaokaoa_ctrl_joelho_esq_crv_IK";
	rename -uid "CA4CF6C0-40FE-7CC5-B305-09B22D881A1A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 0.99999999999999989 1.9999999999999998 2.9999999999999996 3.9999999999999996
		 4.9999999999999991 5.9999999999999991
		7
		9.9999998178277245 3.8992665178210628 7.0000058512945067
		10.000000182172293 1.6944016281007594 6.9999941046791463
		5.5372358753975348 1.3529983648666462 6.9999923253343859
		1.0000001822541256 1.6875232332360492 6.9999941512113502
		0.99999981774587443 3.8923893887864121 7.0000058977505688
		5.4896392334628246 4.2341574011015481 7.0000076746656141
		9.9999998178277067 3.8992665571587195 7.0000058512921619
		;
createNode transform -n "Kaokaoa_ctrl_twist_joelho_esq_crv_IK_gp" -p "Kaokaoa_ctrl_joelho_esq_crv_IK";
	rename -uid "C9BFB609-4F6A-06CD-92A9-408DA9681253";
	setAttr ".rp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
	setAttr ".sp" -type "double3" 5.4948153495788574 4.5553369522094727 -0.27931928634643555 ;
createNode transform -n "Kaokaoa_ctrl_twist_joelho_esq_crv_IK" -p "Kaokaoa_ctrl_twist_joelho_esq_crv_IK_gp";
	rename -uid "61FE39CB-4F44-D861-6055-AF8E651FA0B7";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rp" -type "double3" 5.4964822752490861 2.8097964323090054 7 ;
	setAttr ".sp" -type "double3" 5.4964822752490861 2.8097964323090054 7 ;
	setAttr ".mntl" -type "double3" -3.2 0 0 ;
	setAttr ".mxtl" -type "double3" 3.2 0 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_twist_joelho_esq_crv_IKShape" -p "Kaokaoa_ctrl_twist_joelho_esq_crv_IK";
	rename -uid "85BFB228-44AF-49E5-D6D8-6F82D4701842";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 10 0 no 3
		11 0 0.61803398874989479 1.2360679774997898 1.8541019662496847 2.4721359549995796
		 3.0901699437494745 3.7082039324993694 4.3262379212492643 4.9442719099991592 5.5623058987490541
		 6.180339887498949
		11
		5.4964822752490852 3.8987117182203606 7
		5.2178158273336761 3.0790988185136192 7
		4.2670629256889727 3.0790988185136192 7
		5.0866758253957149 2.6692923686602481 7
		4.6768693755423429 1.7208811463976503 7
		5.4964822752490852 2.2594859188068774 7
		6.3160951749558274 1.7208811463976503 7
		5.9062887251024554 2.6692923686602481 7
		6.7259016248091985 3.0790988185136192 7
		5.7751487231644942 3.0790988185136192 7
		5.4964822752490852 3.8987117182203606 7
		;
createNode transform -n "Kaokaoa_Calcanhar_Esq_grp" -p "Kaokaoa_ctrl_tornozelo_esq_crv_IK";
	rename -uid "4D800039-4747-B96D-F427-9987E152EC26";
	setAttr ".rp" -type "double3" 5.584348201751709 2 0 ;
	setAttr ".sp" -type "double3" 5.584348201751709 2 0 ;
createNode transform -n "Kaokaoa_Ponta_Pe_Esq_grp" -p "Kaokaoa_Calcanhar_Esq_grp";
	rename -uid "5C33033C-4745-C908-230B-519E957BD43B";
	setAttr ".rp" -type "double3" 5.584348201751709 2 -11 ;
	setAttr ".sp" -type "double3" 5.584348201751709 2 -11 ;
createNode transform -n "Kaokaoa_Pe_A_Pe_B_Esq_grp" -p "Kaokaoa_Ponta_Pe_Esq_grp";
	rename -uid "4A98B2B0-414D-7B8D-F6F7-FDB9A5D40F5E";
	setAttr ".rp" -type "double3" 5.584348201751709 2 -4 ;
	setAttr ".sp" -type "double3" 5.584348201751709 2 -4 ;
createNode ikHandle -n "Kaokaoa_Pe_B_Esq_ikHandle" -p "Kaokaoa_Pe_A_Pe_B_Esq_grp";
	rename -uid "610D3FC8-44D9-8017-7331-7BAD634BCD6A";
	setAttr ".t" -type "double3" 5.5843479942978052 2.0000000000000058 -3.9999999999999982 ;
	setAttr ".r" -type "double3" -90.000000000000014 55.454829982290939 -89.999999999999957 ;
	setAttr ".roc" yes;
createNode ikHandle -n "Kaokaoa_Pe_C_Esq_ikHandle" -p "Kaokaoa_Pe_A_Pe_B_Esq_grp";
	rename -uid "BA4240BA-41BF-7210-DF01-7BB75DE861C8";
	setAttr ".t" -type "double3" 5.5843479942978025 2.0000000000000067 -6.9999999999999964 ;
	setAttr ".r" -type "double3" -4.7186510469525154e-14 89.999999999999986 0 ;
	setAttr ".roc" yes;
createNode transform -n "Kaokaoa_Perna_Pe_A_Esq_grp" -p "Kaokaoa_Ponta_Pe_Esq_grp";
	rename -uid "32CC1DCF-4122-8184-8752-B1B3E11B20E1";
	setAttr ".rp" -type "double3" 5.584348201751709 2 -4 ;
	setAttr ".sp" -type "double3" 5.584348201751709 2 -4 ;
createNode ikHandle -n "Kaokaoa_Perna_Esq_ikHandle" -p "Kaokaoa_Perna_Pe_A_Esq_grp";
	rename -uid "0FA67997-49DC-1C4E-A4EA-58969D5F8A4C";
	setAttr ".t" -type "double3" 5.4948153495788743 4.5553369522094762 -0.27931928634643866 ;
	setAttr ".pv" -type "double3" 0.12985839478693945 -0.056459265558335969 1.9949809895425004 ;
	setAttr ".roc" yes;
createNode parentConstraint -n "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1" 
		-p "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp";
	rename -uid "B6C185CA-45AA-380A-EB0A-6F9EBFA238DA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_master_crvW0" -dv 1 
		-min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Kaokaoa_ctrl_root_crvW1" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".tg[0].tot" -type "double3" 5.4948153495788681 -44.444663047790534 -1.2793192863464358 ;
	setAttr ".tg[1].tot" -type "double3" 5.4948153495788574 -44.444663047790542 -1.2793192863464373 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "Kaokaoa_ctrl_pulso_dir_crv_IK_gp" -p "Kaokaoa_ctrl_master_crv";
	rename -uid "A5536095-45A0-B8A8-5087-15BF05DE7C53";
	setAttr ".s" -type "double3" 1 1 -1 ;
	setAttr ".rp" -type "double3" 28.969997406005859 61.854949951171875 3.5025157928466797 ;
	setAttr ".rpt" -type "double3" -57.939994812011719 0 -7.0050315856933629 ;
	setAttr ".sp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".spt" -type "double3" 0 0 7.0050315856933594 ;
createNode transform -n "Kaokaoa_ctrl_pulso_dir_crv_IK" -p "Kaokaoa_ctrl_pulso_dir_crv_IK_gp";
	rename -uid "8F1B08D1-4469-0D5B-3BD8-6382369F5D89";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".sp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 0.44499999 0.491 1 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_pulso_dir_crv_IKShape" -p "Kaokaoa_ctrl_pulso_dir_crv_IK";
	rename -uid "AB72963B-431F-36F6-0CAD-DDA38B844D8E";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 7 0 no 3
		8 0 0.86776747823511613 1.7355349564702323 2.6033024347053488 3.4710699129404654
		 4.3388373911755815 5.2066048694106977 6.0743723476458147
		8
		29.999995674411611 57.999999581704628 -5.0000361900412624
		29.999996644533432 59.434413934211186 -6.9999996904919248
		30.000000094048367 62.999999247871884 -7.0000003095080716
		30.00000434608571 66 -2.9999999999999991
		30.000003400586255 63.000000752128116 0.99999969049192705
		29.999999951071324 59.584839561056874 1.0000003095080721
		29.999997501128451 58.000000418295379 -0.999999999999998
		29.999995653914304 57.999999583490322 -4.9999638099587358
		;
createNode parentConstraint -n "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1" 
		-p "Kaokaoa_ctrl_pulso_dir_crv_IK_gp";
	rename -uid "A807C2F0-4D60-A493-5D76-2FAF73278F79";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_root_crvW0" -dv 1 -min 
		0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Kaokaoa_ctrl_master_crvW1" -dv 1 -min 
		0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w2" -ln "Kaokaoa_ctrl_ombro_dir_crvW2" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 3 ".tg";
	setAttr ".tg[0].tot" -type "double3" -28.969997406005881 12.854949951171861 -4.5025157928466868 ;
	setAttr ".tg[0].tor" -type "double3" 0 180 0 ;
	setAttr ".tg[1].tot" -type "double3" -28.96999740600587 12.854949951171868 -4.5025157928466859 ;
	setAttr ".tg[1].tor" -type "double3" 0 180 0 ;
	setAttr ".tg[2].tot" -type "double3" 25.070420265197754 -2.1844482421875142 -0.44029617309570179 ;
	setAttr ".tg[2].tor" -type "double3" 7.016709298534876e-15 -7.016709298534876e-15 
		180 ;
	setAttr ".lr" -type "double3" 0 180 0 ;
	setAttr ".rst" -type "double3" -1.7763568394002505e-14 0 -8.8817841970012523e-16 ;
	setAttr ".rsrr" -type "double3" 0 180 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
	setAttr -k on ".w2";
createNode transform -n "Kaokaoa_ctrl_pulso_esq_crv_IK_gp" -p "Kaokaoa_ctrl_master_crv";
	rename -uid "6C104FE6-4103-D941-0743-CBA974D4D871";
	setAttr ".rp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".sp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
createNode transform -n "Kaokaoa_ctrl_pulso_esq_crv_IK" -p "Kaokaoa_ctrl_pulso_esq_crv_IK_gp";
	rename -uid "451B5D28-495A-411A-9A1C-57AA63A290ED";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".sp" -type "double3" 28.969997406005859 61.854949951171875 -3.5025157928466797 ;
	setAttr ".uocol" yes;
	setAttr ".oclr" -type "float3" 1 0 0 ;
createNode nurbsCurve -n "Kaokaoa_ctrl_pulso_esq_crv_IKShape" -p "Kaokaoa_ctrl_pulso_esq_crv_IK";
	rename -uid "FACB6ECE-47E2-44C5-5DAA-3883D0E6F3FC";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 7 0 no 3
		8 0 0.86776747823511613 1.7355349564702323 2.6033024347053488 3.4710699129404654
		 4.3388373911755815 5.2066048694106977 6.0743723476458147
		8
		29.999995674411611 57.999999581704628 -5.0000361900412624
		29.999996644533432 59.434413934211186 -6.9999996904919248
		30.000000094048367 62.999999247871884 -7.0000003095080716
		30.00000434608571 66 -2.9999999999999991
		30.000003400586255 63.000000752128116 0.99999969049192705
		29.999999951071324 59.584839561056874 1.0000003095080721
		29.999997501128451 58.000000418295379 -0.999999999999998
		29.999995653914304 57.999999583490322 -4.9999638099587358
		;
createNode parentConstraint -n "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1" 
		-p "Kaokaoa_ctrl_pulso_esq_crv_IK_gp";
	rename -uid "57A1BBE8-4305-390A-A09D-FFACA7BC796E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_root_crvW0" -dv 1 -min 
		0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Kaokaoa_ctrl_master_crvW1" -dv 1 -min 
		0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w2" -ln "Kaokaoa_ctrl_ombro_esq_crvW2" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 3 ".tg";
	setAttr ".tg[0].tot" -type "double3" 28.969997406005859 12.854949951171861 -4.5025157928466815 ;
	setAttr ".tg[1].tot" -type "double3" 28.96999740600587 12.854949951171868 -4.5025157928466806 ;
	setAttr ".tg[2].tot" -type "double3" 25.070420265197754 -2.1844482421875071 -0.44029617309570401 ;
	setAttr ".rst" -type "double3" 0 0 -4.4408920985006262e-16 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
	setAttr -k on ".w2";
createNode transform -n "Kaokaoa_jnt_gp";
	rename -uid "2B21B5FA-4069-91FB-71B8-AEA6D6DDCD33";
createNode joint -n "Kaokaoa_Root_jnt" -p "Kaokaoa_jnt_gp";
	rename -uid "F2054CD2-49BB-6908-2F50-0B9FE6712262";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 49 1 1;
	setAttr ".radi" 0.5;
createNode joint -n "Kaokaoa_Bacia_A_jnt" -p "Kaokaoa_Root_jnt";
	rename -uid "1D624980-4886-EE76-534F-A79F03B5300B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -1.0658141036401503e-14 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -89.999999999999986 ;
	setAttr ".bps" -type "matrix" 2.2204460492503131e-16 -0.99995649442159862 0.0093278756460142657 0
		 1 2.2204460492503131e-16 8.6736173798840355e-19 0 -2.6020852139652106e-18 0.0093278756460142657 0.99995649442159862 0
		 -1.0658141036401503e-14 49 1 1;
	setAttr ".radi" 0.65517241379310387;
createNode joint -n "Kaokaoa_Bacia_B_jnt" -p "Kaokaoa_Bacia_A_jnt";
	rename -uid "76E568B9-46D7-0D03-C8B3-38861F86E1B7";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.0000000000000071 -8.8817841970012681e-16 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 89.999999999999986 ;
	setAttr ".bps" -type "matrix" 1 9.6601789681697489e-21 2.9385662005974624e-18 0 0 0.99995649442159862 -0.0093278756460142657 0
		 -2.6020852139652106e-18 0.0093278756460142657 0.99995649442159862 0 -1.0658141036401503e-14 45.000174022313601 1.0373115025840571 1;
	setAttr ".radi" 0.65517241379310387;
createNode joint -n "Kaokaoa_Calda_A_jnt" -p "Kaokaoa_Bacia_B_jnt";
	rename -uid "E1F7E194-49B2-00D1-9825-0986AB41B47E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.0642359300857972e-14 -2.943728207075111 -6.0650340960516926 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -89.999999999999929 53.894083342809296 -89.999999999999929 ;
	setAttr ".bps" -type "matrix" 5.5721381251145292e-16 -0.59679041602894878 -0.80239715810563195 0
		 1.6806680992588264e-16 0.80239715810563184 -0.59679041602894878 0 1.0000000000000002 1.7171387989503816e-16 5.5647252471879859e-16 0
		 0 41.999999999999986 -5.0000000000000018 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Calda_B_jnt" -p "Kaokaoa_Calda_A_jnt";
	rename -uid "2E028529-4CBD-A7F7-0BDC-4BA0A0EF7736";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.2688099557178738 0 -1.4516432303847703e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 5.5721381251145292e-16 -0.59679041602894878 -0.80239715810563195 0
		 1.6806680992588264e-16 0.80239715810563184 -0.59679041602894878 0 1.0000000000000002 1.7171387989503816e-16 5.5647252471879859e-16 0
		 3.6978282741617934e-16 40.049205546607546 -7.6228838188554207 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Calda_C_jnt" -p "Kaokaoa_Calda_B_jnt";
	rename -uid "AE232B99-4DBB-4A90-3C3E-8CA3A6ED5EC2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.2688099557178933 1.4210854715202004e-14 -1.4516432303847758e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -0.118688078414321 ;
	setAttr ".bps" -type "matrix" 5.5686446721114707e-16 -0.59845129830468302 -0.80115918740125525 0
		 1.6922071566406036e-16 0.80115918740125514 -0.59845129830468302 0 1.0000000000000002 1.7171387989503816e-16 5.5647252471879859e-16 0
		 7.3956565483236656e-16 38.098411093215105 -10.245767637710863 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Calda_D_jnt" -p "Kaokaoa_Calda_C_jnt";
	rename -uid "94200B79-42A9-DF28-7BFD-5082CD3232EA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.2688099557178845 -7.1054273576010019e-15 -1.4520175572897851e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 1.9833489589596969 ;
	setAttr ".bps" -type "matrix" 5.6238743418430996e-16 -0.57036541857511758 -0.82139106964565378 0
		 1.4984678616440139e-16 0.82139106964565367 -0.57036541857511747 0 1.0000000000000002 1.7171387989503816e-16 5.5647252471879859e-16 0
		 1.107832211947913e-15 36.142187531304458 -12.864604765602932 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Calda_E_jnt" -p "Kaokaoa_Calda_D_jnt";
	rename -uid "B0A89896-4CB2-2513-1B56-58B47189AAF5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.2688099557178756 -2.1316282072803006e-14 -1.4453545621080697e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 4.2206264426068332 ;
	setAttr ".bps" -type "matrix" 5.7189057346253554e-16 -0.50836651100496055 -0.8611408075852891 0
		 1.0805025421952333e-16 0.86114080758528899 -0.50836651100496044 0 1.0000000000000002 1.7171387989503816e-16 5.5647252471879859e-16 0
		 1.5008152936721436e-15 34.277771372668902 -15.549576071598388 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Calda_F_jnt" -p "Kaokaoa_Calda_E_jnt";
	rename -uid "951E1FEA-4627-328D-04FF-E6B887D0F4B9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.2688099557178871 4.2632564145606011e-14 -1.4283175113388154e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 5.7087993318582466 ;
	setAttr ".bps" -type "matrix" 5.7980220672721566e-16 -0.42018528186875997 -0.907438333387383 0
		 5.0626934792287371e-17 0.907438333387383 -0.42018528186875986 0 1.0000000000000002 1.7171387989503816e-16 5.5647252471879859e-16 0
		 1.9418993824488802e-15 32.616017860342353 -18.364481716708145 1;
	setAttr ".radi" 0.55172413793103436;
createNode joint -n "Kaokaoa_Calda_G_jnt" -p "Kaokaoa_Calda_F_jnt";
	rename -uid "010A4EAC-4A7B-D01F-9DBC-2B98FF935514";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.268809955717872 -4.2632564145606011e-14 -1.3992314577054296e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -0.12115903094596014 ;
	setAttr ".bps" -type "matrix" 5.7969385354386242e-16 -0.42210323186751481 -0.9065477712988983 0
		 5.1852884352544771e-17 0.9065477712988983 -0.42210323186751469 0 1.0000000000000002 1.7171387989503816e-16 5.5647252471879859e-16 0
		 2.4379311504405626e-15 31.242512027723592 -21.330725175084837 1;
	setAttr ".radi" 0.55172413793103459;
createNode joint -n "Kaokaoa_Calda_H_jnt" -p "Kaokaoa_Calda_G_jnt";
	rename -uid "DB3F7BA9-4EDA-5B4D-72B0-C8BEA8E4B9A7";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.2688099557179076 1.4210854715202004e-14 -1.3999192744485127e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 6.5002054688414885 ;
	setAttr ".bps" -type "matrix" 5.8183736036081392e-16 -0.31676236878963837 -0.94850492972824219 0
		 -1.4105727225909738e-17 0.94850492972824219 -0.31676236878963826 0 1.0000000000000002 1.7171387989503816e-16 5.5647252471879859e-16 0
		 2.9329209157247066e-15 29.86273678105437 -24.294057555240563 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Calda_I_jnt" -p "Kaokaoa_Calda_H_jnt";
	rename -uid "4B7A1D0D-43A6-6ABB-3730-5D996E7EBD6B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.2688099557178703 0 -1.3588440692619763e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 5.8183736036081392e-16 -0.31676236878963837 -0.94850492972824219 0
		 -1.4105727225909738e-17 0.94850492972824219 -0.31676236878963826 0 1.0000000000000002 1.7171387989503816e-16 5.5647252471879859e-16 0
		 3.4759926026187644e-15 28.827300796358024 -27.394539912583721 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Calda_J_jnt" -p "Kaokaoa_Calda_I_jnt";
	rename -uid "68DCE5EB-4990-962A-5D82-FE82F723A21D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.2688099557179093 -3.5527136788005009e-14 -1.3588440692619771e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 0.89716207542300419 ;
	setAttr ".bps" -type "matrix" 5.8154516793929133e-16 -0.30187204349347202 -0.95334845117463518 0
		 -2.3214286520864991e-17 0.95334845117463518 -0.30187204349347191 0 1.0000000000000002 1.7171387989503816e-16 5.5647252471879859e-16 0
		 4.0190642895128448e-15 27.791864811661632 -30.495022269926903 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Calda_K_jnt" -p "Kaokaoa_Calda_J_jnt";
	rename -uid "14687577-4B32-C54E-55E2-A0916CBC8234";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.2688099557178312 2.1316282072803006e-14 -1.3525224489277902e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 5.8154516793929133e-16 -0.30187204349347202 -0.95334845117463518 0
		 -2.3214286520864991e-17 0.95334845117463518 -0.30187204349347191 0 1.0000000000000002 1.7171387989503816e-16 5.5647252471879859e-16 0
		 4.5675024752446073e-15 26.805102470537307 -33.611337178394734 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Calda_L_jnt_FIM" -p "Kaokaoa_Calda_K_jnt";
	rename -uid "ABE64455-4373-098A-DB06-059A35BB21F5";
	setAttr ".t" -type "double3" 3.2688099557178738 7.1054273576010019e-15 -1.3525224489278028e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -89.999999999999986 0 ;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Perna_Dir_A_jnt" -p "Kaokaoa_Bacia_B_jnt";
	rename -uid "94A36F18-4DEB-79CF-D2CF-218E496E841B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -4.8254499999999894 -4.1857880522540398 -0.28603245702353952 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.91856180405409 4.8001455519761018 88.497748938352714 ;
	setAttr ".bps" -type "matrix" 0.026124273704060341 0.99532624970085692 -0.092968698925300242 0
		 0.99965840412637341 -0.026082950188345305 0.001659749675381455 0 -0.00077290552330422802 -0.092980300956170797 -0.99566764849077649 0
		 -4.82545 40.811900000000001 0.79033599999999993 1;
	setAttr ".radi" 1.3793103448275861;
createNode joint -n "Kaokaoa_Perna_Dir_B_jnt" -p "Kaokaoa_Perna_Dir_A_jnt";
	rename -uid "D9527B60-4E48-46B4-6013-1AA2D5EB7682";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -16.747322022586371 1.1405771616068705e-06 0.038188185458862378 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.15543002220696467 12.86444358046907 -0.81741768618922639 ;
	setAttr ".bps" -type "matrix" 0.0117347260983725 0.99130874177510819 0.13103157895579354 0
		 0.99992056629772919 -0.012236204285877531 0.0030226477636840676 0 0.0045997063194511099 0.13098570068876395 -0.99137358695743405 0
		 -5.2629900000000047 24.139299999999988 2.3092899999999998 1;
	setAttr ".radi" 1.3275862068965516;
createNode joint -n "Kaokaoa_Pe_Dir_A_jnt" -p "Kaokaoa_Perna_Dir_B_jnt";
	rename -uid "88BF39DC-4AF4-B08B-82E2-5DA77D2D6830";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -19.755660732694594 -2.7028032612008701e-06 -6.4832164660133529e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -89.606689183143232 47.927522549099081 -0.38041701071842787 ;
	setAttr ".bps" -type "matrix" 2.697495005143935e-16 0.56705577352237713 0.82367939740832363 0
		 -9.7274618915399458e-16 -0.82367939740832363 0.56705577352237735 0 1.0000000000000004 -1.2506272059620294e-15 5.1521287236511171e-16 0
		 -5.4948200000000078 4.5553400000000011 -0.27931900000000143 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Pe_Dir_B_jnt" -p "Kaokaoa_Pe_Dir_A_jnt";
	rename -uid "FB40BB59-40B4-7554-9229-798938578F86";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -4.5136685843412678 -0.005052731111625075 -0.089529999999998999 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.7075472871464478e-06 0 34.545170017709076 ;
	setAttr ".bps" -type "matrix" -3.2941423669677117e-16 -1.6653345369377348e-16 1.0000000000000004 0
		 2.9802321340008565e-08 -0.99999999999999978 -1.1102228710797558e-16 0 1 2.9802321043575363e-08 5.1521287071075028e-16 0
		 -5.5843500000000077 2 -4.0000000000000018 1;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Pe_Dir_C_jnt" -p "Kaokaoa_Pe_Dir_B_jnt";
	rename -uid "FBA3F3E0-438B-D875-64DF-7B8DB814B307";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -2.9999999999999991 4.4408920985006262e-16 -1.7763568394002505e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 3.7988570508352478e-06 -89.999998292452744 0 ;
	setAttr ".bps" -type "matrix" 0.99999999999999967 2.9802321043575349e-08 2.980232223677438e-08 0
		 2.9802323315978856e-08 -0.99999999999999756 -6.6302563460698902e-08 0 2.9802320075005436e-08 6.6302564404388407e-08 -0.99999999999999789 0
		 -5.5843500000000086 2 -7.0000000000000018 1;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Dedao_Pe_A_Dir_jnt" -p "Kaokaoa_Pe_Dir_C_jnt";
	rename -uid "83CAC72D-49E2-CED6-3F7F-17AB3A7586FB";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.3070500557407692 -0.10252004845621054 -1.7678299244472111 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 4.0864855371422726 115.89386732954441 2.7131380922452206 ;
	setAttr ".bps" -type "matrix" -0.43621600254407211 0.020671599691700779 0.89960451537920672 0
		 0.016820788469320128 -0.99937409134514921 0.031120517722689742 0 0.89968475601164977 0.028707325097332235 0.4355952585669588 0
		 -3.2773000000000092 2.1025199999999993 -5.2321700000000035 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Dedao_Pe_B_Dir_jnt" -p "Kaokaoa_Dedao_Pe_A_Dir_jnt";
	rename -uid "1E93453C-4088-EB13-A4C2-0F8ED7FC0315";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -2.9423590228348719 -0.14942681500230526 -6.8262100505478429e-07 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -27.642589871312378 ;
	setAttr ".bps" -type "matrix" -0.39422993347009555 0.48197638024178824 0.7824842033199062 0
		 -0.18748359756635669 -0.87571379935158022 0.44494408892443699 0 0.89968475601164977 0.028707325097332235 0.4355952585669588 0
		 -1.9963100000000096 2.1910299999999983 -7.8837800000000025 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Dedao_Pe_C_Dir_jnt_FIM" -p "Kaokaoa_Dedao_Pe_B_Dir_jnt";
	rename -uid "6EE9ED72-44F0-1287-0E9A-2AB8B3F09A9F";
	setAttr ".t" -type "double3" -2.509086079254554 -2.4436316081732912e-06 3.0052347455011841e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -89.999999999994301 0 ;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Indicador_Pe_A_Dir_jnt" -p "Kaokaoa_Pe_Dir_C_jnt";
	rename -uid "AB11DD42-4EC4-4405-1561-E1866355BC41";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 0.75903003880172815 0.032649934132130243 -1.334619979543918 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 103.93473751539629 81.94829458352504 105.50066396715661 ;
	setAttr ".bps" -type "matrix" -0.03743278479159546 -0.13497216243848073 0.99014206151916784 0
		 -0.024770142042675088 -0.99040672558490206 -0.13594468720541697 0 0.99899210541722139 -0.029614747725978323 0.033730402179560331 0
		 -4.8253200000000085 1.9673499999999995 -5.6653800000000034 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Indicador_Pe_B_Dir_jnt" -p "Kaokaoa_Indicador_Pe_A_Dir_jnt";
	rename -uid "20CA0913-4893-4EB4-054D-0C965ACBBEB3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -3.3850538864971984 0.08242881177202932 -2.204874300915094e-07 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -39.830421485610728 ;
	setAttr ".bps" -type "matrix" -0.012880555202277544 0.53072187180978836 0.84744816129389089 0
		 -0.042998425689195659 -0.84702848919020524 0.52980550571734308 0 0.99899210541722139 -0.029614747725978323 0.033730402179560331 0
		 -4.7006500000000093 2.3425999999999996 -9.0282700000000027 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Indicador_Pe_C_Dir_jnt_FIM" -p "Kaokaoa_Indicador_Pe_B_Dir_jnt";
	rename -uid "DB9EFDB0-4D4D-F437-F067-36875C548999";
	setAttr ".t" -type "double3" -2.6500005406990894 1.4805330185829746e-05 7.1655774984691334e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -89.999999999999986 0 ;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Medio_Pe_A_Dir_jnt" -p "Kaokaoa_Pe_Dir_C_jnt";
	rename -uid "2CD12649-405D-E9AC-8848-BDB7EEEE0B6D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -1.2319699558567994 0.0034398648489937234 -1.484640036943639 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 29.414379005209433 73.930452527339213 29.880268032595147 ;
	setAttr ".bps" -type "matrix" 0.2400079366915534 -0.13790079081878634 0.96092640832512155 0
		 -0.024770142042671937 -0.99040672558490195 -0.13594468720541789 0 0.97045485747058335 0.0088255202535828577 -0.24112129686944772 0
		 -6.816320000000009 1.9965600000000006 -5.5153600000000029 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Medio_Pe_B_Dir_jnt" -p "Kaokaoa_Medio_Pe_A_Dir_jnt";
	rename -uid "871A1918-4304-F6E6-0BDF-0EA1BD79C871";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -3.3850593296414919 0.082433189903117876 3.0780501072413813e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -39.830421485610735 ;
	setAttr ".bps" -type "matrix" 0.20017825620653942 0.5284728505470464 0.82501218898679862 0
		 0.13470722086755371 -0.84890432701626206 0.51109236760022936 0 0.97045485747058335 0.0088255202535828577 -0.24112129686944772 0
		 -7.6308000000000096 2.3817200000000014 -8.779360000000004 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Medio_Pe_C_Dir_jnt_FIM" -p "Kaokaoa_Medio_Pe_B_Dir_jnt";
	rename -uid "9688C120-4B79-EB8A-06ED-809D30B7050C";
	setAttr ".t" -type "double3" -2.6500575551546106 -1.6979552768248141e-05 6.3758825374904404e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -89.999999999999815 0 ;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Anelar_Pe_A_Dir_jnt" -p "Kaokaoa_Pe_Dir_C_jnt";
	rename -uid "A5446858-4BEA-04DC-B3AE-4DB57D419260";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -2.4315399311211676 -0.0020402255681066794 -2.3091500723302678 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -3.4023439515515692 58.373380161150273 -3.8622467076597609 ;
	setAttr ".bps" -type "matrix" 0.52319060450126964 0.035321191011972147 0.85148341429947616 0
		 0.016820788469389336 -0.99937409134514621 0.031120517722745215 0 0.85204967721187785 -0.0019593400826308756 -0.52345726525627312 0
		 -8.0158900000000077 2.0020400000000018 -4.6908500000000029 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Anelar_Pe_B_Dir_jnt" -p "Kaokaoa_Anelar_Pe_A_Dir_jnt";
	rename -uid "B12B7729-40E0-DF11-FAE0-879C65040FE5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -2.7949336502290745 -0.22664223191429755 -5.484368545971563e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -27.642589871312371 ;
	setAttr ".bps" -type "matrix" 0.45566899700481528 0.49495385184096358 0.73985569519766514 0
		 0.25763756079376615 -0.86891705331074864 0.42261808022611247 0 0.85204967721187785 -0.0019593400826308756 -0.52345726525627312 0
		 -9.4819900000000068 2.1298200000000023 -7.0777400000000039 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Anelar_Pe_C_Dir_jnt_FIM" -p "Kaokaoa_Anelar_Pe_B_Dir_jnt";
	rename -uid "1142CAD0-492D-D074-1763-CAA0435F6102";
	setAttr ".t" -type "double3" -2.5090861935039275 5.8935452580399783e-06 1.4914552197708986e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -89.999999999998636 0 ;
	setAttr ".radi" 0.55172413793103448;
createNode orientConstraint -n "Kaokaoa_Pe_Dir_C_jnt_orientConstraint1" -p "Kaokaoa_Pe_Dir_C_jnt";
	rename -uid "145A6C62-4656-A3A8-669C-F4963ADE492D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Pe_Dir_C_jnt_IKW0" -dv 1 
		-min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -3.8574804302509849e-14 -3.699497863567812e-07 2.4528619101909491e-14 ;
	setAttr ".rsrr" -type "double3" -3.8574804681661524e-14 -3.699497863567812e-07 2.4528619481061157e-14 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "Kaokaoa_Pe_Dir_B_jnt_orientConstraint1" -p "Kaokaoa_Pe_Dir_B_jnt";
	rename -uid "DF14160F-4A59-D592-A607-99B33A0E1550";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Pe_Dir_B_jnt_IKW0" -dv 1 
		-min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.761487544727855e-07 -1.8858552695640973e-06 4.9497998452684507e-08 ;
	setAttr ".o" -type "double3" 0 1.8858552695640978e-06 0 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1" -p "Kaokaoa_Pe_Dir_A_jnt";
	rename -uid "2F835821-47D3-1137-6560-AEBA97E6ED06";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Pe_Dir_A_jnt_FKW0" -dv 1 
		-min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Kaokaoa_Pe_Dir_A_jnt_IKW1" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".lr" -type "double3" -3.9756933518293967e-14 1.590277340731759e-14 9.5416640443905456e-15 ;
	setAttr ".rsrr" -type "double3" -5.4069429584879788e-14 1.5902773407317593e-14 1.9083328088781091e-14 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode orientConstraint -n "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1" -p "Kaokaoa_Perna_Dir_B_jnt";
	rename -uid "C6EA449A-426B-6C44-EEE4-DEB9BE62D8F7";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Perna_Dir_B_jnt_FKW0" -dv 
		1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Kaokaoa_Perna_Dir_B_jnt_IKW1" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".lr" -type "double3" -1.118163755202018e-16 6.3605755173841867e-15 -4.0688736647628985e-16 ;
	setAttr ".rsrr" -type "double3" -7.4544250346801199e-17 6.3608667058621029e-15 -3.0128301181832142e-16 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode orientConstraint -n "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1" -p "Kaokaoa_Perna_Dir_A_jnt";
	rename -uid "250ED3A0-40B7-085B-971E-7FAD617BB2B0";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Perna_Dir_A_jnt1_FKW0" -dv 
		1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Kaokaoa_Perna_Dir_A_jnt1_IKW1" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode joint -n "Kaokaoa_Perna_Dir_A_jnt_FK" -p "Kaokaoa_Bacia_B_jnt";
	rename -uid "9E48AA5D-4F8E-BBD5-334B-9ABCD6F58DF7";
	setAttr ".t" -type "double3" -4.8254499999999894 -4.1857880522540398 -0.28603245702353952 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.91856180405409 4.8001455519761018 88.497748938352714 ;
	setAttr ".radi" 1.3793103448275861;
createNode joint -n "Kaokaoa_Perna_Dir_B_jnt_FK" -p "Kaokaoa_Perna_Dir_A_jnt_FK";
	rename -uid "A3373DB8-46D7-0E13-6531-FE87219AB18F";
	setAttr ".t" -type "double3" -16.747322022586371 1.1405771616068705e-06 0.038188185458862378 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.15543002220696486 12.864443580469077 -0.81741768618922683 ;
	setAttr ".radi" 1.3275862068965516;
createNode joint -n "Kaokaoa_Pe_Dir_A_jnt_FK" -p "Kaokaoa_Perna_Dir_B_jnt_FK";
	rename -uid "2928DD60-4684-F137-93A9-50A353BB19BC";
	setAttr ".t" -type "double3" -19.755660732694594 -2.7028032612008701e-06 -6.4832164660133529e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -89.606689183143288 47.927522549099095 -0.38041701071844697 ;
	setAttr ".radi" 0.55172413793103448;
createNode orientConstraint -n "Kaokaoa_Pe_Dir_A_jnt_FK_orientConstraint1" -p "Kaokaoa_Pe_Dir_A_jnt_FK";
	rename -uid "75207D23-4F59-7C8D-3AE6-9BA524C195EE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_tornozelo_dir_crv_FKW0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 34.54517001770904 -89.999999999999858 0 ;
	setAttr ".o" -type "double3" -89.999999999999801 55.454829982290967 -89.999999999999773 ;
	setAttr ".rsrr" -type "double3" 1.9083328088781101e-14 1.3517357396219947e-14 6.3611093629270367e-15 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "Kaokaoa_Perna_Dir_B_jnt_FK_orientConstraint1" -p "Kaokaoa_Perna_Dir_B_jnt_FK";
	rename -uid "0BADDC73-44AF-D685-6059-42A5AC067526";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_perna_B_dir_crv_FKW0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -7.5266359726873606 -0.2635446884253641 89.327627175840263 ;
	setAttr ".o" -type "double3" -0.17469138319541028 7.5292073730545832 -89.321786595610718 ;
	setAttr ".rsrr" -type "double3" 7.9513867036587899e-16 3.180554681463516e-15 2.2069531490250782e-32 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "Kaokaoa_Perna_Dir_A_jnt_FK_orientConstraint1" -p "Kaokaoa_Perna_Dir_A_jnt_FK";
	rename -uid "AB27EFD9-43E4-C6E3-9340-D2A7962A0E6A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_perna_A_dir_crv_FKW0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 5.3350866024018764 0.04428422885679064 88.503018617725985 ;
	setAttr ".o" -type "double3" -0.095510347762312098 -5.3344173649463906 -88.496505995035903 ;
	setAttr ".rsrr" -type "double3" -1.5902773407317584e-15 7.951386703658789e-16 -1.9033631921883233e-14 ;
	setAttr -k on ".w0";
createNode joint -n "Kaokaoa_Perna_Dir_A_jnt_IK" -p "Kaokaoa_Bacia_B_jnt";
	rename -uid "1B5857CC-4459-2150-B4DB-96AA9625F84E";
	setAttr ".t" -type "double3" -4.8254499999999894 -4.1857880522540398 -0.28603245702353952 ;
	setAttr ".r" -type "double3" -8.4734036379045094e-07 6.4661976228168292e-09 1.0441233262180278e-07 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.91856180405409 4.8001455519761018 88.497748938352714 ;
	setAttr ".radi" 1.3793103448275861;
createNode joint -n "Kaokaoa_Perna_Dir_B_jnt_IK" -p "Kaokaoa_Perna_Dir_A_jnt_IK";
	rename -uid "89C6C542-4844-7927-417E-47B0AEEFE827";
	setAttr ".t" -type "double3" -16.747322022586371 1.1405771616068705e-06 0.038188185458862378 ;
	setAttr ".r" -type "double3" 4.1183946398075658e-20 -3.5439512629541906e-13 2.2233780692563034e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.15543002220696486 12.864443580469077 -0.81741768618922683 ;
	setAttr ".radi" 1.3275862068965516;
createNode joint -n "Kaokaoa_Pe_Dir_A_jnt_IK" -p "Kaokaoa_Perna_Dir_B_jnt_IK";
	rename -uid "D61BFB49-413B-F1A9-0EE8-BFA439079D9B";
	setAttr ".t" -type "double3" -19.755660732694594 -2.7028032612008701e-06 -6.4832164660133529e-06 ;
	setAttr ".r" -type "double3" -7.1500057471483355e-07 -8.0039401567281554e-10 -1.4182299439597983e-08 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -89.606689183143288 47.927522549099095 -0.38041701071844697 ;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Pe_Dir_B_jnt_IK" -p "Kaokaoa_Pe_Dir_A_jnt_IK";
	rename -uid "6CC09A58-4734-16FF-2F05-48A24C776C13";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -4.5136685877147915 -0.0050527412909526781 -0.089530276993333047 ;
	setAttr ".r" -type "double3" 1.3644429461297523e-07 -1.0098906516443866e-22 1.6158250383501972e-22 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.5313985326736636e-06 -1.8858552710392522e-06 34.545170067207017 ;
	setAttr ".bps" -type "matrix" -3.2941423669677117e-16 -1.6653345369377348e-16 1.0000000000000004 0
		 2.9802321340008565e-08 -0.99999999999999978 -1.1102228710797558e-16 0 1 2.9802321043575363e-08 5.1521287071075028e-16 0
		 -5.5843500000000077 2 -4.0000000000000018 1;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Pe_Dir_C_jnt_IK" -p "Kaokaoa_Pe_Dir_B_jnt_IK";
	rename -uid "34007E4A-4D92-0A41-638D-989C639B4C44";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -3 2.2204460492503131e-15 -3.5527136788005009e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 3.7988570122604432e-06 -89.999996776547277 0 ;
	setAttr ".bps" -type "matrix" 0.99999999999999967 2.9802321043575349e-08 2.980232223677438e-08 0
		 2.9802323315978856e-08 -0.99999999999999756 -6.6302563460698902e-08 0 2.9802320075005436e-08 6.6302564404388407e-08 -0.99999999999999789 0
		 -5.5843500000000086 2 -7.0000000000000018 1;
	setAttr ".radi" 0.60344827586206895;
createNode ikEffector -n "effector11" -p "Kaokaoa_Pe_Dir_B_jnt_IK";
	rename -uid "50B72D6B-4B55-6B4B-8ADC-2382F7605188";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "effector10" -p "Kaokaoa_Pe_Dir_A_jnt_IK";
	rename -uid "D2A5D178-4F97-832B-81E0-139C68EE1328";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "effector9" -p "Kaokaoa_Perna_Dir_B_jnt_IK";
	rename -uid "9D509244-428C-6D3B-942F-789E87679828";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode joint -n "Kaokaoa_Perna_Esq_A_jnt" -p "Kaokaoa_Bacia_B_jnt";
	rename -uid "C212AFEE-4C00-68F8-015D-F28BD5414A46";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.8254465016053132 -4.1857828502316039 -0.28603219597699048 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.081438195945834735 -4.8001455519761018 -88.497748938352686 ;
	setAttr ".bps" -type "matrix" 0.026124273704060452 -0.9953262497008567 0.092968698925300228 0
		 0.99965840412637319 0.026082950188345208 -0.0016597496753799354 0 -0.00077290552330573875 0.092980300956170728 0.99566764849077627 0
		 4.8254465016053025 40.811905204231131 0.79033621251137354 1;
	setAttr ".radi" 1.3793103448275861;
createNode joint -n "Kaokaoa_Perna_Esq_B_jnt" -p "Kaokaoa_Perna_Esq_A_jnt";
	rename -uid "811F164D-4A28-BD69-D3DB-A2A0664E7F4E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 16.747346159324923 -8.8817841970012523e-16 -0.03818642222391766 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.15543002218707974 12.86444358046907 -0.81741768618926058 ;
	setAttr ".bps" -type "matrix" 0.011734726098372365 -0.99130874177510808 -0.13103157895579348 0
		 0.99992056629773041 0.012236204285831382 -0.0030226477633384292 0 0.0045997063191024999 -0.13098570068876819 0.99137358695743483 0
		 5.2629882709848035 24.139281373997388 2.3092942101754712 1;
	setAttr ".radi" 1.3275862068965516;
createNode joint -n "Kaokaoa_Pe_Esq_A_jnt" -p "Kaokaoa_Perna_Esq_B_jnt";
	rename -uid "54C7F7F8-4C71-B097-7F0A-848CE9477E26";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 19.755645844781249 -1.4161035899462604e-08 -2.8477221025724475e-08 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -89.606689183172975 47.927522549098946 -0.38041701074054179 ;
	setAttr ".bps" -type "matrix" 1.8388068845354155e-16 -0.56705577352237724 -0.8236793974083233 0
		 -1.8995222061946038e-16 0.82367939740832319 -0.56705577352237735 0 0.99999999999999978 2.5608855314107615e-16 -1.3010426069826053e-17 0
		 5.4948153495788619 4.5553369522094762 -0.27931928634643688 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Pe_Esq_B_jnt" -p "Kaokaoa_Pe_Esq_A_jnt";
	rename -uid "FBD2034D-41F1-4966-5F47-7AB07D769361";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.5136666202163909 0.0050550791394909922 0.089532644718933518 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 34.545170017709083 ;
	setAttr ".bps" -type "matrix" 4.3745231264779338e-17 1.1102230246251565e-16 -1.0000000000000002 0
		 -2.6073033664306024e-16 1 5.5511151231257827e-17 0 0.99999999999999978 2.5608855314107615e-16 -1.3010426069826053e-17 0
		 5.5843479942977963 2.000000000000004 -3.9999999999999982 1;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Pe_Esq_C_jnt" -p "Kaokaoa_Pe_Esq_B_jnt";
	rename -uid "B9AA1577-4774-DC9B-C68B-F7AA3168470A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.9999999999999973 4.4408920985006262e-16 -2.6645352591003757e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -89.999999999999986 0 ;
	setAttr ".bps" -type "matrix" 0.99999999999999978 2.5608855314107615e-16 -2.3505503099485741e-16 0
		 -2.6073033664306024e-16 1 5.5511151231257827e-17 0 1.7829937366025191e-16 -1.1102230246251559e-16 1.0000000000000002 0
		 5.5843479942977936 2.0000000000000049 -6.9999999999999964 1;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Dedao_Pe_A_Esq_jnt" -p "Kaokaoa_Pe_Esq_C_jnt";
	rename -uid "8F80FE23-4F5A-22BF-C7DE-C1BD2A143C57";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -2.3070487213612907 0.10252447170222601 1.7678308355389758 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 4.0864766629156177 115.8938688553571 2.7131284013983783 ;
	setAttr ".bps" -type "matrix" -0.43621600254407183 -0.020671599691700907 -0.89960451537920605 0
		 0.016820788469409438 0.9993740913451461 -0.031120517722733276 0 0.89968475601164699 -0.028707325097431857 -0.43559525856695569 0
		 3.2772992729365038 2.10252447170223 -5.2321691644610198 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Dedao_Pe_B_Esq_jnt" -p "Kaokaoa_Dedao_Pe_A_Esq_jnt";
	rename -uid "8237ADD9-41F2-282A-E7C7-26A432D5F5D7";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.9423571852598664 0.1494245004317909 -1.4210854715202004e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -27.642589871312371 ;
	setAttr ".bps" -type "matrix" -0.3942299334701368 -0.48197638024178657 -0.78248420331988555 0
		 -0.1874835975662773 0.87571379935157767 -0.44494408892447496 0 0.89968475601164699 -0.028707325097431857 -0.43559525856695569 0
		 1.9963094214395152 2.1910322161622622 -7.8837771419931393 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Dedao_Pe_C_Esq_jnt_FIM" -p "Kaokaoa_Dedao_Pe_B_Esq_jnt";
	rename -uid "800547EE-456E-3123-29A7-D194BE5DDA31";
	setAttr ".t" -type "double3" 2.5090868352081825 -8.8817841970012523e-16 1.7763568394002505e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -89.999999999999986 0 ;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Indicador_Pe_A_Esq_jnt" -p "Kaokaoa_Pe_Esq_C_jnt";
	rename -uid "5E1D5677-46D5-9B8B-4E10-EBB5A528532C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -0.75902897427634919 -0.032645123142234445 1.3346224042745503 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 103.93474201465386 81.94829046650122 105.5006667145135 ;
	setAttr ".bps" -type "matrix" -0.037432784791595154 0.13497216243848073 -0.99014206151916762 0
		 -0.024770142042675306 0.99040672558490184 0.13594468720541689 0 0.99899210541722083 0.029614747725978208 -0.033730402179559936 0
		 4.8253190200214444 1.96735487685777 -5.6653775957254453 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Indicador_Pe_B_Esq_jnt" -p "Kaokaoa_Indicador_Pe_A_Esq_jnt";
	rename -uid "889E6AB3-4AD3-32C4-C1CF-EF80A3F19D23";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.3850559832688578 -0.08243201180578863 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -39.830421485610742 ;
	setAttr ".bps" -type "matrix" -0.012880555202277162 -0.53072187180978847 -0.84744816129389056 0
		 -0.042998425689195638 0.84702848919020501 -0.52980550571734319 0 0.99899210541722083 0.029614747725978208 -0.033730402179559936 0
		 4.700648800533533 2.3426019839989385 -9.0282700994177159 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Indicador_Pe_C_Esq_jnt_FIM" -p "Kaokaoa_Indicador_Pe_B_Esq_jnt";
	rename -uid "03E22F57-4641-D926-DD75-E9B1D157D22A";
	setAttr ".t" -type "double3" 2.6500284270758421 8.8817841970012523e-16 3.5527136788005009e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -89.999999999999986 0 ;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Medio_Pe_A_Esq_jnt" -p "Kaokaoa_Pe_Esq_C_jnt";
	rename -uid "86A7EF5E-4A6F-8CE7-3184-31B8A485C041";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.2319716775335197 -0.0034415628788326824 1.4846390535142211 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 29.414393978080849 73.930452115349468 29.880280712875599 ;
	setAttr ".bps" -type "matrix" 0.24000793669155338 0.13790079081878581 -0.960926408325121 0
		 -0.024770142042675098 0.99040672558490195 0.13594468720541664 0 0.97045485747058247 -0.0088255202535798272 0.24112129686944844 0
		 6.8163196718313133 1.9965584371211724 -5.5153609464857754 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Medio_Pe_B_Esq_jnt" -p "Kaokaoa_Medio_Pe_A_Esq_jnt";
	rename -uid "C6285E6E-44AC-667C-ACFF-8381DA27D1A2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.3850559832688552 -0.08243201180578863 -3.5527136788005009e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -39.830421485610742 ;
	setAttr ".bps" -type "matrix" 0.20017825620654142 -0.52847285054704696 -0.8250121889867974 0
		 0.13470722086755132 0.84890432701626173 -0.51109236760022991 0 0.97045485747058247 -0.0088255202535798272 0.24112129686944844 0
		 7.6308018266023581 2.3817191152838633 -8.7793568285284298 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Medio_Pe_C_Esq_jnt_FIM" -p "Kaokaoa_Medio_Pe_B_Esq_jnt";
	rename -uid "08891CF1-4CFB-CD7B-9420-7B9526B90F19";
	setAttr ".t" -type "double3" 2.6500284270758439 1.7763568394002505e-15 2.6645352591003757e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -89.999999999999986 0 ;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Anelar_Pe_A_Esq_jnt" -p "Kaokaoa_Pe_Esq_C_jnt";
	rename -uid "8B7CC756-4F8D-1690-7845-8C9E7CEC35D5";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.431542805246738 0.0020434879041495435 2.3091545729573806 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -3.4023369428888808 58.373382120702253 -3.8622424474482391 ;
	setAttr ".bps" -type "matrix" 0.52319060450126953 -0.035321191011972654 -0.85148341429947549 0
		 0.016820788469409372 0.9993740913451461 -0.031120517722733301 0 0.85204967721187652 0.0019593400826073333 0.52345726525627401 0
		 8.0158907995445325 2.0020434879041549 -4.6908454270426159 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Anelar_Pe_B_Esq_jnt" -p "Kaokaoa_Anelar_Pe_A_Esq_jnt";
	rename -uid "9FE07EF8-4FF2-3BF3-47AA-9CBBC1FC2B0C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.7949361865642022 0.22663392305024699 3.5527136788005009e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -27.642589871312371 ;
	setAttr ".bps" -type "matrix" 0.4556689970048059 -0.49495385184096385 -0.73985569519767003 0
		 0.2576375607937838 0.86891705331074842 -0.42261808022610148 0 0.85204967721187652 0.0019593400826073333 0.52345726525627401 0
		 9.4819873138151536 2.1298150839085728 -7.0777401989463149 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Anelar_Pe_C_Esq_jnt_FIM" -p "Kaokaoa_Anelar_Pe_B_Esq_jnt";
	rename -uid "7282E168-41E1-316C-E0B7-F7BDD0A386EF";
	setAttr ".t" -type "double3" 2.5090868352081817 8.8817841970012523e-16 3.5527136788005009e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -89.999999999999986 0 ;
	setAttr ".radi" 0.55172413793103448;
createNode orientConstraint -n "Kaokaoa_Pe_Esq_C_jnt_orientConstraint1" -p "Kaokaoa_Pe_Esq_C_jnt";
	rename -uid "78F73060-4559-D359-C4E8-2796949AF881";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Pe_Esq_C_jnt_IKW0" -dv 1 
		-min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode orientConstraint -n "Kaokaoa_Pe_Esq_B_jnt_orientConstraint1" -p "Kaokaoa_Pe_Esq_B_jnt";
	rename -uid "59B8C921-4ED1-0B2B-0284-F5B99BA7B011";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Pe_Esq_B_jnt_IKW0" -dv 1 
		-min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rsrr" -type "double3" 0 0 -1.9083328088781101e-14 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1" -p "Kaokaoa_Pe_Esq_A_jnt";
	rename -uid "4531B181-4932-CFDA-91E9-E5A3B5DE06EC";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Pe_Esq_A_jnt_FKW0" -dv 1 
		-min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Kaokaoa_Pe_Esq_A_jnt_IKW1" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".rsrr" -type "double3" -9.5416640443905503e-15 -6.3611093629270335e-15 
		-6.3611093629270327e-15 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode orientConstraint -n "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1" -p "Kaokaoa_Perna_Esq_B_jnt";
	rename -uid "F6AC1B21-4F96-A47D-8C13-84ABC4F36BAE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Perna_Esq_B_jnt_FKW0" -dv 
		1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Kaokaoa_Perna_Esq_B_jnt_IKW1" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".lr" -type "double3" 2.1553592292532886e-35 1.5903744035577312e-15 1.5530052155583582e-18 ;
	setAttr ".rsrr" -type "double3" -1.0862679022897191e-32 6.3613034885789787e-15 -1.9567865716035308e-16 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode orientConstraint -n "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1" -p "Kaokaoa_Perna_Esq_A_jnt";
	rename -uid "58B8DB20-46E0-50E0-6D9E-C0B934D489C9";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Perna_Esq_A_jnt_FKW0" -dv 
		1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Kaokaoa_Perna_Esq_A_jnt_IKW1" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".rsrr" -type "double3" 1.590277340731758e-15 7.951386703658788e-16 1.9046055963607693e-14 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode joint -n "Kaokaoa_Perna_Esq_A_jnt_FK" -p "Kaokaoa_Bacia_B_jnt";
	rename -uid "78F24AAB-418D-5AB1-31C2-2B99EAD7C9D4";
	setAttr ".t" -type "double3" 4.8254465016053132 -4.1857828502316039 -0.28603219597699048 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.081438195945835165 -4.8001455519761018 -88.497748938352686 ;
	setAttr ".radi" 1.3793103448275861;
createNode joint -n "Kaokaoa_Perna_Esq_B_jnt_FK" -p "Kaokaoa_Perna_Esq_A_jnt_FK";
	rename -uid "5B143D22-4970-F128-4B86-58A4145DBAF6";
	setAttr ".t" -type "double3" 16.747346159324923 -8.8817841970012523e-16 -0.03818642222391766 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.15543002218707974 12.86444358046907 -0.81741768618926058 ;
	setAttr ".radi" 1.3275862068965516;
createNode joint -n "Kaokaoa_Pe_Esq_A_jnt_FK" -p "Kaokaoa_Perna_Esq_B_jnt_FK";
	rename -uid "16663F24-4E8C-ED02-3F9E-D5BF40959519";
	setAttr ".t" -type "double3" 19.755645844781249 -1.4161035899462604e-08 -2.8477221025724475e-08 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -89.606689183172975 47.927522549098946 -0.38041701074054179 ;
	setAttr ".radi" 0.55172413793103448;
createNode orientConstraint -n "Kaokaoa_Pe_Esq_A_jnt_FK_orientConstraint1" -p "Kaokaoa_Pe_Esq_A_jnt_FK";
	rename -uid "A4F10CA8-4FB5-7CAC-FE20-0B8699BC2320";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_tornozelo_esq_crv_FKW0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 34.545170017709076 -89.999999999999957 0 ;
	setAttr ".o" -type "double3" -89.999999999999929 55.454829982290917 -89.999999999999915 ;
	setAttr ".rsrr" -type "double3" -1.5902773407317581e-14 -1.8288189418415224e-14 
		-1.2722218725854064e-14 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "Kaokaoa_Perna_Esq_B_jnt_FK_orientConstraint1" -p "Kaokaoa_Perna_Esq_B_jnt_FK";
	rename -uid "D5E52A35-4F67-05EF-26FA-37A89D27284B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_perna_B_esq_crv_FKW0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -7.5266359726875933 -0.26354468840539402 89.327627175840291 ;
	setAttr ".o" -type "double3" -0.17469138317544072 7.5292073730545797 -89.321786595610718 ;
	setAttr ".rsrr" -type "double3" -3.1805546814635168e-15 7.0622500768802538e-31 2.5444437451708134e-14 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "Kaokaoa_Perna_Esq_A_jnt_FK_orientConstraint1" -p "Kaokaoa_Perna_Esq_A_jnt_FK";
	rename -uid "0A4C4570-4569-1F00-C0B4-EEA6127ECF10";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_perna_A_esq_crv_FKW0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 5.3350866024018782 0.044284228856878501 88.503018617725971 ;
	setAttr ".o" -type "double3" -0.095510347762223058 -5.3344173649463951 -88.496505995035903 ;
	setAttr ".rsrr" -type "double3" -1.1927080055488192e-15 1.9878466759146976e-15 -1.9058480005332168e-14 ;
	setAttr -k on ".w0";
createNode joint -n "Kaokaoa_Perna_Esq_A_jnt_IK" -p "Kaokaoa_Bacia_B_jnt";
	rename -uid "265DE72B-4A28-62AC-FA37-D6A1C812F337";
	setAttr ".t" -type "double3" 4.8254465016053132 -4.1857828502316039 -0.28603219597699048 ;
	setAttr ".r" -type "double3" -1.3927675160598358e-14 1.0628493638092364e-16 1.7162184166746269e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.081438195945835165 -4.8001455519761018 -88.497748938352686 ;
	setAttr ".radi" 1.3793103448275861;
createNode joint -n "Kaokaoa_Perna_Esq_B_jnt_IK" -p "Kaokaoa_Perna_Esq_A_jnt_IK";
	rename -uid "AFE241B7-4330-F9D0-587D-8386DF1B59CA";
	setAttr ".t" -type "double3" 16.747346159324923 -8.8817841970012523e-16 -0.03818642222391766 ;
	setAttr ".r" -type "double3" 3.476713774985061e-23 5.5411871794769345e-14 -3.4358072679539037e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -0.15543002218707974 12.86444358046907 -0.81741768618926058 ;
	setAttr ".radi" 1.3275862068965516;
createNode joint -n "Kaokaoa_Pe_Esq_A_jnt_IK" -p "Kaokaoa_Perna_Esq_B_jnt_IK";
	rename -uid "21034019-4661-9E67-5CDB-C99A11B14F7B";
	setAttr ".t" -type "double3" 19.755645844781249 -1.4161035899462604e-08 -2.8477221025724475e-08 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -89.606689183172975 47.927522549098946 -0.38041701074054179 ;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Pe_Esq_B_jnt_IK" -p "Kaokaoa_Pe_Esq_A_jnt_IK";
	rename -uid "0F784A30-46F4-507D-3188-D09F5CD772B0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.5136666202163891 0.0050550791394905481 0.089532644718929077 ;
	setAttr ".r" -type "double3" 5.0888874903416268e-14 7.5330667486722978e-30 -4.5198400492033663e-29 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 34.545170017709083 ;
	setAttr ".bps" -type "matrix" 4.3745231264779338e-17 1.1102230246251565e-16 -1.0000000000000002 0
		 -2.6073033664306024e-16 1 5.5511151231257827e-17 0 0.99999999999999978 2.5608855314107615e-16 -1.3010426069826053e-17 0
		 5.5843479942977963 2.000000000000004 -3.9999999999999982 1;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Pe_Esq_C_jnt_IK" -p "Kaokaoa_Pe_Esq_B_jnt_IK";
	rename -uid "8B9C3058-4E05-3221-D5F0-46B833DE191A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.9999999999999973 4.4408920985006262e-16 -2.6645352591003757e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -89.999999999999986 0 ;
	setAttr ".bps" -type "matrix" 0.99999999999999978 2.5608855314107615e-16 -2.3505503099485741e-16 0
		 -2.6073033664306024e-16 1 5.5511151231257827e-17 0 1.7829937366025191e-16 -1.1102230246251559e-16 1.0000000000000002 0
		 5.5843479942977936 2.0000000000000049 -6.9999999999999964 1;
	setAttr ".radi" 0.60344827586206895;
createNode ikEffector -n "effector7" -p "Kaokaoa_Pe_Esq_B_jnt_IK";
	rename -uid "41D1BB0B-46E3-FB69-5437-6A910B265E4D";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "effector6" -p "Kaokaoa_Pe_Esq_A_jnt_IK";
	rename -uid "A6085DB7-4D9F-DC4D-C4E9-6B8FCB01DD39";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode ikEffector -n "effector8" -p "Kaokaoa_Perna_Esq_B_jnt_IK";
	rename -uid "24B0C0EB-4CED-29CC-B8EA-4C9C7DA95DD5";
	setAttr ".v" no;
	setAttr ".hd" yes;
createNode orientConstraint -n "Kaokaoa_Bacia_A_jnt_orientConstraint1" -p "Kaokaoa_Bacia_A_jnt";
	rename -uid "4A0D4439-4EC7-E4DF-5EFF-B0849071D72B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_cintura_crvW0" -dv 1 
		-min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 0 0 89.999999999999986 ;
	setAttr ".o" -type "double3" 0 -0.53445565696279229 -89.999999999999986 ;
	setAttr ".rsrr" -type "double3" 0 -0.53445565696279218 0 ;
	setAttr -k on ".w0";
createNode joint -n "Kaokaoa_Col_A_jnt" -p "Kaokaoa_Root_jnt";
	rename -uid "2861F180-4A34-9EB9-0CAA-D9A1E871EE7E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.0658141036401503e-14 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -3.9864875531637248e-16 4.2173119323491521 90 ;
	setAttr ".bps" -type "matrix" 1.1102230246251565e-16 0.99957642418677328 -0.029102786979664338 0
		 -1 1.1102230246251565e-16 1.7347234759768071e-18 0 6.9388939039072284e-18 0.029102786979664334 0.99957642418677339 0
		 1.0658141036401503e-14 49 1 1;
	setAttr ".radi" 0.55172413793103414;
createNode joint -n "Kaokaoa_Col_B_jnt" -p "Kaokaoa_Col_A_jnt";
	rename -uid "5A11AA76-42AB-916B-A1FB-41A5317EC38C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.4840923070156649 9.956685047586655e-16 0 ;
	setAttr ".r" -type "double3" 0 2.5114725609073285 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 9.1886475440139197 0 ;
	setAttr ".bps" -type "matrix" 1.0730839009373593e-16 0.97290587541584217 -0.23120155185753774 0
		 -1 1.1102230246251565e-16 1.7347234759768071e-18 0 2.9308860574552959e-17 0.23120155185753774 0.97290587541584228 0
		 1.0160306784022171e-14 53.482192953970134 0.86950041679177148 1;
	setAttr ".radi" 0.55172413793103414;
createNode joint -n "Kaokaoa_Col_C_jnt" -p "Kaokaoa_Col_B_jnt";
	rename -uid "7D189D18-457E-A734-9C4B-DDB166EA0218";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.4840923070157004 9.9566850475867496e-16 1.7763568394002505e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 6.9980722228464129 0 ;
	setAttr ".bps" -type "matrix" 1.0156312541165652e-16 0.92609734675231314 -0.37728464630610903 0
		 -1 1.1102230246251565e-16 1.7347234759768071e-18 0 4.5376551756431632e-17 0.37728464630610897 0.92609734675231326 0
		 9.6458190057610579e-15 57.84479270537269 -0.16722868326270324 1;
	setAttr ".radi" 0.55172413793103481;
createNode joint -n "Kaokaoa_Col_D_jnt" -p "Kaokaoa_Col_C_jnt";
	rename -uid "BF5DC3D2-4104-0015-3576-98B1979376AD";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.4840923070156862 9.9566850475866865e-16 0 ;
	setAttr ".r" -type "double3" 0 -1.7164444081372359 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -14.963319128036256 0 ;
	setAttr ".bps" -type "matrix" 1.1031382609290725e-16 0.99541988025504291 -0.095599487409900985 0
		 -1 1.1102230246251565e-16 1.7347234759768071e-18 0 1.4316412449765544e-17 0.095599487409900985 0.99541988025504302 0
		 9.1055689303372676e-15 61.997498693492375 -1.8590078633190608 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Col_E_jnt" -p "Kaokaoa_Col_D_jnt";
	rename -uid "01B544B5-41B6-BBBB-52C4-89BE84326067";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.4840923070156791 9.9566850475867023e-16 -3.9968028886505635e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -89.999999999999986 ;
	setAttr ".bps" -type "matrix" 1 1.1000531158323732e-16 -2.2962073888943776e-17 0
		 -1.1173077883212407e-16 0.99541988025504291 -0.095599487409900985 0 1.4316412449765544e-17 0.095599487409900985 0.99541988025504302 0
		 8.6045578045192681e-15 66.461053320794477 -2.287684789368444 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Cabeca_A_jnt" -p "Kaokaoa_Col_E_jnt";
	rename -uid "4A5C1598-47DD-B96D-C5A1-FB8B8E75FEA4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -2.5757174171303632e-14 3.8554469550486918 0.12945061273050124 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 9.9424125078287659e-17 -1.4489631436170289 90 ;
	setAttr ".bps" -type "matrix" -1.1133304073810076e-16 0.99751896528478368 -0.070398252088914565 0
		 -1 -1.1000531158323732e-16 2.2962073888943776e-17 0 1.3667666103436685e-17 0.070398252088914565 0.99751896528478379 0
		 -1.7581535189454167e-14 70.311217279340653 -2.5274058285840248 1;
	setAttr ".radi" 0.81034482758620685;
createNode joint -n "Kaokaoa_Cabeca_B_jnt" -p "Kaokaoa_Cabeca_A_jnt";
	rename -uid "74DFA4DE-4664-FF44-111C-3C98726CE171";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 13.963146520970714 2.208426933042474e-15 3.8857805861880479e-16 ;
	setAttr ".r" -type "double3" 0 -125.97791781460325 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 7.6465670415618249e-17 -0.52904654018755604 0.84859281066691616 0
		 -1 -1.1000531158323732e-16 2.2962073888943776e-17 0 8.2066145910458587e-17 -0.84859281066691605 -0.52904654018755604 0
		 -2.1344521682947942e-14 84.239720749059188 -3.5103869373217713 1;
	setAttr ".radi" 0.81034482758620685;
createNode joint -n "Kaokaoa_Cabeca_C_jnt_FIM" -p "Kaokaoa_Cabeca_B_jnt";
	rename -uid "10E882EE-4FD7-3A6A-8789-4AA94922B830";
	setAttr ".t" -type "double3" 17.746956301414368 1.8988699477169261e-15 1.0658141036401503e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -89.999999999999986 ;
	setAttr ".radi" 0.81034482758620685;
createNode orientConstraint -n "Kaokaoa_Cabeca_C_jnt_FIM_orientConstraint1" -p "Kaokaoa_Cabeca_C_jnt_FIM";
	rename -uid "4E0137D1-47B7-8501-6EC2-31AF43E0EFB2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_nariz_crvW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -121.94105600084964 0 0 ;
	setAttr ".o" -type "double3" 121.94105600084964 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "Katzen_Mand_A_jnt" -p "Kaokaoa_Cabeca_A_jnt";
	rename -uid "637EE892-450D-9B26-5EFB-61ABED123ADC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.8841353202475233 -1.7009842384882703e-14 1.9123717342143651 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 248.91963930266184 0 ;
	setAttr ".bps" -type "matrix" 5.2796917068755168e-17 -0.29309764575929359 0.956082512155912 0
		 -1 -1.1000531158323732e-16 2.2962073888943776e-17 0 9.8966340766654719e-17 -0.95608251215591189 -0.29309764575929365 0
		 -8.6665470134588499e-16 73.322824587168199 -0.82281684036397129 1;
	setAttr ".radi" 0.75862068965517238;
createNode joint -n "Katzen_Mand_B_jnt_FIM" -p "Katzen_Mand_A_jnt";
	rename -uid "A4374A65-423F-6A8F-9881-9789BF0842CE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 11.585397329218162 2.4993571753263661e-17 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 5.2796917068755168e-17 -0.29309764575929359 0.956082512155912 0
		 -1 -1.1000531158323732e-16 2.2962073888943776e-17 0 9.8966340766654719e-17 -0.95608251215591189 -0.29309764575929365 0
		 -2.7997501109983971e-16 69.927171904788352 10.253778942479322 1;
	setAttr ".radi" 0.7068965517241379;
createNode joint -n "Kaokaoa_Lingua_A_jnt" -p "Katzen_Mand_A_jnt";
	rename -uid "69E4908F-433F-5A90-C473-35A2638DCD53";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 7;
	setAttr ".gpr" 9;
	setAttr ".gps" 9;
	setAttr ".gss" 5;
	setAttr ".t" -type "double3" 4.6983535850401168 2.5017585590605578e-14 2.1428946630084056 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -90 47.933127248434189 -4.7471141699932489e-15 ;
	setAttr ".bps" -type "matrix" 1.741597062542461e-17 0.51338591743767303 0.85815785248209364 0
		 -3.2754630287968787e-16 0.85815785248209342 -0.51338591743767314 0 -1 -2.6496235664474214e-16 1.4964142117594745e-16 0
		 -2.5424107263916075e-14 69.896964099753632 3.0411194773800001 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Lingua_B_jnt" -p "Kaokaoa_Lingua_A_jnt";
	rename -uid "31045D29-4647-32DE-500A-D7A0CA3F4EDC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".gpr" 9;
	setAttr ".gps" 9;
	setAttr ".gss" 5;
	setAttr ".t" -type "double3" 1.4999999999999929 2.1316282072803006e-14 -1.7360166783351232e-15 ;
	setAttr ".r" -type "double3" 0 -3.1805546814635168e-15 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -13.404837015906161 ;
	setAttr ".bps" -type "matrix" 9.2876563305253738e-17 0.30045263329834593 0.953796736807214 0
		 -3.1458518806768864e-16 0.95379673680721366 -0.30045263329834598 0 -1 -2.6496235664474214e-16 1.4964142117594745e-16 0
		 -2.3661966629642821e-14 70.667042975910149 4.3283562561031239 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Lingua_C_jnt" -p "Kaokaoa_Lingua_B_jnt";
	rename -uid "0E97EADF-4A97-95FC-BDF1-E6B4AEEDDF2C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".gpr" 9;
	setAttr ".gps" 9;
	setAttr ".gss" 5;
	setAttr ".t" -type "double3" 1.5000000000000178 -2.8421709430404007e-14 4.054817549152516e-16 ;
	setAttr ".r" -type "double3" 0 6.3611093629270335e-15 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -18.308974731428972 ;
	setAttr ".bps" -type "matrix" 1.8699896508445327e-16 -0.014384217588933601 0.99989654179037668 0
		 -2.6948336427379198e-16 0.99989654179037624 0.014384217588933657 0 -1 -2.6496235664474214e-16 1.4964142117594745e-16 0
		 -2.392813353960018e-14 71.117721925857651 5.7590513613139702 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Lingua_D_jnt" -p "Kaokaoa_Lingua_C_jnt";
	rename -uid "1D71B21F-482B-D730-D684-7689BC122545";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".gpr" 9;
	setAttr ".gps" 9;
	setAttr ".gss" 5;
	setAttr ".t" -type "double3" 1.4999999999999876 0 3.5654644802282121e-16 ;
	setAttr ".r" -type "double3" 0 6.3611093629270335e-15 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -11.034192723834286 ;
	setAttr ".bps" -type "matrix" 2.3511964832131314e-16 -0.20549326971670964 0.97865852885525706 0
		 -2.2871083825704429e-16 0.97865852885525662 0.20549326971670978 0 -1 -2.6496235664474214e-16 1.4964142117594745e-16 0
		 -2.4004181539996324e-14 71.096145599474255 7.2588961739995224 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Lingua_F_jnt_FIM" -p "Kaokaoa_Lingua_D_jnt";
	rename -uid "FB02FF5A-4049-496C-AB4C-76A367FA3544";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".gpr" 9;
	setAttr ".gps" 9;
	setAttr ".gss" 5;
	setAttr ".t" -type "double3" 1.5111111154000261 2.8421709430404007e-14 3.3021311198278229e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 89.999999999999986 0 ;
	setAttr ".radi" 0.55172413793103425;
createNode orientConstraint -n "Katzen_Mand_A_jnt_orientConstraint1" -p "Katzen_Mand_A_jnt";
	rename -uid "A672B2EA-4684-B553-6C76-69AE6EBB8D6B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_boca_crvW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -107.04349888358458 -6.3611093629270335e-15 -90 ;
	setAttr ".o" -type "double3" 180 -72.956501116415453 -90 ;
	setAttr ".rsrr" -type "double3" 180 -180 -180 ;
	setAttr -k on ".w0";
createNode joint -n "Kaokaoa_Orelha_Esq_A_jnt" -p "Kaokaoa_Cabeca_A_jnt";
	rename -uid "284205E6-49BC-46A7-FF06-5E994F85AE43";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 9.1578115568831322 -5.9462132721965473 -2.0092408193204294 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -48.811320530480955 27.812317724856442 -55.112587458651781 ;
	setAttr ".bps" -type "matrix" 0.72551965438585697 0.47179126874302069 -0.50103316241310569 0
		 -0.66467862731578209 0.29165775362328988 -0.68785033047969391 0 -0.17839157348214152 0.83207496867125341 0.52519300549540693 0
		 5.9462132721965286 79.304860946129892 -5.1763555782447241 1;
	setAttr ".radi" 0.75862068965517238;
createNode joint -n "Kaokaoa_Orelha_Esq_B_jnt" -p "Kaokaoa_Orelha_Esq_A_jnt";
	rename -uid "C13AD656-4114-C9D8-2642-EDA179D47CAE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.6610159415171708 -7.1054273576010019e-15 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.2202277958697287 -4.1402692546644317 -16.437276711301429 ;
	setAttr ".bps" -type "matrix" 0.86876241226866391 0.42908909521175798 -0.24725375507661518 0
		 -0.43726626674160424 0.43024894930451313 -0.78973669890174358 0 -0.23248673725396057 0.79420928601516461 0.5614103018366251 0
		 9.3278719471730405 81.503887570809724 -7.511679135480966 1;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Orelha_Esq_C_jnt_FIM" -p "Kaokaoa_Orelha_Esq_B_jnt";
	rename -uid "07480182-4F7E-BF52-5153-CFB6875A2010";
	setAttr ".t" -type "double3" 4.6610159415171779 -7.1054273576010019e-15 -1.4210854715202004e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -106.39316820994532 ;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Orelha_Dir_A_jnt" -p "Kaokaoa_Cabeca_A_jnt";
	rename -uid "3B557601-4450-C928-25DA-478411D41E73";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 9.1578508251431288 5.9462099999999838 -2.0092424807809701 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 131.18867946951914 -27.812317724856435 -124.88741254134821 ;
	setAttr ".bps" -type "matrix" 0.72551965438585764 -0.47179126874302013 0.50103316241310569 0
		 -0.66467862731578187 -0.29165775362329127 0.68785033047969357 0 -0.17839157348214013 -0.83207496867125341 -0.52519300549540782 0
		 -5.9462100000000024 79.30490000000006 -5.1763599999999901 1;
	setAttr ".radi" 0.75862068965517238;
createNode joint -n "Kaokaoa_Orelha_Dir_B_jnt" -p "Kaokaoa_Orelha_Dir_A_jnt";
	rename -uid "6C1799FB-450F-1960-1018-D493BFCA8229";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -4.6610025592629611 1.1092855221050968e-05 2.0521867092782031e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.2202277958697287 -4.1402692546644317 -16.437276711301429 ;
	setAttr ".bps" -type "matrix" 0.86876241226866457 -0.42908909521175709 0.24725375507661521 0
		 -0.43726626674160379 -0.43024894930451429 0.78973669890174314 0 -0.23248673725395924 -0.79420928601516472 -0.56141030183662599 0
		 -9.3278700000000061 81.503900000000044 -7.5116800000000179 1;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Orelha_Dir_C_jnt_FIM" -p "Kaokaoa_Orelha_Dir_B_jnt";
	rename -uid "FBB1B9C1-4081-48A6-8778-7098B8BDBD8D";
	setAttr ".t" -type "double3" -4.6610314793334382 5.4546464198779177e-06 -5.749914137709311e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -106.39316820994532 ;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Olho_Esq_jnt" -p "Kaokaoa_Cabeca_A_jnt";
	rename -uid "99098B59-42D9-6592-C671-D990B80CB691";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 7.5428195467023045 -3.8106560707092467 5.9953537550365512 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 4.0368618137535899 0 -90.000000000000014 ;
	setAttr ".bps" -type "matrix" 0.99999999999999989 -1.1148839296864851e-16 -7.3305218164479783e-18 0
		 1.1194996512976923e-16 0.99999999999999978 0 0 7.5936198092498282e-18 2.7755575615628914e-17 1 0
		 3.8106560707092281 78.257385253906264 2.9220719337463374 1;
	setAttr ".radi" 0.5;
createNode joint -n "Kaokaoa_Olho_Dir_jnt" -p "Kaokaoa_Cabeca_A_jnt";
	rename -uid "DE07FEA2-4F01-F9A4-CE1B-2095F862B54B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 7.5428195467023045 3.8106560707092103 5.9953537550365512 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 4.0368618137535899 0 -90.000000000000014 ;
	setAttr ".bps" -type "matrix" 0.99999999999999989 -1.1148839296864851e-16 -7.3305218164479783e-18 0
		 1.1194996512976923e-16 0.99999999999999978 0 0 7.5936198092498282e-18 2.7755575615628914e-17 1 0
		 -3.810656070709229 78.257385253906264 2.9220719337463374 1;
	setAttr ".radi" 0.5;
createNode orientConstraint -n "Kaokaoa_Cabeca_A_jnt_orientConstraint1" -p "Kaokaoa_Cabeca_A_jnt";
	rename -uid "CC3206E6-4E61-BF1F-C655-C29CB1EE6E3A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_cabeca_crvW0" -dv 1 
		-min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 4.0368618137535917 3.9756933518293979e-16 -90 ;
	setAttr ".o" -type "double3" 0 4.0368618137535934 89.999999999999986 ;
	setAttr ".rsrr" -type "double3" 7.9513867036587919e-16 -1.7241821476758432e-34 2.4848083448933725e-17 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "Kaokaoa_Col_E_jnt_orientConstraint1" -p "Kaokaoa_Col_E_jnt";
	rename -uid "410CFB53-438B-9F05-0F8A-4D8793340C9B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_pescoco_crvW0" -dv 1 
		-min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 5.4858249573706201 3.9711384546827632e-16 1.9025509591139047e-17 ;
	setAttr ".o" -type "double3" -5.4858249573706219 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "Kaokaoa_Ombro_Esq_jnt" -p "Kaokaoa_Col_D_jnt";
	rename -uid "32D68F8C-48AA-E7C9-7E04-528381BA07E4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 5.2727895450217845 1.5160667682566269 -105.99658589524763 ;
	setAttr ".bps" -type "matrix" 0.9609416187019203 -0.27675116159924851 2.4286128663675299e-17 0
		 0.27675116159924851 0.9609416187019203 0 0 -3.2339975661866999e-18 1.3877787807814457e-17 1 0
		 3.8995772085463325 64.039401019990933 -3.0622197261391721 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Braco_A_Esq_jnt" -p "Kaokaoa_Ombro_Esq_jnt";
	rename -uid "695033EA-4F7C-D8F6-D96C-4AB713C01E14";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 5.7524800449221232 0.11703493231335216 -0.064577936464013774 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.11766062119261367 6.1155762573456594 11.196702021476996 ;
	setAttr ".bps" -type "matrix" 0.99071989382339232 -0.08440685263210071 -0.10653438511255066 0
		 0.085107766255565154 0.99636965974546388 0.0020418770033553942 0 0.10597528063446923 -0.011089831714304003 0.9943069221960561 0
		 9.4597642479297033 62.559859222784098 -3.1267976626031859 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Braco_B_Esq_jnt" -p "Kaokaoa_Braco_A_Esq_jnt";
	rename -uid "2E5233F3-442F-A7AA-E2F2-EC8D157E0131";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 10.222238465120626 -0.048162306830434432 -0.086791492679061832 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.2025832266735244 -11.075731380667717 6.2361649000431365 ;
	setAttr ".bps" -type "matrix" 0.99594488242871049 0.021741600166886102 0.087298877348138806 0
		 -0.021184228456727287 0.99974889295129399 -0.0073061280686613321 0 -0.087435802899929402 0.0054271414985932239 0.99615537267355991 0
		 19.573842515586005 61.650007288867315 -4.3022132754239406 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Mao_A_Esq_jnt" -p "Kaokaoa_Braco_B_Esq_jnt";
	rename -uid "78921279-4C3D-5C36-1D68-52A8D2EAF933";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 9.432320338938986 6.3948846218409017e-14 -0.02382501189772146 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 2.2688039581649391 0 ;
	setAttr ".bps" -type "matrix" 0.9986255458009361 0.021509708547200891 0.047794892111994482 0
		 -0.021184228456727287 0.99974889295129399 -0.0073061280686613321 0 -0.047940043163058388 0.0062835882166933357 0.99883045046726893 0
		 28.969996845624905 61.854951724611801 -3.5025157126524782 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Mao_B_Esq_jnt" -p "Kaokaoa_Mao_A_Esq_jnt";
	rename -uid "EFB44D96-43CE-3E77-70F8-94BF101DFFB1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.7851411218918294 -4.2632564145606011e-14 8.8817841970012523e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.9986255458009361 0.021509708547200891 0.047794892111994482 0
		 -0.021184228456727287 0.99974889295129399 -0.0073061280686613321 0 -0.047940043163058388 0.0062835882166933357 0.99883045046726893 0
		 33.74856101020864 61.957878715500875 -3.2738104089909887 1;
	setAttr ".radi" 0.55172413793103436;
createNode joint -n "Kaokaoa_Polegar_A_Esq_jnt" -p "Kaokaoa_Mao_B_Esq_jnt";
	rename -uid "DB9174F5-40CF-5EF7-D742-FB96D05F0B1D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -1.894250644049194 -0.75175176055007142 1.8846535563148787 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 123.55676905427477 -52.10333477432205 -58.601682408793465 ;
	setAttr ".bps" -type "matrix" 0.29284566506171344 -0.51232035509219154 0.80732228398129469 0
		 -0.84363110748579928 0.25895728135927665 0.47034846753582249 0 -0.45003107774557854 -0.81882170231939011 -0.35637487127171291 0
		 31.782488835112332 61.177413332726921 -1.4764041588892449 1;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Polegar_B_Esq_jnt" -p "Kaokaoa_Polegar_A_Esq_jnt";
	rename -uid "2572855F-4D15-6DF5-C8B1-D6A2E7655579";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.186647841272952 -0.48122754404500206 -0.04180890004027818 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -15.345392519221512 ;
	setAttr ".bps" -type "matrix" 0.50566127042213149 -0.56258485533389679 0.65406800880643523 0
		 -0.73605618580257148 0.11414596076828668 0.66722709101328892 0 -0.45003107774557854 -0.81882170231939011 -0.35637487127171291 0
		 32.847633006725509 59.966765792406377 0.077480374082274039 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Polegar_C_Esq_jnt" -p "Kaokaoa_Polegar_B_Esq_jnt";
	rename -uid "3B5B107C-4A20-1347-6F19-1C983BCF659F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.0495372025254897 -0.017460025593581702 4.1848469134464494e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -3.3653478022568604 -2.7557542127828838 ;
	setAttr ".bps" -type "matrix" 0.51311490671262849 -0.61451069884785503 0.59924093110435295 0
		 -0.71089357684404508 0.086965754492089986 0.69790205612786516 0 -0.48098171993452177 -0.78410047732873045 -0.39222828370948337 0
		 33.896856152174379 58.811734210425684 1.4063672890269947 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Polegar_D_Esq_jnt_FIM" -p "Kaokaoa_Polegar_C_Esq_jnt";
	rename -uid "6CCE07AB-4047-C8B0-6656-8C90EA3DE3A7";
	setAttr ".t" -type "double3" 2.9974785486283384 -7.1054273576010019e-15 -7.1054273576010019e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.55172413793103414;
createNode joint -n "Kaokaoa_Indicador_A_Esq_jnt" -p "Kaokaoa_Mao_B_Esq_jnt";
	rename -uid "4B5EA90A-4F8C-2410-CA39-619E3B1E086C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.4148961865084644 -0.36498084378472839 2.3345178375470246 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.37428336534566864 -15.865391030665887 -1.3348571812573256 ;
	setAttr ".bps" -type "matrix" 0.94769277301515675 -2.5218542532012833e-16 0.31918397198926329 0
		 2.5522119140308774e-16 1 -6.9388939039072284e-18 0 -0.31918397198926318 9.1072982488782372e-17 0.94769277301515675 0
		 36.055952984193382 61.65960238289788 -0.82393660620688136 1;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Indicador_B_Esq_jnt" -p "Kaokaoa_Indicador_A_Esq_jnt";
	rename -uid "66EC7C68-4731-9B0D-E514-C1B5C0241B9D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.5793704894767941 2.1316282072803006e-14 1.7763568394002505e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -25.739342131667176 ;
	setAttr ".bps" -type "matrix" 0.85366178347470545 -0.43427770660194592 0.28751423092316564 0
		 0.41156184402826079 0.90077903702770201 0.13861448333959694 0 -0.31918397198926318 9.1072982488782372e-17 0.94769277301515675 0
		 38.500403755999109 61.659602382897901 -0.00064288814378632431 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Indicador_C_Esq_jnt" -p "Kaokaoa_Indicador_B_Esq_jnt";
	rename -uid "36B12E97-4FC1-8D7B-B60D-989F9F6D58A8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.0344773525777997 -1.4210854715202004e-14 3.5527136788005009e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -20.162669928221135 ;
	setAttr ".bps" -type "matrix" 0.65948762819067741 -0.71815073573863564 0.22211616109930218 0
		 0.68058626219502272 0.69588757767189402 0.22922220432006948 0 -0.31918397198926318 9.1072982488782372e-17 0.94769277301515675 0
		 40.237159321239567 60.776074224086805 0.58429830321321918 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Indicador_D_Esq_jnt_FIM" -p "Kaokaoa_Indicador_C_Esq_jnt";
	rename -uid "3DB444B4-4A56-7770-9339-7EB33F02699A";
	setAttr ".t" -type "double3" 1.9999999999999716 -2.8421709430404007e-14 -5.3290705182007514e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.55172413793103414;
createNode joint -n "Kaokaoa_Medio_A_Esq_jnt" -p "Kaokaoa_Mao_B_Esq_jnt";
	rename -uid "E376908A-44E8-3FEA-CDE9-F481001F2600";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.8341531157146918 0.4068503929334355 0.75297408382815068 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.42123621103592696 -0.47646775026969479 -8.2347236306873253 ;
	setAttr ".bps" -type "matrix" 0.9909305776284304 -0.12184838390830589 0.056652993388872891 0
		 0.12164973508899021 0.99254872491930313 0.0069548985502584319 0 -0.057078299499582652 -2.0816681711721685e-17 0.99836970493211397 0
		 36.534102290521652 62.430320132010657 -2.3892314243318378 1;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Medio_B_Esq_jnt" -p "Kaokaoa_Medio_A_Esq_jnt";
	rename -uid "E8545655-4C6E-865C-492C-03A39C56EA9A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.4671185150195072 0.056014307364961269 8.8817841970012523e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -15.163481863360143 ;
	setAttr ".bps" -type "matrix" 0.9246093365974245 -0.3772310389880707 0.052861308164400683 0
		 0.3766160410857548 0.92611918413559557 0.021531706223899869 0 -0.057078299499582652 -2.0816681711721685e-17 0.99836970493211397 0
		 38.985659591339868 62.1853026573976 -2.2490722015857845 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Medio_C_Esq_jnt" -p "Kaokaoa_Medio_B_Esq_jnt";
	rename -uid "D0C79067-4749-9155-54C4-B187650E0CC8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.550343655081349 0.060630174978470563 -8.8817841970012523e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -18.75124920377425 ;
	setAttr ".bps" -type "matrix" 0.75446692440519647 -0.6549191684012331 0.043134010237877767 0
		 0.65385145691112445 0.755698936654431 0.037381672442023228 0 -0.057078299499582652 -2.0816681711721685e-17 0.99836970493211397 0
		 41.366565442830812 61.279384638799691 -2.1129522285934659 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Medio_D_Esq_jnt_FIM" -p "Kaokaoa_Medio_C_Esq_jnt";
	rename -uid "A274A4C8-4F2B-49D4-D062-B4BFCAB4C69D";
	setAttr ".t" -type "double3" 2.4116965267193295 0.0051834323323447506 -2.6645352591003757e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 1.4114207244468848 ;
	setAttr ".radi" 0.55172413793103414;
createNode joint -n "Kaokaoa_Anelar_A_Esq_jnt" -p "Kaokaoa_Mao_B_Esq_jnt";
	rename -uid "6708581D-4492-89D5-DAAE-2A972DB14151";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.6233459569836768 0.4485124394118003 -1.2701091669471483 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -7.9250686881182935 13.339332843408792 -11.987580951055367 ;
	setAttr ".bps" -type "matrix" 0.96583536830803163 -0.1830220914202158 -0.18348012256770296 0
		 0.16012606234001131 0.97812489348389131 -0.13278304449970085 0 0.20376870585242463 0.098866611145001393 0.97401422356962086 0
		 36.419688996629205 62.454725094235563 -4.4203284726916756 1;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Anelar_B_Esq_jnt" -p "Kaokaoa_Anelar_A_Esq_jnt";
	rename -uid "9FEB39EE-46CC-FEBF-0C0C-F1B034512ABF";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.4197730687115211 -0.087290024555400691 -1.7763568394002505e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -15.163481863360143 ;
	setAttr ".bps" -type "matrix" 0.89032344778035755 -0.43250198631040704 -0.14235936980069083 0
		 0.40718849793151746 0.89619608626586633 -0.17615363213405222 0 0.20376870585242463 0.098866611145001393 0.97401422356962086 0
		 38.742814001756436 61.926472620467209 -4.8527180967099746 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Anelar_C_Esq_jnt" -p "Kaokaoa_Anelar_B_Esq_jnt";
	rename -uid "876BE840-4942-12BF-D58F-F0A3266F27FC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 2.048631320527841 0.060630174978484774 -1.7763568394002505e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -18.75124920377425 ;
	setAttr ".bps" -type "matrix" 0.71217299819228352 -0.69763742398217454 -0.078177012640097077 0
		 0.67177967754394152 0.7095966585745872 -0.21256680591931315 0 0.20376870585242463 0.098866611145001393 0.97401422356962086 0
		 40.591446412158426 61.094772030646538 -5.1550401859936601 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Anelar_D_Esq_jnt_FIM" -p "Kaokaoa_Anelar_C_Esq_jnt";
	rename -uid "AD29B5CC-4BD2-B0AC-98B5-FFADE498ACE8";
	setAttr ".t" -type "double3" 2.4116965267193287 0.0051834323323447506 -1.7763568394002505e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 1.4114207244468848 ;
	setAttr ".radi" 0.55172413793103414;
createNode joint -n "Kaokaoa_Minimo_A_Esq_jnt" -p "Kaokaoa_Mao_B_Esq_jnt";
	rename -uid "A25ABCF7-4226-2A50-F94A-D98C3DB7BA5A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.7015941168852819 -0.2800156739172337 -3.0884585757450855 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -14.864959564122332 24.287847621846531 -12.154314180386665 ;
	setAttr ".bps" -type "matrix" 0.91361814232847216 -0.17528008215981947 -0.36684980960376523 0
		 0.090928638284802743 0.96753058238088885 -0.23583162404005537 0 0.39627499636987362 0.18210289661547249 0.89989147251005297 0
		 35.601809117351131 61.69512754709865 -6.2752835418421444 1;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Minimo_B_Esq_jnt" -p "Kaokaoa_Minimo_A_Esq_jnt";
	rename -uid "9EF3AF98-4858-E741-4B1F-35A88C341396";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.8341031092934905 0.35930344220616917 -1.7763568394002505e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -20.529493342778547 ;
	setAttr ".bps" -type "matrix" 0.82370817497921256 -0.50345116739331974 -0.26084816373269476 0
		 0.40555020616992876 0.84461556763687384 -0.34950475416075544 0 0.39627499636987362 0.18210289661547249 0.89989147251005297 0
		 37.310149965633563 61.721282872101298 -7.0328590325788145 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Minimo_C_Esq_jnt" -p "Kaokaoa_Minimo_B_Esq_jnt";
	rename -uid "1E71BEBF-4700-B580-CE3B-52BE371041FE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 1.7791739817298715 -0.089818570179303947 3.5527136788005009e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -20.162669928221135 ;
	setAttr ".bps" -type "matrix" 0.63344177423936232 -0.76372629537072112 -0.12439318473213655 0
		 0.66461842127685999 0.61932275979780482 -0.41799721685184149 0 0.39627499636987362 0.18210289661547249 0.89989147251005297 0
		 38.739244179440668 60.749693491367246 -7.4655612813844474 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Minimo_D_Esq_jnt_FIM" -p "Kaokaoa_Minimo_C_Esq_jnt";
	rename -uid "367A78BE-4B88-FA09-6B55-78AC49A6C39C";
	setAttr ".t" -type "double3" 2.2732137303090632 0.17231395823768025 1.7763568394002505e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.55172413793103414;
createNode orientConstraint -n "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1" -p "Kaokaoa_Mao_A_Esq_jnt";
	rename -uid "0169D0CF-4B8A-DEB6-FCC3-70A104DF6936";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Mao_A_Esq_jnt_FKW0" -dv 1 
		-min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Kaokaoa_Mao_A_Esq_jnt_IKW1" -dv 1 
		-min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode orientConstraint -n "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1" -p "Kaokaoa_Braco_B_Esq_jnt";
	rename -uid "13CDE267-4CC8-0284-F20E-9A84AA054C95";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Braco_B_Esq_jnt_FKW0" -dv 
		1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Kaokaoa_Braco_B_Esq_jnt_IKW1" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".lr" -type "double3" -8.9453100416161458e-16 1.2802974997063098e-14 -6.2120208622334295e-15 ;
	setAttr ".rsrr" -type "double3" -6.9574633657014439e-16 8.0135069122811239e-15 -3.8638769763091933e-15 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode orientConstraint -n "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1" -p "Kaokaoa_Braco_A_Esq_jnt";
	rename -uid "99056272-4423-F5A7-CC4D-E8AB5D57694D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Braco_A_Esq_jnt_FKW0" -dv 
		1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Kaokaoa_Braco_A_Esq_jnt_IKW1" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".lr" -type "double3" -6.95746336570144e-16 6.429441592411601e-15 6.3331552690469841e-15 ;
	setAttr ".rsrr" -type "double3" -7.951386703658787e-16 5.6218788803212541e-15 6.3362612794780982e-15 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode joint -n "Kaokaoa_Braco_A_Esq_jnt_FK" -p "Kaokaoa_Ombro_Esq_jnt";
	rename -uid "1F55BCB3-4561-2B99-0B6B-A5BD5F92A021";
	setAttr ".t" -type "double3" 5.7524800449221232 0.11703493231335216 -0.064577936464013774 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.11766062119261357 6.1155762573456665 11.196702021477002 ;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Braco_B_Esq_jnt_FK" -p "Kaokaoa_Braco_A_Esq_jnt_FK";
	rename -uid "4698234C-4A34-4B29-742C-8D987F921958";
	setAttr ".t" -type "double3" 10.222238465120626 -0.048162306830434432 -0.086791492679061832 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.2025832266735241 -11.075731380667705 6.2361649000431303 ;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Mao_A_Esq_jnt_FK" -p "Kaokaoa_Braco_B_Esq_jnt_FK";
	rename -uid "C22543B5-4EFA-4B99-A779-9FA36014D5F4";
	setAttr ".t" -type "double3" 9.432320338938986 6.3948846218409017e-14 -0.02382501189772146 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 2.2688039581649391 0 ;
	setAttr ".radi" 0.55172413793103448;
createNode orientConstraint -n "Kaokaoa_Mao_A_Esq_jnt_FK_orientConstraint1" -p "Kaokaoa_Mao_A_Esq_jnt_FK";
	rename -uid "159B5496-4CB3-3DEB-F24F-96BDFD0CFA18";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_pulso_esq_crv_FKW0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 0.36043988800562382 2.7478153558409613 -1.2152551763810735 ;
	setAttr ".o" -type "double3" -0.41909298730641797 -2.7394892689871191 1.2339209493958276 ;
	setAttr ".rsrr" -type "double3" -2.5469285535157068e-16 -1.987846675914698e-15 7.9513867036587919e-16 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "Kaokaoa_Braco_B_Esq_jnt_FK_orientConstraint1" -p "Kaokaoa_Braco_B_Esq_jnt_FK";
	rename -uid "8508743C-4FCE-C945-A661-2B91108A0798";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_cotovelo_esq_crv_FKW0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 0.31214932403919649 5.0161077571646331 -1.2185251456409587 ;
	setAttr ".o" -type "double3" -0.42021838021768837 -5.0082323868012253 1.2505753344573294 ;
	setAttr ".rsrr" -type "double3" 8.0756271209034599e-17 -7.9513867036587899e-16 -2.0499668845370319e-16 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "Kaokaoa_Braco_A_Esq_jnt_FK_orientConstraint1" -p "Kaokaoa_Braco_A_Esq_jnt_FK";
	rename -uid "6C7EE799-400B-0730-6E33-67991A265B98";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Braco_A_esq_crv_FKW0" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -0.63901215336138661 -6.0833595490122185 4.9099382004544951 ;
	setAttr ".o" -type "double3" 0.11766062119261336 6.1155762573456611 -4.8696971600163588 ;
	setAttr ".rsrr" -type "double3" -9.9392333795734874e-17 -2.3916280319598706e-15 
		2.0744066464224978e-33 ;
	setAttr -k on ".w0";
createNode joint -n "Kaokaoa_Braco_A_Esq_jnt_IK" -p "Kaokaoa_Ombro_Esq_jnt";
	rename -uid "9BA064A1-4286-B5FD-887E-F0AD16B20743";
	setAttr ".t" -type "double3" 5.7524800449221232 0.11703493231335216 -0.064577936464013774 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.11766062119261357 6.1155762573456665 11.196702021477002 ;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Braco_B_Esq_jnt_IK" -p "Kaokaoa_Braco_A_Esq_jnt_IK";
	rename -uid "AFB8BF1E-43B2-F283-26CF-608C882E9A1B";
	setAttr ".t" -type "double3" 10.222238465120626 -0.048162306830434432 -0.086791492679061832 ;
	setAttr ".r" -type "double3" 1.0672408724181718e-16 -7.7095607291003729e-14 4.2252057756035505e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.2025832266735241 -11.075731380667705 6.2361649000431303 ;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Mao_A_Esq_jnt_IK" -p "Kaokaoa_Braco_B_Esq_jnt_IK";
	rename -uid "84F53DAE-4F38-2944-BE3C-EB8576DABCF3";
	setAttr ".t" -type "double3" 9.432320338938986 6.3948846218409017e-14 -0.02382501189772146 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 2.2688039581649391 0 ;
	setAttr ".radi" 0.55172413793103448;
createNode orientConstraint -n "Kaokaoa_Mao_A_Esq_jnt_IK_orientConstraint1" -p "Kaokaoa_Mao_A_Esq_jnt_IK";
	rename -uid "4621AB7F-4E61-1CF3-38F6-B29CD02FE7CA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_pulso_esq_crv_IKW0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 0.36043988800562371 2.7478153558409653 -1.2152551763810699 ;
	setAttr ".o" -type "double3" -0.41909298730641809 -2.7394892689871284 1.2339209493958272 ;
	setAttr ".rsrr" -type "double3" -2.0499668845370324e-16 -1.987846675914698e-15 5.9480099755885103e-16 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "Kaokaoa_Ombro_Esq_jnt_pointConstraint1" -p "Kaokaoa_Ombro_Esq_jnt";
	rename -uid "581487A8-4586-FD72-CD4B-D5AB4A168245";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_ombro_esq_crvW0" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".o" -type "double3" 2.8238559082183201e-06 -6.7738226583458072e-08 1.6432360228080256e-07 ;
	setAttr ".rst" -type "double3" 2.1475766066668029 -3.8995772085463227 -1.0024961926554963 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "Kaokaoa_Ombro_Esq_jnt_orientConstraint1" -p "Kaokaoa_Ombro_Esq_jnt";
	rename -uid "222F43FD-4746-FC38-2662-97917CDBB792";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_ombro_esq_crvW0" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.7143179283917684e-16 1.6302314366759778e-15 16.066399181493363 ;
	setAttr ".o" -type "double3" 0 0 -16.066399181493363 ;
	setAttr -k on ".w0";
createNode joint -n "Kaokaoa_Ombro_Dir_jnt" -p "Kaokaoa_Col_D_jnt";
	rename -uid "8E52734F-4609-91B1-A079-C0BCF844C784";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -174.72721130875186 -1.5160667682566293 -74.003414104752366 ;
	setAttr ".bps" -type "matrix" 0.96094161870192019 0.27675116159924845 0 0 0.27675116159924851 -0.96094161870191996 1.4901161277114383e-08 0
		 4.1239136929359926e-09 -1.4319146063312971e-08 -0.99999999999999978 0 -3.8995799999999994 64.039400000000001 -3.0622199999999999 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Braco_A_Dir_jnt" -p "Kaokaoa_Ombro_Dir_jnt";
	rename -uid "6FF6C34F-45D2-EB54-0D80-3EBFD6BAE221";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -5.7524617130601303 -0.11707314979373251 0.064579998255474003 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.11766146351119823 6.1155760915617057 11.196702111212726 ;
	setAttr ".bps" -type "matrix" 0.99071989382339221 0.084406852632100182 0.10653438511255087 0
		 0.085107766255567943 -0.99636965974546332 -0.0020418770033860632 0 0.1059752806344668 0.011089831714334669 -0.99430692219605588 0
		 -9.4597599999999975 62.559899999999999 -3.1267999999999998 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Braco_B_Dir_jnt" -p "Kaokaoa_Braco_A_Dir_jnt";
	rename -uid "901642EB-47AB-16D9-4CF1-67B62E8FADD1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -10.222204011740633 0.048213443831492953 0.086789434193370152 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.2025832266756045 -11.075731380667527 6.2361649000434509 ;
	setAttr ".bps" -type "matrix" 0.99594488242871049 -0.021741600166886074 -0.087298877348138557 0
		 -0.021184228456726795 -0.99974889295129366 0.0073061280686664027 0 -0.087435802899929332 -0.0054271414985983535 -0.99615537267355969 0
		 -19.573799999999999 61.649999999999991 -4.3022099999999996 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Mao_A_Dir_jnt" -p "Kaokaoa_Braco_B_Dir_jnt";
	rename -uid "BFE2BCC2-4D3F-8DB3-DD53-9B89215C310E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -9.4323663715373876 -5.4638074686863547e-05 0.023836237227784274 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 2.2688039581648711 0 ;
	setAttr ".bps" -type "matrix" 0.99862554580093599 -0.021509708547200669 -0.047794892111995425 0
		 -0.021184228456726795 -0.99974889295129366 0.0073061280686664027 0 -0.047940043163059498 -0.0062835882166984349 -0.99883045046726859 0
		 -28.969999999999992 61.85499999999999 -3.5025200000000005 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Mao_B_Dir_jnt" -p "Kaokaoa_Mao_A_Dir_jnt";
	rename -uid "B99833EF-4085-EE8C-12D7-A38746D29C28";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" -4.7851765519488083 2.7777569208353725e-05 -2.8032948717893191e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 0.99862554580093599 -0.021509708547200669 -0.047794892111995425 0
		 -0.021184228456726795 -0.99974889295129366 0.0073061280686664027 0 -0.047940043163059498 -0.0062835882166984349 -0.99883045046726859 0
		 -33.74860000000001 61.957899999999995 -3.2738099999999992 1;
	setAttr ".radi" 0.55172413793103436;
createNode joint -n "Kaokaoa_Polegar_A_Dir_jnt" -p "Kaokaoa_Mao_B_Dir_jnt";
	rename -uid "EB90893E-4769-1A80-86E3-3B89C8FDD79C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 1.8942789960893052 0.75178580703162368 -1.8846584182341317 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 123.55676905427494 -52.10333477432178 -58.601682408793579 ;
	setAttr ".bps" -type "matrix" 0.29284566506171322 0.51232035509219098 -0.80732228398129469 0
		 -0.84363110748579917 -0.25895728135927704 -0.47034846753582216 0 -0.45003107774557877 0.81882170231938989 0.3563748712717123 0
		 -31.782499999999995 61.177399999999984 -1.4763999999999999 1;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Polegar_B_Dir_jnt" -p "Kaokaoa_Polegar_A_Dir_jnt";
	rename -uid "003476FB-4D7D-371B-3691-C298C7D6DCB7";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" -2.1866072132935983 0.48117991252271075 0.041826475600601043 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -15.345392519221512 ;
	setAttr ".bps" -type "matrix" 0.50566127042213116 0.56258485533389635 -0.65406800880643534 0
		 -0.73605618580257137 -0.11414596076828717 -0.6672270910132887 0 -0.45003107774557877 0.81882170231938989 0.3563748712717123 0
		 -32.847599999999993 59.966799999999992 0.077480399999997562 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Polegar_C_Dir_jnt" -p "Kaokaoa_Polegar_B_Dir_jnt";
	rename -uid "BCC1878C-4A42-6C9F-78AA-7C996469FF78";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" -2.0496163120457176 0.017522612960277684 -2.0478336367091288e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -3.3653478022568275 -2.7557542127828825 ;
	setAttr ".bps" -type "matrix" 0.51311490671262838 0.61451069884785425 -0.59924093110435339 0
		 -0.71089357684404497 -0.086965754492090527 -0.69790205612786493 0 -0.48098171993452171 0.78410047732873067 0.39222828370948248 0
		 -33.896900000000002 58.811699999999988 1.406370000000005 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Polegar_D_Dir_jnt_FIM" -p "Kaokaoa_Polegar_C_Dir_jnt";
	rename -uid "5DFAE1C6-480F-1171-7AB8-62849D9D8E09";
	setAttr ".uoc" 1;
	setAttr ".t" -type "double3" -2.9974005355908364 -4.2107852312511795e-05 3.9581549309275488e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.55172413793103414;
createNode joint -n "Kaokaoa_Indicador_A_Dir_jnt" -p "Kaokaoa_Mao_B_Dir_jnt";
	rename -uid "E6D53F41-40C0-BD44-ED51-5FA171D25175";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" -2.4149036540445223 0.36500466939840237 -2.3345165022181145 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.37428336534500328 -15.865391030665785 -1.3348571812573917 ;
	setAttr ".bps" -type "matrix" 0.94769277301515698 1.8735013540549517e-16 -0.31918397198926252 0
		 5.6060841732707978e-15 -0.99999999999999978 1.6002824065886045e-14 0 -0.31918397198926257 -1.6984677553288918e-14 -0.94769277301515664 0
		 -36.05599999999999 61.659599999999983 -0.82393700000000036 1;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Indicador_B_Dir_jnt" -p "Kaokaoa_Indicador_A_Dir_jnt";
	rename -uid "2DD815AD-44EB-4631-AEB6-9595A7D4C981";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" -2.5793224991417958 0 -1.6578877772843725e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -25.739342131667176 ;
	setAttr ".bps" -type "matrix" 0.85366178347470334 0.43427770660194576 -0.28751423092317185 0
		 0.41156184402826573 -0.90077903702770179 -0.13861448333958221 0 -0.31918397198926257 -1.6984677553288918e-14 -0.94769277301515664 0
		 -38.500400000000006 61.659599999999983 -0.00064288800000078528 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Indicador_C_Dir_jnt" -p "Kaokaoa_Indicador_B_Dir_jnt";
	rename -uid "4B06B383-4AA5-F848-4270-AB81094368E3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" -2.0345029688705107 -4.3610468637211852e-05 1.4470352294182476e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -20.162669928221149 ;
	setAttr ".bps" -type "matrix" 0.65948762819067352 0.71815073573863564 -0.22211616109931301 0
		 0.68058626219502671 -0.69588757767189358 -0.22922220432005785 0 -0.31918397198926257 -1.6984677553288918e-14 -0.94769277301515664 0
		 -40.237199999999994 60.776099999999992 0.58429800000000021 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Indicador_D_Dir_jnt_FIM" -p "Kaokaoa_Indicador_C_Dir_jnt";
	rename -uid "3A793955-44D6-F2BE-0E01-068B5C0ADC87";
	setAttr ".uoc" 1;
	setAttr ".t" -type "double3" -1.9999492410395572 5.0268331619918172e-05 -2.3715285406566977e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.55172413793103414;
createNode joint -n "Kaokaoa_Medio_A_Dir_jnt" -p "Kaokaoa_Mao_B_Dir_jnt";
	rename -uid "0C7C5BAB-4A2D-B8AA-5C85-A4A9B263875F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" -2.8341110498106232 -0.40680985389698776 -0.75297681671720174 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.42123621103527914 -0.47646775026967131 -8.234723630687574 ;
	setAttr ".bps" -type "matrix" 0.99093057762842962 0.12184838390831026 -0.05665299338887414 0
		 0.1216497350889956 -0.99254872491930246 -0.0069548985502424672 0 -0.057078299499582014 -1.6292522886374172e-14 -0.99836970493211374 0
		 -36.534100000000002 62.430299999999988 -2.3892300000000009 1;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Medio_B_Dir_jnt" -p "Kaokaoa_Medio_A_Dir_jnt";
	rename -uid "9DE94A44-4C5A-7CD9-AB67-BA8E9A822E2A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" -2.46715874172477 -0.056036851519763786 1.6612098932000663e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -15.163481863359909 ;
	setAttr ".bps" -type "matrix" 0.92460933659742373 0.37723103898807098 -0.052861308164406144 0
		 0.37661604108575597 -0.92611918413559524 -0.021531706223884568 0 -0.057078299499582014 -1.6292522886374172e-14 -0.99836970493211374 0
		 -38.985699999999994 62.185299999999998 -2.2490700000000006 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Medio_C_Dir_jnt" -p "Kaokaoa_Medio_B_Dir_jnt";
	rename -uid "14D26999-4965-7651-3FEE-7D8B98CA16CF";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" -2.550331448991443 -0.060644659163855863 -3.6095678890291083e-07 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -18.751249203774229 ;
	setAttr ".bps" -type "matrix" 0.75446692440519558 0.65491916840123299 -0.04313401023788787 0
		 0.6538514569111249 -0.75569893665443089 -0.037381672442010475 0 -0.057078299499582014 -1.6292522886374172e-14 -0.99836970493211374 0
		 -41.366600000000005 61.279400000000017 -2.112950000000001 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Medio_D_Dir_jnt_FIM" -p "Kaokaoa_Medio_C_Dir_jnt";
	rename -uid "D4FF8F27-421F-C50E-ED9F-D3A717709ADF";
	setAttr ".uoc" 1;
	setAttr ".t" -type "double3" -2.4117038247782396 -0.0051224941124559109 -2.0584902111764336e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 1.4114207244468848 ;
	setAttr ".radi" 0.55172413793103414;
createNode joint -n "Kaokaoa_Anelar_A_Dir_jnt" -p "Kaokaoa_Mao_B_Dir_jnt";
	rename -uid "08BD1C50-475A-A005-3B10-6FBE799ABD14";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" -2.6233169188908718 -0.4484666793407257 1.2701100507365251 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -7.925068688118948 13.339332843408767 -11.987580951055754 ;
	setAttr ".bps" -type "matrix" 0.96583536830803041 0.18302209142022363 0.18348012256770058 0
		 0.16012606234001636 -0.97812489348388809 0.13278304449971645 0 0.20376870585242562 -0.098866611145015812 -0.97401422356961898 0
		 -36.419699999999999 62.454699999999995 -4.420329999999999 1;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Anelar_B_Dir_jnt" -p "Kaokaoa_Anelar_A_Dir_jnt";
	rename -uid "35A89E4D-4791-AB90-187F-37B1FAC67EEA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" -2.4197393830016125 0.08724265270487308 2.7357029175334446e-07 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -15.16348186335968 ;
	setAttr ".bps" -type "matrix" 0.89032344778035821 0.43250198631040659 0.14235936980068586 0
		 0.40718849793151479 -0.89619608626586467 0.17615363213406549 0 0.20376870585242562 -0.098866611145015812 -0.97401422356961898 0
		 -38.742800000000017 61.926499999999983 -4.8527199999999979 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Anelar_C_Dir_jnt" -p "Kaokaoa_Anelar_B_Dir_jnt";
	rename -uid "01AEDB27-4F1A-46D7-06AE-75B7BA354711";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" -2.0486019122592438 -0.060617138395670622 4.5109200836890295e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -18.75124920377424 ;
	setAttr ".bps" -type "matrix" 0.71217299819228508 0.69763742398217343 0.078177012640088112 0
		 0.67177967754393908 -0.70959665857458587 0.21256680591932409 0 0.20376870585242562 -0.098866611145015812 -0.97401422356961898 0
		 -40.591399999999993 61.094800000000021 -5.1550399999999978 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Anelar_D_Dir_jnt_FIM" -p "Kaokaoa_Anelar_C_Dir_jnt";
	rename -uid "159ABA6B-4D8C-4357-04FF-48A8B7102E2C";
	setAttr ".uoc" 1;
	setAttr ".t" -type "double3" -2.4117401432471102 -0.0052403016803879154 -1.6995494611649065e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 1.4114207244468848 ;
	setAttr ".radi" 0.55172413793103414;
createNode joint -n "Kaokaoa_Minimo_A_Dir_jnt" -p "Kaokaoa_Mao_B_Dir_jnt";
	rename -uid "BE27AE4E-44E7-0892-36A2-00AC938CF9E4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" -1.7015451752446964 0.28006349702934585 3.0884534471371232 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -14.864959564123032 24.287847621846506 -12.154314180387203 ;
	setAttr ".bps" -type "matrix" 0.91361814232847094 0.17528008215983013 0.3668498096037629 0
		 0.090928638284807767 -0.9675305823808843 0.23583162404007071 0 0.39627499636987518 -0.18210289661548462 -0.89989147251004953 0
		 -35.601800000000011 61.695099999999996 -6.2752799999999986 1;
	setAttr ".radi" 0.60344827586206895;
createNode joint -n "Kaokaoa_Minimo_B_Dir_jnt" -p "Kaokaoa_Minimo_A_Dir_jnt";
	rename -uid "A23BB0A7-451E-4657-016B-83AAAB123AD0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" -1.8340596131467422 -0.35934401578062136 1.2109554184291937e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -20.52949334277789 ;
	setAttr ".bps" -type "matrix" 0.82370817497921434 0.50345116739331841 0.26084816373269115 0
		 0.40555020616992365 -0.84461556763687151 0.34950475416076598 0 0.39627499636987518 -0.18210289661548462 -0.89989147251004953 0
		 -37.310099999999998 61.721300000000028 -7.032860000000003 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Minimo_C_Dir_jnt" -p "Kaokaoa_Minimo_B_Dir_jnt";
	rename -uid "A99DCA5F-46CE-6B3E-280E-CF970C4F8E91";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" -1.7791835075492919 0.089825978753211189 -2.3828054800389964e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -20.162669928221149 ;
	setAttr ".bps" -type "matrix" 0.63344177423936543 0.76372629537071912 0.12439318473212942 0
		 0.66461842127685589 -0.61932275979780282 0.41799721685185015 0 0.39627499636987518 -0.18210289661548462 -0.89989147251004953 0
		 -38.739199999999997 60.749699999999997 -7.4655600000000009 1;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Minimo_D_Dir_jnt_FIM" -p "Kaokaoa_Minimo_C_Dir_jnt";
	rename -uid "EF1F15A5-43C7-A028-743F-0FB11F8085E0";
	setAttr ".uoc" 1;
	setAttr ".t" -type "double3" -2.2732355656751189 -0.17233024359936167 -9.5276651315145955e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".radi" 0.55172413793103414;
createNode orientConstraint -n "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1" -p "Kaokaoa_Mao_A_Dir_jnt";
	rename -uid "5DF28C06-42A7-4DED-53AF-828B002C3E08";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Mao_A_Dir_jnt_FKW0" -dv 1 
		-min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Kaokaoa_Mao_A_Dir_jnt_IKW1" -dv 1 
		-min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode orientConstraint -n "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1" -p "Kaokaoa_Braco_B_Dir_jnt";
	rename -uid "6183C884-426F-AEE3-8DCB-29A75319D12A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Braco_B_Dir_jnt_FKW0" -dv 
		1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Kaokaoa_Braco_B_Dir_jnt_IKW1" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".lr" -type "double3" -5.9635400277440949e-16 6.4170175506871333e-15 -3.081162347667781e-15 ;
	setAttr ".rsrr" -type "double3" -3.975693351829396e-16 4.808104147368675e-15 -2.3108717607508355e-15 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode orientConstraint -n "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1" -p "Kaokaoa_Braco_A_Dir_jnt";
	rename -uid "0AC012B6-4230-C629-9FAB-1C8B5AADB6AF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Braco_A_Dir_jnt_FKW0" -dv 
		1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Kaokaoa_Braco_A_Dir_jnt_IKW1" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".lr" -type "double3" -2.273091373357932e-05 -3.4125111195143383e-15 -1.9910927243825224e-06 ;
	setAttr ".rsrr" -type "double3" 2.981770013872047e-16 -2.4351121779955051e-15 1.5530052155583572e-17 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode joint -n "Kaokaoa_Braco_A_Dir_jnt_FK" -p "Kaokaoa_Ombro_Dir_jnt";
	rename -uid "44FDA3E6-44EB-7AD5-06B0-588553D94A0C";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -5.7524617130601303 -0.11707314979373251 0.064579998255474003 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.11766146351119863 6.1155760915617021 11.196702111212728 ;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Braco_B_Dir_jnt_FK" -p "Kaokaoa_Braco_A_Dir_jnt_FK";
	rename -uid "EAC76BC2-422D-ECB4-1A4D-64A943BF7AAD";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -10.222204011740633 0.048213443831492953 0.086789434193370152 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.2025832266756045 -11.07573138066752 6.2361649000434474 ;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Mao_A_Dir_jnt_FK" -p "Kaokaoa_Braco_B_Dir_jnt_FK";
	rename -uid "5F7134AA-4539-1FDE-74B3-C6AFF61D0B2D";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -9.4323663715373876 -5.4638074686863547e-05 0.023836237227784274 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 2.2688039581648711 0 ;
	setAttr ".radi" 0.55172413793103448;
createNode orientConstraint -n "Kaokaoa_Mao_A_Dir_jnt_FK_orientConstraint1" -p "Kaokaoa_Mao_A_Dir_jnt_FK";
	rename -uid "84D2C654-4908-760F-615D-CDB468EB9863";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_pulso_dir_crv_FKW0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 0.36043988800591592 2.7478153558410501 -1.2152551763810431 ;
	setAttr ".o" -type "double3" -0.41909298730670902 -2.7394892689871959 1.2339209493958134 ;
	setAttr ".rsrr" -type "double3" -9.9392333795734899e-17 3.9912234039849796e-16 -1.9567865716035308e-16 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "Kaokaoa_Braco_B_Dir_jnt_FK_orientConstraint1" -p "Kaokaoa_Braco_B_Dir_jnt_FK";
	rename -uid "D0923C00-410F-0DCF-9E44-C8A74DCCA6B4";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_cotovelo_dir_crv_FKW0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 0.31214932403949064 5.0161077571646571 -1.2185251456409285 ;
	setAttr ".o" -type "double3" -0.42021838021797914 -5.0082323868012368 1.2505753344573272 ;
	setAttr ".rsrr" -type "double3" 1.1802839638243519e-16 7.9358566515032083e-16 1.9567865716035308e-16 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "Kaokaoa_Braco_A_Dir_jnt_FK_orientConstraint1" -p "Kaokaoa_Braco_A_Dir_jnt_FK";
	rename -uid "2B629179-439F-EADA-BD69-2DAD4352A2FE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_Braco_A_dir_crv_FKW0" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -0.6390129735089437 -6.0833593127439123 4.9099381978045509 ;
	setAttr ".o" -type "double3" 0.11766146351119858 6.1155760915617012 -4.8696970702806315 ;
	setAttr ".rsrr" -type "double3" -1.9878466759146975e-16 -7.9824468079699571e-16 
		7.8892664950364556e-16 ;
	setAttr -k on ".w0";
createNode joint -n "Kaokaoa_Braco_A_Dir_jnt_IK" -p "Kaokaoa_Ombro_Dir_jnt";
	rename -uid "44F700CB-411B-A707-BB40-8A9A87CE814D";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -5.7524617130601303 -0.11707314979373251 0.064579998255474003 ;
	setAttr ".r" -type "double3" -2.2730913733831414e-05 -1.1200839446985471e-06 -1.9910927264512347e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.11766146351119863 6.1155760915617021 11.196702111212728 ;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Braco_B_Dir_jnt_IK" -p "Kaokaoa_Braco_A_Dir_jnt_IK";
	rename -uid "76708286-4C75-437B-D8F4-D19150E27908";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -10.222204011740633 0.048213443831492953 0.086789434193370152 ;
	setAttr ".r" -type "double3" -3.6380606451459106e-16 2.5991449085110068e-13 -1.4333808107936732e-13 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -1.2025832266756045 -11.07573138066752 6.2361649000434474 ;
	setAttr ".radi" 0.55172413793103448;
createNode joint -n "Kaokaoa_Mao_A_Dir_jnt_IK" -p "Kaokaoa_Braco_B_Dir_jnt_IK";
	rename -uid "9FA98CF2-4298-A489-A959-CD9DCEB27704";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -9.4323663715373876 -5.4638074686863547e-05 0.023836237227784274 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 2.2688039581648711 0 ;
	setAttr ".radi" 0.55172413793103448;
createNode orientConstraint -n "Kaokaoa_Mao_A_Dir_jnt_IK_orientConstraint1" -p "Kaokaoa_Mao_A_Dir_jnt_IK";
	rename -uid "3067D2BD-41E8-04C4-8E60-BFABAA78AF91";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_pulso_dir_crv_IKW0" 
		-dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 0.36046259718789081 2.7478134179330871 -1.2152556309707609 ;
	setAttr ".o" -type "double3" -0.41911569717185265 -2.7394868392147167 1.2339224766775223 ;
	setAttr ".rsrr" -type "double3" -6.2120208622334312e-18 -7.9513867036587919e-16 
		-3.1060104311167156e-18 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "Kaokaoa_Ombro_Dir_jnt_pointConstraint1" -p "Kaokaoa_Ombro_Dir_jnt";
	rename -uid "30BE3176-4213-CD64-B01F-A48237A58091";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_ombro_dir_crvW0" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".o" -type "double3" 1.8347176080624195e-06 2.8591918730391797e-06 -2.0579351867056062e-07 ;
	setAttr ".rst" -type "double3" 2.1475756175285028 3.8995800000000092 -1.002496562772619 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "Kaokaoa_Ombro_Dir_jnt_orientConstraint1" -p "Kaokaoa_Ombro_Dir_jnt";
	rename -uid "DFA2507B-411D-6830-CA6C-E2A214CBAD06";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_ombro_dir_crvW0" -dv 
		1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 8.2042663378741534e-07 -2.3628285092193428e-07 16.066399181493352 ;
	setAttr ".o" -type "double3" 0 0 -16.066399181493352 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "Kaokaoa_Col_C_jnt_orientConstraint1" -p "Kaokaoa_Col_C_jnt";
	rename -uid "28C0824D-4372-FB3E-3CC6-8781AB3A183D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_peito_A_crvW0" -dv 1 
		-min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 20.365894666545358 -1.5902773407317584e-15 -90 ;
	setAttr ".o" -type "double3" 0 22.165588493544107 90 ;
	setAttr ".rsrr" -type "double3" 1.5971127151393822e-15 1.799693826998751 4.2270355479171409e-16 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "Kaokaoa_Col_A_jnt_orientConstraint1" -p "Kaokaoa_Col_A_jnt";
	rename -uid "C3D5A494-4721-5C49-A5A2-249BAC773C05";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_barriga_crvW0" -dv 1 
		-min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 4.2173119323491521 -3.975693351829396e-16 -90 ;
	setAttr ".o" -type "double3" 0 1.6677023387776957 90 ;
	setAttr ".rsrr" -type "double3" 9.9452362757011038e-16 -2.5496095935714562 -1.5917787568856968e-17 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "Kaokaoa_Root_jnt_parentConstraint1" -p "Kaokaoa_Root_jnt";
	rename -uid "6C77EFFD-4C16-4520-2289-A19182700F06";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Kaokaoa_ctrl_root_crvW0" -dv 1 -min 
		0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -3.944304526105059e-31 -1.4210854715202004e-14 
		-1.7763568394002505e-15 ;
	setAttr ".rst" -type "double3" 0 49 1 ;
	setAttr -k on ".w0";
createNode animCurveUU -n "Kaokaoa_Braco_A_esq_crv_FK_visibility";
	rename -uid "7B85D2E3-4160-8828-B4A3-A5A4AF1021FB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 1;
createNode animCurveUU -n "Kaokaoa_ctrl_cotovelo_esq_crv_IK_visibility";
	rename -uid "76F290F9-45FB-4755-B9EE-84848D5AF3B1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_Braco_A_dir_crv_FK_visibility";
	rename -uid "23C70F13-441B-B2DB-6706-998563523016";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 1;
createNode animCurveUU -n "Kaokaoa_ctrl_cotovelo_dir_crv_IK_visibility";
	rename -uid "2A262020-4E23-726B-F6F8-AC8F69C6B6AC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_ctrl_perna_A_esq_crv_FK_visibility";
	rename -uid "BB8A4887-4AE3-85E0-EC39-CBBC35CD98D2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 1;
createNode animCurveUU -n "Kaokaoa_ctrl_perna_A_dir_crv_FK_visibility";
	rename -uid "A1822374-4890-8C78-1632-FDB17EB4F4A1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 1;
createNode animCurveUU -n "Kaokaoa_ctrl_olhos_crv_parentConstraint1_Kaokaoa_ctrl_master_crvW0";
	rename -uid "1D5184D4-4E8D-ABD2-92EA-75BF7ADC0340";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 1;
createNode animCurveUU -n "Kaokaoa_ctrl_olhos_crv_parentConstraint1_Kaokaoa_ctrl_cabeca_crvW1";
	rename -uid "DE74C2EF-45C1-5D07-F541-D9A64D0A7904";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_ctrl_tornozelo_dir_crv_IK_visibility";
	rename -uid "83004E2B-4DFC-A9C0-3820-B9BB6D60AF9D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUA -n "Kaokaoa_Calcanhar_Dir_grp_rotateX";
	rename -uid "CCA66AFD-4230-193A-1CA8-73AB10BBC581";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  10 0 20 -29.999999999999996;
createNode animCurveUA -n "Kaokaoa_Ponta_Pe_Dir_grp_rotateX";
	rename -uid "BD9F6DC3-44E2-EFAE-2C09-7A8CDE1B7AC4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 -59.999999999999993;
createNode animCurveUA -n "Kaokaoa_Ponta_Pe_Dir_grp_rotateY";
	rename -uid "7B0E59F6-4E17-23A5-8586-5D92F074DA9C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 -59.999999999999993 10 0 20 90;
createNode ikSCsolver -n "ikSCsolver";
	rename -uid "0A490E46-4577-D06A-CE2F-F086AC60EE15";
createNode animCurveUA -n "Kaokaoa_Perna_Pe_A_Dir_grp_rotateX";
	rename -uid "38C8B591-4361-1544-EAE7-1093761CBF02";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 -40 10 0;
createNode ikRPsolver -n "ikRPsolver";
	rename -uid "6BF97D96-4C4C-1549-2A1A-6E8C29306C94";
createNode animCurveUA -n "Kaokaoa_Perna_Dir_ikHandle_twist";
	rename -uid "88428539-486C-8C16-788D-E49E329FDE69";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -3.2000000476837158 -50 0 0 3.2000000476837158 
		59.999999999999993;
createNode animCurveUU -n "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_master_crvW0";
	rename -uid "6B2E4DDF-40FE-4A72-5CE8-C69F0836C9AD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 5 1;
createNode animCurveUU -n "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_root_crvW1";
	rename -uid "4A9D93A2-47E5-1BF2-BCDE-FE8D23BAA313";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 5 0;
createNode animCurveUU -n "Kaokaoa_ctrl_tornozelo_esq_crv_IK_visibility";
	rename -uid "D983070C-4DC4-2802-26D6-8C8A8EC61745";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUA -n "Kaokaoa_Calcanhar_Esq_grp_rotateX";
	rename -uid "61C0034D-4122-1F41-E814-9CB4F82702DA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  10 0 20 29.999999999999996;
createNode animCurveUA -n "Kaokaoa_Ponta_Pe_Esq_grp_rotateX";
	rename -uid "A9CCF69A-4944-1185-FED7-B9B46DDF33E2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 -59.999999999999993;
createNode animCurveUA -n "Kaokaoa_Ponta_Pe_Esq_grp_rotateY";
	rename -uid "FFA8AE1F-49BD-C3D8-2426-9B88D90E3A7C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 59.999999999999993 10 0 20 -90;
createNode animCurveUA -n "Kaokaoa_Perna_Pe_A_Esq_grp_rotateX";
	rename -uid "A78675D3-4895-605D-EA75-8AAB52A3C4A1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 -40 10 0;
createNode animCurveUA -n "Kaokaoa_Perna_Esq_ikHandle_twist";
	rename -uid "EBF8875D-49BB-97B8-93BA-5BA5A56F91F6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  -3.2000000476837158 50 0 0 3.2000000476837158 
		-59.999999999999993;
createNode animCurveUU -n "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_master_crvW0";
	rename -uid "B76B3988-45E1-7C05-4A11-1BAF0D4929A4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 5 1;
createNode animCurveUU -n "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_root_crvW1";
	rename -uid "01C901BD-4790-DB6A-D59E-87A1A926BD20";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 5 0;
createNode animCurveUU -n "Kaokaoa_ctrl_pulso_dir_crv_IK_visibility";
	rename -uid "4ABA60EF-446E-E2EE-4E09-FE994B3FC793";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_root_crvW0";
	rename -uid "774F65E3-4B52-5217-E292-8EBD6CE3B4A3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 5 1 10 0;
createNode animCurveUU -n "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_master_crvW1";
	rename -uid "E69A7768-438B-DE2C-2BA3-EBA4CAB37961";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 5 0 10 1;
createNode animCurveUU -n "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_ombro_dir_crvW2";
	rename -uid "B6C33C5F-4340-AFAE-3F2E-AD8063C8F829";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 5 0 10 0;
createNode animCurveUU -n "Kaokaoa_ctrl_pulso_esq_crv_IK_visibility";
	rename -uid "5CA4D828-4C18-E66D-C887-498FFC471760";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_root_crvW0";
	rename -uid "CE885CA2-498F-2986-790C-1395B4FB17F2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 5 1 10 0;
createNode animCurveUU -n "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_master_crvW1";
	rename -uid "618D9D24-4512-9FD7-72E9-81AF66086AD8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 0 5 0 10 1;
createNode animCurveUU -n "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_ombro_esq_crvW2";
	rename -uid "D4D646C0-4D79-AF7E-C261-DE80D729952B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  0 1 5 0 10 0;
createNode animCurveUU -n "Kaokaoa_Pe_Dir_C_jnt_orientConstraint1_Kaokaoa_Pe_Dir_C_jnt_IKW0";
	rename -uid "3EA389FC-4548-CEB4-5704-D194961CE7C7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_Pe_Dir_B_jnt_orientConstraint1_Kaokaoa_Pe_Dir_B_jnt_IKW0";
	rename -uid "27EFDF64-4068-F449-AB26-B09A8733911A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1_Kaokaoa_Pe_Dir_A_jnt_FKW0";
	rename -uid "62BD9BDE-4060-916F-D1FA-499077ABE2BB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 1;
createNode animCurveUU -n "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1_Kaokaoa_Pe_Dir_A_jnt_IKW1";
	rename -uid "1AA527B2-49BE-B283-FBE8-458B2614AA22";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1_Kaokaoa_Perna_Dir_B_jnt_FKW0";
	rename -uid "2810296F-487A-58B6-148C-F8A2DF95E3E0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 1;
createNode animCurveUU -n "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1_Kaokaoa_Perna_Dir_B_jnt_IKW1";
	rename -uid "59C8CAD0-4F37-8D09-DC23-48B4E4A6EC37";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1_Kaokaoa_Perna_Dir_A_jnt1_FKW0";
	rename -uid "4C86F61A-46C4-4BAC-4466-4180BF4A2024";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 1;
createNode animCurveUU -n "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1_Kaokaoa_Perna_Dir_A_jnt1_IKW1";
	rename -uid "12D8F188-4D32-7995-6C78-31B34ACC7CAB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_Pe_Esq_C_jnt_orientConstraint1_Kaokaoa_Pe_Esq_C_jnt_IKW0";
	rename -uid "4906C495-4150-8367-4107-278E3BBF7D21";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_Pe_Esq_B_jnt_orientConstraint1_Kaokaoa_Pe_Esq_B_jnt_IKW0";
	rename -uid "C4AE60CC-492D-9612-A158-B39B3D63046D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1_Kaokaoa_Pe_Esq_A_jnt_FKW0";
	rename -uid "D06412B1-4F80-9A0F-5EF3-5A93BDB9B5D6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 1;
createNode animCurveUU -n "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1_Kaokaoa_Pe_Esq_A_jnt_IKW1";
	rename -uid "36D585A3-4629-1031-231A-38A7FBF6E38D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1_Kaokaoa_Perna_Esq_B_jnt_FKW0";
	rename -uid "6D611701-4507-4564-37EA-08B4D4DC603F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 1;
createNode animCurveUU -n "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1_Kaokaoa_Perna_Esq_B_jnt_IKW1";
	rename -uid "00337F19-4203-29DB-EE5C-F2A9AA5120D0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1_Kaokaoa_Perna_Esq_A_jnt_FKW0";
	rename -uid "983BAD67-4D58-410B-22F6-91AF6182E79C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 1;
createNode animCurveUU -n "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1_Kaokaoa_Perna_Esq_A_jnt_IKW1";
	rename -uid "A0CADEBA-46D2-9E0F-C35F-9D8A981EBB75";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1_Kaokaoa_Mao_A_Esq_jnt_FKW0";
	rename -uid "549648C2-4622-94BC-A4B8-91874AC753FC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 1;
createNode animCurveUU -n "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1_Kaokaoa_Mao_A_Esq_jnt_IKW1";
	rename -uid "6FD24F85-46F0-567E-C11C-B6B6692309F4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1_Kaokaoa_Braco_B_Esq_jnt_FKW0";
	rename -uid "301FA427-4868-3D15-BCCE-278ACE026E15";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 1;
createNode animCurveUU -n "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1_Kaokaoa_Braco_B_Esq_jnt_IKW1";
	rename -uid "59054898-40E9-6441-B5C9-E2AB03313707";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1_Kaokaoa_Braco_A_Esq_jnt_FKW0";
	rename -uid "4DA59794-4E86-E244-9414-A284A4A3FC80";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 1;
createNode animCurveUU -n "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1_Kaokaoa_Braco_A_Esq_jnt_IKW1";
	rename -uid "6458BD26-408B-025A-D321-44BF8AE6350C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1_Kaokaoa_Mao_A_Dir_jnt_FKW0";
	rename -uid "F9674C11-4C38-BF3C-07D0-CEBD3A54D7E0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 1;
createNode animCurveUU -n "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1_Kaokaoa_Mao_A_Dir_jnt_IKW1";
	rename -uid "561CC6B2-44EC-5CBA-C401-FEB1058FADDB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1_Kaokaoa_Braco_B_Dir_jnt_FKW0";
	rename -uid "33EF6AD1-4F2E-CE1A-AEF4-CFAAF9765F7F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 1;
createNode animCurveUU -n "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1_Kaokaoa_Braco_B_Dir_jnt_IKW1";
	rename -uid "3EEA3E55-44F1-0DD4-769B-1AB42D99A53B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
createNode animCurveUU -n "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1_Kaokaoa_Braco_A_Dir_jnt_FKW0";
	rename -uid "622FA25A-4962-4431-E58C-D0BAEBA06758";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 0 10 1;
createNode animCurveUU -n "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1_Kaokaoa_Braco_A_Dir_jnt_IKW1";
	rename -uid "450ABDC0-4EEC-5B2C-1217-D5990308250E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 2 ".ktv[0:1]"  0 1 10 0;
select -ne :time1;
	setAttr ".o" 0;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".aoon" yes;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 899 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 21 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 490 ".u";
select -ne :defaultRenderingList1;
	setAttr -s 34 ".r";
select -ne :defaultTextureList1;
	setAttr -s 482 ".tx";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
	setAttr -s 69 ".gn";
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :initialMaterialInfo;
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :ikSystem;
	setAttr -s 2 ".sol";
connectAttr "Kaokaoa_Braco_A_esq_crv_FK_visibility.o" "Kaokaoa_Braco_A_esq_crv_FK.v"
		;
connectAttr "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.ctx" "Kaokaoa_ctrl_mao_esq_crv_gp.tx"
		;
connectAttr "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.cty" "Kaokaoa_ctrl_mao_esq_crv_gp.ty"
		;
connectAttr "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.ctz" "Kaokaoa_ctrl_mao_esq_crv_gp.tz"
		;
connectAttr "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.crx" "Kaokaoa_ctrl_mao_esq_crv_gp.rx"
		;
connectAttr "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.cry" "Kaokaoa_ctrl_mao_esq_crv_gp.ry"
		;
connectAttr "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.crz" "Kaokaoa_ctrl_mao_esq_crv_gp.rz"
		;
connectAttr "Kaokaoa_ctrl_mao_esq_crv_gp.ro" "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.cro"
		;
connectAttr "Kaokaoa_ctrl_mao_esq_crv_gp.pim" "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.cpim"
		;
connectAttr "Kaokaoa_ctrl_mao_esq_crv_gp.rp" "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.crp"
		;
connectAttr "Kaokaoa_ctrl_mao_esq_crv_gp.rpt" "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.crt"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt.t" "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.tg[0].tt"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt.rp" "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.tg[0].trp"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt.rpt" "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.tg[0].trt"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt.r" "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt.ro" "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt.s" "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.tg[0].ts"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt.pm" "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt.jo" "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.tg[0].tjo"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt.ssc" "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.tg[0].tsc"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt.is" "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.tg[0].tis"
		;
connectAttr "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.w0" "Kaokaoa_ctrl_mao_esq_crv_gp_parentConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_ctrl_cotovelo_esq_crv_IK_visibility.o" "Kaokaoa_ctrl_cotovelo_esq_crv_IK.v"
		;
connectAttr "Kaokaoa_Braco_A_dir_crv_FK_visibility.o" "Kaokaoa_Braco_A_dir_crv_FK.v"
		;
connectAttr "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.ctx" "Kaokaoa_ctrl_mao_dir_crv_gp.tx"
		;
connectAttr "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.cty" "Kaokaoa_ctrl_mao_dir_crv_gp.ty"
		;
connectAttr "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.ctz" "Kaokaoa_ctrl_mao_dir_crv_gp.tz"
		;
connectAttr "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.crx" "Kaokaoa_ctrl_mao_dir_crv_gp.rx"
		;
connectAttr "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.cry" "Kaokaoa_ctrl_mao_dir_crv_gp.ry"
		;
connectAttr "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.crz" "Kaokaoa_ctrl_mao_dir_crv_gp.rz"
		;
connectAttr "Kaokaoa_ctrl_mao_dir_crv_gp.ro" "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.cro"
		;
connectAttr "Kaokaoa_ctrl_mao_dir_crv_gp.pim" "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.cpim"
		;
connectAttr "Kaokaoa_ctrl_mao_dir_crv_gp.rp" "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.crp"
		;
connectAttr "Kaokaoa_ctrl_mao_dir_crv_gp.rpt" "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.crt"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt.t" "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.tg[0].tt"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt.rp" "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.tg[0].trp"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt.rpt" "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.tg[0].trt"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt.r" "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt.ro" "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt.s" "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.tg[0].ts"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt.pm" "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt.jo" "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.tg[0].tjo"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt.ssc" "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.tg[0].tsc"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt.is" "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.tg[0].tis"
		;
connectAttr "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.w0" "Kaokaoa_ctrl_mao_dir_crv_gp_parentConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_ctrl_cotovelo_dir_crv_IK_visibility.o" "Kaokaoa_ctrl_cotovelo_dir_crv_IK.v"
		;
connectAttr "Kaokaoa_ctrl_perna_A_esq_crv_FK_visibility.o" "Kaokaoa_ctrl_perna_A_esq_crv_FK.v"
		;
connectAttr "Kaokaoa_ctrl_perna_A_dir_crv_FK_visibility.o" "Kaokaoa_ctrl_perna_A_dir_crv_FK.v"
		;
connectAttr "Kaokaoa_ctrl_olhos_crv_parentConstraint1.ctx" "Kaokaoa_ctrl_olhos_crv.tx"
		;
connectAttr "Kaokaoa_ctrl_olhos_crv_parentConstraint1.cty" "Kaokaoa_ctrl_olhos_crv.ty"
		;
connectAttr "Kaokaoa_ctrl_olhos_crv_parentConstraint1.ctz" "Kaokaoa_ctrl_olhos_crv.tz"
		;
connectAttr "Kaokaoa_ctrl_olhos_crv_parentConstraint1.crx" "Kaokaoa_ctrl_olhos_crv.rx"
		;
connectAttr "Kaokaoa_ctrl_olhos_crv_parentConstraint1.cry" "Kaokaoa_ctrl_olhos_crv.ry"
		;
connectAttr "Kaokaoa_ctrl_olhos_crv_parentConstraint1.crz" "Kaokaoa_ctrl_olhos_crv.rz"
		;
connectAttr "Kaokaoa_ctrl_olhos_crv.ro" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.cro"
		;
connectAttr "Kaokaoa_ctrl_olhos_crv.pim" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.cpim"
		;
connectAttr "Kaokaoa_ctrl_olhos_crv.rp" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.crp"
		;
connectAttr "Kaokaoa_ctrl_olhos_crv.rpt" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.crt"
		;
connectAttr "Kaokaoa_ctrl_master_crv.t" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.tg[0].tt"
		;
connectAttr "Kaokaoa_ctrl_master_crv.rp" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.tg[0].trp"
		;
connectAttr "Kaokaoa_ctrl_master_crv.rpt" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.tg[0].trt"
		;
connectAttr "Kaokaoa_ctrl_master_crv.r" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_master_crv.ro" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_master_crv.s" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.tg[0].ts"
		;
connectAttr "Kaokaoa_ctrl_master_crv.pm" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_ctrl_olhos_crv_parentConstraint1.w0" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_ctrl_cabeca_crv.t" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.tg[1].tt"
		;
connectAttr "Kaokaoa_ctrl_cabeca_crv.rp" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.tg[1].trp"
		;
connectAttr "Kaokaoa_ctrl_cabeca_crv.rpt" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.tg[1].trt"
		;
connectAttr "Kaokaoa_ctrl_cabeca_crv.r" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.tg[1].tr"
		;
connectAttr "Kaokaoa_ctrl_cabeca_crv.ro" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.tg[1].tro"
		;
connectAttr "Kaokaoa_ctrl_cabeca_crv.s" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.tg[1].ts"
		;
connectAttr "Kaokaoa_ctrl_cabeca_crv.pm" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.tg[1].tpm"
		;
connectAttr "Kaokaoa_ctrl_olhos_crv_parentConstraint1.w1" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.tg[1].tw"
		;
connectAttr "Kaokaoa_ctrl_olhos_crv_parentConstraint1_Kaokaoa_ctrl_master_crvW0.o" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.w0"
		;
connectAttr "Kaokaoa_ctrl_olhos_crv_parentConstraint1_Kaokaoa_ctrl_cabeca_crvW1.o" "Kaokaoa_ctrl_olhos_crv_parentConstraint1.w1"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.ctx" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp.tx"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.cty" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp.ty"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.ctz" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp.tz"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.crx" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp.rx"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.cry" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp.ry"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.crz" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp.rz"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK_visibility.o" "Kaokaoa_ctrl_tornozelo_dir_crv_IK.v"
		;
connectAttr "Kaokaoa_Calcanhar_Dir_grp_rotateX.o" "Kaokaoa_Calcanhar_Dir_grp.rx"
		;
connectAttr "Kaokaoa_Ponta_Pe_Dir_grp_rotateX.o" "Kaokaoa_Ponta_Pe_Dir_grp.rx";
connectAttr "Kaokaoa_Ponta_Pe_Dir_grp_rotateY.o" "Kaokaoa_Ponta_Pe_Dir_grp.ry";
connectAttr "Kaokaoa_Pe_Dir_A_jnt_IK.msg" "Kaokaoa_Pe_B_Dir_ikHandle.hsj";
connectAttr "effector10.hp" "Kaokaoa_Pe_B_Dir_ikHandle.hee";
connectAttr "ikSCsolver.msg" "Kaokaoa_Pe_B_Dir_ikHandle.hsv";
connectAttr "Kaokaoa_Pe_Dir_B_jnt_IK.msg" "Kaokaoa_Pe_C_Dir_ikHandle.hsj";
connectAttr "effector11.hp" "Kaokaoa_Pe_C_Dir_ikHandle.hee";
connectAttr "ikSCsolver.msg" "Kaokaoa_Pe_C_Dir_ikHandle.hsv";
connectAttr "Kaokaoa_Perna_Pe_A_Dir_grp_rotateX.o" "Kaokaoa_Perna_Pe_A_Dir_grp.rx"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_IK.msg" "Kaokaoa_Perna_Dir_ikHandle.hsj";
connectAttr "effector9.hp" "Kaokaoa_Perna_Dir_ikHandle.hee";
connectAttr "ikRPsolver.msg" "Kaokaoa_Perna_Dir_ikHandle.hsv";
connectAttr "Kaokaoa_Perna_Dir_ikHandle_twist.o" "Kaokaoa_Perna_Dir_ikHandle.twi"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp.ro" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.cro"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp.pim" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.cpim"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp.rp" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.crp"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp.rpt" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.crt"
		;
connectAttr "Kaokaoa_ctrl_master_crv.t" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.tg[0].tt"
		;
connectAttr "Kaokaoa_ctrl_master_crv.rp" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.tg[0].trp"
		;
connectAttr "Kaokaoa_ctrl_master_crv.rpt" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.tg[0].trt"
		;
connectAttr "Kaokaoa_ctrl_master_crv.r" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_master_crv.ro" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_master_crv.s" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.tg[0].ts"
		;
connectAttr "Kaokaoa_ctrl_master_crv.pm" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.w0" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_ctrl_root_crv.t" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.tg[1].tt"
		;
connectAttr "Kaokaoa_ctrl_root_crv.rp" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.tg[1].trp"
		;
connectAttr "Kaokaoa_ctrl_root_crv.rpt" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.tg[1].trt"
		;
connectAttr "Kaokaoa_ctrl_root_crv.r" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.tg[1].tr"
		;
connectAttr "Kaokaoa_ctrl_root_crv.ro" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.tg[1].tro"
		;
connectAttr "Kaokaoa_ctrl_root_crv.s" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.tg[1].ts"
		;
connectAttr "Kaokaoa_ctrl_root_crv.pm" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.tg[1].tpm"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.w1" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.tg[1].tw"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_master_crvW0.o" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.w0"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_root_crvW1.o" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1.w1"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.ctx" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp.tx"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.cty" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp.ty"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.ctz" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp.tz"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.crx" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp.rx"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.cry" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp.ry"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.crz" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp.rz"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK_visibility.o" "Kaokaoa_ctrl_tornozelo_esq_crv_IK.v"
		;
connectAttr "Kaokaoa_Calcanhar_Esq_grp_rotateX.o" "Kaokaoa_Calcanhar_Esq_grp.rx"
		;
connectAttr "Kaokaoa_Ponta_Pe_Esq_grp_rotateX.o" "Kaokaoa_Ponta_Pe_Esq_grp.rx";
connectAttr "Kaokaoa_Ponta_Pe_Esq_grp_rotateY.o" "Kaokaoa_Ponta_Pe_Esq_grp.ry";
connectAttr "Kaokaoa_Pe_Esq_A_jnt_IK.msg" "Kaokaoa_Pe_B_Esq_ikHandle.hsj";
connectAttr "effector6.hp" "Kaokaoa_Pe_B_Esq_ikHandle.hee";
connectAttr "ikSCsolver.msg" "Kaokaoa_Pe_B_Esq_ikHandle.hsv";
connectAttr "Kaokaoa_Pe_Esq_B_jnt_IK.msg" "Kaokaoa_Pe_C_Esq_ikHandle.hsj";
connectAttr "effector7.hp" "Kaokaoa_Pe_C_Esq_ikHandle.hee";
connectAttr "ikSCsolver.msg" "Kaokaoa_Pe_C_Esq_ikHandle.hsv";
connectAttr "Kaokaoa_Perna_Pe_A_Esq_grp_rotateX.o" "Kaokaoa_Perna_Pe_A_Esq_grp.rx"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_IK.msg" "Kaokaoa_Perna_Esq_ikHandle.hsj";
connectAttr "effector8.hp" "Kaokaoa_Perna_Esq_ikHandle.hee";
connectAttr "ikRPsolver.msg" "Kaokaoa_Perna_Esq_ikHandle.hsv";
connectAttr "Kaokaoa_Perna_Esq_ikHandle_twist.o" "Kaokaoa_Perna_Esq_ikHandle.twi"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp.ro" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.cro"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp.pim" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.cpim"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp.rp" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.crp"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp.rpt" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.crt"
		;
connectAttr "Kaokaoa_ctrl_master_crv.t" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.tg[0].tt"
		;
connectAttr "Kaokaoa_ctrl_master_crv.rp" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.tg[0].trp"
		;
connectAttr "Kaokaoa_ctrl_master_crv.rpt" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.tg[0].trt"
		;
connectAttr "Kaokaoa_ctrl_master_crv.r" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_master_crv.ro" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_master_crv.s" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.tg[0].ts"
		;
connectAttr "Kaokaoa_ctrl_master_crv.pm" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.w0" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_ctrl_root_crv.t" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.tg[1].tt"
		;
connectAttr "Kaokaoa_ctrl_root_crv.rp" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.tg[1].trp"
		;
connectAttr "Kaokaoa_ctrl_root_crv.rpt" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.tg[1].trt"
		;
connectAttr "Kaokaoa_ctrl_root_crv.r" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.tg[1].tr"
		;
connectAttr "Kaokaoa_ctrl_root_crv.ro" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.tg[1].tro"
		;
connectAttr "Kaokaoa_ctrl_root_crv.s" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.tg[1].ts"
		;
connectAttr "Kaokaoa_ctrl_root_crv.pm" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.tg[1].tpm"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.w1" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.tg[1].tw"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_master_crvW0.o" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.w0"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_root_crvW1.o" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1.w1"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.ctx" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp.tx"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.cty" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp.ty"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.ctz" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp.tz"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.crx" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp.rx"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.cry" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp.ry"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.crz" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp.rz"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK_visibility.o" "Kaokaoa_ctrl_pulso_dir_crv_IK.v"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK_gp.ro" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.cro"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK_gp.pim" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.cpim"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK_gp.rp" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.crp"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK_gp.rpt" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.crt"
		;
connectAttr "Kaokaoa_ctrl_root_crv.t" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[0].tt"
		;
connectAttr "Kaokaoa_ctrl_root_crv.rp" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[0].trp"
		;
connectAttr "Kaokaoa_ctrl_root_crv.rpt" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[0].trt"
		;
connectAttr "Kaokaoa_ctrl_root_crv.r" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_root_crv.ro" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_root_crv.s" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[0].ts"
		;
connectAttr "Kaokaoa_ctrl_root_crv.pm" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.w0" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_ctrl_master_crv.t" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[1].tt"
		;
connectAttr "Kaokaoa_ctrl_master_crv.rp" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[1].trp"
		;
connectAttr "Kaokaoa_ctrl_master_crv.rpt" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[1].trt"
		;
connectAttr "Kaokaoa_ctrl_master_crv.r" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[1].tr"
		;
connectAttr "Kaokaoa_ctrl_master_crv.ro" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[1].tro"
		;
connectAttr "Kaokaoa_ctrl_master_crv.s" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[1].ts"
		;
connectAttr "Kaokaoa_ctrl_master_crv.pm" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[1].tpm"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.w1" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[1].tw"
		;
connectAttr "Kaokaoa_ctrl_ombro_dir_crv.t" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[2].tt"
		;
connectAttr "Kaokaoa_ctrl_ombro_dir_crv.rp" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[2].trp"
		;
connectAttr "Kaokaoa_ctrl_ombro_dir_crv.rpt" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[2].trt"
		;
connectAttr "Kaokaoa_ctrl_ombro_dir_crv.r" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[2].tr"
		;
connectAttr "Kaokaoa_ctrl_ombro_dir_crv.ro" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[2].tro"
		;
connectAttr "Kaokaoa_ctrl_ombro_dir_crv.s" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[2].ts"
		;
connectAttr "Kaokaoa_ctrl_ombro_dir_crv.pm" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[2].tpm"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.w2" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.tg[2].tw"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_root_crvW0.o" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.w0"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_master_crvW1.o" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.w1"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_ombro_dir_crvW2.o" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1.w2"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.ctx" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp.tx"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.cty" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp.ty"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.ctz" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp.tz"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.crx" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp.rx"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.cry" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp.ry"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.crz" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp.rz"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK_visibility.o" "Kaokaoa_ctrl_pulso_esq_crv_IK.v"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK_gp.ro" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.cro"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK_gp.pim" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.cpim"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK_gp.rp" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.crp"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK_gp.rpt" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.crt"
		;
connectAttr "Kaokaoa_ctrl_root_crv.t" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[0].tt"
		;
connectAttr "Kaokaoa_ctrl_root_crv.rp" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[0].trp"
		;
connectAttr "Kaokaoa_ctrl_root_crv.rpt" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[0].trt"
		;
connectAttr "Kaokaoa_ctrl_root_crv.r" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_root_crv.ro" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_root_crv.s" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[0].ts"
		;
connectAttr "Kaokaoa_ctrl_root_crv.pm" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.w0" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_ctrl_master_crv.t" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[1].tt"
		;
connectAttr "Kaokaoa_ctrl_master_crv.rp" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[1].trp"
		;
connectAttr "Kaokaoa_ctrl_master_crv.rpt" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[1].trt"
		;
connectAttr "Kaokaoa_ctrl_master_crv.r" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[1].tr"
		;
connectAttr "Kaokaoa_ctrl_master_crv.ro" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[1].tro"
		;
connectAttr "Kaokaoa_ctrl_master_crv.s" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[1].ts"
		;
connectAttr "Kaokaoa_ctrl_master_crv.pm" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[1].tpm"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.w1" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[1].tw"
		;
connectAttr "Kaokaoa_ctrl_ombro_esq_crv.t" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[2].tt"
		;
connectAttr "Kaokaoa_ctrl_ombro_esq_crv.rp" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[2].trp"
		;
connectAttr "Kaokaoa_ctrl_ombro_esq_crv.rpt" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[2].trt"
		;
connectAttr "Kaokaoa_ctrl_ombro_esq_crv.r" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[2].tr"
		;
connectAttr "Kaokaoa_ctrl_ombro_esq_crv.ro" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[2].tro"
		;
connectAttr "Kaokaoa_ctrl_ombro_esq_crv.s" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[2].ts"
		;
connectAttr "Kaokaoa_ctrl_ombro_esq_crv.pm" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[2].tpm"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.w2" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.tg[2].tw"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_root_crvW0.o" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.w0"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_master_crvW1.o" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.w1"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_ombro_esq_crvW2.o" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1.w2"
		;
connectAttr "Kaokaoa_Root_jnt_parentConstraint1.ctx" "Kaokaoa_Root_jnt.tx";
connectAttr "Kaokaoa_Root_jnt_parentConstraint1.cty" "Kaokaoa_Root_jnt.ty";
connectAttr "Kaokaoa_Root_jnt_parentConstraint1.ctz" "Kaokaoa_Root_jnt.tz";
connectAttr "Kaokaoa_Root_jnt_parentConstraint1.crx" "Kaokaoa_Root_jnt.rx";
connectAttr "Kaokaoa_Root_jnt_parentConstraint1.cry" "Kaokaoa_Root_jnt.ry";
connectAttr "Kaokaoa_Root_jnt_parentConstraint1.crz" "Kaokaoa_Root_jnt.rz";
connectAttr "Kaokaoa_Root_jnt.s" "Kaokaoa_Bacia_A_jnt.is";
connectAttr "Kaokaoa_Bacia_A_jnt_orientConstraint1.crx" "Kaokaoa_Bacia_A_jnt.rx"
		;
connectAttr "Kaokaoa_Bacia_A_jnt_orientConstraint1.cry" "Kaokaoa_Bacia_A_jnt.ry"
		;
connectAttr "Kaokaoa_Bacia_A_jnt_orientConstraint1.crz" "Kaokaoa_Bacia_A_jnt.rz"
		;
connectAttr "Kaokaoa_Bacia_A_jnt.s" "Kaokaoa_Bacia_B_jnt.is";
connectAttr "Kaokaoa_Bacia_B_jnt.s" "Kaokaoa_Calda_A_jnt.is";
connectAttr "Kaokaoa_Calda_A_jnt.s" "Kaokaoa_Calda_B_jnt.is";
connectAttr "Kaokaoa_Calda_B_jnt.s" "Kaokaoa_Calda_C_jnt.is";
connectAttr "Kaokaoa_Calda_C_jnt.s" "Kaokaoa_Calda_D_jnt.is";
connectAttr "Kaokaoa_Calda_D_jnt.s" "Kaokaoa_Calda_E_jnt.is";
connectAttr "Kaokaoa_Calda_E_jnt.s" "Kaokaoa_Calda_F_jnt.is";
connectAttr "Kaokaoa_Calda_F_jnt.s" "Kaokaoa_Calda_G_jnt.is";
connectAttr "Kaokaoa_Calda_G_jnt.s" "Kaokaoa_Calda_H_jnt.is";
connectAttr "Kaokaoa_Calda_H_jnt.s" "Kaokaoa_Calda_I_jnt.is";
connectAttr "Kaokaoa_Calda_I_jnt.s" "Kaokaoa_Calda_J_jnt.is";
connectAttr "Kaokaoa_Calda_J_jnt.s" "Kaokaoa_Calda_K_jnt.is";
connectAttr "Kaokaoa_Calda_K_jnt.s" "Kaokaoa_Calda_L_jnt_FIM.is";
connectAttr "Kaokaoa_Bacia_B_jnt.s" "Kaokaoa_Perna_Dir_A_jnt.is";
connectAttr "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.crx" "Kaokaoa_Perna_Dir_A_jnt.rx"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.cry" "Kaokaoa_Perna_Dir_A_jnt.ry"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.crz" "Kaokaoa_Perna_Dir_A_jnt.rz"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt.s" "Kaokaoa_Perna_Dir_B_jnt.is";
connectAttr "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.crx" "Kaokaoa_Perna_Dir_B_jnt.rx"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.cry" "Kaokaoa_Perna_Dir_B_jnt.ry"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.crz" "Kaokaoa_Perna_Dir_B_jnt.rz"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt.s" "Kaokaoa_Pe_Dir_A_jnt.is";
connectAttr "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.crx" "Kaokaoa_Pe_Dir_A_jnt.rx"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.cry" "Kaokaoa_Pe_Dir_A_jnt.ry"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.crz" "Kaokaoa_Pe_Dir_A_jnt.rz"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt.s" "Kaokaoa_Pe_Dir_B_jnt.is";
connectAttr "Kaokaoa_Pe_Dir_B_jnt_orientConstraint1.crx" "Kaokaoa_Pe_Dir_B_jnt.rx"
		;
connectAttr "Kaokaoa_Pe_Dir_B_jnt_orientConstraint1.cry" "Kaokaoa_Pe_Dir_B_jnt.ry"
		;
connectAttr "Kaokaoa_Pe_Dir_B_jnt_orientConstraint1.crz" "Kaokaoa_Pe_Dir_B_jnt.rz"
		;
connectAttr "Kaokaoa_Pe_Dir_B_jnt.s" "Kaokaoa_Pe_Dir_C_jnt.is";
connectAttr "Kaokaoa_Pe_Dir_C_jnt_orientConstraint1.crx" "Kaokaoa_Pe_Dir_C_jnt.rx"
		;
connectAttr "Kaokaoa_Pe_Dir_C_jnt_orientConstraint1.cry" "Kaokaoa_Pe_Dir_C_jnt.ry"
		;
connectAttr "Kaokaoa_Pe_Dir_C_jnt_orientConstraint1.crz" "Kaokaoa_Pe_Dir_C_jnt.rz"
		;
connectAttr "Kaokaoa_Pe_Dir_C_jnt.s" "Kaokaoa_Dedao_Pe_A_Dir_jnt.is";
connectAttr "Kaokaoa_Dedao_Pe_A_Dir_jnt.s" "Kaokaoa_Dedao_Pe_B_Dir_jnt.is";
connectAttr "Kaokaoa_Dedao_Pe_B_Dir_jnt.s" "Kaokaoa_Dedao_Pe_C_Dir_jnt_FIM.is";
connectAttr "Kaokaoa_Pe_Dir_C_jnt.s" "Kaokaoa_Indicador_Pe_A_Dir_jnt.is";
connectAttr "Kaokaoa_Indicador_Pe_A_Dir_jnt.s" "Kaokaoa_Indicador_Pe_B_Dir_jnt.is"
		;
connectAttr "Kaokaoa_Indicador_Pe_B_Dir_jnt.s" "Kaokaoa_Indicador_Pe_C_Dir_jnt_FIM.is"
		;
connectAttr "Kaokaoa_Pe_Dir_C_jnt.s" "Kaokaoa_Medio_Pe_A_Dir_jnt.is";
connectAttr "Kaokaoa_Medio_Pe_A_Dir_jnt.s" "Kaokaoa_Medio_Pe_B_Dir_jnt.is";
connectAttr "Kaokaoa_Medio_Pe_B_Dir_jnt.s" "Kaokaoa_Medio_Pe_C_Dir_jnt_FIM.is";
connectAttr "Kaokaoa_Pe_Dir_C_jnt.s" "Kaokaoa_Anelar_Pe_A_Dir_jnt.is";
connectAttr "Kaokaoa_Anelar_Pe_A_Dir_jnt.s" "Kaokaoa_Anelar_Pe_B_Dir_jnt.is";
connectAttr "Kaokaoa_Anelar_Pe_B_Dir_jnt.s" "Kaokaoa_Anelar_Pe_C_Dir_jnt_FIM.is"
		;
connectAttr "Kaokaoa_Pe_Dir_C_jnt.ro" "Kaokaoa_Pe_Dir_C_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Pe_Dir_C_jnt.pim" "Kaokaoa_Pe_Dir_C_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Pe_Dir_C_jnt.jo" "Kaokaoa_Pe_Dir_C_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Pe_Dir_C_jnt.is" "Kaokaoa_Pe_Dir_C_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_Pe_Dir_C_jnt_IK.r" "Kaokaoa_Pe_Dir_C_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Pe_Dir_C_jnt_IK.ro" "Kaokaoa_Pe_Dir_C_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Pe_Dir_C_jnt_IK.pm" "Kaokaoa_Pe_Dir_C_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Pe_Dir_C_jnt_IK.jo" "Kaokaoa_Pe_Dir_C_jnt_orientConstraint1.tg[0].tjo"
		;
connectAttr "Kaokaoa_Pe_Dir_C_jnt_orientConstraint1.w0" "Kaokaoa_Pe_Dir_C_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Pe_Dir_C_jnt_orientConstraint1_Kaokaoa_Pe_Dir_C_jnt_IKW0.o" "Kaokaoa_Pe_Dir_C_jnt_orientConstraint1.w0"
		;
connectAttr "Kaokaoa_Pe_Dir_B_jnt.ro" "Kaokaoa_Pe_Dir_B_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Pe_Dir_B_jnt.pim" "Kaokaoa_Pe_Dir_B_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Pe_Dir_B_jnt.jo" "Kaokaoa_Pe_Dir_B_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Pe_Dir_B_jnt.is" "Kaokaoa_Pe_Dir_B_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_Pe_Dir_B_jnt_IK.r" "Kaokaoa_Pe_Dir_B_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Pe_Dir_B_jnt_IK.ro" "Kaokaoa_Pe_Dir_B_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Pe_Dir_B_jnt_IK.pm" "Kaokaoa_Pe_Dir_B_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Pe_Dir_B_jnt_IK.jo" "Kaokaoa_Pe_Dir_B_jnt_orientConstraint1.tg[0].tjo"
		;
connectAttr "Kaokaoa_Pe_Dir_B_jnt_orientConstraint1.w0" "Kaokaoa_Pe_Dir_B_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Pe_Dir_B_jnt_orientConstraint1_Kaokaoa_Pe_Dir_B_jnt_IKW0.o" "Kaokaoa_Pe_Dir_B_jnt_orientConstraint1.w0"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt.ro" "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt.pim" "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt.jo" "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt.is" "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_FK.r" "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_FK.ro" "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_FK.pm" "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_FK.jo" "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.tg[0].tjo"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.w0" "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_IK.r" "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.tg[1].tr"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_IK.ro" "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.tg[1].tro"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_IK.pm" "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.tg[1].tpm"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_IK.jo" "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.tg[1].tjo"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.w1" "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.tg[1].tw"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1_Kaokaoa_Pe_Dir_A_jnt_FKW0.o" "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.w0"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1_Kaokaoa_Pe_Dir_A_jnt_IKW1.o" "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1.w1"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt.ro" "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt.pim" "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt.jo" "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt.is" "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_FK.r" "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_FK.ro" "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_FK.pm" "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_FK.jo" "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.tg[0].tjo"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.w0" "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_IK.r" "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.tg[1].tr"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_IK.ro" "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.tg[1].tro"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_IK.pm" "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.tg[1].tpm"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_IK.jo" "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.tg[1].tjo"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.w1" "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.tg[1].tw"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1_Kaokaoa_Perna_Dir_B_jnt_FKW0.o" "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.w0"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1_Kaokaoa_Perna_Dir_B_jnt_IKW1.o" "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1.w1"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt.ro" "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt.pim" "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt.jo" "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt.is" "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_FK.r" "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_FK.ro" "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_FK.pm" "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_FK.jo" "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.tg[0].tjo"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.w0" "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_IK.r" "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.tg[1].tr"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_IK.ro" "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.tg[1].tro"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_IK.pm" "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.tg[1].tpm"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_IK.jo" "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.tg[1].tjo"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.w1" "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.tg[1].tw"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1_Kaokaoa_Perna_Dir_A_jnt1_FKW0.o" "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.w0"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1_Kaokaoa_Perna_Dir_A_jnt1_IKW1.o" "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1.w1"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_FK_orientConstraint1.crx" "Kaokaoa_Perna_Dir_A_jnt_FK.rx"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_FK_orientConstraint1.cry" "Kaokaoa_Perna_Dir_A_jnt_FK.ry"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_FK_orientConstraint1.crz" "Kaokaoa_Perna_Dir_A_jnt_FK.rz"
		;
connectAttr "Kaokaoa_Bacia_B_jnt.s" "Kaokaoa_Perna_Dir_A_jnt_FK.is";
connectAttr "Kaokaoa_Perna_Dir_B_jnt_FK_orientConstraint1.crx" "Kaokaoa_Perna_Dir_B_jnt_FK.rx"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_FK_orientConstraint1.cry" "Kaokaoa_Perna_Dir_B_jnt_FK.ry"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_FK_orientConstraint1.crz" "Kaokaoa_Perna_Dir_B_jnt_FK.rz"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_FK.s" "Kaokaoa_Perna_Dir_B_jnt_FK.is";
connectAttr "Kaokaoa_Pe_Dir_A_jnt_FK_orientConstraint1.crx" "Kaokaoa_Pe_Dir_A_jnt_FK.rx"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_FK_orientConstraint1.cry" "Kaokaoa_Pe_Dir_A_jnt_FK.ry"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_FK_orientConstraint1.crz" "Kaokaoa_Pe_Dir_A_jnt_FK.rz"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_FK.s" "Kaokaoa_Pe_Dir_A_jnt_FK.is";
connectAttr "Kaokaoa_Pe_Dir_A_jnt_FK.ro" "Kaokaoa_Pe_Dir_A_jnt_FK_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_FK.pim" "Kaokaoa_Pe_Dir_A_jnt_FK_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_FK.jo" "Kaokaoa_Pe_Dir_A_jnt_FK_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_FK.is" "Kaokaoa_Pe_Dir_A_jnt_FK_orientConstraint1.is"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_FK.r" "Kaokaoa_Pe_Dir_A_jnt_FK_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_FK.ro" "Kaokaoa_Pe_Dir_A_jnt_FK_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_FK.pm" "Kaokaoa_Pe_Dir_A_jnt_FK_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Pe_Dir_A_jnt_FK_orientConstraint1.w0" "Kaokaoa_Pe_Dir_A_jnt_FK_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_FK.ro" "Kaokaoa_Perna_Dir_B_jnt_FK_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_FK.pim" "Kaokaoa_Perna_Dir_B_jnt_FK_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_FK.jo" "Kaokaoa_Perna_Dir_B_jnt_FK_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_FK.is" "Kaokaoa_Perna_Dir_B_jnt_FK_orientConstraint1.is"
		;
connectAttr "Kaokaoa_ctrl_perna_B_dir_crv_FK.r" "Kaokaoa_Perna_Dir_B_jnt_FK_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_perna_B_dir_crv_FK.ro" "Kaokaoa_Perna_Dir_B_jnt_FK_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_perna_B_dir_crv_FK.pm" "Kaokaoa_Perna_Dir_B_jnt_FK_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Perna_Dir_B_jnt_FK_orientConstraint1.w0" "Kaokaoa_Perna_Dir_B_jnt_FK_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_FK.ro" "Kaokaoa_Perna_Dir_A_jnt_FK_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_FK.pim" "Kaokaoa_Perna_Dir_A_jnt_FK_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_FK.jo" "Kaokaoa_Perna_Dir_A_jnt_FK_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_FK.is" "Kaokaoa_Perna_Dir_A_jnt_FK_orientConstraint1.is"
		;
connectAttr "Kaokaoa_ctrl_perna_A_dir_crv_FK.r" "Kaokaoa_Perna_Dir_A_jnt_FK_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_perna_A_dir_crv_FK.ro" "Kaokaoa_Perna_Dir_A_jnt_FK_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_perna_A_dir_crv_FK.pm" "Kaokaoa_Perna_Dir_A_jnt_FK_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Perna_Dir_A_jnt_FK_orientConstraint1.w0" "Kaokaoa_Perna_Dir_A_jnt_FK_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Bacia_B_jnt.s" "Kaokaoa_Perna_Dir_A_jnt_IK.is";
connectAttr "Kaokaoa_Perna_Dir_A_jnt_IK.s" "Kaokaoa_Perna_Dir_B_jnt_IK.is";
connectAttr "Kaokaoa_Perna_Dir_B_jnt_IK.s" "Kaokaoa_Pe_Dir_A_jnt_IK.is";
connectAttr "Kaokaoa_Pe_Dir_A_jnt_IK.s" "Kaokaoa_Pe_Dir_B_jnt_IK.is";
connectAttr "Kaokaoa_Pe_Dir_B_jnt_IK.s" "Kaokaoa_Pe_Dir_C_jnt_IK.is";
connectAttr "Kaokaoa_Pe_Dir_C_jnt_IK.tx" "effector11.tx";
connectAttr "Kaokaoa_Pe_Dir_C_jnt_IK.ty" "effector11.ty";
connectAttr "Kaokaoa_Pe_Dir_C_jnt_IK.tz" "effector11.tz";
connectAttr "Kaokaoa_Pe_Dir_B_jnt_IK.tx" "effector10.tx";
connectAttr "Kaokaoa_Pe_Dir_B_jnt_IK.ty" "effector10.ty";
connectAttr "Kaokaoa_Pe_Dir_B_jnt_IK.tz" "effector10.tz";
connectAttr "Kaokaoa_Pe_Dir_A_jnt_IK.tx" "effector9.tx";
connectAttr "Kaokaoa_Pe_Dir_A_jnt_IK.ty" "effector9.ty";
connectAttr "Kaokaoa_Pe_Dir_A_jnt_IK.tz" "effector9.tz";
connectAttr "Kaokaoa_Bacia_B_jnt.s" "Kaokaoa_Perna_Esq_A_jnt.is";
connectAttr "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.crx" "Kaokaoa_Perna_Esq_A_jnt.rx"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.cry" "Kaokaoa_Perna_Esq_A_jnt.ry"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.crz" "Kaokaoa_Perna_Esq_A_jnt.rz"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt.s" "Kaokaoa_Perna_Esq_B_jnt.is";
connectAttr "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.crx" "Kaokaoa_Perna_Esq_B_jnt.rx"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.cry" "Kaokaoa_Perna_Esq_B_jnt.ry"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.crz" "Kaokaoa_Perna_Esq_B_jnt.rz"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt.s" "Kaokaoa_Pe_Esq_A_jnt.is";
connectAttr "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.crx" "Kaokaoa_Pe_Esq_A_jnt.rx"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.cry" "Kaokaoa_Pe_Esq_A_jnt.ry"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.crz" "Kaokaoa_Pe_Esq_A_jnt.rz"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt.s" "Kaokaoa_Pe_Esq_B_jnt.is";
connectAttr "Kaokaoa_Pe_Esq_B_jnt_orientConstraint1.crx" "Kaokaoa_Pe_Esq_B_jnt.rx"
		;
connectAttr "Kaokaoa_Pe_Esq_B_jnt_orientConstraint1.cry" "Kaokaoa_Pe_Esq_B_jnt.ry"
		;
connectAttr "Kaokaoa_Pe_Esq_B_jnt_orientConstraint1.crz" "Kaokaoa_Pe_Esq_B_jnt.rz"
		;
connectAttr "Kaokaoa_Pe_Esq_B_jnt.s" "Kaokaoa_Pe_Esq_C_jnt.is";
connectAttr "Kaokaoa_Pe_Esq_C_jnt_orientConstraint1.crx" "Kaokaoa_Pe_Esq_C_jnt.rx"
		;
connectAttr "Kaokaoa_Pe_Esq_C_jnt_orientConstraint1.cry" "Kaokaoa_Pe_Esq_C_jnt.ry"
		;
connectAttr "Kaokaoa_Pe_Esq_C_jnt_orientConstraint1.crz" "Kaokaoa_Pe_Esq_C_jnt.rz"
		;
connectAttr "Kaokaoa_Pe_Esq_C_jnt.s" "Kaokaoa_Dedao_Pe_A_Esq_jnt.is";
connectAttr "Kaokaoa_Dedao_Pe_A_Esq_jnt.s" "Kaokaoa_Dedao_Pe_B_Esq_jnt.is";
connectAttr "Kaokaoa_Dedao_Pe_B_Esq_jnt.s" "Kaokaoa_Dedao_Pe_C_Esq_jnt_FIM.is";
connectAttr "Kaokaoa_Pe_Esq_C_jnt.s" "Kaokaoa_Indicador_Pe_A_Esq_jnt.is";
connectAttr "Kaokaoa_Indicador_Pe_A_Esq_jnt.s" "Kaokaoa_Indicador_Pe_B_Esq_jnt.is"
		;
connectAttr "Kaokaoa_Indicador_Pe_B_Esq_jnt.s" "Kaokaoa_Indicador_Pe_C_Esq_jnt_FIM.is"
		;
connectAttr "Kaokaoa_Pe_Esq_C_jnt.s" "Kaokaoa_Medio_Pe_A_Esq_jnt.is";
connectAttr "Kaokaoa_Medio_Pe_A_Esq_jnt.s" "Kaokaoa_Medio_Pe_B_Esq_jnt.is";
connectAttr "Kaokaoa_Medio_Pe_B_Esq_jnt.s" "Kaokaoa_Medio_Pe_C_Esq_jnt_FIM.is";
connectAttr "Kaokaoa_Pe_Esq_C_jnt.s" "Kaokaoa_Anelar_Pe_A_Esq_jnt.is";
connectAttr "Kaokaoa_Anelar_Pe_A_Esq_jnt.s" "Kaokaoa_Anelar_Pe_B_Esq_jnt.is";
connectAttr "Kaokaoa_Anelar_Pe_B_Esq_jnt.s" "Kaokaoa_Anelar_Pe_C_Esq_jnt_FIM.is"
		;
connectAttr "Kaokaoa_Pe_Esq_C_jnt.ro" "Kaokaoa_Pe_Esq_C_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Pe_Esq_C_jnt.pim" "Kaokaoa_Pe_Esq_C_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Pe_Esq_C_jnt.jo" "Kaokaoa_Pe_Esq_C_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Pe_Esq_C_jnt.is" "Kaokaoa_Pe_Esq_C_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_Pe_Esq_C_jnt_IK.r" "Kaokaoa_Pe_Esq_C_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Pe_Esq_C_jnt_IK.ro" "Kaokaoa_Pe_Esq_C_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Pe_Esq_C_jnt_IK.pm" "Kaokaoa_Pe_Esq_C_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Pe_Esq_C_jnt_IK.jo" "Kaokaoa_Pe_Esq_C_jnt_orientConstraint1.tg[0].tjo"
		;
connectAttr "Kaokaoa_Pe_Esq_C_jnt_orientConstraint1.w0" "Kaokaoa_Pe_Esq_C_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Pe_Esq_C_jnt_orientConstraint1_Kaokaoa_Pe_Esq_C_jnt_IKW0.o" "Kaokaoa_Pe_Esq_C_jnt_orientConstraint1.w0"
		;
connectAttr "Kaokaoa_Pe_Esq_B_jnt.ro" "Kaokaoa_Pe_Esq_B_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Pe_Esq_B_jnt.pim" "Kaokaoa_Pe_Esq_B_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Pe_Esq_B_jnt.jo" "Kaokaoa_Pe_Esq_B_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Pe_Esq_B_jnt.is" "Kaokaoa_Pe_Esq_B_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_Pe_Esq_B_jnt_IK.r" "Kaokaoa_Pe_Esq_B_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Pe_Esq_B_jnt_IK.ro" "Kaokaoa_Pe_Esq_B_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Pe_Esq_B_jnt_IK.pm" "Kaokaoa_Pe_Esq_B_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Pe_Esq_B_jnt_IK.jo" "Kaokaoa_Pe_Esq_B_jnt_orientConstraint1.tg[0].tjo"
		;
connectAttr "Kaokaoa_Pe_Esq_B_jnt_orientConstraint1.w0" "Kaokaoa_Pe_Esq_B_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Pe_Esq_B_jnt_orientConstraint1_Kaokaoa_Pe_Esq_B_jnt_IKW0.o" "Kaokaoa_Pe_Esq_B_jnt_orientConstraint1.w0"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt.ro" "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt.pim" "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt.jo" "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt.is" "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_FK.r" "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_FK.ro" "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_FK.pm" "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_FK.jo" "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.tg[0].tjo"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.w0" "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_IK.r" "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.tg[1].tr"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_IK.ro" "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.tg[1].tro"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_IK.pm" "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.tg[1].tpm"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_IK.jo" "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.tg[1].tjo"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.w1" "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.tg[1].tw"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1_Kaokaoa_Pe_Esq_A_jnt_FKW0.o" "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.w0"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1_Kaokaoa_Pe_Esq_A_jnt_IKW1.o" "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1.w1"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt.ro" "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt.pim" "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt.jo" "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt.is" "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_FK.r" "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_FK.ro" "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_FK.pm" "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_FK.jo" "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.tg[0].tjo"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.w0" "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_IK.r" "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.tg[1].tr"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_IK.ro" "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.tg[1].tro"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_IK.pm" "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.tg[1].tpm"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_IK.jo" "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.tg[1].tjo"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.w1" "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.tg[1].tw"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1_Kaokaoa_Perna_Esq_B_jnt_FKW0.o" "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.w0"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1_Kaokaoa_Perna_Esq_B_jnt_IKW1.o" "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1.w1"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt.ro" "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt.pim" "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt.jo" "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt.is" "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_FK.r" "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_FK.ro" "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_FK.pm" "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_FK.jo" "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.tg[0].tjo"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.w0" "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_IK.r" "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.tg[1].tr"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_IK.ro" "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.tg[1].tro"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_IK.pm" "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.tg[1].tpm"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_IK.jo" "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.tg[1].tjo"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.w1" "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.tg[1].tw"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1_Kaokaoa_Perna_Esq_A_jnt_FKW0.o" "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.w0"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1_Kaokaoa_Perna_Esq_A_jnt_IKW1.o" "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1.w1"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_FK_orientConstraint1.crx" "Kaokaoa_Perna_Esq_A_jnt_FK.rx"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_FK_orientConstraint1.cry" "Kaokaoa_Perna_Esq_A_jnt_FK.ry"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_FK_orientConstraint1.crz" "Kaokaoa_Perna_Esq_A_jnt_FK.rz"
		;
connectAttr "Kaokaoa_Bacia_B_jnt.s" "Kaokaoa_Perna_Esq_A_jnt_FK.is";
connectAttr "Kaokaoa_Perna_Esq_B_jnt_FK_orientConstraint1.crx" "Kaokaoa_Perna_Esq_B_jnt_FK.rx"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_FK_orientConstraint1.cry" "Kaokaoa_Perna_Esq_B_jnt_FK.ry"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_FK_orientConstraint1.crz" "Kaokaoa_Perna_Esq_B_jnt_FK.rz"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_FK.s" "Kaokaoa_Perna_Esq_B_jnt_FK.is";
connectAttr "Kaokaoa_Pe_Esq_A_jnt_FK_orientConstraint1.crx" "Kaokaoa_Pe_Esq_A_jnt_FK.rx"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_FK_orientConstraint1.cry" "Kaokaoa_Pe_Esq_A_jnt_FK.ry"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_FK_orientConstraint1.crz" "Kaokaoa_Pe_Esq_A_jnt_FK.rz"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_FK.s" "Kaokaoa_Pe_Esq_A_jnt_FK.is";
connectAttr "Kaokaoa_Pe_Esq_A_jnt_FK.ro" "Kaokaoa_Pe_Esq_A_jnt_FK_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_FK.pim" "Kaokaoa_Pe_Esq_A_jnt_FK_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_FK.jo" "Kaokaoa_Pe_Esq_A_jnt_FK_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_FK.is" "Kaokaoa_Pe_Esq_A_jnt_FK_orientConstraint1.is"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_FK.r" "Kaokaoa_Pe_Esq_A_jnt_FK_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_FK.ro" "Kaokaoa_Pe_Esq_A_jnt_FK_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_FK.pm" "Kaokaoa_Pe_Esq_A_jnt_FK_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Pe_Esq_A_jnt_FK_orientConstraint1.w0" "Kaokaoa_Pe_Esq_A_jnt_FK_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_FK.ro" "Kaokaoa_Perna_Esq_B_jnt_FK_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_FK.pim" "Kaokaoa_Perna_Esq_B_jnt_FK_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_FK.jo" "Kaokaoa_Perna_Esq_B_jnt_FK_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_FK.is" "Kaokaoa_Perna_Esq_B_jnt_FK_orientConstraint1.is"
		;
connectAttr "Kaokaoa_ctrl_perna_B_esq_crv_FK.r" "Kaokaoa_Perna_Esq_B_jnt_FK_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_perna_B_esq_crv_FK.ro" "Kaokaoa_Perna_Esq_B_jnt_FK_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_perna_B_esq_crv_FK.pm" "Kaokaoa_Perna_Esq_B_jnt_FK_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Perna_Esq_B_jnt_FK_orientConstraint1.w0" "Kaokaoa_Perna_Esq_B_jnt_FK_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_FK.ro" "Kaokaoa_Perna_Esq_A_jnt_FK_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_FK.pim" "Kaokaoa_Perna_Esq_A_jnt_FK_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_FK.jo" "Kaokaoa_Perna_Esq_A_jnt_FK_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_FK.is" "Kaokaoa_Perna_Esq_A_jnt_FK_orientConstraint1.is"
		;
connectAttr "Kaokaoa_ctrl_perna_A_esq_crv_FK.r" "Kaokaoa_Perna_Esq_A_jnt_FK_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_perna_A_esq_crv_FK.ro" "Kaokaoa_Perna_Esq_A_jnt_FK_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_perna_A_esq_crv_FK.pm" "Kaokaoa_Perna_Esq_A_jnt_FK_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Perna_Esq_A_jnt_FK_orientConstraint1.w0" "Kaokaoa_Perna_Esq_A_jnt_FK_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Bacia_B_jnt.s" "Kaokaoa_Perna_Esq_A_jnt_IK.is";
connectAttr "Kaokaoa_Perna_Esq_A_jnt_IK.s" "Kaokaoa_Perna_Esq_B_jnt_IK.is";
connectAttr "Kaokaoa_Perna_Esq_B_jnt_IK.s" "Kaokaoa_Pe_Esq_A_jnt_IK.is";
connectAttr "Kaokaoa_Pe_Esq_A_jnt_IK.s" "Kaokaoa_Pe_Esq_B_jnt_IK.is";
connectAttr "Kaokaoa_Pe_Esq_B_jnt_IK.s" "Kaokaoa_Pe_Esq_C_jnt_IK.is";
connectAttr "Kaokaoa_Pe_Esq_C_jnt_IK.tx" "effector7.tx";
connectAttr "Kaokaoa_Pe_Esq_C_jnt_IK.ty" "effector7.ty";
connectAttr "Kaokaoa_Pe_Esq_C_jnt_IK.tz" "effector7.tz";
connectAttr "Kaokaoa_Pe_Esq_B_jnt_IK.tx" "effector6.tx";
connectAttr "Kaokaoa_Pe_Esq_B_jnt_IK.ty" "effector6.ty";
connectAttr "Kaokaoa_Pe_Esq_B_jnt_IK.tz" "effector6.tz";
connectAttr "Kaokaoa_Pe_Esq_A_jnt_IK.tx" "effector8.tx";
connectAttr "Kaokaoa_Pe_Esq_A_jnt_IK.ty" "effector8.ty";
connectAttr "Kaokaoa_Pe_Esq_A_jnt_IK.tz" "effector8.tz";
connectAttr "Kaokaoa_Bacia_A_jnt.ro" "Kaokaoa_Bacia_A_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Bacia_A_jnt.pim" "Kaokaoa_Bacia_A_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Bacia_A_jnt.jo" "Kaokaoa_Bacia_A_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Bacia_A_jnt.is" "Kaokaoa_Bacia_A_jnt_orientConstraint1.is";
connectAttr "Kaokaoa_ctrl_cintura_crv.r" "Kaokaoa_Bacia_A_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_cintura_crv.ro" "Kaokaoa_Bacia_A_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_cintura_crv.pm" "Kaokaoa_Bacia_A_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Bacia_A_jnt_orientConstraint1.w0" "Kaokaoa_Bacia_A_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Root_jnt.s" "Kaokaoa_Col_A_jnt.is";
connectAttr "Kaokaoa_Col_A_jnt_orientConstraint1.crx" "Kaokaoa_Col_A_jnt.rx";
connectAttr "Kaokaoa_Col_A_jnt_orientConstraint1.cry" "Kaokaoa_Col_A_jnt.ry";
connectAttr "Kaokaoa_Col_A_jnt_orientConstraint1.crz" "Kaokaoa_Col_A_jnt.rz";
connectAttr "Kaokaoa_Col_A_jnt.s" "Kaokaoa_Col_B_jnt.is";
connectAttr "Kaokaoa_Col_B_jnt.s" "Kaokaoa_Col_C_jnt.is";
connectAttr "Kaokaoa_Col_C_jnt_orientConstraint1.crx" "Kaokaoa_Col_C_jnt.rx";
connectAttr "Kaokaoa_Col_C_jnt_orientConstraint1.cry" "Kaokaoa_Col_C_jnt.ry";
connectAttr "Kaokaoa_Col_C_jnt_orientConstraint1.crz" "Kaokaoa_Col_C_jnt.rz";
connectAttr "Kaokaoa_Col_C_jnt.s" "Kaokaoa_Col_D_jnt.is";
connectAttr "Kaokaoa_Col_D_jnt.s" "Kaokaoa_Col_E_jnt.is";
connectAttr "Kaokaoa_Col_E_jnt_orientConstraint1.crx" "Kaokaoa_Col_E_jnt.rx";
connectAttr "Kaokaoa_Col_E_jnt_orientConstraint1.cry" "Kaokaoa_Col_E_jnt.ry";
connectAttr "Kaokaoa_Col_E_jnt_orientConstraint1.crz" "Kaokaoa_Col_E_jnt.rz";
connectAttr "Kaokaoa_Col_E_jnt.s" "Kaokaoa_Cabeca_A_jnt.is";
connectAttr "Kaokaoa_Cabeca_A_jnt_orientConstraint1.crx" "Kaokaoa_Cabeca_A_jnt.rx"
		;
connectAttr "Kaokaoa_Cabeca_A_jnt_orientConstraint1.cry" "Kaokaoa_Cabeca_A_jnt.ry"
		;
connectAttr "Kaokaoa_Cabeca_A_jnt_orientConstraint1.crz" "Kaokaoa_Cabeca_A_jnt.rz"
		;
connectAttr "Kaokaoa_Cabeca_A_jnt.s" "Kaokaoa_Cabeca_B_jnt.is";
connectAttr "Kaokaoa_Cabeca_B_jnt.s" "Kaokaoa_Cabeca_C_jnt_FIM.is";
connectAttr "Kaokaoa_Cabeca_C_jnt_FIM_orientConstraint1.crx" "Kaokaoa_Cabeca_C_jnt_FIM.rx"
		;
connectAttr "Kaokaoa_Cabeca_C_jnt_FIM_orientConstraint1.cry" "Kaokaoa_Cabeca_C_jnt_FIM.ry"
		;
connectAttr "Kaokaoa_Cabeca_C_jnt_FIM_orientConstraint1.crz" "Kaokaoa_Cabeca_C_jnt_FIM.rz"
		;
connectAttr "Kaokaoa_Cabeca_C_jnt_FIM.ro" "Kaokaoa_Cabeca_C_jnt_FIM_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Cabeca_C_jnt_FIM.pim" "Kaokaoa_Cabeca_C_jnt_FIM_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Cabeca_C_jnt_FIM.jo" "Kaokaoa_Cabeca_C_jnt_FIM_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Cabeca_C_jnt_FIM.is" "Kaokaoa_Cabeca_C_jnt_FIM_orientConstraint1.is"
		;
connectAttr "Kaokaoa_ctrl_nariz_crv.r" "Kaokaoa_Cabeca_C_jnt_FIM_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_nariz_crv.ro" "Kaokaoa_Cabeca_C_jnt_FIM_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_nariz_crv.pm" "Kaokaoa_Cabeca_C_jnt_FIM_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Cabeca_C_jnt_FIM_orientConstraint1.w0" "Kaokaoa_Cabeca_C_jnt_FIM_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Cabeca_A_jnt.s" "Katzen_Mand_A_jnt.is";
connectAttr "Katzen_Mand_A_jnt_orientConstraint1.crx" "Katzen_Mand_A_jnt.rx";
connectAttr "Katzen_Mand_A_jnt_orientConstraint1.cry" "Katzen_Mand_A_jnt.ry";
connectAttr "Katzen_Mand_A_jnt_orientConstraint1.crz" "Katzen_Mand_A_jnt.rz";
connectAttr "Katzen_Mand_A_jnt.s" "Katzen_Mand_B_jnt_FIM.is";
connectAttr "Katzen_Mand_A_jnt.s" "Kaokaoa_Lingua_A_jnt.is";
connectAttr "Kaokaoa_Lingua_A_jnt.s" "Kaokaoa_Lingua_B_jnt.is";
connectAttr "Kaokaoa_Lingua_B_jnt.s" "Kaokaoa_Lingua_C_jnt.is";
connectAttr "Kaokaoa_Lingua_C_jnt.s" "Kaokaoa_Lingua_D_jnt.is";
connectAttr "Kaokaoa_Lingua_D_jnt.s" "Kaokaoa_Lingua_F_jnt_FIM.is";
connectAttr "Katzen_Mand_A_jnt.ro" "Katzen_Mand_A_jnt_orientConstraint1.cro";
connectAttr "Katzen_Mand_A_jnt.pim" "Katzen_Mand_A_jnt_orientConstraint1.cpim";
connectAttr "Katzen_Mand_A_jnt.jo" "Katzen_Mand_A_jnt_orientConstraint1.cjo";
connectAttr "Katzen_Mand_A_jnt.is" "Katzen_Mand_A_jnt_orientConstraint1.is";
connectAttr "Kaokaoa_ctrl_boca_crv.r" "Katzen_Mand_A_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_boca_crv.ro" "Katzen_Mand_A_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_boca_crv.pm" "Katzen_Mand_A_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Katzen_Mand_A_jnt_orientConstraint1.w0" "Katzen_Mand_A_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Cabeca_A_jnt.s" "Kaokaoa_Orelha_Esq_A_jnt.is";
connectAttr "Kaokaoa_Orelha_Esq_A_jnt.s" "Kaokaoa_Orelha_Esq_B_jnt.is";
connectAttr "Kaokaoa_Orelha_Esq_B_jnt.s" "Kaokaoa_Orelha_Esq_C_jnt_FIM.is";
connectAttr "Kaokaoa_Cabeca_A_jnt.s" "Kaokaoa_Orelha_Dir_A_jnt.is";
connectAttr "Kaokaoa_Orelha_Dir_A_jnt.s" "Kaokaoa_Orelha_Dir_B_jnt.is";
connectAttr "Kaokaoa_Orelha_Dir_B_jnt.s" "Kaokaoa_Orelha_Dir_C_jnt_FIM.is";
connectAttr "Kaokaoa_Cabeca_A_jnt.s" "Kaokaoa_Olho_Esq_jnt.is";
connectAttr "Kaokaoa_Cabeca_A_jnt.s" "Kaokaoa_Olho_Dir_jnt.is";
connectAttr "Kaokaoa_Cabeca_A_jnt.ro" "Kaokaoa_Cabeca_A_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Cabeca_A_jnt.pim" "Kaokaoa_Cabeca_A_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Cabeca_A_jnt.jo" "Kaokaoa_Cabeca_A_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Cabeca_A_jnt.is" "Kaokaoa_Cabeca_A_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_ctrl_cabeca_crv.r" "Kaokaoa_Cabeca_A_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_cabeca_crv.ro" "Kaokaoa_Cabeca_A_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_cabeca_crv.pm" "Kaokaoa_Cabeca_A_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Cabeca_A_jnt_orientConstraint1.w0" "Kaokaoa_Cabeca_A_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Col_E_jnt.ro" "Kaokaoa_Col_E_jnt_orientConstraint1.cro";
connectAttr "Kaokaoa_Col_E_jnt.pim" "Kaokaoa_Col_E_jnt_orientConstraint1.cpim";
connectAttr "Kaokaoa_Col_E_jnt.jo" "Kaokaoa_Col_E_jnt_orientConstraint1.cjo";
connectAttr "Kaokaoa_Col_E_jnt.is" "Kaokaoa_Col_E_jnt_orientConstraint1.is";
connectAttr "Kaokaoa_ctrl_pescoco_crv.r" "Kaokaoa_Col_E_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_pescoco_crv.ro" "Kaokaoa_Col_E_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_pescoco_crv.pm" "Kaokaoa_Col_E_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Col_E_jnt_orientConstraint1.w0" "Kaokaoa_Col_E_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Col_D_jnt.s" "Kaokaoa_Ombro_Esq_jnt.is";
connectAttr "Kaokaoa_Ombro_Esq_jnt_pointConstraint1.ctx" "Kaokaoa_Ombro_Esq_jnt.tx"
		;
connectAttr "Kaokaoa_Ombro_Esq_jnt_pointConstraint1.cty" "Kaokaoa_Ombro_Esq_jnt.ty"
		;
connectAttr "Kaokaoa_Ombro_Esq_jnt_pointConstraint1.ctz" "Kaokaoa_Ombro_Esq_jnt.tz"
		;
connectAttr "Kaokaoa_Ombro_Esq_jnt_orientConstraint1.crx" "Kaokaoa_Ombro_Esq_jnt.rx"
		;
connectAttr "Kaokaoa_Ombro_Esq_jnt_orientConstraint1.cry" "Kaokaoa_Ombro_Esq_jnt.ry"
		;
connectAttr "Kaokaoa_Ombro_Esq_jnt_orientConstraint1.crz" "Kaokaoa_Ombro_Esq_jnt.rz"
		;
connectAttr "Kaokaoa_Ombro_Esq_jnt.s" "Kaokaoa_Braco_A_Esq_jnt.is";
connectAttr "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.crx" "Kaokaoa_Braco_A_Esq_jnt.rx"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.cry" "Kaokaoa_Braco_A_Esq_jnt.ry"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.crz" "Kaokaoa_Braco_A_Esq_jnt.rz"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt.s" "Kaokaoa_Braco_B_Esq_jnt.is";
connectAttr "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.crx" "Kaokaoa_Braco_B_Esq_jnt.rx"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.cry" "Kaokaoa_Braco_B_Esq_jnt.ry"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.crz" "Kaokaoa_Braco_B_Esq_jnt.rz"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.crx" "Kaokaoa_Mao_A_Esq_jnt.rx"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.cry" "Kaokaoa_Mao_A_Esq_jnt.ry"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.crz" "Kaokaoa_Mao_A_Esq_jnt.rz"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt.s" "Kaokaoa_Mao_A_Esq_jnt.is";
connectAttr "Kaokaoa_Mao_A_Esq_jnt.s" "Kaokaoa_Mao_B_Esq_jnt.is";
connectAttr "Kaokaoa_Mao_B_Esq_jnt.s" "Kaokaoa_Polegar_A_Esq_jnt.is";
connectAttr "Kaokaoa_Polegar_A_Esq_jnt.s" "Kaokaoa_Polegar_B_Esq_jnt.is";
connectAttr "Kaokaoa_Polegar_B_Esq_jnt.s" "Kaokaoa_Polegar_C_Esq_jnt.is";
connectAttr "Kaokaoa_Polegar_C_Esq_jnt.s" "Kaokaoa_Polegar_D_Esq_jnt_FIM.is";
connectAttr "Kaokaoa_Mao_B_Esq_jnt.s" "Kaokaoa_Indicador_A_Esq_jnt.is";
connectAttr "Kaokaoa_Indicador_A_Esq_jnt.s" "Kaokaoa_Indicador_B_Esq_jnt.is";
connectAttr "Kaokaoa_Indicador_B_Esq_jnt.s" "Kaokaoa_Indicador_C_Esq_jnt.is";
connectAttr "Kaokaoa_Indicador_C_Esq_jnt.s" "Kaokaoa_Indicador_D_Esq_jnt_FIM.is"
		;
connectAttr "Kaokaoa_Mao_B_Esq_jnt.s" "Kaokaoa_Medio_A_Esq_jnt.is";
connectAttr "Kaokaoa_Medio_A_Esq_jnt.s" "Kaokaoa_Medio_B_Esq_jnt.is";
connectAttr "Kaokaoa_Medio_B_Esq_jnt.s" "Kaokaoa_Medio_C_Esq_jnt.is";
connectAttr "Kaokaoa_Medio_C_Esq_jnt.s" "Kaokaoa_Medio_D_Esq_jnt_FIM.is";
connectAttr "Kaokaoa_Mao_B_Esq_jnt.s" "Kaokaoa_Anelar_A_Esq_jnt.is";
connectAttr "Kaokaoa_Anelar_A_Esq_jnt.s" "Kaokaoa_Anelar_B_Esq_jnt.is";
connectAttr "Kaokaoa_Anelar_B_Esq_jnt.s" "Kaokaoa_Anelar_C_Esq_jnt.is";
connectAttr "Kaokaoa_Anelar_C_Esq_jnt.s" "Kaokaoa_Anelar_D_Esq_jnt_FIM.is";
connectAttr "Kaokaoa_Mao_B_Esq_jnt.s" "Kaokaoa_Minimo_A_Esq_jnt.is";
connectAttr "Kaokaoa_Minimo_A_Esq_jnt.s" "Kaokaoa_Minimo_B_Esq_jnt.is";
connectAttr "Kaokaoa_Minimo_B_Esq_jnt.s" "Kaokaoa_Minimo_C_Esq_jnt.is";
connectAttr "Kaokaoa_Minimo_C_Esq_jnt.s" "Kaokaoa_Minimo_D_Esq_jnt_FIM.is";
connectAttr "Kaokaoa_Mao_A_Esq_jnt.ro" "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt.pim" "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt.jo" "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt.is" "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_FK.r" "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_FK.ro" "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_FK.pm" "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_FK.jo" "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.tg[0].tjo"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.w0" "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_IK.r" "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.tg[1].tr"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_IK.ro" "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.tg[1].tro"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_IK.pm" "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.tg[1].tpm"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_IK.jo" "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.tg[1].tjo"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.w1" "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.tg[1].tw"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1_Kaokaoa_Mao_A_Esq_jnt_FKW0.o" "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.w0"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1_Kaokaoa_Mao_A_Esq_jnt_IKW1.o" "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1.w1"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt.ro" "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt.pim" "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt.jo" "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt.is" "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_FK.r" "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_FK.ro" "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_FK.pm" "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_FK.jo" "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.tg[0].tjo"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.w0" "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_IK.r" "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.tg[1].tr"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_IK.ro" "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.tg[1].tro"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_IK.pm" "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.tg[1].tpm"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_IK.jo" "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.tg[1].tjo"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.w1" "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.tg[1].tw"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1_Kaokaoa_Braco_B_Esq_jnt_FKW0.o" "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.w0"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1_Kaokaoa_Braco_B_Esq_jnt_IKW1.o" "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1.w1"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt.ro" "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt.pim" "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt.jo" "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt.is" "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_FK.r" "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_FK.ro" "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_FK.pm" "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_FK.jo" "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.tg[0].tjo"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.w0" "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_IK.r" "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.tg[1].tr"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_IK.ro" "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.tg[1].tro"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_IK.pm" "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.tg[1].tpm"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_IK.jo" "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.tg[1].tjo"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.w1" "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.tg[1].tw"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1_Kaokaoa_Braco_A_Esq_jnt_FKW0.o" "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.w0"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1_Kaokaoa_Braco_A_Esq_jnt_IKW1.o" "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1.w1"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_FK_orientConstraint1.crx" "Kaokaoa_Braco_A_Esq_jnt_FK.rx"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_FK_orientConstraint1.cry" "Kaokaoa_Braco_A_Esq_jnt_FK.ry"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_FK_orientConstraint1.crz" "Kaokaoa_Braco_A_Esq_jnt_FK.rz"
		;
connectAttr "Kaokaoa_Ombro_Esq_jnt.s" "Kaokaoa_Braco_A_Esq_jnt_FK.is";
connectAttr "Kaokaoa_Braco_B_Esq_jnt_FK_orientConstraint1.crx" "Kaokaoa_Braco_B_Esq_jnt_FK.rx"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_FK_orientConstraint1.cry" "Kaokaoa_Braco_B_Esq_jnt_FK.ry"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_FK_orientConstraint1.crz" "Kaokaoa_Braco_B_Esq_jnt_FK.rz"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_FK.s" "Kaokaoa_Braco_B_Esq_jnt_FK.is";
connectAttr "Kaokaoa_Mao_A_Esq_jnt_FK_orientConstraint1.crx" "Kaokaoa_Mao_A_Esq_jnt_FK.rx"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_FK_orientConstraint1.cry" "Kaokaoa_Mao_A_Esq_jnt_FK.ry"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_FK_orientConstraint1.crz" "Kaokaoa_Mao_A_Esq_jnt_FK.rz"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_FK.s" "Kaokaoa_Mao_A_Esq_jnt_FK.is";
connectAttr "Kaokaoa_Mao_A_Esq_jnt_FK.ro" "Kaokaoa_Mao_A_Esq_jnt_FK_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_FK.pim" "Kaokaoa_Mao_A_Esq_jnt_FK_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_FK.jo" "Kaokaoa_Mao_A_Esq_jnt_FK_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_FK.is" "Kaokaoa_Mao_A_Esq_jnt_FK_orientConstraint1.is"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_FK.r" "Kaokaoa_Mao_A_Esq_jnt_FK_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_FK.ro" "Kaokaoa_Mao_A_Esq_jnt_FK_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_FK.pm" "Kaokaoa_Mao_A_Esq_jnt_FK_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_FK_orientConstraint1.w0" "Kaokaoa_Mao_A_Esq_jnt_FK_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_FK.ro" "Kaokaoa_Braco_B_Esq_jnt_FK_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_FK.pim" "Kaokaoa_Braco_B_Esq_jnt_FK_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_FK.jo" "Kaokaoa_Braco_B_Esq_jnt_FK_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_FK.is" "Kaokaoa_Braco_B_Esq_jnt_FK_orientConstraint1.is"
		;
connectAttr "Kaokaoa_ctrl_cotovelo_esq_crv_FK.r" "Kaokaoa_Braco_B_Esq_jnt_FK_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_cotovelo_esq_crv_FK.ro" "Kaokaoa_Braco_B_Esq_jnt_FK_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_cotovelo_esq_crv_FK.pm" "Kaokaoa_Braco_B_Esq_jnt_FK_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_FK_orientConstraint1.w0" "Kaokaoa_Braco_B_Esq_jnt_FK_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_FK.ro" "Kaokaoa_Braco_A_Esq_jnt_FK_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_FK.pim" "Kaokaoa_Braco_A_Esq_jnt_FK_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_FK.jo" "Kaokaoa_Braco_A_Esq_jnt_FK_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_FK.is" "Kaokaoa_Braco_A_Esq_jnt_FK_orientConstraint1.is"
		;
connectAttr "Kaokaoa_Braco_A_esq_crv_FK.r" "Kaokaoa_Braco_A_Esq_jnt_FK_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Braco_A_esq_crv_FK.ro" "Kaokaoa_Braco_A_Esq_jnt_FK_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Braco_A_esq_crv_FK.pm" "Kaokaoa_Braco_A_Esq_jnt_FK_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Braco_A_Esq_jnt_FK_orientConstraint1.w0" "Kaokaoa_Braco_A_Esq_jnt_FK_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Ombro_Esq_jnt.s" "Kaokaoa_Braco_A_Esq_jnt_IK.is";
connectAttr "Kaokaoa_Braco_A_Esq_jnt_IK.s" "Kaokaoa_Braco_B_Esq_jnt_IK.is";
connectAttr "Kaokaoa_Mao_A_Esq_jnt_IK_orientConstraint1.crx" "Kaokaoa_Mao_A_Esq_jnt_IK.rx"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_IK_orientConstraint1.cry" "Kaokaoa_Mao_A_Esq_jnt_IK.ry"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_IK_orientConstraint1.crz" "Kaokaoa_Mao_A_Esq_jnt_IK.rz"
		;
connectAttr "Kaokaoa_Braco_B_Esq_jnt_IK.s" "Kaokaoa_Mao_A_Esq_jnt_IK.is";
connectAttr "Kaokaoa_Mao_A_Esq_jnt_IK.ro" "Kaokaoa_Mao_A_Esq_jnt_IK_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_IK.pim" "Kaokaoa_Mao_A_Esq_jnt_IK_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_IK.jo" "Kaokaoa_Mao_A_Esq_jnt_IK_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_IK.is" "Kaokaoa_Mao_A_Esq_jnt_IK_orientConstraint1.is"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK.r" "Kaokaoa_Mao_A_Esq_jnt_IK_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK.ro" "Kaokaoa_Mao_A_Esq_jnt_IK_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_pulso_esq_crv_IK.pm" "Kaokaoa_Mao_A_Esq_jnt_IK_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Mao_A_Esq_jnt_IK_orientConstraint1.w0" "Kaokaoa_Mao_A_Esq_jnt_IK_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Ombro_Esq_jnt.pim" "Kaokaoa_Ombro_Esq_jnt_pointConstraint1.cpim"
		;
connectAttr "Kaokaoa_Ombro_Esq_jnt.rp" "Kaokaoa_Ombro_Esq_jnt_pointConstraint1.crp"
		;
connectAttr "Kaokaoa_Ombro_Esq_jnt.rpt" "Kaokaoa_Ombro_Esq_jnt_pointConstraint1.crt"
		;
connectAttr "Kaokaoa_ctrl_ombro_esq_crv.t" "Kaokaoa_Ombro_Esq_jnt_pointConstraint1.tg[0].tt"
		;
connectAttr "Kaokaoa_ctrl_ombro_esq_crv.rp" "Kaokaoa_Ombro_Esq_jnt_pointConstraint1.tg[0].trp"
		;
connectAttr "Kaokaoa_ctrl_ombro_esq_crv.rpt" "Kaokaoa_Ombro_Esq_jnt_pointConstraint1.tg[0].trt"
		;
connectAttr "Kaokaoa_ctrl_ombro_esq_crv.pm" "Kaokaoa_Ombro_Esq_jnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Ombro_Esq_jnt_pointConstraint1.w0" "Kaokaoa_Ombro_Esq_jnt_pointConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Ombro_Esq_jnt.ro" "Kaokaoa_Ombro_Esq_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Ombro_Esq_jnt.pim" "Kaokaoa_Ombro_Esq_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Ombro_Esq_jnt.jo" "Kaokaoa_Ombro_Esq_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Ombro_Esq_jnt.is" "Kaokaoa_Ombro_Esq_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_ctrl_ombro_esq_crv.r" "Kaokaoa_Ombro_Esq_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_ombro_esq_crv.ro" "Kaokaoa_Ombro_Esq_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_ombro_esq_crv.pm" "Kaokaoa_Ombro_Esq_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Ombro_Esq_jnt_orientConstraint1.w0" "Kaokaoa_Ombro_Esq_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Col_D_jnt.s" "Kaokaoa_Ombro_Dir_jnt.is";
connectAttr "Kaokaoa_Ombro_Dir_jnt_pointConstraint1.ctx" "Kaokaoa_Ombro_Dir_jnt.tx"
		;
connectAttr "Kaokaoa_Ombro_Dir_jnt_pointConstraint1.cty" "Kaokaoa_Ombro_Dir_jnt.ty"
		;
connectAttr "Kaokaoa_Ombro_Dir_jnt_pointConstraint1.ctz" "Kaokaoa_Ombro_Dir_jnt.tz"
		;
connectAttr "Kaokaoa_Ombro_Dir_jnt_orientConstraint1.crx" "Kaokaoa_Ombro_Dir_jnt.rx"
		;
connectAttr "Kaokaoa_Ombro_Dir_jnt_orientConstraint1.cry" "Kaokaoa_Ombro_Dir_jnt.ry"
		;
connectAttr "Kaokaoa_Ombro_Dir_jnt_orientConstraint1.crz" "Kaokaoa_Ombro_Dir_jnt.rz"
		;
connectAttr "Kaokaoa_Ombro_Dir_jnt.s" "Kaokaoa_Braco_A_Dir_jnt.is";
connectAttr "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.crx" "Kaokaoa_Braco_A_Dir_jnt.rx"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.cry" "Kaokaoa_Braco_A_Dir_jnt.ry"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.crz" "Kaokaoa_Braco_A_Dir_jnt.rz"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt.s" "Kaokaoa_Braco_B_Dir_jnt.is";
connectAttr "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.crx" "Kaokaoa_Braco_B_Dir_jnt.rx"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.cry" "Kaokaoa_Braco_B_Dir_jnt.ry"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.crz" "Kaokaoa_Braco_B_Dir_jnt.rz"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.crx" "Kaokaoa_Mao_A_Dir_jnt.rx"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.cry" "Kaokaoa_Mao_A_Dir_jnt.ry"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.crz" "Kaokaoa_Mao_A_Dir_jnt.rz"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt.s" "Kaokaoa_Mao_A_Dir_jnt.is";
connectAttr "Kaokaoa_Mao_A_Dir_jnt.s" "Kaokaoa_Mao_B_Dir_jnt.is";
connectAttr "Kaokaoa_Mao_B_Dir_jnt.s" "Kaokaoa_Polegar_A_Dir_jnt.is";
connectAttr "Kaokaoa_Polegar_A_Dir_jnt.s" "Kaokaoa_Polegar_B_Dir_jnt.is";
connectAttr "Kaokaoa_Polegar_B_Dir_jnt.s" "Kaokaoa_Polegar_C_Dir_jnt.is";
connectAttr "Kaokaoa_Polegar_C_Dir_jnt.s" "Kaokaoa_Polegar_D_Dir_jnt_FIM.is";
connectAttr "Kaokaoa_Mao_B_Dir_jnt.s" "Kaokaoa_Indicador_A_Dir_jnt.is";
connectAttr "Kaokaoa_Indicador_A_Dir_jnt.s" "Kaokaoa_Indicador_B_Dir_jnt.is";
connectAttr "Kaokaoa_Indicador_B_Dir_jnt.s" "Kaokaoa_Indicador_C_Dir_jnt.is";
connectAttr "Kaokaoa_Indicador_C_Dir_jnt.s" "Kaokaoa_Indicador_D_Dir_jnt_FIM.is"
		;
connectAttr "Kaokaoa_Mao_B_Dir_jnt.s" "Kaokaoa_Medio_A_Dir_jnt.is";
connectAttr "Kaokaoa_Medio_A_Dir_jnt.s" "Kaokaoa_Medio_B_Dir_jnt.is";
connectAttr "Kaokaoa_Medio_B_Dir_jnt.s" "Kaokaoa_Medio_C_Dir_jnt.is";
connectAttr "Kaokaoa_Medio_C_Dir_jnt.s" "Kaokaoa_Medio_D_Dir_jnt_FIM.is";
connectAttr "Kaokaoa_Mao_B_Dir_jnt.s" "Kaokaoa_Anelar_A_Dir_jnt.is";
connectAttr "Kaokaoa_Anelar_A_Dir_jnt.s" "Kaokaoa_Anelar_B_Dir_jnt.is";
connectAttr "Kaokaoa_Anelar_B_Dir_jnt.s" "Kaokaoa_Anelar_C_Dir_jnt.is";
connectAttr "Kaokaoa_Anelar_C_Dir_jnt.s" "Kaokaoa_Anelar_D_Dir_jnt_FIM.is";
connectAttr "Kaokaoa_Mao_B_Dir_jnt.s" "Kaokaoa_Minimo_A_Dir_jnt.is";
connectAttr "Kaokaoa_Minimo_A_Dir_jnt.s" "Kaokaoa_Minimo_B_Dir_jnt.is";
connectAttr "Kaokaoa_Minimo_B_Dir_jnt.s" "Kaokaoa_Minimo_C_Dir_jnt.is";
connectAttr "Kaokaoa_Minimo_C_Dir_jnt.s" "Kaokaoa_Minimo_D_Dir_jnt_FIM.is";
connectAttr "Kaokaoa_Mao_A_Dir_jnt.ro" "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt.pim" "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt.jo" "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt.is" "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_FK.r" "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_FK.ro" "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_FK.pm" "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_FK.jo" "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.tg[0].tjo"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.w0" "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_IK.r" "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.tg[1].tr"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_IK.ro" "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.tg[1].tro"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_IK.pm" "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.tg[1].tpm"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_IK.jo" "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.tg[1].tjo"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.w1" "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.tg[1].tw"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1_Kaokaoa_Mao_A_Dir_jnt_FKW0.o" "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.w0"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1_Kaokaoa_Mao_A_Dir_jnt_IKW1.o" "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1.w1"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt.ro" "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt.pim" "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt.jo" "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt.is" "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_FK.r" "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_FK.ro" "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_FK.pm" "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_FK.jo" "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.tg[0].tjo"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.w0" "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_IK.r" "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.tg[1].tr"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_IK.ro" "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.tg[1].tro"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_IK.pm" "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.tg[1].tpm"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_IK.jo" "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.tg[1].tjo"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.w1" "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.tg[1].tw"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1_Kaokaoa_Braco_B_Dir_jnt_FKW0.o" "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.w0"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1_Kaokaoa_Braco_B_Dir_jnt_IKW1.o" "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1.w1"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt.ro" "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt.pim" "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt.jo" "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt.is" "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_FK.r" "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_FK.ro" "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_FK.pm" "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_FK.jo" "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.tg[0].tjo"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.w0" "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_IK.r" "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.tg[1].tr"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_IK.ro" "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.tg[1].tro"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_IK.pm" "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.tg[1].tpm"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_IK.jo" "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.tg[1].tjo"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.w1" "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.tg[1].tw"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1_Kaokaoa_Braco_A_Dir_jnt_FKW0.o" "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.w0"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1_Kaokaoa_Braco_A_Dir_jnt_IKW1.o" "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1.w1"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_FK_orientConstraint1.crx" "Kaokaoa_Braco_A_Dir_jnt_FK.rx"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_FK_orientConstraint1.cry" "Kaokaoa_Braco_A_Dir_jnt_FK.ry"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_FK_orientConstraint1.crz" "Kaokaoa_Braco_A_Dir_jnt_FK.rz"
		;
connectAttr "Kaokaoa_Ombro_Dir_jnt.s" "Kaokaoa_Braco_A_Dir_jnt_FK.is";
connectAttr "Kaokaoa_Braco_B_Dir_jnt_FK_orientConstraint1.crx" "Kaokaoa_Braco_B_Dir_jnt_FK.rx"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_FK_orientConstraint1.cry" "Kaokaoa_Braco_B_Dir_jnt_FK.ry"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_FK_orientConstraint1.crz" "Kaokaoa_Braco_B_Dir_jnt_FK.rz"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_FK.s" "Kaokaoa_Braco_B_Dir_jnt_FK.is";
connectAttr "Kaokaoa_Mao_A_Dir_jnt_FK_orientConstraint1.crx" "Kaokaoa_Mao_A_Dir_jnt_FK.rx"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_FK_orientConstraint1.cry" "Kaokaoa_Mao_A_Dir_jnt_FK.ry"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_FK_orientConstraint1.crz" "Kaokaoa_Mao_A_Dir_jnt_FK.rz"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_FK.s" "Kaokaoa_Mao_A_Dir_jnt_FK.is";
connectAttr "Kaokaoa_Mao_A_Dir_jnt_FK.ro" "Kaokaoa_Mao_A_Dir_jnt_FK_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_FK.pim" "Kaokaoa_Mao_A_Dir_jnt_FK_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_FK.jo" "Kaokaoa_Mao_A_Dir_jnt_FK_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_FK.is" "Kaokaoa_Mao_A_Dir_jnt_FK_orientConstraint1.is"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_FK.r" "Kaokaoa_Mao_A_Dir_jnt_FK_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_FK.ro" "Kaokaoa_Mao_A_Dir_jnt_FK_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_FK.pm" "Kaokaoa_Mao_A_Dir_jnt_FK_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_FK_orientConstraint1.w0" "Kaokaoa_Mao_A_Dir_jnt_FK_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_FK.ro" "Kaokaoa_Braco_B_Dir_jnt_FK_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_FK.pim" "Kaokaoa_Braco_B_Dir_jnt_FK_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_FK.jo" "Kaokaoa_Braco_B_Dir_jnt_FK_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_FK.is" "Kaokaoa_Braco_B_Dir_jnt_FK_orientConstraint1.is"
		;
connectAttr "Kaokaoa_ctrl_cotovelo_dir_crv_FK.r" "Kaokaoa_Braco_B_Dir_jnt_FK_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_cotovelo_dir_crv_FK.ro" "Kaokaoa_Braco_B_Dir_jnt_FK_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_cotovelo_dir_crv_FK.pm" "Kaokaoa_Braco_B_Dir_jnt_FK_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_FK_orientConstraint1.w0" "Kaokaoa_Braco_B_Dir_jnt_FK_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_FK.ro" "Kaokaoa_Braco_A_Dir_jnt_FK_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_FK.pim" "Kaokaoa_Braco_A_Dir_jnt_FK_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_FK.jo" "Kaokaoa_Braco_A_Dir_jnt_FK_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_FK.is" "Kaokaoa_Braco_A_Dir_jnt_FK_orientConstraint1.is"
		;
connectAttr "Kaokaoa_Braco_A_dir_crv_FK.r" "Kaokaoa_Braco_A_Dir_jnt_FK_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_Braco_A_dir_crv_FK.ro" "Kaokaoa_Braco_A_Dir_jnt_FK_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_Braco_A_dir_crv_FK.pm" "Kaokaoa_Braco_A_Dir_jnt_FK_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Braco_A_Dir_jnt_FK_orientConstraint1.w0" "Kaokaoa_Braco_A_Dir_jnt_FK_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Ombro_Dir_jnt.s" "Kaokaoa_Braco_A_Dir_jnt_IK.is";
connectAttr "Kaokaoa_Braco_A_Dir_jnt_IK.s" "Kaokaoa_Braco_B_Dir_jnt_IK.is";
connectAttr "Kaokaoa_Mao_A_Dir_jnt_IK_orientConstraint1.crx" "Kaokaoa_Mao_A_Dir_jnt_IK.rx"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_IK_orientConstraint1.cry" "Kaokaoa_Mao_A_Dir_jnt_IK.ry"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_IK_orientConstraint1.crz" "Kaokaoa_Mao_A_Dir_jnt_IK.rz"
		;
connectAttr "Kaokaoa_Braco_B_Dir_jnt_IK.s" "Kaokaoa_Mao_A_Dir_jnt_IK.is";
connectAttr "Kaokaoa_Mao_A_Dir_jnt_IK.ro" "Kaokaoa_Mao_A_Dir_jnt_IK_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_IK.pim" "Kaokaoa_Mao_A_Dir_jnt_IK_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_IK.jo" "Kaokaoa_Mao_A_Dir_jnt_IK_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_IK.is" "Kaokaoa_Mao_A_Dir_jnt_IK_orientConstraint1.is"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK.r" "Kaokaoa_Mao_A_Dir_jnt_IK_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK.ro" "Kaokaoa_Mao_A_Dir_jnt_IK_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_pulso_dir_crv_IK.pm" "Kaokaoa_Mao_A_Dir_jnt_IK_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Mao_A_Dir_jnt_IK_orientConstraint1.w0" "Kaokaoa_Mao_A_Dir_jnt_IK_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Ombro_Dir_jnt.pim" "Kaokaoa_Ombro_Dir_jnt_pointConstraint1.cpim"
		;
connectAttr "Kaokaoa_Ombro_Dir_jnt.rp" "Kaokaoa_Ombro_Dir_jnt_pointConstraint1.crp"
		;
connectAttr "Kaokaoa_Ombro_Dir_jnt.rpt" "Kaokaoa_Ombro_Dir_jnt_pointConstraint1.crt"
		;
connectAttr "Kaokaoa_ctrl_ombro_dir_crv.t" "Kaokaoa_Ombro_Dir_jnt_pointConstraint1.tg[0].tt"
		;
connectAttr "Kaokaoa_ctrl_ombro_dir_crv.rp" "Kaokaoa_Ombro_Dir_jnt_pointConstraint1.tg[0].trp"
		;
connectAttr "Kaokaoa_ctrl_ombro_dir_crv.rpt" "Kaokaoa_Ombro_Dir_jnt_pointConstraint1.tg[0].trt"
		;
connectAttr "Kaokaoa_ctrl_ombro_dir_crv.pm" "Kaokaoa_Ombro_Dir_jnt_pointConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Ombro_Dir_jnt_pointConstraint1.w0" "Kaokaoa_Ombro_Dir_jnt_pointConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Ombro_Dir_jnt.ro" "Kaokaoa_Ombro_Dir_jnt_orientConstraint1.cro"
		;
connectAttr "Kaokaoa_Ombro_Dir_jnt.pim" "Kaokaoa_Ombro_Dir_jnt_orientConstraint1.cpim"
		;
connectAttr "Kaokaoa_Ombro_Dir_jnt.jo" "Kaokaoa_Ombro_Dir_jnt_orientConstraint1.cjo"
		;
connectAttr "Kaokaoa_Ombro_Dir_jnt.is" "Kaokaoa_Ombro_Dir_jnt_orientConstraint1.is"
		;
connectAttr "Kaokaoa_ctrl_ombro_dir_crv.r" "Kaokaoa_Ombro_Dir_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_ombro_dir_crv.ro" "Kaokaoa_Ombro_Dir_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_ombro_dir_crv.pm" "Kaokaoa_Ombro_Dir_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Ombro_Dir_jnt_orientConstraint1.w0" "Kaokaoa_Ombro_Dir_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Col_C_jnt.ro" "Kaokaoa_Col_C_jnt_orientConstraint1.cro";
connectAttr "Kaokaoa_Col_C_jnt.pim" "Kaokaoa_Col_C_jnt_orientConstraint1.cpim";
connectAttr "Kaokaoa_Col_C_jnt.jo" "Kaokaoa_Col_C_jnt_orientConstraint1.cjo";
connectAttr "Kaokaoa_Col_C_jnt.is" "Kaokaoa_Col_C_jnt_orientConstraint1.is";
connectAttr "Kaokaoa_ctrl_peito_A_crv.r" "Kaokaoa_Col_C_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_peito_A_crv.ro" "Kaokaoa_Col_C_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_peito_A_crv.pm" "Kaokaoa_Col_C_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Col_C_jnt_orientConstraint1.w0" "Kaokaoa_Col_C_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Col_A_jnt.ro" "Kaokaoa_Col_A_jnt_orientConstraint1.cro";
connectAttr "Kaokaoa_Col_A_jnt.pim" "Kaokaoa_Col_A_jnt_orientConstraint1.cpim";
connectAttr "Kaokaoa_Col_A_jnt.jo" "Kaokaoa_Col_A_jnt_orientConstraint1.cjo";
connectAttr "Kaokaoa_Col_A_jnt.is" "Kaokaoa_Col_A_jnt_orientConstraint1.is";
connectAttr "Kaokaoa_ctrl_barriga_crv.r" "Kaokaoa_Col_A_jnt_orientConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_barriga_crv.ro" "Kaokaoa_Col_A_jnt_orientConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_barriga_crv.pm" "Kaokaoa_Col_A_jnt_orientConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Col_A_jnt_orientConstraint1.w0" "Kaokaoa_Col_A_jnt_orientConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_Root_jnt.ro" "Kaokaoa_Root_jnt_parentConstraint1.cro";
connectAttr "Kaokaoa_Root_jnt.pim" "Kaokaoa_Root_jnt_parentConstraint1.cpim";
connectAttr "Kaokaoa_Root_jnt.rp" "Kaokaoa_Root_jnt_parentConstraint1.crp";
connectAttr "Kaokaoa_Root_jnt.rpt" "Kaokaoa_Root_jnt_parentConstraint1.crt";
connectAttr "Kaokaoa_Root_jnt.jo" "Kaokaoa_Root_jnt_parentConstraint1.cjo";
connectAttr "Kaokaoa_ctrl_root_crv.t" "Kaokaoa_Root_jnt_parentConstraint1.tg[0].tt"
		;
connectAttr "Kaokaoa_ctrl_root_crv.rp" "Kaokaoa_Root_jnt_parentConstraint1.tg[0].trp"
		;
connectAttr "Kaokaoa_ctrl_root_crv.rpt" "Kaokaoa_Root_jnt_parentConstraint1.tg[0].trt"
		;
connectAttr "Kaokaoa_ctrl_root_crv.r" "Kaokaoa_Root_jnt_parentConstraint1.tg[0].tr"
		;
connectAttr "Kaokaoa_ctrl_root_crv.ro" "Kaokaoa_Root_jnt_parentConstraint1.tg[0].tro"
		;
connectAttr "Kaokaoa_ctrl_root_crv.s" "Kaokaoa_Root_jnt_parentConstraint1.tg[0].ts"
		;
connectAttr "Kaokaoa_ctrl_root_crv.pm" "Kaokaoa_Root_jnt_parentConstraint1.tg[0].tpm"
		;
connectAttr "Kaokaoa_Root_jnt_parentConstraint1.w0" "Kaokaoa_Root_jnt_parentConstraint1.tg[0].tw"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendBracoEsq" "Kaokaoa_Braco_A_esq_crv_FK_visibility.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendBracoEsq" "Kaokaoa_ctrl_cotovelo_esq_crv_IK_visibility.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendBracoDir" "Kaokaoa_Braco_A_dir_crv_FK_visibility.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendBracoDir" "Kaokaoa_ctrl_cotovelo_dir_crv_IK_visibility.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaEsq" "Kaokaoa_ctrl_perna_A_esq_crv_FK_visibility.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaDir" "Kaokaoa_ctrl_perna_A_dir_crv_FK_visibility.i"
		;
connectAttr "Kaokaoa_ctrl_olhos_crv.OlhoFilhoDeCabecaMaster" "Kaokaoa_ctrl_olhos_crv_parentConstraint1_Kaokaoa_ctrl_master_crvW0.i"
		;
connectAttr "Kaokaoa_ctrl_olhos_crv.OlhoFilhoDeCabecaMaster" "Kaokaoa_ctrl_olhos_crv_parentConstraint1_Kaokaoa_ctrl_cabeca_crvW1.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaDir" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_visibility.i"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK.ControleDobraPeDireito" "Kaokaoa_Calcanhar_Dir_grp_rotateX.i"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK.ControlePontaPeDireito" "Kaokaoa_Ponta_Pe_Dir_grp_rotateX.i"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK.TwistPontaPeDireito" "Kaokaoa_Ponta_Pe_Dir_grp_rotateY.i"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_dir_crv_IK.ControleDobraPeDireito" "Kaokaoa_Perna_Pe_A_Dir_grp_rotateX.i"
		;
connectAttr "Kaokaoa_ctrl_twist_joelho_dir_crv_IK.tx" "Kaokaoa_Perna_Dir_ikHandle_twist.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.IKPernasDirFilho" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_master_crvW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.IKPernasDirFilho" "Kaokaoa_ctrl_tornozelo_dir_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_root_crvW1.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaEsq" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_visibility.i"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK.ControleDobraPeEsquerdo" "Kaokaoa_Calcanhar_Esq_grp_rotateX.i"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK.ControlePontaPeEsquerdo" "Kaokaoa_Ponta_Pe_Esq_grp_rotateX.i"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK.TwistPontaPeEsquerdo" "Kaokaoa_Ponta_Pe_Esq_grp_rotateY.i"
		;
connectAttr "Kaokaoa_ctrl_tornozelo_esq_crv_IK.ControleDobraPeEsquerdo" "Kaokaoa_Perna_Pe_A_Esq_grp_rotateX.i"
		;
connectAttr "Kaokaoa_ctrl_twist_joelho_esq_crv_IK.tx" "Kaokaoa_Perna_Esq_ikHandle_twist.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.IKPernasEsqFilho" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_master_crvW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.IKPernasEsqFilho" "Kaokaoa_ctrl_tornozelo_esq_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_root_crvW1.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendBracoDir" "Kaokaoa_ctrl_pulso_dir_crv_IK_visibility.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.IKBracoDirFilho" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_root_crvW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.IKBracoDirFilho" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_master_crvW1.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.IKBracoDirFilho" "Kaokaoa_ctrl_pulso_dir_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_ombro_dir_crvW2.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendBracoEsq" "Kaokaoa_ctrl_pulso_esq_crv_IK_visibility.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.IKBracoEsqFilho" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_root_crvW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.IKBracoEsqFilho" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_master_crvW1.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.IKBracoEsqFilho" "Kaokaoa_ctrl_pulso_esq_crv_IK_gp_parentConstraint1_Kaokaoa_ctrl_ombro_esq_crvW2.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaDir" "Kaokaoa_Pe_Dir_C_jnt_orientConstraint1_Kaokaoa_Pe_Dir_C_jnt_IKW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaDir" "Kaokaoa_Pe_Dir_B_jnt_orientConstraint1_Kaokaoa_Pe_Dir_B_jnt_IKW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaDir" "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1_Kaokaoa_Pe_Dir_A_jnt_FKW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaDir" "Kaokaoa_Pe_Dir_A_jnt_orientConstraint1_Kaokaoa_Pe_Dir_A_jnt_IKW1.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaDir" "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1_Kaokaoa_Perna_Dir_B_jnt_FKW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaDir" "Kaokaoa_Perna_Dir_B_jnt_orientConstraint1_Kaokaoa_Perna_Dir_B_jnt_IKW1.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaDir" "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1_Kaokaoa_Perna_Dir_A_jnt1_FKW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaDir" "Kaokaoa_Perna_Dir_A_jnt_orientConstraint1_Kaokaoa_Perna_Dir_A_jnt1_IKW1.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaEsq" "Kaokaoa_Pe_Esq_C_jnt_orientConstraint1_Kaokaoa_Pe_Esq_C_jnt_IKW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaEsq" "Kaokaoa_Pe_Esq_B_jnt_orientConstraint1_Kaokaoa_Pe_Esq_B_jnt_IKW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaEsq" "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1_Kaokaoa_Pe_Esq_A_jnt_FKW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaEsq" "Kaokaoa_Pe_Esq_A_jnt_orientConstraint1_Kaokaoa_Pe_Esq_A_jnt_IKW1.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaEsq" "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1_Kaokaoa_Perna_Esq_B_jnt_FKW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaEsq" "Kaokaoa_Perna_Esq_B_jnt_orientConstraint1_Kaokaoa_Perna_Esq_B_jnt_IKW1.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaEsq" "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1_Kaokaoa_Perna_Esq_A_jnt_FKW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendPernaEsq" "Kaokaoa_Perna_Esq_A_jnt_orientConstraint1_Kaokaoa_Perna_Esq_A_jnt_IKW1.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendBracoEsq" "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1_Kaokaoa_Mao_A_Esq_jnt_FKW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendBracoEsq" "Kaokaoa_Mao_A_Esq_jnt_orientConstraint1_Kaokaoa_Mao_A_Esq_jnt_IKW1.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendBracoEsq" "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1_Kaokaoa_Braco_B_Esq_jnt_FKW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendBracoEsq" "Kaokaoa_Braco_B_Esq_jnt_orientConstraint1_Kaokaoa_Braco_B_Esq_jnt_IKW1.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendBracoEsq" "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1_Kaokaoa_Braco_A_Esq_jnt_FKW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendBracoEsq" "Kaokaoa_Braco_A_Esq_jnt_orientConstraint1_Kaokaoa_Braco_A_Esq_jnt_IKW1.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendBracoDir" "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1_Kaokaoa_Mao_A_Dir_jnt_FKW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendBracoDir" "Kaokaoa_Mao_A_Dir_jnt_orientConstraint1_Kaokaoa_Mao_A_Dir_jnt_IKW1.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendBracoDir" "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1_Kaokaoa_Braco_B_Dir_jnt_FKW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendBracoDir" "Kaokaoa_Braco_B_Dir_jnt_orientConstraint1_Kaokaoa_Braco_B_Dir_jnt_IKW1.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendBracoDir" "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1_Kaokaoa_Braco_A_Dir_jnt_FKW0.i"
		;
connectAttr "Kaokaoa_ctrl_master_crv.BlendBracoDir" "Kaokaoa_Braco_A_Dir_jnt_orientConstraint1_Kaokaoa_Braco_A_Dir_jnt_IKW1.i"
		;
connectAttr "ikSCsolver.msg" ":ikSystem.sol" -na;
connectAttr "ikRPsolver.msg" ":ikSystem.sol" -na;
// End of KaokaoaControls.ma
