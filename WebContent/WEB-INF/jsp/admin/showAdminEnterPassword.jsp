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
	
		<table border="0" cellpadding="0" cellspacing="0" align="center" valign="top">
			<html:form action="adminLogin.do">
				<tr height="100">
					<td class="data2Text">
						<bean:write name="adminLoginForm" property="login"/>
					</td>
					<td>
						<html:hidden property="login"/>
						
						<html:text property="password" styleClass="form"/>
					</td>
					<td>
						<html:submit styleClass="form"/>
					</td>
				</tr>
			</html:form>
		</table>
	</body>
</html:html>
