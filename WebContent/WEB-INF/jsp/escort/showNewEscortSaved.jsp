<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<tiles:insert template='../tiles/amandrisSellerTile.jsp'>
	<tiles:put name='logoTile' content='logoTile.jsp'/>
	<tiles:put name='footer1Tile' content='footer1Tile.jsp'/>
	<tiles:put name='footer2Tile' content='footer2Tile.jsp'/>
	<tiles:put name='footer3Tile' content='footer3Tile.jsp'/>
	<tiles:put name='body' type='string'>
	
	
	<table width="720" cellpadding="0" cellspacing="0" border="0" >
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
			<td height="450" align="center">	
				<table width="90%" cellspadding="0" cellspacing="0" border="0">
					<tr><td height="20"></td></tr>
					<tr>
						<td class="data3Text" align="center" style="color:#DD55AA;">
							<b><bean:message key="showNewSellerSaved.congratulations"/></b>
						</td>
					</tr>
					<tr><td height="20"></td></tr>
					<tr>
						<td class="data2Text" align="center" style="text-align:justify;">
							<b><bean:message key="showNewSellerSaved.saved"/></b>
						</td>
					</tr>
					<tr><td height="20"></td></tr>
					<tr>
						<td class="data2Text" align="center" style="text-align:justify;color:red;">
							<b><bean:message key="showNewSellerSaved.warning"/></b>
						</td>
					</tr>
					<tr><td height="20"></td></tr>
					<tr>
						<td class="data2Text" align="center">
							<bean:message key="showNewSellerSaved.click"/>&nbsp;<a href="http://www.amandris.com" class="data2Link"><bean:message key="showNewSellerSaved.here"/></a>&nbsp;<bean:message key="showNewSellerSaved.goToIndex"/>.
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
</tiles:put>
</tiles:insert>
