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
				<table width="93%" cellpadding="0" cellspacing="0" boder="0">
					<tr>
						<td align="center" class="data1Text">
							<bean:message key="showBuyerPaymentSms.text1"/> 
						</td>
					</tr>
					<tr>
						<td height="10" align="center" class="errorText">
							
						</td>
					</tr>
					<tr><td height="90"></td></tr>
					<tr>
						<td align="center">
							<table width="95%" cellpadding="0" cellspacing="0" boder="0">
								<tr>
									<td align="left" class="data3Text" valign="top">
										<bean:message key="showBuyerPaymentSms.text2"/>&nbsp;<span style="color:red;"><b>amandris&nbsp;b<bean:write name="buyerSession" property="id"/></b></span>
									</td>
									
								</tr>
								<tr><td height="20" colspan="2"></td></tr>
								<tr>
									<td align="center" class="data1Text" valign="top" >
										<bean:message key="showBuyerPaymentSms.text3"/>&nbsp;b<bean:write name="buyerSession" property="id"/> 
									</td>
								</tr>	
								<tr><td height="20" colspan="2"></td></tr>
								<tr>
									<td align="center" class="data1Text" valign="top" >
										<bean:message key="showBuyerPaymentSms.text4"/>
									</td>
								</tr>								
							</table>
						</td>
					</tr>
					<tr><td height="20"></td></tr>
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
