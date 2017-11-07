<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-tiles.tld' prefix='tiles' %>

<html:html locale="true">
	<head>
		<title><bean:message key="common.amandris"/></title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="stylesheet" href="css/amandris.css" type="text/css">
		<script language="javascript" src="javascript/javaScriptCode.js" type="text/javascript"></script>
	</head>
	<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
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
								<table cellpadding="2" cellspacing="0" border="0" >
									<tr>
										<td>
											<tiles:get name='indexBuyerLoginTile'/>
										</td>
										<td>
											<tiles:get name='indexSellerLoginTile'/>
										</td>
									</tr>
								</table>
							</td>
						</tr>		
						
						<tr>
							<td>
								<table cellpadding="0" cellspacing="2" border="0" >
									<tr>
										<td>
											<tiles:get name='indexBuyerTile'/>
										</td>
										<td width="2"></td>
										<td>
											<tiles:get name='indexSellerTile'/>
										</td>
									</tr>
								</table>
							</td>
						</tr>		
						<tr><td height="5"></td></tr>
						<tr>
							<td>
								<tiles:get name='indexMainUserTile'/>
							</td>
						</tr>
						<%
						if( !request.getRequestURL().toString().startsWith("https")){%>
							<tr><td height="10"></td></tr>
							<tr>
								<td align="center">
									<%-- <SCRIPT TYPE="text/javascript" LANGUAGE="Javascript" SRC="http://pub.oxado.com/insert_ad?pub=149246"></SCRIPT> --%>
								</td>
							</tr>
						<%}%>
						<tr>
							<td>
								<table cellspacing="0" cellpadding="0" border="0">
									<tr>
										<td>
											<table cellspacing="0" cellpadding="0" border="0">
												<tr>
													<td>
														<table width="565" cellpadding="0" cellspacing="0" border="0" >
															<tiles:get name='footer1Tile'/>
														</table>
													</td>
												</tr>
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
										<%
										if( !request.getRequestURL().toString().startsWith("https")){%>
										<td>
											<table width="135" border="0" cellpadding="2" cellspacing="0" title="Haga clic para verificar ? Este sitio ha elegido VeriSign SSL para que la comunicaci&#243;n sea confidencial y el comercio electr&#243;nico sea seguro.">
												<tr>
												<td width="135" align="center" valign="top"><script src=https://seal.verisign.com/getseal?host_name=www.amandris.com&size=S&use_flash=NO&use_transparent=NO&lang=es></script><br />
												<a href="http://www.verisign.es/certificados-ssl" target="_blank"  style="color:#000000; text-decoration:none; font:bold 7px verdana,sans-serif; letter-spacing:.5px; text-align:center; margin:0px; padding:0px;">Acerca de los certificados SSL</a></td>
												</tr>
											</table>
										</td>
										<%}%>
									</tr>
								</table>
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