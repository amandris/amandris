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
							<b>ID VOTO</b>
						</td>
						<td class="data2text">
							<b>DE OFERTANTE</b>
						</td>
						<td class="data2text">
							<b>A DEMANDANTE</b>
						</td>
					</tr>
				<logic:iterate name="adminCensorVoteToBuyerCollection" id="collection">
					<tr bgcolor="#E0E0E0">
						<td width="20"></td>
						<td class="data2text">
							<a href="showAdminCensorVoteToBuyerDetail.do?id=<bean:write name="collection" property="id"/>" class="data2Link">
								<bean:write name="collection" property="id"/>
							</a>
						</td>
						<td class="data2text">
							<bean:write name="collection" property="sellerLogin"/>
						</td>
						<td class="data2text">
							<bean:write name="collection" property="buyerLogin"/>
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
