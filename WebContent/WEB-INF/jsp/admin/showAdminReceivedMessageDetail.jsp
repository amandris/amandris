<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<tiles:insert template='../tiles/adminTile.jsp'>
	<tiles:put name='adminMenu' content='adminMenuTile.jsp'/>
	<tiles:put name='adminBody' type='string'>


<table border="0" cellpadding="0" cellspacing="0" align="left" valign="top">
	<tr>
		<td width="20"></td>
		<td>
			<table border="0" cellpadding="0" cellspacing="5" align="left" valign="top">
				<tr>
					<td class="data2text" valign="top">
						<b>ID</b>
					</td>
					<td class="data2text" valign="top">
						<bean:write name="adminAmandrisMessage" property="id"/>
					</td>
				</tr>
				<tr>
					<td class="data2text" valign="top">
						<b>FECHA</b>
					</td>
					<td class="data2text" valign="top">
						<bean:write name="adminAmandrisMessage" property="date"/>
					</td>
				</tr>
				<tr>
					<td class="data2text" valign="top">
						<b>ESTÁ REGISTRADO</b>
					</td>
					<td class="data2text" valign="top">
						<logic:equal name="adminAmandrisMessage" property="userType" value="0">
							NO
						</logic:equal>
						<logic:equal name="adminAmandrisMessage" property="userType" value="1">
							SÍ, ES DEMANDANTE (<bean:write name="adminAmandrisMessage" property="userId"/>)
						</logic:equal>
						<logic:equal name="adminAmandrisMessage" property="userType" value="2">
							SÍ, ES OFERTANTE (<bean:write name="adminAmandrisMessage" property="userId"/>)
						</logic:equal>
					</td>
				</tr>
				<tr>
					<td class="data2text" valign="top">
						<b>E-MAIL</b>
					</td>
					<td class="data2text">
						<bean:write name="adminAmandrisMessage" property="email"/>
					</td>
				</tr>
				<tr>
					<td class="data2text" valign="top">
						<b>SUBJECT</b>
					</td>
					<td class="data2text">
						<bean:write name="adminAmandrisMessage" property="subject"/>
					</td>
				</tr>
				<tr>
					<td class="data2text" valign="top">
						<b>TEXTO</b>
					</td>
					<td class="data2text">
						<bean:write name="adminAmandrisMessage" property="text"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<button class="form" onclick="history.back();">Atrás</button>&nbsp;&nbsp;&nbsp;
			<button class="form" onclick="if(confirm('¿Desea borrar el mensaje?')) document.location.href='deleteAdminReceivedMessage.do?id=<bean:write name="adminAmandrisMessage" property="id"/>'">Borrar</button>
		</td>
	</tr>
</table>

</tiles:put>
</tiles:insert>
