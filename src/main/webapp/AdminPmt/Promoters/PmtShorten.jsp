<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<input type="text" id="longURL">
<button id="makeShortURL">단축URL생성</button>
<br>
<input type="text" id="shortURL">

<script> 	/** 	 * 단축url 키등록 	 */ 	
function load(){ 	    
	gapi.client.setApiKey('AIzaSyBWmKlMDs_ItqDp0UUtcdHpTS_xGNLGyVA ');       	    
	gapi.client.load('urlshortener','v1',function(){}); 	} 	/** 	 
	* 단축 URL생성 	 */ 	$('#makeShortURL').click(function(){ 	    
		var longURL=$('#longURL').val();     	    
		var request=gapi.client.urlshortener.url.insert({ 	        
			'resource':{ 	            
				'longUrl':longURL 	        } 	    
		}); 	   
		request.execute(function(response){ 	        
			if(response.id!=null){         	            
				console.log(response.id); 	            
				$('#shortURL').val(response.id); 	        
				}else{ 	            
					alert("error: creating short url"); 	        
					} 	    
			}); 	
		});     	
	</script>
<script src="https://apis.google.com/js/client.js?onload=load"></script>
