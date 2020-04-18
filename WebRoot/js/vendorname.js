$(document).ready(function(){	
	var highlightindex = -1;
	var timeout;
	var wordInput = $("#vendorname");
	
	var wordInputOffset = wordInput.offset(); 
	
	var autoNode = $("#vendornameauto");

	autoNode.hide();
	autoNode.css("position","absolute");
	autoNode.css("z-index","99");
	autoNode.css("cursor","default");
	autoNode.css("filter","alpha(opacity=50");
	autoNode.css("text-overflow","clip");
	autoNode.css("border","1px black solid");
	autoNode.css("background-color","#e5f1f4");
	autoNode.css("top",wordInputOffset.top+wordInput.height()+4+"px");
	autoNode.css("left",wordInputOffset.left-2+"px").width(wordInput.width()+5);
	//autoNode.css("background-color","red");
							    		
	wordInput.blur(function()	
   	{
		setTimeout(function()
		{
			 autoNode.hide();
			 highlightindex = -1;
		},200);
	});	
		
	wordInput.keyup(function(event)
	{
		var myEvent = event || window.event; 	
	    var keyCode = myEvent.keyCode;
	    	
	    if(keyCode>=48&&keyCode<=57||keyCode >= 65 && keyCode <= 90 || keyCode==8 || keyCode ==46||keyCode==13||keyCode==32)//鏄嫳鏂�鎴栭�鏍兼垨鍒犻櫎閿兘杩涗笌鏈嶅姟鍣ㄤ氦浜�
	    {
	    	var textInput = wordInput.val()+",vendorname";
	    	
	    	if(textInput != "" ) 
	    	{
	    		clearTimeout(timeout);
	    		timeout = setTimeout(function(){
	    			$.post("servlet/VendorNameServlet",{text:textInput},function(data) 
	    			{
			    		var jqueryObj = $(data);
			    		var wordNodes = jqueryObj.find("vendorname");
		    			autoNode.html("");
		
		    			wordNodes.each(function(i)
		    			{
			    			var wordNode = $(this);
			    			var NewNode = $("<div>").attr("id",i);
				    			
			    			NewNode.html(wordNode.text()).appendTo(autoNode);
				   
				    		NewNode.hover(
					    		function()
					    		{
					    			if(highlightindex !=-1)
					    			{	
					    				autoNode.children().eq(highlightindex).css("background-color","white");
					    			}
					    				highlightindex = $(this).attr("id");
					    				$(this).css("background-color","gray");
					    		},
					    		function(){
					    			$(this).css("background-color","white");				  
						    	}
					    	);
					    	NewNode.click(function()
					    	{
					    		var clickNode = $(this);
					    		wordInput.val(clickNode.text());
					    		autoNode.hide();
					    		highlightindex =-1;
					    	});
			    		});
				    	if(wordNodes.length>0)
			    		{
			    			autoNode.show();
			    		}
			    		else
			    		{
			    			autoNode.hide();
			    		}
	    			},"xml");
				},500);
			}
		    else
		    {
		    	autoNode.hide();
				highlightindex = -1;
			}
		}
		else if(keyCode ==38 || keyCode ==40)
		{
			var autoNodes = autoNode.children();
			if(keyCode == 38)
			{
				if(highlightindex != -1)
				{
					autoNodes.eq(highlightindex).css("background-color","white");
					highlightindex--;
				}
				
				if(highlightindex == -1){ 
					highlightindex = autoNodes.length - 1;
				}
				autoNodes.eq(highlightindex).css("background-color","gray");
				wordInput.val(autoNodes.eq(highlightindex).text());
			}
			if(keyCode == 40)
			{
				if(highlightindex!=-1)
				{
					autoNodes.eq(highlightindex).css("background-color","white");
					highlightindex++; 
				}
			
				if(highlightindex==-1)
	    			{
	    				highlightindex++;
	    			}
	  
	    			 if(highlightindex == autoNodes.length)  
				{
					highlightindex = 0;
				}
				
				autoNodes.eq(highlightindex).css("background-color","gray");
				wordInput.val(autoNodes.eq(highlightindex).text()); 
			}
		}
		else if(keyCode==13)
		{
			autoNode.hide();
			highlightindex = -1;
	  	}
	});
});
