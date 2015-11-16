 var ie=document.all
    var dom=document.getElementById
    var ns4=document.layers
    var bouncelimit=32 //(must be divisible by 8)
    var direction="up"
    function initbox(){
    	if (!dom&&!ie&&!ns4)
    	return
    	crossobj=(dom)?document.getElementById("dropin").style : ie? document.all.dropin : document.dropin
    	scroll_top=(ie)? document.body.scrollTop : window.pageYOffset
    	crossobj.top=scroll_top-10
    	crossobj.visibility=(dom||ie)? "visible" : "show"
    	dropstart=setInterval("dropin()",0)
    }
 
 function initbox1(){
 	if (!dom&&!ie&&!ns4)
 	return
 	crossobj=(dom)?document.getElementById("dropin1").style : ie? document.all.dropin : document.dropin
 	scroll_top=(ie)? document.body.scrollTop : window.pageYOffset
 	crossobj.top=scroll_top-10
 	crossobj.visibility=(dom||ie)? "visible" : "show"
 	dropstart=setInterval("dropin()",0)
 }
    
    function dropin(){
    	scroll_top=(ie)? document.body.scrollTop : window.pageYOffset
    	if (parseInt(crossobj.top)<100+scroll_top)
    		crossobj.top=parseInt(crossobj.top)+40
    	else{
    		clearInterval(dropstart)
    		bouncestart=setInterval("bouncein()",0)
    	}
    }
    
    function dismissbox(){
    	if (window.bouncestart)
			clearInterval(bouncestart)
    		crossobj.visibility="hidden"
    	}

    function dropornot(){
    	if (get_cookie("droppedin")==""){
    		window.onload=initbox
    		document.cookie="droppedin=yes"
    	}
    }
    dropornot()
    
    function redo(){
    	bouncelimit=32
    	direction="up"
    	initbox()
    }
    window.onload=initbox
    function redo1(){
    	bouncelimit=32
    	direction="up"
    	initbox1()
    }
    window.onload=initbox1
    