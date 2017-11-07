<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri='/WEB-INF/amandris.tld' prefix='amandris' %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meat name="keywords" content="amandris,escort,escorts,chica,chicas,sex,sexo"/>
<title><bean:message key="common.amandris"/> - Escort <bean:write name="seller" property="login"/></title>
<link href="css/reset.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/main.css" rel="stylesheet" type="text/css" media="all" />
<link rel="alternate" type="application/x-cooliris-quick" href="http://www.amandris.com/cooliris-quick.xml" />
<!--[if IE]>
<link href="css/iefix.css" rel="stylesheet" type="text/css" media="all" />
<![endif]-->
<link href="css/fichapremium.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery-1.2.3.min.js"></script>
<script type="text/javascript" src="js/jquery.pngFix.js"></script>
<script type="text/javascript" src="js/dom.js"></script>
<script language="javascript" type="text/javascript">
	function goto(v){
		document.location.href="showSellerProfilePictures.do?id=<bean:write name="seller" property="id"/>&picture=" + v;
	}
	function showPicture( p, v){
		var bigPicture = document.getElementById('bigPicture');
		var str = '<img src="' + p + '" alt="Foto grande" width="285" style="cursor:pointer;cursor:hand;" onclick="goto(' + v + ');"/>'; 
		bigPicture.innerHTML = str; 
	}
