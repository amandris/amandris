function MM_swapImgRestore() {
	var i,x,a=document.MM_sr;
  	for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) 
  		x.src=x.oSrc;
}


function MM_preloadImages() { 
	var d=document; 
	if(d.images){ 
		if(!d.MM_p) d.MM_p=new Array();
		var i,j=d.MM_p.length,a=MM_preloadImages.arguments; 
		for(i=0; i<a.length; i++)
			if (a[i].indexOf("#")!=0){ 
				d.MM_p[j]=new Image; 
				d.MM_p[j++].src=a[i];
			}
	}
}


function MM_findObj(n, d) {
	var p,i,x;
  	if(!d) 
  		d=document;
  	if((p=n.indexOf("?"))>0&&parent.frames.length) {
		d=parent.frames[n.substring(p+1)].document; 
		n=n.substring(0,p);
	}
  	if(!(x=d[n])&&d.all) 
  		x=d.all[n];
  	for (i=0;!x&&i<d.forms.length;i++) 
  		x=d.forms[i][n];
  	for(i=0;!x&&d.layers&&i<d.layers.length;i++) 
  		x=MM_findObj(n,d.layers[i].document);
  	if(!x && d.getElementById) 
  		x=d.getElementById(n); return x;
}


function MM_swapImage() {
	var i,j=0,x,a=MM_swapImage.arguments; 
	document.MM_sr=new Array; 
	for(i=0;i<(a.length-2);i+=3)
		if ((x=MM_findObj(a[i]))!=null){
			document.MM_sr[j++]=x; 
			if(!x.oSrc) x.oSrc=x.src; 
			x.src=a[i+2];
		}
}

function showCalendar(id,url) {
	window.open(url, id ,"height=210px,width=155px,top=200px, left=200px, toolbar=no,minimize=no,status=no,memubar=no,location=no,scrollbars=no");
}

function popup(id,url,width,height) {
	window.open(url, id ,"height="+height+"px,width="+width+"px,top=200px, left=200px, toolbar=no,minimize=no,status=no,memubar=no,location=no,scrollbars=no");
}

function MoveToolTip(FromTop, FromLeft)
{
	document.getElementById( "AmandrisToolTip").style.top 	= FromTop;
	document.getElementById( "AmandrisToolTip").style.left 	= FromLeft;
}

function ReplaceContent()
{
	document.getElementById( "AmandrisToolTip").innerHTML = ContentInfo;
}

function ReplaceFixedContent( posx, posy)
{
	document.getElementById( "AmandrisFixedToolTip").innerHTML = ContentInfo;
	document.getElementById( "AmandrisFixedToolTip").style.top 	= posy;
	document.getElementById( "AmandrisFixedToolTip").style.left	= posx;
}
 
function Activate()
{
	initialize=1;
}

function deActivate()
{
	initialize=0;
}

function FixedActivate()
{
	fixedInitialize=1;
}

function FixedDeActivate()
{
	fixedInitialize=0;
}
 
function overhere( e)
{
	if ( navigator.appName == "Microsoft Internet Explorer") {
		Ex = event.clientX + document.body.scrollLeft; 
		Ey = event.clientY + document.body.scrollTop;
	} else {
		Ex = e.pageX + document.body.scrollLeft; 
		Ey = e.pageY + document.body.scrollTop;
	}
	
	if( typeof( window.innerWidth ) == 'number' ) {
		//Non-IE
		Width = window.innerWidth;
	    Height = window.innerHeight;
	} else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
	    //IE 6+ in 'standards compliant mode'
		Width = document.documentElement.clientWidth;
	    Height = document.documentElement.clientHeight;
	} else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
		//IE 4 compatible
	    Width = document.body.clientWidth;
		Height = document.body.clientHeight;
	}
	
	if( (Ey - document.body.scrollTop) > ( Height / 2)) {
		underMouse = 0;
	} else {
		underMouse = 1;
	}
	
	
	if( (Ex - document.body.scrollLeft) > ( Width / 2)) {
		rightMouse = 0;
	} else {
		rightMouse = 1;
	}
	
	/*
	if( underMouse == 0){
		Ey = Ey - document.getElementById( "AmandrisToolTip").clientHeight;
	}
	
	if( rightMouse == 0){
		Ex = Ex - document.getElementById( "AmandrisToolTip").clientWidth;
	}
	*/

	if( initialize){
		MoveToolTip(Ey,Ex);
		document.getElementById( "AmandrisToolTip").style.visibility = 'visible';
	} else {
		MoveToolTip( 0,0);
		document.getElementById( "AmandrisToolTip").style.visibility = 'hidden';
	}
	
	if( fixedInitialize){
		document.getElementById( "AmandrisFixedToolTip").style.visibility = 'visible';
	} else {
		document.getElementById( "AmandrisFixedToolTip").style.visibility = 'hidden';
	}
}

 
function EnterHelpContent( title, content){
	ContentInfo = '<table border="0" width="240" cellspacing="0" cellpadding="0">'+
	'<tr><td width="100%" bgcolor="#000000">'+
 	'<table border="0" width="100%" cellspacing="1" cellpadding="0">'+
	'<tr><td width="100%" bgcolor=' + topColor + '>'+
 	'<table border="0" width="90%" cellspacing="0" cellpadding="0" align="center">'+
	'<tr><td width="100%" align="center">'+
 	'<font class="toolTipHeader">&nbsp;' + title + '</font>'+
 	'</td></tr>'+
	'</table>'+
 	'</td></tr>'+
 	'<tr><td width="100%" bgcolor='+subColor+'>'+
 	'<table border="0" width="90%" cellpadding="1" cellspacing="1" align="center">'+
 	'<tr><td width="100%" style="text-align:justify;">'+
 	'<font class="toolTip">' + content + '</font>'+
 	'</td></tr>'+
	'</table>'+
 	'</td></tr>'+
	'</table>'+
 	'</td></tr>'+
	'</table>';
	ReplaceContent();
}

function EnterFixedHelpContent( title, content, posx, posy){
	ContentInfo = '<table border="0" width="240" cellspacing="0" cellpadding="0">'+
	'<tr><td width="100%" bgcolor="#000000">'+
 	'<table border="0" width="100%" cellspacing="1" cellpadding="0">'+
	'<tr><td width="100%" bgcolor=' + topColor + '>'+
 	'<table border="0" width="90%" cellspacing="0" cellpadding="0" align="center">'+
	'<tr><td width="100%" align="center">'+
 	'<font class="toolTipHeader">&nbsp;' + title + '</font>'+
 	'</td></tr>'+
	'</table>'+
 	'</td></tr>'+
 	'<tr><td width="100%" bgcolor='+subColor+'>'+
 	'<table border="0" width="90%" cellpadding="1" cellspacing="1" align="center">'+
 	'<tr><td width="100%" style="text-align:justify;">'+
 	'<font class="toolTip">' + content + '</font>'+
 	'</td></tr>'+
	'</table>'+
 	'</td></tr>'+
	'</table>'+
 	'</td></tr>'+
	'</table>';
	
	if( typeof( window.innerWidth ) == 'number' ) {
		Width = window.innerWidth;
	    Height = window.innerHeight;
	} else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
		Width = document.documentElement.clientWidth;
	    Height = document.documentElement.clientHeight;
	} else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
	    Width = document.body.clientWidth;
		Height = document.body.clientHeight;
	}
	
	if( Width > 800){
		posx = posx + (( Width /2) - 400);
	}
	
	ReplaceFixedContent( posx, posy);
}



 
 



