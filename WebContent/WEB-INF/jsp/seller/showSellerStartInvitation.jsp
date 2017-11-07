<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/amandris.tld" prefix="amandris" %>

<tiles:insert template='../tiles/amandrisSellerTile.jsp'>
	<tiles:put name='logoTile' content='logoTile.jsp'/>
	<tiles:put name='sellerMenuTile' content='sellerMenuTile.jsp'/>
	<tiles:put name='footer2Tile' content='footer2Tile.jsp'/>
	<tiles:put name='footer3Tile' content='footer3Tile.jsp'/>
	<tiles:put name='body' type='string'>
	
	<script language="javascript" type="text/javascript">
		function setSellerInvitation()
		{
			var type = 0;
			document.location.href="setSellerInvitation.do?id=<bean:write name="sellerStartInvitation" property="buyerId"/>&type=1";
		}
	</script>	
	
	
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
			<td height="450" class="errorText" align="center">	
				<table width="90%" cellpadding="0" cellspacing="0" boder="0">
					<tr>
						<td align="center" class="data1Text">
							<bean:message key="showSellerStartInvitation.text1"/>
						</td>
					</tr>
					<tr><td height="30"></td></tr>
					<tr>
						<td align="center">
							<table width="90%" cellpadding="0" cellspacing="0" boder="0">
								<tr height="64">
									<td align="left" class="data2Text">
										<b><bean:message key="showSellerStartInvitation.standardInvitation"/></b>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr><td height="20"></td></tr>
					<tr>
						<td align="right" class="data1Text">
							<button class="form" onclick="javascript:setSellerInvitation();"><bean:message key="showSellerStartInvitation.send"/></button>
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
