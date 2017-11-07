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
		function showSellerPayment()
		{
			var id = 0;
			
			
			if( document.getElementById( "paymentType2").checked)
				id = 2;
			if( document.getElementById( "paymentType3").checked)
				id = 3;
			if( document.getElementById( "paymentType4").checked)
				id = 4;
			
			document.location.href="showSellerPayment.do?id=" + id;
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
							<bean:message key="showSellerBuyCredits.text1"/>
						</td>
					</tr>
					<tr><td height="20"></td></tr>
					<tr>
						<td align="center">
							<table width="60%" cellpadding="0" cellspacing="0" boder="0">
								
								<tr height="74">
									<td align="left">
										<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerBuyCredits.creditCard"/>','<bean:message key="showSellerBuyCredits.creditCard.help"/>'); Activate();" onMouseout="deActivate();">
									</td>
									<td align="center" class="data1Text">
										<input type="radio" id="paymentType2" name="paymentType" value="2">
									</td>
									<td align="left" class="data2Text">
										<bean:message key="showSellerBuyCredits.creditCard"/>
									</td>
									<td align="left">
										<img src="pictures/paymentCreditCard.gif"/>
									</td>
								</tr>
								<tr height="74">
									<td align="left">
										<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerBuyCredits.paypal"/>','<bean:message key="showSellerBuyCredits.paypal.help"/>'); Activate();" onMouseout="deActivate();">
									</td>
									<td align="center" class="data1Text">
										<input type="radio" id="paymentType3" name="paymentType" value="3">
									</td>
									<td align="left" class="data2Text">
										<bean:message key="showSellerBuyCredits.paypal"/>
									</td>
									<td align="left">
										<img src="pictures/paymentPaypal.gif"/>
									</td>
								</tr>
								<tr height="74">
									<td align="left">
										<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerBuyCredits.sms"/>','<bean:message key="showSellerBuyCredits.sms.help"/>'); Activate();" onMouseout="deActivate();">
									</td>
									<td align="center" class="data1Text">
										<input type="radio" id="paymentType4" name="paymentType" value="4">
									</td>
									<td align="left" class="data2Text">
										<bean:message key="showSellerBuyCredits.sms"/>&nbsp;<bean:message key="showSellerBuyCredits.onlySpain"/>
									</td>
									<td align="left">
										<img src="pictures/paymentPhone.gif"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr><td height="130"></td></tr>
					<tr>
						<td align="right" class="data1Text">
							<button class="form" onclick="javascript:showSellerPayment();"><bean:message key="showSellerBuyCredits.continue"/></button>
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
