<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri='/WEB-INF/amandris.tld' prefix='amandris' %>
<%@ page import="com.amandris.clients.web.view.SellerViewSmall, java.util.ArrayList, java.util.Collection, java.util.Locale, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, javax.servlet.http.HttpSession, org.apache.struts.action.ActionForm, org.apache.struts.action.ActionForward, org.apache.struts.action.ActionMapping, com.amandris.clients.service.facade.PromotionFacade, com.amandris.clients.service.facade.UtilFacade, com.amandris.clients.util.Constant, com.amandris.clients.web.util.CountryState" %>


<%
		HttpSession 	session2 		= request.getSession();
		PromotionFacade	promotionFacade = new PromotionFacade();
		UtilFacade		utilFacade		= UtilFacade.getInstance();
		Locale			locale			= request.getLocale();
		CountryState 	countryState	= new CountryState();
		Collection		collection		= null;
		
		collection = promotionFacade.getShowInIndexSellerRandomSellection( locale);
		
		countryState = ( CountryState) session.getAttribute( Constant.COUNTRY_STATE_OBJECT_NAME);
		
		if( countryState == null) {
			countryState = utilFacade.getCountryState( false, locale);
			countryState.setLocale( locale);
			if( locale != null) {
				countryState.setSelectedCountry	( new Integer( 70));
				countryState.setSelectedState( new Integer( 0));
			}
		}
		
		session2.setAttribute( Constant.COUNTRY_STATE_OBJECT_NAME, countryState);
		request.setAttribute( Constant.SHOW_IN_INDEX_SELLER_OBJECT_NAME, collection);

