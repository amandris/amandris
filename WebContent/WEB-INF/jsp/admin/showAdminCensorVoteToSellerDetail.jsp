<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<tiles:insert template='../tiles/adminTile.jsp'>
	<tiles:put name='adminMenu' content='adminMenuTile.jsp'/>
	<tiles:put name='adminBody' type='string'>


<table border="0" cellpadding="0" cellspacing="0" align="left" valign="top">
	<html:form action="setAdminCensorVoteToSeller.do">
		<tr>
			<td width="20"></td>
			<td>
				<table border="0" cellpadding="0" cellspacing="5" align="left" valign="top">
					<tr>
						<td class="data2text" valign="top">
							<b>ID</b>
						</td>
						<td class="data2text" valign="top">
							<bean:write name="adminCensorVoteForm" property="id"/>
						</td>
					</tr>
					<tr>
						<td class="data2text" valign="top">
							<b>DE DEMANDANTE</b>
						</td>
						<td class="data2text" valign="top">
							<bean:write name="adminCensorVoteForm" property="buyerLogin"/>
						</td>
					</tr>
					<tr>
						<td class="data2text" valign="top">
							<b>A OFERTANTE</b>
						</td>
						<td class="data2text" valign="top">
							<bean:write name="adminCensorVoteForm" property="sellerLogin"/>
						</td>
					</tr>
					<tr>
						<td class="data2text" valign="top">
							<b>VOTO</b>
						</td>
						<td class="data2text" valign="top">
							<bean:write name="adminCensorVoteForm" property="vote"/>
						</td>
					</tr>
					
					<tr>
						<td class="data2text" valign="top">
							<b>TEXTO</b>
						</td>
						<td class="data2text">
							<html:text styleClass="form" property="comment" size="100"/>
						</td>
					</tr>
					<tr>
						<td class="data2text" valign="top">
							<b>RESPUESTA</b>
						</td>
						<td class="data2text">
							<html:text styleClass="form" property="reply" size="100"/>
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
