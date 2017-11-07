<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<tiles:insert template='../tiles/adminTile.jsp'>
	<tiles:put name='adminMenu' content='adminMenuTile.jsp'/>
	<tiles:put name='adminBody' type='string'>


<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" valign="top">
	<tr>
		<td>
			<table width="80%" border="0" cellpadding="0" cellspacing="0" align="center" valign="top">
				<tr bgcolor="#A0A0A0">
						<td width="20"></td>
						<td class="data2text">
							<b>ID</b>
						</td>
						<td class="data2text">
							<b>FECHA</b>
						</td>
						<td class="data2text">
							<b>E-MAIL</b>
						</td>
						<td class="data2text">
							<b>SUBJECT</b>
						</td>
						<td class="data2text">
							<b>ES NUEVO</b>
						</td>
						<td class="data2text">
							<b>BORRAR</b>
						</td>
					</tr>
				<logic:iterate name="adminAmandrisMessageCollection" id="collection">
					<logic:equal name="collection" property="isNew" value="1">
						<tr bgcolor="#D0D0D0">
					</logic:equal>
					<logic:notEqual name="collection" property="isNew" value="1">
						<tr bgcolor="#F5F5F5">
					</logic:notEqual>
						<td width="20"></td>
						<td class="data2text">
							<a href="showAdminReceivedMessageDetail.do?id=<bean:write name="collection" property="id"/>" class="data2Link">
								<bean:write name="collection" property="id"/>
							</a>
						</td>
						<td class="data2text">
							<bean:write name="collection" property="date"/>
						</td>
						<td class="data2text">
							<bean:write name="collection" property="email"/>
						</td>
						<td class="data2text">
							<bean:write name="collection" property="briefSubject"/>
						</td>
						<td class="data2text">
							<logic:equal name="collection" property="isNew" value="1">
								SÍ
							</logic:equal>
							<logic:notEqual name="collection" property="isNew" value="1">
								NO
							</logic:notEqual>
						</td>
						<td class="data2text">
							<button class="form" onclick="if(confirm('¿Desea borrar el mensaje <bean:write name="collection" property="id"/>?')) document.location.href='deleteAdminReceivedMessage.do?id=<bean:write name="collection" property="id"/>'">Borrar</button>
						</td>
					</tr>
					<tr height="1"></tr>
					
				</logic:iterate>
			</table>
		</td>
	</tr>
</table>

</tiles:put>
</tiles:insert>
