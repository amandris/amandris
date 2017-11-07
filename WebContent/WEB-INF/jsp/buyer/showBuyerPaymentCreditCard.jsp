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
				<table width="90%" cellpadding="0" cellspacing="0" boder="0">
					<tr>
						<td align="center" class="data1Text">
							<bean:message key="showBuyerPaymentCreditCard.text1"/> 
						</td>
					</tr>
					<tr><td height="90"></td></tr>
					<tr>
						<td align="center">
							<table width="70%" cellpadding="0" cellspacing="0" boder="0">
								<tr>
									<td align="left" class="data3Text" valign="top">
										<bean:message key="showBuyerPaymentCreditCard.pack1"/>
									</td>
									<td align="center">
										<form action="https://tpv.4b.es/tpvv/teargral.exe" method="post">
											<input type="hidden" name="pszPurchorderNum" value="b10<bean:write name="buyerSession" property="id"/>">
											<input type="hidden" name="store" value="PI00009015">
											<input type="image" src="pictures/buyNow.gif" border="0" name="submit" alt="<bean:message key="showBuyerPaymentCreditCard.alt"/>">
										</form>
									</td>
								</tr>
								<tr><td height="30" colspan="2"></td></tr>
								<tr>
									<td align="left" class="data3Text" valign="top">
										<bean:message key="showBuyerPaymentCreditCard.pack2"/>
									</td>
									<td align="center">
										<form action="https://tpv.4b.es/tpvv/teargral.exe" method="post">
											<input type="hidden" name="pszPurchorderNum" value="b20<bean:write name="buyerSession" property="id"/>">
											<input type="hidden" name="store" value="PI00009015">
											<input type="image" src="pictures/buyNow.gif" border="0" name="submit" alt="<bean:message key="showBuyerPaymentCreditCard.alt"/>">
										</form>
									</td>
								</tr>								
							</table>
						</td>
					</tr>
					<tr><td height="80"></td></tr>
					<tr>
						<td align="center">
							<table width="90%" cellpadding="0" cellspacing="0" boder="0">
								<tr>
									<td valign="top">
										<table width="135" border="0" cellpadding="2" cellspacing="0" title="Haga clic para verificar ? Este sitio ha elegido VeriSign SSL para que la comunicaci&#243;n sea confidencial y el comercio electr&#243;nico sea seguro.">
											<tr>
											<td width="135" align="center" valign="top"><script src=https://seal.verisign.com/getseal?host_name=www.amandris.com&size=S&use_flash=NO&use_transparent=NO&lang=es></script><br />
											<a href="http://www.verisign.es/certificados-ssl" target="_blank"  style="color:#000000; text-decoration:none; font:bold 7px verdana,sans-serif; letter-spacing:.5px; text-align:center; margin:0px; padding:0px;">Acerca de los certificados SSL</a></td>
											</tr>
										</table>
									</td>
									<td>
										<img src="pictures/4b.gif"/>
									</td>
									<td>
										<img src="pictures/masterCard.gif"/>
									</td>
									<td>
										<img src="pictures/visa.gif"/>
									</td>
								</tr>
							</table>
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
