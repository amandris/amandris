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
				<logic:equal name="adminCensorBuyer" property="picture1Waiting" value="1">
					<tr>
						<td align="center" colspan="2">
							<img src="/media/pictures/original/buyer_<bean:write name="adminCensorBuyer" property="id"/>_1_<bean:write name="adminCensorBuyer" property="picture1"/>.jpg" border="0"/>
						</td>
					</tr>
					<tr>
						<td align="center">
							<input type="button" onclick="document.location.href='setAdminCensorBuyerPicture.do?id=<bean:write name="adminCensorBuyer" property="id"/>&index=1'" value="Admitir"/>
						</td>
						<td align="center">
							<input type="button" onclick="document.location.href='setAdminCensorDenyBuyerPicture.do?id=<bean:write name="adminCensorBuyer" property="id"/>&index=1'" value="Denegar"/>
						</td>
					</tr>
					<tr><td height="1" background="pictures/pixel.gif" colspan="2"></td></tr>
					<tr><td height="10" colspan="2"></td></tr>
				</logic:equal>
				<logic:equal name="adminCensorBuyer" property="picture2Waiting" value="1">
					<tr>
						<td align="center" colspan="2">
							<img src="/media/pictures/original/buyer_<bean:write name="adminCensorBuyer" property="id"/>_2_<bean:write name="adminCensorBuyer" property="picture2"/>.jpg" border="0"/>
						</td>
					</tr>
					<tr>
						<td align="center">
							<input type="button" onclick="document.location.href='setAdminCensorBuyerPicture.do?id=<bean:write name="adminCensorBuyer" property="id"/>&index=2'" value="Admitir"/>
						</td>
						<td align="center">
							<input type="button" onclick="document.location.href='setAdminCensorDenyBuyerPicture.do?id=<bean:write name="adminCensorBuyer" property="id"/>&index=2'" value="Denegar"/>
						</td>
					</tr>
					<tr><td height="1" background="pictures/pixel.gif" colspan="2"></td></tr>
					<tr><td height="10" colspan="2"></td></tr>
				</logic:equal>
				<logic:equal name="adminCensorBuyer" property="picture3Waiting" value="1">
					<tr>
						<td align="center" colspan="2">
							<img src="/media/pictures/original/buyer_<bean:write name="adminCensorBuyer" property="id"/>_3_<bean:write name="adminCensorBuyer" property="picture3"/>.jpg" border="0"/>
						</td>
					</tr>
					<tr>
						<td align="center">
							<input type="button" onclick="document.location.href='setAdminCensorBuyerPicture.do?id=<bean:write name="adminCensorBuyer" property="id"/>&index=3'" value="Admitir"/>
						</td>
						<td align="center">
							<input type="button" onclick="document.location.href='setAdminCensorDenyBuyerPicture.do?id=<bean:write name="adminCensorBuyer" property="id"/>&index=3'" value="Denegar"/>
						</td>
					</tr>
					<tr><td height="1" background="pictures/pixel.gif" colspan="2"></td></tr>
					<tr><td height="10" colspan="2"></td></tr>
				</logic:equal>
				<logic:equal name="adminCensorBuyer" property="picture4Waiting" value="1">
					<tr>
						<td align="center" colspan="2">
							<img src="/media/pictures/original/buyer_<bean:write name="adminCensorBuyer" property="id"/>_4_<bean:write name="adminCensorBuyer" property="picture4"/>.jpg" border="0"/>
						</td>
					</tr>
					<tr>
						<td align="center">
							<input type="button" onclick="document.location.href='setAdminCensorBuyerPicture.do?id=<bean:write name="adminCensorBuyer" property="id"/>&index=4'" value="Admitir"/>
						</td>
						<td align="center">
							<input type="button" onclick="document.location.href='setAdminCensorDenyBuyerPicture.do?id=<bean:write name="adminCensorBuyer" property="id"/>&index=4'" value="Denegar"/>
						</td>
					</tr>
					<tr><td height="1" background="pictures/pixel.gif" colspan="2"></td></tr>
					<tr><td height="10" colspan="2"></td></tr>
				</logic:equal>
				<logic:equal name="adminCensorBuyer" property="picture5Waiting" value="1">
					<tr>
						<td align="center" colspan="2">
							<img src="/media/pictures/original/buyer_<bean:write name="adminCensorBuyer" property="id"/>_5_<bean:write name="adminCensorBuyer" property="picture5"/>.jpg" border="0"/>
						</td>
					</tr>
					<tr>
						<td align="center">
							<input type="button" onclick="document.location.href='setAdminCensorBuyerPicture.do?id=<bean:write name="adminCensorBuyer" property="id"/>&index=5'" value="Admitir"/>
						</td>
						<td align="center">
							<input type="button" onclick="document.location.href='setAdminCensorDenyBuyerPicture.do?id=<bean:write name="adminCensorBuyer" property="id"/>&index=5'" value="Denegar"/>
						</td>
					</tr>
				</logic:equal>
			</table>
		</td>
	</tr>
</table>

</tiles:put>
</tiles:insert>
