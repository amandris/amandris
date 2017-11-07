<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

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
			<td height="450" align="center">	
				<table width="90%" cellspadding="0" cellspacing="0" border="0">
					<tr>
						<td class="data2Text" align="center">
							<b><bean:message key="showBuyerSellerContactWays.text"/>&nbsp;
								<a href="showSeller.do?id=<bean:write name="contactWays" property="sellerId"/>" class="data2Link">
									<bean:write name="contactWays" property="sellerLogin"/>
								</a>
							</b>
						</td>
					</tr>
					<tr><td height="20"></td></tr>
					<tr>
						<td align="center">
							<table cellpadding="5" cellspacing="0" border="0">
								<tr>
									<td class="data2Text">
										<bean:message key="showBuyerSellerContactWays.contactWay"/>
									</td>
									<td width="20"></td>
									<td class="data2Text">
										<bean:message key="showBuyerSellerContactWays.allowed"/>
									</td>
									<td width="20"></td>
									<td class="data2Text" align="center">
										<bean:message key="showBuyerSellerContactWays.contact"/>
									</td>
								</tr>
								<tr>
									<td background="pictures/pixel.gif"></td>
									<td background="pictures/pixel.gif"></td>
									<td background="pictures/pixel.gif"></td>
									<td background="pictures/pixel.gif"></td>
									<td background="pictures/pixel.gif"></td>
								</tr>
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0">
											<tr>
												<td>
													<img src="pictures/messagesIcon.gif"/>&nbsp;
												</td>
												<td width="5"></td>
												<td class="data1Text">
													<b><bean:message key="showBuyerSellerContactWays.amandrisMessage"/></b>
												</td>
											</tr>
										</table>
									</td>
									<td width="20"></td>
									<td class="data1Text" align="center">
										<img src="pictures/yesIcon.gif"/>
									</td>
									<td width="20"></td>
									<td class="data1Text" align="center">
										<button class="form" onclick="document.location.href='showBuyerSendContactMessage.do?id=<bean:write name="contactWays" property="contactId"/>';"><bean:message key="showBuyerSellerContactWays.sendMessage"/></button>
									</td>
								</tr>
								<tr>
									<td class="data1Text">
										<table cellpadding="0" cellspacing="0">
											<tr>
												<td>
													<img src="pictures/emailIcon.gif"/>&nbsp;
												</td>
												<td width="5"></td>
												<td class="data1Text">
													<b><bean:message key="showBuyerSellerContactWays.email"/></b>
												</td>
											</tr>
										</table>
									</td>
									<td width="20"></td>
									<td align="center">
										<logic:equal name="contactWays" property="allowEmail" value="1">
											<img src="pictures/yesIcon.gif"/>
										</logic:equal>
										<logic:equal name="contactWays" property="allowEmail" value="0">
											<img src="pictures/noIcon.gif"/>
										</logic:equal>
									</td>
									<td width="20"></td>
									<td class="data1Text" align="center">
										<logic:equal name="contactWays" property="allowEmail" value="1">
											<bean:write name="contactWays" property="email"/>
										</logic:equal>
										<logic:equal name="contactWays" property="allowEmail" value="0">
											-
										</logic:equal>
									</td>
								</tr>
								<tr>
									<td class="data1Text">
										<table cellpadding="0" cellspacing="0">
											<tr>
												<td>
													<img src="pictures/chatIcon.gif"/>&nbsp;
												</td>
												<td width="5"></td>
												<td class="data1Text">
													<b><bean:message key="showBuyerSellerContactWays.messenger"/></b>
												</td>
											</tr>
										</table>
									</td>
									<td width="20"></td>
									<td align="center">
										<logic:equal name="contactWays" property="allowMessenger" value="1">
											<img src="pictures/yesIcon.gif"/>
										</logic:equal>
										<logic:equal name="contactWays" property="allowMessenger" value="0">
											<img src="pictures/noIcon.gif"/>
										</logic:equal>
									</td>
									<td width="20"></td>
									<td class="data1Text" align="center">
										<logic:equal name="contactWays" property="allowMessenger" value="1">
											<bean:write name="contactWays" property="messenger"/>
										</logic:equal>
										<logic:equal name="contactWays" property="allowMessenger" value="0">
											-
										</logic:equal>
									</td>
								</tr>
								<tr>
									<td class="data1Text">
										<table cellpadding="0" cellspacing="0">
											<tr>
												<td>
													<img src="pictures/phoneCallIcon.gif"/>&nbsp;
												</td>
												<td width="5"></td>
												<td class="data1Text">
													<b><bean:message key="showBuyerSellerContactWays.phoneCall"/></b>
												</td>
											</tr>
										</table>
									</td>
									<td width="20"></td>
									<td align="center">
										<logic:equal name="contactWays" property="allowPhoneCall" value="1">
											<img src="pictures/yesIcon.gif"/>
										</logic:equal>
										<logic:equal name="contactWays" property="allowPhoneCall" value="0">
											<img src="pictures/noIcon.gif"/>
										</logic:equal>
									</td>
									<td width="20"></td>
									<td class="data1Text" align="center">
										<logic:equal name="contactWays" property="allowPhoneCall" value="1">
											<bean:write name="contactWays" property="phoneCall"/>
										</logic:equal>
										<logic:equal name="contactWays" property="allowPhoneCall" value="0">
											-
										</logic:equal>
									</td>
								</tr>
								<tr>
									<td class="data1Text">
										<table cellpadding="0" cellspacing="0">
											<tr>
												<td>
													<img src="pictures/smsIcon.gif"/>&nbsp;
												</td>
												<td width="5"></td>
												<td class="data1Text">
													<b><bean:message key="showBuyerSellerContactWays.sms"/></b>
												</td>
											</tr>
										</table>
									</td>
									<td width="20"></td>
									<td align="center">
										<logic:equal name="contactWays" property="allowSms" value="1">
											<img src="pictures/yesIcon.gif"/>
										</logic:equal>
										<logic:equal name="contactWays" property="allowSms" value="0">
											<img src="pictures/noIcon.gif"/>
										</logic:equal>
									</td>
									<td width="20"></td>
									<td class="data1Text" align="center">
										<logic:equal name="contactWays" property="allowSms" value="1">
											<bean:write name="contactWays" property="sms"/>
										</logic:equal>
										<logic:equal name="contactWays" property="allowSms" value="0">
											-
										</logic:equal>
									</td>
								</tr>
								<tr>
									<td class="data1Text">
										<table cellpadding="0" cellspacing="0">
											<tr>
												<td>
													<img src="pictures/skypeIcon.gif"/>&nbsp;
												</td>
												<td width="5"></td>
												<td class="data1Text">
													<b><bean:message key="showBuyerSellerContactWays.skype"/></b>
												</td>
											</tr>
										</table>
									</td>
									<td width="20"></td>
									<td align="center">
										<logic:equal name="contactWays" property="allowSkype" value="1">
											<img src="pictures/yesIcon.gif"/>
										</logic:equal>
										<logic:equal name="contactWays" property="allowSkype" value="0">
											<img src="pictures/noIcon.gif"/>
										</logic:equal>
									</td>
									<td width="20"></td>
									<td class="data1Text" align="center">
										<logic:equal name="contactWays" property="allowSkype" value="1">
											<bean:write name="contactWays" property="skype"/>
										</logic:equal>
										<logic:equal name="contactWays" property="allowSkype" value="0">
											-
										</logic:equal>
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