%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><bean:message key="common.amandris"/></title>
<link href="css/reset.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/main.css" rel="stylesheet" type="text/css" media="all" />
<link rel="alternate" type="application/x-cooliris-quick" href="http://www.amandris.com/cooliris-quick.xml" />
<!--[if IE]>
<link href="css/iefix.css" rel="stylesheet" type="text/css" media="all" />
<![endif]-->
<script type="text/javascript" src="js/jquery-1.2.3.min.js"></script> 
<script type="text/javascript" src="js/jquery.pngFix.js"></script>
<script type="text/javascript" src="js/dom.js"></script> 
<script type="text/javascript" src="javascript/javaScriptCode.js" ></script>
</head>
<body>
<div id="bodyheader"></div>
<div id="wrapper">
    <div id="girl_left"></div>
    <div id="container">
    	<div id="header">
        	<div id="logo_amandris"><img src="img/logo_amandris.png" alt="Amandris" /><h1 class="hide"><bean:message key="common.amandris"/></h1></div>
        </div>
        <div id="content">
        	<div id="botonera_acceso">
            	<div class="col_izda">
                	<h2 class="hide"><bean:message key="indexBuyerLogin.text"/></h2>
                    <a href="showLoginBuyer.do" title="<bean:message key="indexBuyerLogin.access"/>" id="banner_demandantes"><span class="hide"><bean:message key="indexBuyerLogin.access"/></span></a>
                </div>
                <div class="col_dcha">
                	<h2 class="hide"><bean:message key="indexSellerLogin.text"/></h2>
                    <a href="showLoginSeller.do" title="<bean:message key="indexSellerLogin.access"/>" id="banner_ofertantes"><span class="hide"><bean:message key="indexSellerLogin.access"/></span></a>
                </div>
            </div>
            <div id="paneles">
            	<div class="col_izda panel_izda">
                	<h3 id="tit_sistemadecitas"><span class="hide"><bean:message key="indexBuyer.text1"/></span></h3>
                    <p class="white" id="lit_panelizda"><strong><bean:message key="indexBuyer.smallText1"/></strong><br /><bean:message key="indexBuyer.smallText2"/></p>
                    <form action="showBuyerSellerCollection.do" id="search">
                    	<fieldset>
                            <p><bean:message key="indexBuyer.text2"/></p>
                            <label>
                            	<span class="labelwidth"><bean:message key="indexBuyer.iAm"/></span>
                            	<select name="mySex">
									<option VALUE="2" selected><bean:message key="sex.2"/></option>
									<option VALUE="1"><bean:message key="sex.1"/></option>
									<option VALUE="4"><bean:message key="sex.4"/></option>
									<option VALUE="8"><bean:message key="sex.8"/></option>
									<option VALUE="16"><bean:message key="sex.16"/></option>
									<option VALUE="32"><bean:message key="sex.32"/></option>
									<option VALUE="64"><bean:message key="sex.64"/></option>
								</select>
                            </label>
                            <label>
                            	<span class="labelwidth"><bean:message key="indexBuyer.searching"/></span>
                            	<select name="sex" class="form">
									<option VALUE="2"><bean:message key="sex.2"/></option>
									<option VALUE="1" selected><bean:message key="sex.1"/></option>
									<option VALUE="4"><bean:message key="sex.4"/></option>
									<option VALUE="8"><bean:message key="sex.8"/></option>
									<option VALUE="16"><bean:message key="sex.16"/></option>
									<option VALUE="32"><bean:message key="sex.32"/></option>
									<option VALUE="64"><bean:message key="sex.64"/></option>
								</select>
                            </label>
                            
                            <amandris:indexCountryStateTag 	name="countryState" 
															countryKey="indexBuyer.country" 
															stateKey="indexBuyer.state"
															inHome="true"/>
                            <label>
                            	<span class="labelwidth"><bean:message key="indexBuyer.between"/></span>
                            	<input type="text" name="ageLow"><span class="floatleft labelfont"><bean:message key="indexBuyer.and"/></span><input type="text" name="ageHigh"><span class="floatleft labelfont"><bean:message key="indexBuyer.years"/></span></label>
                            	<html:hidden property="itemsPerPage" value="8"/>
                            <button onclick="form.submit();"><span class="hide">Buscar</span></button>
                      </fieldset>
                    </form>
                    <ul class="steps">
                    	<li><bean:message key="indexBuyer.step1"/></li>
                        <li><bean:message key="indexBuyer.step2"/></li>
                        <li><bean:message key="indexBuyer.step3"/></li>
                    </ul>
              	</div>
          		<div class="col_dcha panel_dcha">
                	<h3 id="tit_hazloquemastegusta"><span class="hide"><bean:message key="indexSeller.text1"/></span></h3>
                    <p class="blue" id="lit_paneldcha01"><bean:message key="indexSeller.smallText1"/></p>
                    <p class="lightblue" id="lit_paneldcha02"><bean:message key="indexSeller.text2"/></p>
                    <p class="blue" id="lit_paneldcha03"><strong><bean:message key="indexSeller.smallText2"/></strong></p>
                    <ul class="steps">
                    	<li><bean:message key="indexSeller.step1"/></li>
                        <li><bean:message key="indexSeller.step2"/></li>
                        <li><bean:message key="indexSeller.step3"/></li>
                    </ul>
              	</div>
          	</div>
            <div id="botonera_registro">
            	<div class="col_izda">
                	<a href="javascript:popup('buyerDemo','flash/buyerDemo.html','640','480')" title="Ver demostración" class="verdemo_pink"><span class="hide"><bean:message key="indexBuyer.seeDemo"/></span></a>
                    <a href="showNewBuyerOne.do" title="Regístrate ahora como demandante" class="registratedemandante"><span class="hide"><bean:message key="indexBuyer.register"/></span></a>
                </div>
                <div class="col_dcha">
                	<a href="javascript:popup('sellerDemo','flash/sellerDemo.html','640','480')" title="Ver demostración" class="verdemo_blue"><span class="hide"><bean:message key="indexSeller.seeDemo"/></span></a>
                    <a href="showNewSellerPrevious.do" title="Regístrate ahora como ofertante" class="registrateofertante"><span class="hide"><bean:message key="indexSeller.register"/></span></a>
                </div>
            </div>
          	<div id="destacados">
            	<h3 id="tit_ofertantesdestacados"><span class="hide"><bean:message key="indexMainUser.text"/></span></h3>
                <div class="row">

                	<% 	
                		for(int i = 0; i< collection.size(); i ++){
                			SellerViewSmall item = (SellerViewSmall) ((ArrayList)collection).get( i);		
                	%>
                		<% if( (i + 1) == collection.size()){  %>
	                		<div class="destacado_last">
	                	<%} else{ %>
	                		<div class="destacado">
	                	<%} %>
	                    	<a href="showSeller.do?id=<%=item.getId() %>" title="<%=item.getBriefLogin() %>">
	                    		<% if( item.getHasPicture().equals( "1")){ %>
					  				<img src="/media/pictures/smaller/seller_<%=item.getId() %>_<%=item.getMainPicture() %>_<%=item.getMainPictureCode() %>.jpg"/>
					  			<%} else {
									if( item.getSexId().equals( "1")){
					  			%>
						  			<img src="pictures/defaultGirl.gif"/>
						  		<%} else if( item.getSexId().equals( "2")){%>
						  				<img src="pictures/defaultBoy.gif"/>
						  		<%} else if( item.getSexId().equals( "4")){%>
						  				<img src="pictures/defaultShemale.gif"/>
						  		<%} else if( item.getSexId().equals( "8")){%>
						  				<img src="pictures/defaultBoysCouple.gif"/>
						  		<%} else if( item.getSexId().equals( "16")){%>
						  				<img src="pictures/defaultGirlsCouple.gif"/>
						  		<%} else if( item.getSexId().equals( "32")){%>
						  				<img src="pictures/defaultBoyAndGirlCouple.gif"/>
						  		<%} else if( item.getSexId().equals( "64")){%>
						  				<img src="pictures/defaultGroup.gif"/>
					  			<%}
								}%>
	                    	</a>
	                        <p>
	                        	<a href="showSeller.do?id=<%=item.getId()%>" title="<%=item.getBriefLogin() %>"><%=item.getBriefLogin()%></a><br />
	                        	<%=item.getSex()%>, <%=item.getAge()%><br />
	                        	<%=item.getBriefCity()%><br />
	                        	<%=item.getState()%><br />
	                        	<%=item.getCountry()%>
	                        </p>
	                    </div>
	               <%} %>
                </div>
                <a href="showAllMainSeller.do" title="<bean:message key="indexMainUser.seeAll"/>" id="btn_verofertantes"><span class="hide"><bean:message key="indexMainUser.seeAll"/></span></a>
            </div>
        </div>
        <div id="bottom">
        	<ul id="helpmenu">
            	<li><a href="showWhatIsAmandris.do" title="<bean:message key="footer1.whatIsAmandris"/>"><bean:message key="footer1.whatIsAmandris"/></a></li>
                <li><a href="showFaq.do" title="<bean:message key="footer1.faq"/>"><bean:message key="footer1.faq"/></a></li>
                <li><a href="showNewBuyerOne.do" title="<bean:message key="footer1.registerAsBuyer"/>"><bean:message key="footer1.registerAsBuyer"/></a></li>
                <li><a href="showNewSellerPrevious.do" title="<bean:message key="footer1.registerAsSeller"/>"><bean:message key="footer1.registerAsSeller"/></a></li>
            </ul>
            <ul id="legalmenu">
            	<li><a href="showUserTerms.do" title="<bean:message key="footer2.terms"/>"><bean:message key="footer2.terms"/></a></li>
                <li><a href="showAmandrisMessage.do" title=<bean:message key="footer2.contact"/>"><bean:message key="footer2.contact"/></a></li>
                <li><a href="showPrivacyPolicy.do" title="<bean:message key="footer2.privacy"/>"><bean:message key="footer2.privacy"/></a></li>
                <li class="padleft30"><strong><bean:message key="footer3.copyright"/></strong></li>
            </ul>
        </div>
    </div>
    <div id="girl_right"></div>
</div>
<div id="reflection"></div>
<script src="https://ssl.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-2846764-1";
urchinTracker();
</script>
</body>
</html:html>