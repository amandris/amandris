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
				<table width="98%" cellpadding="0" cellspacing="0" border="0" align="center">
					<tr>
						<td align="center" class="data1Text">
							<table cellpadding="0" cellspacing="0" border="0" align="center">
								<tr><td height="10"></td><td></td><td></td></tr>
								<tr height="30">
									<td nowrap align="right" class="data2Text" valign="top">
										<b><bean:message key="showBuyerConfirmContact.date"/>:</b>
									</td>
									<td width="15"></td>
									<td align="left" class="data3Text" valign="top">
										<b><bean:write name="buyerConfirmContact" property="longDate"/></b>
									</td>
								</tr>
								<tr height="30">
									<td nowrap align="right" class="data2Text" valign="top">
										<b><bean:message key="showBuyerConfirmContact.hour"/>:</b>
									</td>
									<td width="15"></td>
									<td align="left" class="data3Text" valign="top">
										<b><bean:write name="buyerConfirmContact" property="hour"/></b>
									</td>
								</tr>
								<tr height="30">
									<td nowrap align="right" class="data2Text" valign="top">
										<b><bean:message key="showBuyerConfirmContact.sellerLogin"/>:</b>
									</td>
									<td width="15"></td>
									<td align="left" class="data3Text" valign="top">
										<a href="showSeller.do?id=<bean:write name="buyerConfirmContact" property="sellerId"/>" class="data3Link">
											<bean:write name="buyerConfirmContact" property="sellerLogin"/>
										</a>
									</td>
								</tr>
								<tr height="30">
									<td nowrap align="right" class="data2Text" valign="top">
										<b><bean:message key="showBuyerConfirmContact.length"/>:</b>
									</td>
									<td width="15"></td>
									<td align="left" class="data3Text" valign="top">
										<b><bean:write name="buyerConfirmContact" property="length"/></b>&nbsp;
										<logic:equal name="buyerConfirmContact" property="length" value="1">
											<bean:message key="showBuyerConfirmContact.hour"/>
										</logic:equal>
										<logic:notEqual name="buyerConfirmContact" property="length" value="1">
											<bean:message key="showBuyerConfirmContact.hours"/>
										</logic:notEqual>
									</td>
								</tr>
								<tr height="30">
									<td nowrap align="right" class="data2Text" valign="top">
										<b><bean:message key="showBuyerConfirmContact.serviceType"/>:</b>
									</td>
									<td width="15"></td>
									<td align="left" class="data3Text" valign="top">
										<b><bean:write name="buyerConfirmContact" property="serviceTypeText"/></b>
									</td>
								</tr>
								<tr height="30">
									<td nowrap align="right" class="data2Text" valign="top">
										<b><bean:message key="showBuyerConfirmContact.meetingPlace"/>:</b>
									</td>
									<td width="15"></td>
									<td align="left" class="data3Text" valign="top">
										<b>
											<bean:write name="buyerConfirmContact" property="address1"/><br>
											<logic:notEmpty name="buyerConfirmContact" property="address2">
												<bean:write name="buyerConfirmContact" property="address2"/><br>
											</logic:notEmpty>
											<bean:write name="buyerConfirmContact" property="city"/>&nbsp;(<bean:write name="buyerConfirmContact" property="state"/>)<br>
											<bean:write name="buyerConfirmContact" property="country"/>
										</b>
									</td>
								</tr>
								<tr><td height="40"></td><td></td><td></td></tr>
								<tr height="30">
									<td nowrap align="right" class="data2Text" valign="top">
										<b><bean:message key="showBuyerConfirmContact.price"/>:</b>
									</td>
									<td width="15"></td>
									<td align="left" class="data3Text" valign="top">
										<logic:equal name="buyerConfirmContact" property="isFree" value="0">
											<b><bean:write name="buyerConfirmContact" property="price"/>&nbsp;<bean:write name="buyerConfirmContact" property="currency"/></b>
										</logic:equal>
										<logic:equal name="buyerConfirmContact" property="isFree" value="1">
											<b><span style="color=#00AA00;"><bean:message key="showBuyerConfirmContact.free"/></span></b>
										</logic:equal>
									</td>
								</tr>
								<logic:equal name="buyerConfirmContact" property="isFree" value="0">
									<tr height="30">
										<td nowrap align="right" class="data2Text" valign="top">
											<b><bean:message key="showBuyerConfirmContact.payment"/>:</b>
										</td>
										<td width="15"></td>
										<td align="left" class="data3Text" valign="top">
											<logic:equal name="buyerConfirmContact" property="paymentBeforeDate" value="1">
												<b><bean:message key="showBuyerConfirmContact.paymentBeforeDate"/></b>
											</logic:equal>
											<logic:notEqual name="buyerConfirmContact" property="paymentBeforeDate" value="1">
												<b><bean:message key="showBuyerConfirmContact.paymentInDate"/></b>
											</logic:notEqual>
										</td>
									</tr>
								</logic:equal>
							</table>
						</td>
					</tr>
					<tr><td height="20"></td></tr>
					<logic:equal name="buyerConfirmContact" property="allowed" value="1">
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showBuyerConfirmContact.text1"/><br><br>
								<bean:message key="showBuyerConfirmContact.text2"/>
							</td>
						</tr>
						<tr><td height="20"></td></tr>
						<tr>
							<td>
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tr width="100%" bgcolor="#C185AA" height="30">
										<td width="2%"></td>
										<td width="20%" class="data1Text" align="left">
											<button class="form" onclick="history.back();return false;">&lt;&lt;&nbsp;<bean:message key="showBuyerConfirmContact.back"/></button>
										</td>
										<td width="2%"></td>
										<td width="20%" class="data1Text" align="left">
											<button class="form" onclick="document.location.href='setBuyerContact.do'"><bean:message key="showBuyerConfirmContact.setContact"/></button>
										</td>
										<td width="56%"></td>
									</tr>
								</table>
							</td>
						</tr>
					</logic:equal>
					<logic:equal name="buyerConfirmContact" property="allowed" value="0">
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showBuyerConfirmContact.text3"/>
							</td>
						</tr>
						<tr><td height="20"></td></tr>
						<tr>
							<td>
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tr width="100%" bgcolor="#C185AA" height="30">
										<td width="2%"></td>
										<td width="20%" class="data1Text" align="left">
											<button class="form" onclick="history.back();return false;">&lt;&lt;&nbsp;<bean:message key="showBuyerConfirmContact.back"/></button>
										</td>
										<td width="78%"></td>
									</tr>
								</table>
							</td>
						</tr>
					</logic:equal>
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
