<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<html:html>
<head>
	<title><bean:message key="common.amandris"/></title>
</head>
<body>
	<table width="200" cellpadding="0" cellspacing="0" border="0" >
		<tr>
			<td width="8" height="8" background="pictures/borderTopLeft.gif">
			</td>
			<td height="8" background="pictures/borderTop.gif" >	
			</td>
			<td width="8" height="8" background="pictures/borderTopRight.gif">
			</td>
		</tr>
		
		<tr valign="top">
			<td width="8" background="pictures/borderLeft.gif">
			</td>
			<td>
				<table width="100%" cellpadding="0" cellspacing="0" border="0" >
					<tr valign="middle">
						<td height="130" style="font-family:arial;font-size:14;" align="center">	
							<bean:write filter="false" name="checkUserText"/>
						</td>
					</tr>
					<tr><td height="20"></td></tr>
					<tr valign="middle">
						<td height="30" align="center">	
							<button class="form" onclick="parent.close();"><bean:message key="showCheckUserName.close"/></button>
						</td>
					</tr>
				</table>
			</td>
			<td width="8"  background="pictures/borderRight.gif">
			</td>
		</tr>
		<tr>
			<td width="8" height="8" background="pictures/borderBottomLeft.gif">
			</td>
			<td  height="8" background="pictures/borderBottom.gif" >	
			</td>
			<td width="8" height="8" background="pictures/borderBottomRight.gif">
			</td>
		</tr>
	</table>
</body>

</html:html>