<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>


<html:html>
	<head>
		<title>Amandris</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="stylesheet" href="css/amandris.css" type="text/css">
		<script language="javascript" src="javascript/javaScriptCode.js" type="text/javascript"></script>
	</head>
	<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<script languaje=javascript>
			miFecha = new Date();
			dato_url =  miFecha.getMinutes().toString() + miFecha.getSeconds().toString();
			setTimeout("document.location.href='" + window.location + "'", 2500000);
		</script>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" align="left" valign="top">
			<tr>
				<td>
					<table align="left" cellpadding="0" cellspacing="0" border="0" >
						<tr>
							<td>
								<tiles:get name='adminMenu'/>
							</td>
						</tr>
						<tr>
							<td height="40">
							</td>
						</tr>
						<tr>
							<td>
								<tiles:get name='adminBody'/>
							</td>						
						</tr>	
					</table>			
				</td>
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
