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
			<td height="450" class="errorText" align="center">	
				<table width="90%" cellpadding="0" cellspacing="0" boder="0">
					<tr>
						<td align="center" class="data1Text">
							<bean:message key="showEscortPaymentPaypal.text1"/> 
						</td>
					</tr>
					<tr>
						<td height="10" align="center" class="errorText">
							<html:errors/>
						</td>
					</tr>
					<tr><td height="90"></td></tr>
					<tr>
						<td align="center">
							<table width="70%" cellpadding="0" cellspacing="0" boder="0">
								<tr>
									<td align="left" class="data3Text" valign="top">
										<bean:message key="showEscortPaymentPaypal.pack1"/>
									</td>
									<td align="center">
										<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
											<input type="hidden" name="cmd" value="_xclick">
											<input type="hidden" name="business" value="payment@amandris.com">
											<input type="hidden" name="item_name" value="escortp150c">
											<input type="hidden" name="item_number" value="e<bean:write name="sellerSession" property="id"/>">
											<input type="hidden" name="amount" value="150">
											<input type="hidden" name="buyer_credit_promo_code" value="">
											<input type="hidden" name="buyer_credit_product_category" value="">
											<input type="hidden" name="buyer_credit_shipping_method" value="">
											<input type="hidden" name="buyer_credit_user_address_change" value="">
											<input type="hidden" name="no_shipping" value="0">
											<input type="hidden" name="no_note" value="1">
											<input type="hidden" name="currency_code" value="EUR">
											<input type="hidden" name="lc" value="ES">
											<input type="hidden" name="bn" value="PP-BuyNowBF">
											<input type="image" src="https://www.paypal.com/es_ES/i/btn/x-click-but23.gif" border="0" name="submit" alt="Realice pagos con PayPal: es rápido, gratis y seguro.">
											<img alt="" border="0" src="https://www.paypal.com/es_ES/i/scr/pixel.gif" width="1" height="1">
										</form>
									</td>
								</tr>
								<tr><td height="30" colspan="2"></td></tr>
								<tr>
									<td align="left" class="data3Text" valign="top">
										<bean:message key="showEscortPaymentPaypal.pack2"/>
									</td>
									<td align="center">
										<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
											<input type="hidden" name="cmd" value="_xclick">
											<input type="hidden" name="business" value="payment@amandris.com">
											<input type="hidden" name="item_name" value="escortp250c">
											<input type="hidden" name="item_number" value="e<bean:write name="sellerSession" property="id"/>">
											<input type="hidden" name="amount" value="250">
											<input type="hidden" name="buyer_credit_promo_code" value="">
											<input type="hidden" name="buyer_credit_product_category" value="">
											<input type="hidden" name="buyer_credit_shipping_method" value="">
											<input type="hidden" name="buyer_credit_user_address_change" value="">
											<input type="hidden" name="no_shipping" value="0">
											<input type="hidden" name="no_note" value="1">
											<input type="hidden" name="currency_code" value="EUR">
											<input type="hidden" name="lc" value="ES">
											<input type="hidden" name="bn" value="PP-BuyNowBF">
											<input type="image" src="https://www.paypal.com/es_ES/i/btn/x-click-but23.gif" border="0" name="submit" alt="Realice pagos con PayPal: es rápido, gratis y seguro.">
											<img alt="" border="0" src="https://www.paypal.com/es_ES/i/scr/pixel.gif" width="1" height="1">
										</form>
									</td>
								</tr>
								<tr><td height="30" colspan="2"></td></tr>
								<tr>
									<td align="left" class="data3Text" valign="top">
										<bean:message key="showEscortPaymentPaypal.pack3"/>
									</td>
									<td align="center">
										<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
											<input type="hidden" name="cmd" value="_xclick">
											<input type="hidden" name="business" value="payment@amandris.com">
											<input type="hidden" name="item_name" value="escortp400c">
											<input type="hidden" name="item_number" value="e<bean:write name="sellerSession" property="id"/>">
											<input type="hidden" name="amount" value="400">
											<input type="hidden" name="buyer_credit_promo_code" value="">
											<input type="hidden" name="buyer_credit_product_category" value="">
											<input type="hidden" name="buyer_credit_shipping_method" value="">
											<input type="hidden" name="buyer_credit_user_address_change" value="">
											<input type="hidden" name="no_shipping" value="0">
											<input type="hidden" name="no_note" value="1">
											<input type="hidden" name="currency_code" value="EUR">
											<input type="hidden" name="lc" value="ES">
											<input type="hidden" name="bn" value="PP-BuyNowBF">
											<input type="image" src="https://www.paypal.com/es_ES/i/btn/x-click-but23.gif" border="0" name="submit" alt="Realice pagos con PayPal: es rápido, gratis y seguro.">
											<img alt="" border="0" src="https://www.paypal.com/es_ES/i/scr/pixel.gif" width="1" height="1">
										</form>
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
