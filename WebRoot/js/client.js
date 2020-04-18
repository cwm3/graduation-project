$(document).ready(function(){	//娑擄拷绱戞慨瀣鏉炶姤鏌熷▔锟�
	var highlightindex = -1;///妤傛ü瀵掗弰鍓с仛閻ㄥ嫬褰夐柌蹇擄拷(0-n) 閸掓繂顫�1閸楄櫕妫ゆ禒璁崇秿 鐎涙亯iv 鐞氼偊锟芥稉锟�
	var timeout;///閺堝秴濮熼崳銊ゆ唉娴滄帒娆㈡潻锟�
	var wordInput = $("#word"); //鏉堟挸鍙嗗鍡氬Ν閻愶拷
	var wordInputOffset = wordInput.offset(); //閼惧嘲褰囨潏鎾冲弳濡楀棛娈戠仦鐐达拷閸戣姤鏆�
	var autoNode = $("#auto");//閸掓繂顫愰惃鍒焨to div閼哄倻鍋�

	autoNode.hide();//闂呮劘妫�
	autoNode.css("position","absolute"); //閻╃顕禍搴″従閺堬拷甯存潻鎴犳畱娑擄拷閲滈張锟芥箒鐎规矮缍呯拋鍓х枂閻ㄥ嫮鍩楃�纭呰杽閿涘澋ordInput閿涘绻樼悰宀�卜鐎电懓鐣炬担锟�
	autoNode.css("z-index","99");//婢跺嫪绨い璺虹湴
	autoNode.css("cursor","default");//姒х姵鐖ｉ弽宄扮础
	autoNode.css("filter","alpha(opacity=50");//闁繑妲戞惔锟�
	autoNode.css("text-overflow","clip");//閸愬懎顔愭潻鍥ь樋閺冩湹绗夐弰鍓с仛閻胶鏆愰弽鍥唶(...)閿涘矁锟介弰顖滅暆閸楁洜娈戠憗浣稿瀼 
	autoNode.css("border","1px black solid");//鏉堣顢�
	autoNode.css("background-color","#e5f1f4");
	autoNode.css("top",wordInputOffset.top+wordInput.height()+4+"px");//鐠佸墽鐤嗘锟芥禒顧痚8 娴ｆ粈璐熼弽鍥у櫙
	autoNode.css("left",wordInputOffset.left-2+"px").width(wordInput.width()+5);//鐠佸墽鐤嗗锕佺珶娑撳骸顔�
	//瑜版挷濞囬悽銊ュ煂妞ゅ湱娲版稉顓ㄧ礉娴兼艾褰傞悳鏉胯剨閸戠儤顢嬮惃鍕剹閺咁垵澹婇弰顖烇拷閺勫海娈戦敍宀勬付鐟曚浇绻栭柌宀冾啎缂冾喕绔存稉锟�
	//autoNode.css("background-color","red");		//鐠佸墽鐤嗗鐟板毉濡楀棛娈戦懗灞炬珯閼癸拷
							    		
	wordInput.blur(function()	///婢跺崬骞撻悞锔惧仯閺冩湹绺鹃崣锟�
   	{
		setTimeout(function() //瀵よ埖妞�00濮ｎ偆顫楁禒銉ょ┒ 姒х姵鐖ｉ惃鍕仯閸戣绨ㄦ禒鎯板厴閹笛嗩攽
		{
			 autoNode.hide();
			 highlightindex = -1;
		},200);
	});	
		
	wordInput.keyup(function(event)//闁款喚娲忛幐澶夌瑓
	{
		var myEvent = event || window.event; 	//娑撳秴鎮撳ù蹇氼潔閸ｃ劑锟芥稉宥呮倱娴滃娆�
	    var keyCode = myEvent.keyCode;//闁款喚娲忛幐澶夌瑓閻拷閸婏拷
	    	
	    if(keyCode>=48&&keyCode<=57||keyCode >= 65 && keyCode <= 90 || keyCode==8 || keyCode ==46||keyCode==13||keyCode==32)//閺勵垵瀚抽弬锟介幋鏍拷閺嶅吋鍨ㄩ崚鐘绘珟闁款噣鍏樻潻娑楃瑢閺堝秴濮熼崳銊ゆ唉娴滐拷
	    {
	    	var textInput = wordInput.val();//閼惧嘲褰囨潏鎾冲弳濡楀棛娈戦崐锟�
	    	if(textInput != "" ) //鏉堟挸鍙嗘稉宥勮礋缁岋拷
	    	{
	    		clearTimeout(timeout);//濞撳懐鈹栭崜宥勭濞嗭紕娈戦崐鎺撴殶閺冨爼妫�
	    		timeout = setTimeout(function(){ //瀵ゆ儼绻滄稉搴㈡箛閸斺�娅掓禍銈勭鞍閺冨爼妫块幓鎰扮彯閺佸牏宸�
	    			$.post("servlet/ClentInputServlet",{text:textInput},function(data) //娑撳孩婀囬崝鈥虫珤娴溿倓绨�闁插洨鏁ml鏉╂柨娲栭弽鐓庣础
	    			{
			    		var jqueryObj = $(data);//閼惧嘲褰囨潻鏂挎礀閸婅壈濡悙锟�
			    		var wordNodes = jqueryObj.find("word"); //閹垫儳鍩屾潻鏂挎礀閻ㄥ嫭澧嶉張澧刴l-word閼哄倻鍋�<word>...</word> 閼哄倻鍋ｉ崣顖濆殰瀹稿崬婀張宥呭缁旑垰鐣炬稊锟�
		    			autoNode.html("");//濞撳懐鈹栭崘鍛啇闂冨弶顒沝iv闁插矂娼伴柌宥咁槻
		
		    			wordNodes.each(function(i)//闁秴宸婚幍锟芥箒閻ㄥ墜ord閼哄倻鍋�閸欐﹢鍣篿娴狅拷0-n
		    			{
			    			var wordNode = $(this);//閼惧嘲褰囪ぐ鎾冲閻ㄥ墜ord閼哄倻鍋�
			    			var NewNode = $("<div>").attr("id",i);//閺傛澘缂撴稉锟介嚋div閼哄倻鍋�楠炲墎绮版禒顧痙鐏炵偞锟芥稉鏃傜搼娴滃穼閸婏拷
				    			
			    			NewNode.html(wordNode.text()).appendTo(autoNode);//閹跺ord閼哄倻鍋ｉ惃鍕敶鐎圭绁寸紒妾噄v閼哄倻鍋�楠炶埖濡竏iv鏉╄棄濮為崚甯礄閻╃缍嬫禍搴″敶鐎硅褰冮崗銉礆 autoNode閼哄倻鍋ｉ惃鍒v
				   
				    		NewNode.hover(//姒х姵鐖ｆ禍瀣╂
					    		function()//姒х姵鐖ｇ粔璇插煂
					    		{
					    			if(highlightindex !=-1)
					    			{	//姒х姵鐖ｉ柨顔炬磸娑擄拷鎹ｉ悽銊︽闂冨弶顒涢崥灞炬妤傛ü瀵�
					    				autoNode.children().eq(highlightindex).css("background-color","white");
					    			}
					    				highlightindex = $(this).attr("id"); //閹跺タd閸婅壈绁寸紒妾媔ghlightindex
					    				$(this).css("background-color","gray");
					    		},
					    		function(){//姒х姵鐖ｇ粔鏄忚泲
					    			$(this).css("background-color","white");				  
						    	}
					    	);
					    	NewNode.click(function()//閻愮懓鍤Η鐘崇垼閺冿拷
					    	{
					    		var clickNode = $(this); //閼惧嘲褰囪ぐ鎾冲姒х姵鐖ｉ懞鍌滃仯
					    		wordInput.val(clickNode.text());//鐠у锟界紒娆掔翻閸忋儲顢�
					    		autoNode.hide();
					    		highlightindex =-1;
								//....濮濄倕顦╅崣顖欎簰閺�墽鍋ｉ崙濠氱炊閺嶅洭锟界�姘躲�閺冩儼袝閸欐垹娈戦崙鑺ユ殶
					    	});
			    		});
				    	if(wordNodes.length>0) //閺堝绻戦崶鐐诧拷閹靛秵妯夌粈锟�
			    		{
			    			autoNode.show();
			    		}
			    		else//鏉╂柨娲栨稉铏光敄闂呮劘妫�
			    		{
			    			autoNode.hide();
			    		}
	    			},"xml");//.post闁插瞼娈戦弬瑙勭《缂佹挻娼�
				},500);//瀵よ埖妞傞弬瑙勭《缂佹挻娼�
			}
		    else//鏉堟挸鍙嗘稉铏光敄闂呮劘妫宒iv閼哄倻鍋utoNode 娑撳秳绗岄張宥呭閸ｃ劋姘︽禍锟�
		    {
		    	autoNode.hide();
				highlightindex = -1;
			}
		}
		else if(keyCode ==38 || keyCode ==40)
		{
			var autoNodes = autoNode.children();//閼惧嘲褰嘺utoNodes div娑撳娈戦幍锟芥箒鐎涙劘濡悙锟�
			if(keyCode == 38)//閸氭垳绗�
			{
				if(highlightindex != -1)//娑撳秳璐�1 閸樼喐娼甸張澶庡Ν閻愮顫﹂柅澶夎厬
				{
					autoNodes.eq(highlightindex).css("background-color","white");//閺�懓褰夐崢鐔告降閼冲本娅欓懝锟介惂鍊熷
					highlightindex--; //閸戝繋绔�閸氭垳绗傜粔璇插煂
				}
				
				if(highlightindex == -1){ //娑擄拷1 閸楀啿甯弶銉ワ拷娑擄拷閸掍即銆婄粩顖欑啊
					highlightindex = autoNodes.length - 1;//閻╁瓨甯撮幎濠傚綁闁插繑鏁兼稉鐑樻付閸氬簼绔存稉锟�濞夈劍鍓伴梹鍨length閺勶拷-n閿涘矁锟絟ighlightindex 0-n閿涳拷
				}
				autoNodes.eq(highlightindex).css("background-color","gray");//閺�懓褰夐弬浼达拷娑擃厾娈慸iv閼冲本娅欓懝锟介拑婵婂
				wordInput.val(autoNodes.eq(highlightindex).text()); //閻╁瓨甯寸挧瀣拷缂佹瑨绶崗銉︻攱
			}
			if(keyCode == 40)//閸氭垳绗�
			{
				if(highlightindex!=-1)//娑撳秳璐�1 閸樼喐娼甸張澶庡Ν閻愮顫﹂柅澶夎厬
				{
					autoNodes.eq(highlightindex).css("background-color","white");//閺�懓褰夐崢鐔告降闁鑵慸iv閼冲本娅欓懝锟�
					highlightindex++; //閸旓拷 閸楀啿鎮滄稉瀣╅崝锟�
				}
			
				if(highlightindex==-1)//娑擄拷1閸欏﹤褰查崝锟�
	    			{
	    				highlightindex++;
	    			}
	  
	    			 if(highlightindex == autoNodes.length)//閸旓拷閸氬海鐡戞禍锟界�鎭塱v閼哄倻鍋ｉ梹鍨閸掓媽鎻惔鏇狀伂  
				{
					highlightindex = 0;//閹跺﹪銆婄粩顖氾拷鐠у绮癶ighlightindex
				}
				
				autoNodes.eq(highlightindex).css("background-color","gray"); //閺�懓褰夐懗灞炬珯閼癸拷
				wordInput.val(autoNodes.eq(highlightindex).text()); //閻╁瓨甯寸挧瀣拷缂佹瑨绶崗銉︻攱
			}
		}
		else if(keyCode==13)//閸ョ偠婧�
		{
			autoNode.hide();//闂呮劘妫宒iv
			highlightindex = -1;//妤傛ü瀵掗崣姗�櫤閹垹顦叉妯款吇閸婏拷
			//....................//閸欘垯缍旈幓鎰唉閹垮秳缍�
	  	}
	});
});
