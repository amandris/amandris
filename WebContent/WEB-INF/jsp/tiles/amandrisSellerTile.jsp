<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-tiles.tld' prefix='tiles' %>

<html:html locale="true">
	<head>
		<title><bean:message key="common.amandris"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="stylesheet" href="css/amandris.css" type="text/css">
		<link rel="alternate" type="application/x-cooliris-quick" href="http://www.amandris.com/cooliris-quick.xml" />
		<script language="javascript" src="javascript/javaScriptCode.js" type="text/javascript"></script>
	</head>
	<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<div id="AmandrisToolTip" style="position:absolute;filter:alpha(opacity=85);opacity: 0.85;-moz-opacity:0.85;"></div>
	<div id="AmandrisFixedToolTip" style="position:absolute;"></div>
	<script language = "javascript">
		if (navigator.appName != "Microsoft Internet Explorer"){
			document.captureEvents(Event.MOUSEMOVE);
		}
	
		document.onmousemove = overhere; 
		var Ex = 0;
		var Ey = 0;
		var initialize = 0;
		var fixedInitialize = 0;
		var underMouse = 0;
		var rightMouse = 0;
		var topColor, subColor, ContentInfo;
		topColor = "#883469";
		subColor = "#E1AACB";
	</script>	
		<table width="768" border="0" cellpadding="0" cellspacing="0" align="center" valign="top">
			<tr>
				<td background="pictures/pageLeftBorder.gif" width="24">&nbsp;</td>
				<td width="720">
					<table align="center" cellpadding="0" cellspacing="0" border="0" >
						<tr>
							<td>
								<tiles:get name='logoTile'/>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="2" border="0" >
									<tr>
										<td>
											<logic:present name="sellerSession">
												<tiles:get name='sellerMenuTile'/>
											</logic:present>
											<logic:present name="buyerSession">
												<tiles:get name='buyerMenuTile'/>
											</logic:present>
										</td>
									</tr>
								</table>
							</td>
						</tr>		
						<tr><td height="3"></td></tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="2" border="0" >
									<tr>
										<td>
											<tiles:get name="body"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>	
						<logic:notPresent name="buyerSession">
							<logic:notPresent name="sellerSession">
								<tr><td height="5"></td></tr>
								<tr>
									<td align="center">
										<table width="700" cellpadding="0" cellspacing="0" border="0" >
											<tiles:get name='footer1Tile'/>
										</table>
									</td>
								</tr>
							</logic:notPresent>
						</logic:notPresent>
						<tr><td height="5"></td></tr>
						<tr>
							<td align="center">
								<tiles:get name='footer2Tile'/>								
							</td>
						</tr>
						<tr><td height="5"></td></tr>
						<tr>
							<td align="center">
								<tiles:get name='footer3Tile'/>
							</td>
						</tr>
					</table>
				</td>
				<td background="pictures/pageRightBorder.gif" width="22">&nbsp;</td>
			</tr>
		</table>
		<script src="https://ssl.google-analytics.com/urchin.js" type="text/javascript">
		</script>
		<script type="text/javascript">
		_uacct = "UA-2846764-1";
		urchinTracker();
		</script>
	</body>
</html:html>