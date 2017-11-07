<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/amandris.tld" prefix="amandris" %>

<tiles:insert template='../tiles/amandrisBuyerTile.jsp'>
	<tiles:put name='logoTile' content='logoTile.jsp'/>
	<tiles:put name='buyerMenuTile' content='buyerMenuTile.jsp'/>
	<tiles:put name='footer2Tile' content='footer2Tile.jsp'/>
	<tiles:put name='footer3Tile' content='footer3Tile.jsp'/>
	<tiles:put name='body' type='string'>
	
	<script language="javascript" type="text/javascript">
		
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
			<td height="450">	
				<table width="90%" cellpadding="0" cellspacing="0" border="0" align="center">
					<html:form action="setBuyerCancelDate.do">
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showBuyerCancelDate.text1"/>
							</td>
						</tr>
						<tr><td height="5"></td></tr>
						<tr>
							<td height="10" align="center" class="errorText">
								<html:hidden property="sellerId"/>
								<html:hidden property="sellerLogin"/>
								<html:errors/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td class="data1Text" align="left">
								<bean:message key="showBuyerCancelDate.text"/>
							</td>
						</tr>
						<tr><td height="5"></td></tr>
						<tr>
							<td class="data1Text" align="left">
								<html:textarea property="text" styleClass="form" cols="60" rows="15"></html:textarea>
							</td>
						</tr>
						<tr><td height="70"></td></tr>
						<tr>
							<td>
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tr bgcolor="#C185AA" height="30">
										<td width="100%" class="data1Text" align="right">
											<html:submit styleClass="form"><bean:message key="showBuyerCancelDate.cancel"/></html:submit>&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</html:form>
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