</script>
</head>
<body>
<div id="bodyheader"></div>
<div id="wrapper">
  <div id="girl_left"></div>
  <div id="container">
    <div id="header">
      <div id="logo_amandris">
      	<a href="/" border="0">
      		<img src="img/logo_amandris.png" alt="Amandris"  />
      	</a>
        <h1 class="hide">Amandris</h1>
      </div>
    </div>
    <div id="content">
      <div id="bg_pink">
    
        <h2 class="lightPink">Perfil destacado: <span class="white"><bean:write name="seller" property="login"/></span></h2>
        <div class="col_izda">
        <div class="white_box" id="box_foto">
        <div class="white_box_top"><h3 id="tit_fotos"><span class="hide">Fotos</span></h3></div>
         <div class="white_box_body" id="bigPicture" style="text-align:center;">
         	<logic:equal name="seller" property="hasPicture" value="1">
	         	<img src="/media/pictures/original/<bean:write name="profilePictures" property="picture1FileName"/>" alt="Foto grande" width="285" style="cursor:pointer;cursor:hand;" onclick="document.location.href='showSellerProfilePictures.do?id=<bean:write name="seller" property="id"/>&picture=1';"/>
	        </logic:equal>
	        <logic:notEqual name="seller" property="hasPicture" value="1">
  				<logic:equal name="seller" property="sexId" value="1">
	  				<img src="pictures/defaultGirl.gif"/>
	  			</logic:equal>
  				<logic:equal name="seller" property="sexId" value="2">
	  				<img src="pictures/defaultBoy.gif"/>
	  			</logic:equal>
  				<logic:equal name="seller" property="sexId" value="4">
	  				<img src="pictures/defaultShemale.gif"/>
	  			</logic:equal>
  				<logic:equal name="seller" property="sexId" value="8">
	  				<img src="pictures/defaultBoysCouple.gif"/>
	  			</logic:equal>
  				<logic:equal name="seller" property="sexId" value="16">
	  				<img src="pictures/defaultGirlsCouple.gif"/>
	  			</logic:equal>
  				<logic:equal name="seller" property="sexId" value="32">
	  				<img src="pictures/defaultBoyAndGirlCouple.gif"/>
	  			</logic:equal>
  				<logic:equal name="seller" property="sexId" value="64">
	  				<img src="pictures/defaultGroup.gif"/>
	  			</logic:equal>
  			</logic:notEqual>
         </div>
        <div class="white_box_bottom"></div>
        </div>
        <div class="transparent_box">
	        <ul class="thumbs_list">
	        	<logic:greaterEqual name="profilePictures" property="picturesCount" value="1">
			        <li>
			        	<a href="javascript:showPicture('/media/pictures/original/<bean:write name="profilePictures" property="picture1FileName"/>', '1');" title="thumb1">
			        		<img src="/media/pictures/smaller/<bean:write name="profilePictures" property="picture1FileName"/>" alt="thumb1" width=54"/>
			        	</a>
			        </li>
			    </logic:greaterEqual>
			    <logic:greaterEqual name="profilePictures" property="picturesCount" value="2">
			        <li>
			        	<a href="javascript:showPicture('/media/pictures/original/<bean:write name="profilePictures" property="picture2FileName"/>', '2');" title="thumb2">
			        		<img src="/media/pictures/smaller/<bean:write name="profilePictures" property="picture2FileName"/>" alt="thumb2" width=54"/>
			        	</a>
			        </li>
			    </logic:greaterEqual>
			    <logic:greaterEqual name="profilePictures" property="picturesCount" value="3">
			        <li>
			        	<a href="javascript:showPicture('/media/pictures/original/<bean:write name="profilePictures" property="picture3FileName"/>', '3');" title="thumb3">
			        		<img src="/media/pictures/smaller/<bean:write name="profilePictures" property="picture3FileName"/>" alt="thumb3" width=54"/>
			        	</a>
			        </li>
			    </logic:greaterEqual>
			    <logic:greaterEqual name="profilePictures" property="picturesCount" value="4">
			        <li>
			        	<a href="javascript:showPicture('/media/pictures/original/<bean:write name="profilePictures" property="picture4FileName"/>', '4');" title="thumb4">
			        		<img src="/media/pictures/smaller/<bean:write name="profilePictures" property="picture4FileName"/>" alt="thumb4" width=54"/>
			        	</a>
			        </li>
			    </logic:greaterEqual>
			    <logic:greaterEqual name="profilePictures" property="picturesCount" value="5">
			        <li>
			        	<a href="javascript:showPicture('/media/pictures/original/<bean:write name="profilePictures" property="picture5FileName"/>', '5');" title="thumb5">
			        		<img src="/media/pictures/smaller/<bean:write name="profilePictures" property="picture5FileName"/>" alt="thumb5" width=54"/>
			        	</a>
			        </li>
			    </logic:greaterEqual>
	        </ul>
        </div>
        <div class="white_box" id="box_contacto">
        <div class="white_box_top">
          <h3 id="tit_contacto"><span class="hide">Contacto</span></h3>
          </div>
          <div class="white_box_body">
          <dl>
          	<logic:equal name="seller" property="allowPhoneCall" value="1">
            	<dt id="label_telf"><span class="hide">Teléfono:</span></dt>
            	<dd><bean:write name="seller" property="phoneNumberCall"/></dd>
            </logic:equal>
            <logic:equal name="seller" property="allowEmail" value="1">
            	<dt id="label_mail"><span class="hide">Email:</span></dt>
            	<dd><bean:write name="seller" property="email"/></dd>
            </logic:equal>
            <logic:equal name="seller" property="allowUrl" value="1">
            	<dt id="label_url"><span class="hide">URL:</span></dt>
            	<dd><span style="font-size:11px"><a href="<bean:write name="seller" property="url"/>">Escort <bean:write name="seller" property="city"/> <bean:write name="seller" property="login"/></a></span></dd>
            </logic:equal>
          </dl>
          </div>
       <div class="white_box_bottom"></div>
        </div>
        </div>
        <div class="col_dcha">
        <div class="white_box" id="box_perfil">
        <div class="white_box_top">
          <h3 id="tit_perfil"><span class="hide">Perfil</span></h3></div>
           <div class="white_box_body">
          <dl>
            <dt>Nombre</dt>
            <dd><span class="pink"><strong><bean:write name="seller" property="login"/></strong></span></dd>
            <dt><bean:message key="showSeller.age"/></dt>
            <dd><bean:write name="seller" property="age"/> años</dd>
            <dt><bean:message key="showSeller.country"/></dt>
            <dd><bean:write name="seller" property="country"/></dd>
            <dt><bean:message key="showSeller.state"/></dt>
            <dd><bean:write name="seller" property="state"/></dd>
            <dt><bean:message key="showSeller.city"/></dt>
            <dd><bean:write name="seller" property="city"/></dd>
          </dl>
          <logic:notPresent name="sellerSession">
		      <logic:present name="buyerSession">
					<a href="showBuyerStartContact.do?id=<bean:write name="seller" property="id"/>" title="Pedir cita" id="bt_pedircita">
						<span class="hide">Pedir cita</span>
					</a>
			   </logic:present>
			   <logic:notPresent name="buyerSession">
			   		<a href="showNeedToRegister.do" title="Pedir cita" id="bt_pedircita">
						<span class="hide">Pedir cita</span>
					</a>
			   </logic:notPresent>
		  </logic:notPresent>
          
          </div> 
          <div class="white_box_bottom"></div>
        </div>
         <div class="white_box"  id="box_descripcion">
        <div class="white_box_top">
          <h3 id="tit_descripcion"><span class="hide">Descripción</span></h3></div>
           <div class="white_box_body">
          <h4><bean:write name="seller" property="intro"/></h4>
          <p><bean:write name="seller" property="text"/></p>
          <dl>
          	<logic:notEqual name="seller" property="origin" value="">
	            <dt><bean:message key="showSeller.origin"/>:</dt>
	            <dd><bean:write name="seller" property="origin"/></dd>
            </logic:notEqual>
			<logic:notEqual name="seller" property="language" value="">
	            <dt><bean:message key="showSeller.language"/>:</dt>
	            <dd><bean:write name="seller" property="language"/></dd>
	        </logic:notEqual>														
			<logic:notEqual name="seller" property="orientation" value="">   
	            <dt><bean:message key="showSeller.orientation"/>:</dt>
	            <dd><bean:write name="seller" property="orientation"/></dd>
	        </logic:notEqual>														
			<logic:notEqual name="seller" property="height" value="">    
	            <dt><bean:message key="showSeller.height"/>:</dt>
	            <dd><bean:write name="seller" property="height"/></dd>
	        </logic:notEqual>														
			<logic:notEqual name="seller" property="skinColor" value="">   
	            <dt><bean:message key="showSeller.skinColor"/>:</dt>
	            <dd><bean:write name="seller" property="skinColor"/></dd>
	        </logic:notEqual>														
			<logic:notEqual name="seller" property="hairColor" value="">   
	            <dt><bean:message key="showSeller.hairColor"/>:</dt>
	            <dd><bean:write name="seller" property="hairColor"/></dd>
	        </logic:notEqual>																		
			<logic:notEqual name="seller" property="hairLength" value="">  
	            <dt><bean:message key="showSeller.hairLength"/>:</dt>
	            <dd><bean:write name="seller" property="hairLength"/></dd>
	        </logic:notEqual>																		
			<logic:notEqual name="seller" property="eyeColor" value="">   
	            <dt><bean:message key="showSeller.eyeColor"/>:</dt>
	            <dd><bean:write name="seller" property="eyeColor"/></dd>
	        </logic:notEqual>																		
			<logic:notEqual name="seller" property="physique" value="">   
	            <dt><bean:message key="showSeller.physique"/>:</dt>
	            <dd><bean:write name="seller" property="physique"/></dd>
	        </logic:notEqual>																		
			<logic:notEqual name="seller" property="breastSize" value="">  
	            <dt><bean:message key="showSeller.breastSize"/>:</dt>
	            <dd><bean:write name="seller" property="breastSize"/></dd>
	        </logic:notEqual>				
	        <bean:write name="seller" property="pennisSize" /> 													
			<logic:notEqual name="seller" property="pennisSize" value=""> 
	            <dt><bean:message key="showSeller.pennisSize"/>:</dt>
	            <dd><bean:write name="seller" property="pennisSize"/></dd>
	        </logic:notEqual>																		
			<logic:notEqual name="seller" property="educationLevel" value="">  
	            <dt><bean:message key="showSeller.educationLevel"/>:</dt>
	            <dd><bean:write name="seller" property="educationLevel"/></dd>
	        </logic:notEqual>																		
			<logic:notEqual name="seller" property="smoker" value="">  
	            <dt><bean:message key="showSeller.smoker"/>:</dt>
	            <dd><bean:write name="seller" property="smoker"/></dd>
            </logic:notEqual>		
          </dl>
          </div>
         <div class="white_box_bottom"></div>
        </div>
       </div>
       <div class="cleared"></div>
        <div class="white_box"  id="box_precios">
        <div class="white_box_top">
          <h3 id="tit_precios"><span class="hide">Precios</span></h3>
          </div>
           <div class="white_box_body">
          <table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <th scope="col">Tipo de cita</th>
              <th scope="col">Precio</th>
              <th scope="col">Con...</th>
            </tr>
            <bean:define id="companyWithoutSexService" name="sellerService" property="companyWithoutSexService"/>
            <bean:define id="companyWithSexService" name="sellerService" property="companyWithSexService"/>
            <bean:define id="sexService" name="sellerService" property="sexService"/>
            <bean:define id="eroticShowService" name="sellerService" property="eroticShowService"/>
            <tr>
              <td class="vheader"><bean:message key="showSeller.companyWithoutSex"/></td>
              <td>
              	<logic:notEqual name="sellerService" property="companyWithoutSexPrice" value="">
              		<logic:equal name="sellerService" property="companyWithoutSexIsToAsk" value="1">
              			<span class="darkGreen">
              				<strong>
              					<bean:message key="showSeller.toAsk"/>
              				</strong>
						</span>
					</logic:equal>
					<logic:equal name="sellerService" property="companyWithoutSexIsToAsk" value="0">
						<logic:equal name="sellerService" property="companyWithoutSexIsFree" value="1">
							<span class="darkGreen">
	              				<strong>
	              					<bean:message key="showSeller.free"/>
	              				</strong>
							</span>
						</logic:equal>
						<logic:equal name="sellerService" property="companyWithoutSexIsFree" value="0">
							<strong><bean:write name="sellerService" property="companyWithoutSexPrice"/></strong>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSeller.firstHour"/><br/>
							<strong><bean:write name="sellerService" property="companyWithoutSexAdditionalHoursPrice"/></strong>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSeller.additionalHours"/>
						</logic:equal>		
					</logic:equal>										
				</logic:notEqual>
				<logic:equal name="sellerService" property="companyWithoutSexPrice" value="">
					<bean:message key="showSeller.notAllowed"/>
				</logic:equal>
			  </td>
              <td>
              		<logic:equal name="companyWithoutSexService" property="sex1" value="true">
              			<img src="img/iconos/chica.gif" alt="<bean:message key="sex.1"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="companyWithoutSexService" property="sex2" value="true">
              			<img src="img/iconos/chico.gif" alt="<bean:message key="sex.2"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="companyWithoutSexService" property="sex4" value="true">
              			<img src="img/iconos/bisex.gif" alt="<bean:message key="sex.4"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="companyWithoutSexService" property="sex8" value="true">
              			<img src="img/iconos/gay.gif" alt="<bean:message key="sex.8"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="companyWithoutSexService" property="sex16" value="true">
              			<img src="img/iconos/lesb.gif" alt="<bean:message key="sex.16"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="companyWithoutSexService" property="sex32" value="true">
              			<img src="img/iconos/hetero.gif" alt="<bean:message key="sex.32"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="companyWithoutSexService" property="sex64" value="true">
              			<img src="img/iconos/trio.gif" alt="<bean:message key="sex.64"/>" width="36" height="36" />
              		</logic:equal>
            </tr>
            <tr>
              	<td class="vheader"><bean:message key="showSeller.companyWithSex"/></td>
              	<td>
              		<logic:notEqual name="sellerService" property="companyWithSexPrice" value="">
              			<logic:equal name="sellerService" property="companyWithSexIsToAsk" value="1">
	              			<span class="darkGreen">
	              				<strong>
	              					<bean:message key="showSeller.toAsk"/>
	              				</strong>
							</span>
						</logic:equal>
						<logic:equal name="sellerService" property="companyWithSexIsToAsk" value="0">
							<logic:equal name="sellerService" property="companyWithSexIsFree" value="1">
								<span class="darkGreen">
		              				<strong>
		              					<bean:message key="showSeller.free"/>
		              				</strong>
								</span>
							</logic:equal>
						
							<logic:equal name="sellerService" property="companyWithSexIsFree" value="0">
								<strong><bean:write name="sellerService" property="companyWithSexPrice"/></strong>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSeller.firstHour"/><br/>
								<strong><bean:write name="sellerService" property="companyWithSexAdditionalHoursPrice"/></strong>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSeller.additionalHours"/>
							</logic:equal>
						</logic:equal>												
					</logic:notEqual>
					<logic:equal name="sellerService" property="companyWithSexPrice" value="">
						<bean:message key="showSeller.notAllowed"/>
					</logic:equal>
                </td>
              	<td>
              		<logic:equal name="companyWithSexService" property="sex1" value="true">
              			<img src="img/iconos/chica.gif" alt="<bean:message key="sex.1"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="companyWithSexService" property="sex2" value="true">
              			<img src="img/iconos/chico.gif" alt="<bean:message key="sex.2"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="companyWithSexService" property="sex4" value="true">
              			<img src="img/iconos/bisex.gif" alt="<bean:message key="sex.4"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="companyWithSexService" property="sex8" value="true">
              			<img src="img/iconos/gay.gif" alt="<bean:message key="sex.8"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="companyWithSexService" property="sex16" value="true">
              			<img src="img/iconos/lesb.gif" alt="<bean:message key="sex.16"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="companyWithSexService" property="sex32" value="true">
              			<img src="img/iconos/hetero.gif" alt="<bean:message key="sex.32"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="companyWithSexService" property="sex64" value="true">
              			<img src="img/iconos/trio.gif" alt="<bean:message key="sex.64"/>" width="36" height="36" />
              		</logic:equal>
              	</td>
            </tr>
            <tr>
              <td class="vheader"><bean:message key="showSeller.sex"/></td>
              <td>
              	<logic:notEqual name="sellerService" property="sexPrice" value="">
              		<logic:equal name="sellerService" property="sexIsToAsk" value="1">
              			<span class="darkGreen">
              				<strong>
              					<bean:message key="showSeller.toAsk"/>
              				</strong>
						</span>
					</logic:equal>
					<logic:equal name="sellerService" property="sexIsToAsk" value="0">
						<logic:equal name="sellerService" property="sexIsFree" value="1">
							<span class="darkGreen">
	              				<strong>
	              					<bean:message key="showSeller.free"/>
	              				</strong>
							</span>
						</logic:equal>
						<logic:equal name="sellerService" property="sexIsFree" value="0">
							<strong><bean:write name="sellerService" property="sexPrice"/></strong>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSeller.firstHour"/><br/>
							<strong><bean:write name="sellerService" property="sexAdditionalHoursPrice"/></strong>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSeller.additionalHours"/>
						</logic:equal>	
					</logic:equal>											
				</logic:notEqual>
				<logic:equal name="sellerService" property="sexPrice" value="">
					<bean:message key="showSeller.notAllowed"/>
				</logic:equal>
              </td>
              <td>
              		<logic:equal name="sexService" property="sex1" value="true">
              			<img src="img/iconos/chica.gif" alt="<bean:message key="sex.1"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="sexService" property="sex2" value="true">
              			<img src="img/iconos/chico.gif" alt="<bean:message key="sex.2"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="sexService" property="sex4" value="true">
              			<img src="img/iconos/bisex.gif" alt="<bean:message key="sex.4"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="sexService" property="sex8" value="true">
              			<img src="img/iconos/gay.gif" alt="<bean:message key="sex.8"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="sexService" property="sex16" value="true">
              			<img src="img/iconos/lesb.gif" alt="<bean:message key="sex.16"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="sexService" property="sex32" value="true">
              			<img src="img/iconos/hetero.gif" alt="<bean:message key="sex.32"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="sexService" property="sex64" value="true">
              			<img src="img/iconos/trio.gif" alt="<bean:message key="sex.64"/>" width="36" height="36" />
              		</logic:equal>
              </td>
            </tr>
            <tr>
              <td class="vheader"><bean:message key="showSeller.eroticShow"/></td>
              <td>
				<logic:notEqual name="sellerService" property="eroticShowPrice" value="">
				
					<logic:equal name="sellerService" property="eroticShowIsToAsk" value="1">
              			<span class="darkGreen">
              				<strong>
              					<bean:message key="showSeller.toAsk"/>
              				</strong>
						</span>
					</logic:equal>
					<logic:equal name="sellerService" property="eroticShowIsToAsk" value="0">
						<logic:equal name="sellerService" property="eroticShowIsFree" value="1">
							<span style="color:#00AA00;"><b><bean:message key="showSeller.free"/><b></span>
						</logic:equal>
						<logic:equal name="sellerService" property="eroticShowIsFree" value="0">
							<b><bean:write name="sellerService" property="eroticShowPrice"/></b>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSeller.firstHour"/><br>
							<b><bean:write name="sellerService" property="eroticShowAdditionalHoursPrice"/></b>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSeller.additionalHours"/>
						</logic:equal>		
					</logic:equal>										
				</logic:notEqual>
				<logic:equal name="sellerService" property="eroticShowPrice" value="">
					<bean:message key="showSeller.notAllowed"/>
				</logic:equal>
			  </td>
              <td>
              		<logic:equal name="eroticShowService" property="sex1" value="true">
              			<img src="img/iconos/chica.gif" alt="<bean:message key="sex.1"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="eroticShowService" property="sex2" value="true">
              			<img src="img/iconos/chico.gif" alt="<bean:message key="sex.2"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="eroticShowService" property="sex4" value="true">
              			<img src="img/iconos/bisex.gif" alt="<bean:message key="sex.4"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="eroticShowService" property="sex8" value="true">
              			<img src="img/iconos/gay.gif" alt="<bean:message key="sex.8"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="eroticShowService" property="sex16" value="true">
              			<img src="img/iconos/lesb.gif" alt="<bean:message key="sex.16"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="eroticShowService" property="sex32" value="true">
              			<img src="img/iconos/hetero.gif" alt="<bean:message key="sex.32"/>" width="36" height="36" />
              		</logic:equal>
              		<logic:equal name="eroticShowService" property="sex64" value="true">
              			<img src="img/iconos/trio.gif" alt="<bean:message key="sex.64"/>" width="36" height="36" />
              		</logic:equal>
              </td>
            </tr>
          </table>
          </div>
          <div class="white_box_bottom"></div>
        </div>
      </div>
      <div id="bottom_bg_pink"></div>
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
</body>
</html:html>
