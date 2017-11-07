<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<tiles:insert template='../tiles/adminTile.jsp'>
	<tiles:put name='adminMenu' content='adminMenuTile.jsp'/>
	<tiles:put name='adminBody' type='string'>


<table border="0" cellpadding="0" cellspacing="0" align="left" valign="top">
	<html:form action="setAdminCensorSeller.do">
		<tr>
			<td width="20"></td>
			<td>
				<table border="0" cellpadding="0" cellspacing="5" align="left" valign="top">
					<tr>
						<td class="data2text" valign="top">
							<b>ID</b>
						</td>
						<td class="data2text" valign="top">
							<bean:write name="adminCensorSellerForm" property="id"/>
						</td>
					</tr>
					<tr>
						<td class="data2text" valign="top">
							<b>LOGIN</b>
						</td>
						<td class="data2text">
							<html:text styleClass="form" property="login" size="80"/>
						</td>
					</tr>
					<tr>
						<td class="data2text" valign="top">
							<b>NOMBRE</b>
						</td>
						<td class="data2text">
							<html:text styleClass="form" property="name" size="80"/>
						</td>
					</tr>
					<tr>
						<td class="data2text" valign="top">
							<b>APELLIDOS</b>
						</td>
						<td class="data2text">
							<html:text styleClass="form" property="surname" size="80"/>
						</td>
					</tr>
					<tr>
						<td class="data2text" valign="top">
							<b>DIRECCIÓN1</b>
						</td>
						<td class="data2text">
							<html:text styleClass="form" property="address1" size="80"/>
						</td>
					</tr>
					<tr>
						<td class="data2text" valign="top">
							<b>DIRECCIÓN2</b>
						</td>
						<td class="data2text">
							<html:text styleClass="form" property="address2" size="80"/>
						</td>
					</tr>
					<tr>
						<td class="data2text" valign="top">
							<b>CIUDAD</b>
						</td>
						<td class="data2text">
							<html:text styleClass="form" property="city" size="80"/>
						</td>
					</tr>
					<tr>
						<td class="data2text" valign="top">
							<b>CÓDIGO POSTAL</b>
						</td>
						<td class="data2text">
							<html:text styleClass="form" property="postalCode" size="20"/>
						</td>
					</tr>
					<tr>
						<td class="data2text" valign="top">
							<b>INTRODUCCIÓN</b>
						</td>
						<td class="data2text">
							<html:text styleClass="form" property="intro" size="100"/>
						</td>
					</tr>
					<tr>
						<td class="data2text" valign="top">
							<b>TEXTO</b>
						</td>
						<td class="data2text">
							<html:textarea styleClass="form" property="text" cols="60" rows="8"/>
						</td>
					</tr>
					<tr>
						<td class="data2text" valign="top">
							<b>TEXTO PREFERENCIA</b>
						</td>
						<td class="data2text">
							<html:textarea styleClass="form" property="preferredText" cols="60" rows="8"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<html:submit styleClass="form">Guardar</html:submit>
			</td>
		</tr>
	</html:form>
</table>

</tiles:put>
</tiles:insert>
