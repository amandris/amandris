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
				<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
					<html:form action="setSellerChangeCurrency.do">
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showSellerChangeCurrency.text1"/>
							</td>
						</tr>
						<tr><td height="30"></td></tr>
						<tr>
							<td align="center">
								<table width="50%" cellpadding="0" cellspacing="0">
								<tr height="30">
										<td valign="top" align="left" class="data2Text">
											<bean:message key="showSellerChangeCurrency.currentCurrency"/>:&nbsp;
											<b><bean:write name="changeCurrencyForm" property="currentCurrencyText"/></b>
										</td>
									</tr>
									<tr><td height="15"></td></tr>
									<tr height="50">
										<td valign="top" align="left" class="data2Text">
											<bean:message key="showSellerChangeCurrency.newCurrency"/>
											<html:select name="changeCurrencyForm" property="currencyConst" styleClass="form">
												<html:option value="1"><bean:message key="currency.1"/></html:option>
												<html:option value="2"><bean:message key="currency.2"/></html:option>
												<html:option value="3"><bean:message key="currency.3"/></html:option>
											</html:select>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td height="250"></td></tr>
						<tr>
							<td>
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tr bgcolor="#C185AA" height="30">
										<td width="50%" class="data1Text" align="left">
											&nbsp;&nbsp;&nbsp;&nbsp;<button class="form" onclick="javascript:history.back();">&lt;&lt;&nbsp;<bean:message key="showSellerChangeCurrency.back"/></button>
										</td>
										<td width="50%" class="data1Text" align="right">
											<html:submit styleClass="form"><bean:message key="showSellerChangeCurrency.changeCurrency"/></html:submit>&nbsp;&nbsp;&nbsp;&nbsp;
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
