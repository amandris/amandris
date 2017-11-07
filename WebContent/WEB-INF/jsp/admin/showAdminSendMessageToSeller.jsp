<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<tiles:insert template='../tiles/adminTile.jsp'>
	<tiles:put name='adminMenu' content='adminMenuTile.jsp'/>
	<tiles:put name='adminBody' type='string'>


<table border="0" cellpadding="0" cellspacing="0" align="left" valign="top">
	<html:form action="setAdminSendMessageToSeller.do">
		<tr>
			<td width="20"></td>
			<td>
				<table border="0" cellpadding="0" cellspacing="5" align="left" valign="top">
					<tr>
						<td class="data2text" valign="top">
							<b>Lista de ofertantes<br/>(separados por comas)</b>
						</td>
						<td class="data2text" valign="top">
							<html:textarea styleClass="form" property="ids" cols="80" rows="3"/>
						</td>
					</tr>
					<tr>
						<td class="data2text" valign="top">
							<b>Subject</b>
						</td>
						<td class="data2text">
							<html:text styleClass="form" property="subject" size="80"/>
						</td>
					</tr>
					<tr>
						<td class="data2text" valign="top">
							<b>Texto</b>
						</td>
						<td class="data2text">
							<html:textarea styleClass="form" property="text" cols="80" rows="8"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<html:submit styleClass="form">Enviar</html:submit>
			</td>
		</tr>
	</html:form>
</table>

</tiles:put>
</tiles:insert>
