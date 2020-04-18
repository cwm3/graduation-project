$(document).ready(function(){	//涓�紑濮嬪姞杞芥柟娉�
	var highlightindex = -1;///楂樹寒鏄剧ず鐨勫彉閲忓�(0-n) 鍒濆-1鍗虫棤浠讳綍 瀛恉iv 琚�涓�
	var timeout;///鏈嶅姟鍣ㄤ氦浜掑欢杩�
	var wordInput = $("#word"); //杈撳叆妗嗚妭鐐�
	var resource = $("#resource"); //杈撳叆妗嗚妭鐐�
	var wordInputOffset = wordInput.offset(); //鑾峰彇杈撳叆妗嗙殑灞炴�鍑芥暟
	var autoNode = $("#auto");//鍒濆鐨刟uto div鑺傜偣

/*	autoNode.hide();//闅愯棌
	autoNode.css("position","absolute"); //鐩稿浜庡叾鏈�帴杩戠殑涓�釜鏈�湁瀹氫綅璁剧疆鐨勭埗瀵硅薄锛坵ordInput锛夎繘琛岀粷瀵瑰畾浣�
	autoNode.css("z-index","99");//澶勪簬椤跺眰
	autoNode.css("cursor","default");//榧犳爣鏍峰紡
	autoNode.css("filter","alpha(opacity=10");//閫忔槑搴�
	autoNode.css("text-overflow","clip");//鍐呭杩囧鏃朵笉鏄剧ず鐪佺暐鏍囪(...)锛岃�鏄畝鍗曠殑瑁佸垏 
	autoNode.css("border","1px black solid");//杈规
	autoNode.css("background-color","#e5f1f4");
	autoNode.css("top",wordInputOffset.top+wordInput.height()+4+"px");//璁剧疆楂�浠e8 浣滀负鏍囧噯
	autoNode.css("left",wordInputOffset.left-2+"px").width(wordInput.width()+5);//璁剧疆宸﹁竟涓庡
	
	autoNode.hide();
	autoNode.css("position","absolute");
	autoNode.css("z-index","99");
	autoNode.css("cursor","default");
	autoNode.css("filter","alpha(opacity=10");
	autoNode.css("text-overflow","clip");
	autoNode.css("border","1px black solid");
	autoNode.css("background-color","#e5f1f4");
	autoNode.css("top",wordInputOffset.top+wordInput.height()+4+"px");
	autoNode.css("left",wordInputOffset.left-2+"px").width(wordInput.width()+5);
*/	//褰撲娇鐢ㄥ埌椤圭洰涓紝浼氬彂鐜板脊鍑烘鐨勮儗鏅壊鏄�鏄庣殑锛岄渶瑕佽繖閲岃缃竴涓�
	//autoNode.css("background-color","red");		//璁剧疆寮瑰嚭妗嗙殑鑳屾櫙鑹�
	
	autoNode.hide();
	autoNode.css("position","absolute");
	autoNode.css("z-index","99");
	autoNode.css("cursor","default");
	autoNode.css("filter","alpha(opacity=50");
	autoNode.css("text-overflow","clip");
	autoNode.css("border","1px black solid");
	autoNode.css("background-color","red");
	autoNode.css("color","black");

	autoNode.css("top",wordInputOffset.top+wordInput.height()+4+"px");
	autoNode.css("left",wordInputOffset.left-2+"px").width(wordInput.width()+5);
						    		
	wordInput.blur(function()	///澶卞幓鐒︾偣鏃朵績鍙�
   	{
		setTimeout(function() //寤舵椂200姣浠ヤ究 榧犳爣鐨勭偣鍑讳簨浠惰兘鎵ц
		{
			 autoNode.hide();
			 highlightindex = -1;
		},200);
	});	
		
	wordInput.keyup(function(event)//閿洏鎸変笅
	{
		var myEvent = event || window.event; 	//涓嶅悓娴忚鍣ㄩ�涓嶅悓浜嬩欢
	    var keyCode = myEvent.keyCode;//閿洏鎸変笅鐨�鍊�
	    	
	    if(keyCode>=48&&keyCode<=57||keyCode >= 65 && keyCode <= 90 || keyCode==8 || keyCode ==46||keyCode==13||keyCode==32)//鏄嫳鏂�鎴栭�鏍兼垨鍒犻櫎閿兘杩涗笌鏈嶅姟鍣ㄤ氦浜�
	    {
	    	var textInput = wordInput.val()+",vendorname";//鑾峰彇杈撳叆妗嗙殑鍊�
	    	
	    	if(textInput != "" ) //杈撳叆涓嶄负绌�
	    	{
	    		clearTimeout(timeout);//娓呯┖鍓嶄竴娆＄殑鍊掓暟鏃堕棿
	    		timeout = setTimeout(function(){ //寤惰繜涓庢湇鍔″櫒浜や簰鏃堕棿鎻愰珮鏁堢巼
	    			$.post("servlet/InputServlet",{text:textInput},function(data) //涓庢湇鍔″櫒浜や簰 閲囩敤xml杩斿洖鏍煎紡
	    			{
			    		var jqueryObj = $(data);//鑾峰彇杩斿洖鍊艰妭鐐�
			    		var wordNodes = jqueryObj.find("word"); //鎵惧埌杩斿洖鐨勬墍鏈墄ml-word鑺傜偣 <word>...</word> 鑺傜偣鍙嚜宸卞湪鏈嶅姟绔畾涔�
		    			autoNode.html("");//娓呯┖鍐呭闃叉div閲岄潰閲嶅
		
		    			wordNodes.each(function(i)//閬嶅巻鎵�湁鐨剋ord鑺傜偣 鍙橀噺i浠�0-n
		    			{
			    			var wordNode = $(this);//鑾峰彇褰撳墠鐨剋ord鑺傜偣 
			    			var NewNode = $("<div>").attr("id",i);//鏂板缓涓�釜div鑺傜偣 骞剁粰浠d灞炴�涓旂瓑浜巌鍊�
				    			
			    			NewNode.html(wordNode.text()).appendTo(autoNode);//鎶妛ord鑺傜偣鐨勫唴瀹硅祴缁檇iv鑺傜偣 骞舵妸div杩藉姞鍒帮紙鐩稿綋浜庡唴瀹规彃鍏ワ級 autoNode鑺傜偣鐨刣iv
				   
				    		NewNode.hover(//榧犳爣浜嬩欢
					    		function()//榧犳爣绉诲埌
					    		{
					    			if(highlightindex !=-1)
					    			{	//榧犳爣閿洏涓�捣鐢ㄦ椂闃叉鍚屾椂楂樹寒
					    				autoNode.children().eq(highlightindex).css("background-color","#e5f1f4");
					    			}
					    				highlightindex = $(this).attr("id"); //鎶奿d鍊艰祴缁檋ighlightindex
					    				$(this).css("background-color","gray");
					    		},
					    		function(){//榧犳爣绉昏蛋
					    			$(this).css("background-color","#e5f1f4");				  
						    	}
					    	);
					    	NewNode.click(function()//鐐瑰嚮榧犳爣鏃�
					    	{
					    		var clickNode = $(this); //鑾峰彇褰撳墠榧犳爣鑺傜偣
					    		wordInput.val(clickNode.text());//璧嬪�缁欒緭鍏ユ
					    		autoNode.hide();
					    		highlightindex =-1;
								//....姝ゅ鍙互鏀剧偣鍑婚紶鏍囬�瀹氶」鏃惰Е鍙戠殑鍑芥暟
					    	});
			    		});
				    	if(wordNodes.length>0) //鏈夎繑鍥炲�鎵嶆樉绀�
			    		{
			    			autoNode.show();
			    		}
			    		else//杩斿洖涓虹┖闅愯棌
			    		{
			    			autoNode.hide();
			    		}
	    			},"xml");//.post閲岀殑鏂规硶缁撴潫
				},500);//寤舵椂鏂规硶缁撴潫
			}
		    else//杈撳叆涓虹┖闅愯棌div鑺傜偣autoNode 涓嶄笌鏈嶅姟鍣ㄤ氦浜�
		    {
		    	autoNode.hide();
				highlightindex = -1;
			}
		}
		else if(keyCode ==38 || keyCode ==40)
		{
			var autoNodes = autoNode.children();//鑾峰彇autoNodes div涓嬬殑鎵�湁瀛愯妭鐐�
			if(keyCode == 38)//鍚戜笂
			{
				if(highlightindex != -1)//涓嶄负-1 鍘熸潵鏈夎妭鐐硅閫変腑
				{
					autoNodes.eq(highlightindex).css("background-color","#e5f1f4");//鏀瑰彉鍘熸潵鑳屾櫙鑹�鐧借壊
					highlightindex--; //鍑忎竴 鍚戜笂绉诲埌
				}
				
				if(highlightindex == -1){ //涓�1 鍗冲師鏉ュ�涓�鍒伴《绔簡
					highlightindex = autoNodes.length - 1;//鐩存帴鎶婂彉閲忔敼涓烘渶鍚庝竴涓�(娉ㄦ剰闀垮害length鏄�-n锛岃�highlightindex 0-n锛�
				}
				autoNodes.eq(highlightindex).css("background-color","gray");//鏀瑰彉鏂伴�涓殑div鑳屾櫙鑹�钃濊壊
				wordInput.val(autoNodes.eq(highlightindex).text()); //鐩存帴璧嬪�缁欒緭鍏ユ
			}
			if(keyCode == 40)//鍚戜笅
			{
				if(highlightindex!=-1)//涓嶄负-1 鍘熸潵鏈夎妭鐐硅閫変腑
				{
					autoNodes.eq(highlightindex).css("background-color","#e5f1f4");//鏀瑰彉鍘熸潵閫変腑div鑳屾櫙鑹�
					highlightindex++; //鍔� 鍗冲悜涓嬬Щ鍔�
				}
			
				if(highlightindex==-1)//涓�1鍙婂彲鍔�
	    			{
	    				highlightindex++;
	    			}
	  
	    			 if(highlightindex == autoNodes.length)//鍔�鍚庣瓑浜�瀛恉iv鑺傜偣闀垮害鍒拌揪搴曠  
				{
					highlightindex = 0;//鎶婇《绔�璧嬬粰highlightindex
				}
				
				autoNodes.eq(highlightindex).css("background-color","gray"); //鏀瑰彉鑳屾櫙鑹�
				wordInput.val(autoNodes.eq(highlightindex).text()); //鐩存帴璧嬪�缁欒緭鍏ユ
			}
		}
		else if(keyCode==13)//鍥炶溅
		{
			autoNode.hide();//闅愯棌div
			highlightindex = -1;//楂樹寒鍙橀噺鎭㈠榛樿鍊�
			//....................//鍙綔鎻愪氦鎿嶄綔	
	  	}
	});
});
