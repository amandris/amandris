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
			<table border="0" cellpadding="5" cellspacing="0" align="center" valign="top">
					<tr>
						<td align="center">
							<img src="/media/album/original/seller_<bean:write name="adminCensorAlbumElement" property="sellerId"/>_<bean:write name="adminCensorAlbumElement" property="code"/>.jpg" border="0"/>
						</td>
					</tr>
					<tr>
						<td align="center">
							<button onclick="document.location.href='setAdminCensorAlbumElement.do?id=<bean:write name="adminCensorAlbumElement" property="id"/>'">Admitir</button>
						</td>
					</tr>
					<tr><td height="1" background="pictures/pixel.gif"></td></tr>
					<tr><td height="10"></td></tr>
			</table>
		</td>
	</tr>
</table>

</tiles:put>
</tiles:insert>
