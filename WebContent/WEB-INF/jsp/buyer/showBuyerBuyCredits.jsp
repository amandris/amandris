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
		function showBuyerPayment()
		{
			var id = 0;
			
			
			if( document.getElementById( "paymentType2").checked)
				id = 2;
			if( document.getElementById( "paymentType3").checked)
				id = 3;
			if( document.getElementById( "paymentType4").checked)
				id = 4;
			
			document.location.href="showBuyerPayment.do?id=" + id;
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
							<bean:message key="showBuyerBuyCredits.text1"/>
						</td>
					</tr>
					<tr><td height="20"></td></tr>
					<tr>
						<td align="center">
							<table width="60%" cellpadding="0" cellspacing="0" boder="0">
								<tr height="74">
									<td align="left">
										<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showBuyerBuyCredits.creditCard"/>','<bean:message key="showBuyerBuyCredits.creditCard.help"/>'); Activate();" onMouseout="deActivate();">
									</td>
									<td align="center" class="data1Text">
										<input type="radio" id="paymentType2" name="paymentType" value="2">
									</td>
									<td align="left" class="data2Text">
										<bean:message key="showBuyerBuyCredits.creditCard"/>
									</td>
									<td align="left">
										<img src="pictures/paymentCreditCard.gif"/>
									</td>
								</tr>
								<tr height="74">
									<td align="left">
										<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showBuyerBuyCredits.paypal"/>','<bean:message key="showBuyerBuyCredits.paypal.help"/>'); Activate();" onMouseout="deActivate();">
									</td>
									<td align="center" class="data1Text">
										<input type="radio" id="paymentType3" name="paymentType" value="3">
									</td>
									<td align="left" class="data2Text">
										<bean:message key="showBuyerBuyCredits.paypal"/>
									</td>
									<td align="left">
										<img src="pictures/paymentPaypal.gif"/>
									</td>
								</tr>
								<tr height="74">
									<td align="left">
										<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showBuyerBuyCredits.sms"/>','<bean:message key="showBuyerBuyCredits.sms.help"/>'); Activate();" onMouseout="deActivate();">
									</td>
									<td align="center" class="data1Text">
										<input type="radio" id="paymentType4" name="paymentType" value="4">
									</td>
									<td align="left" class="data2Text">
										<bean:message key="showBuyerBuyCredits.sms"/>&nbsp;<bean:message key="showBuyerBuyCredits.onlySpain"/>
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
							<button class="form" onclick="javascript:showBuyerPayment();"><bean:message key="showBuyerBuyCredits.continue"/></button>
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
