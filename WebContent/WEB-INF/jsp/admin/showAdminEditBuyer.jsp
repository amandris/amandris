<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<tiles:insert template='../tiles/adminTile.jsp'>
	<tiles:put name='adminMenu' content='adminMenuTile.jsp'/>
	<tiles:put name='adminBody' type='string'>


	<script language="javascript" type="text/javascript">
		function send()
		{
			var id = document.getElementById('id').value;
		
			document.location.href="showAdminBuyer.do?id=" + id;
		}
	</script>


	<table border="0" cellpadding="0" cellspacing="0" align="left" valign="top">
		<tr>
			<td width="20"></td>
			<td>
				<table border="0" cellpadding="0" cellspacing="5" align="left" valign="top">
					<tr>
						<td class="data2text" valign="top">
							<b>Id del demandante</b>
						</td>
						<td class="data2text" valign="top">
							<input type="text" class="form" name="id" id="id"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" styleClass="form" onclick="send();" value="Enviar" />
			</td>
		</tr>
	</table>

</tiles:put>
</tiles:insert>
