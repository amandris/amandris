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
		function setDivVisibility()
		{
			if( document.getElementById( "hasMeetingPlace").checked){
				document.getElementById( "meetingPlaceDiv").style.display="block";	
			} else { 
				document.getElementById( "meetingPlaceDiv").style.display="none";	
			}
			
			if( document.getElementById( "buyerPaysDisplacement").checked){
				document.getElementById( "displacementDiv").style.display="block";	
			} else { 
				document.getElementById( "displacementDiv").style.display="none";	
			}
			
			if( document.getElementById( "paymentBeforeDate").checked){
				document.getElementById( "paymentDiv").style.display="block";	
			} else { 
				document.getElementById( "paymentDiv").style.display="none";	
			}
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
			<td height="450">	
				<table width="90%" cellpadding="0" cellspacing="0" border="0" align="center">
					<html:form action="setSellerParameter.do">
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showSellerParameter.text1"/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showSellerParameter.text2"/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
	  						<td align="left">
	  						  	<table cellpadding="0" cellspacing="0" border="0" align="left">
							  		<tr align="center">
								  		<td class="data2Text">
				  							<a href="showSellerCalendar.do">
						  						<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="calendarInactive" border="0"/>
						  					</a>
				  						</td>
				  						<td width="10"></td>
				  						<td class="data2Text">
					  						<a href="showSellerService.do">
					  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="serviceInactive" border="0"/>
					  						</a>
				  						</td>
				  						<td width="10"></td>
				  						<td class="data2Text">
					  						<a href="showSellerParameter.do">
					  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="parameterActive" border="0"/>
					  						</a>
				  						</td>
				  						<logic:equal name="sellerSession" property="isEscort" value="0">
					  						<td width="10"></td>
					  						<td class="data2Text">
						  						<a href="showSellerPromotion.do">
						  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="promotionInactive" border="0"/>
						  						</a>
					  						</td>
					  					</logic:equal>
							  		</tr>
							  	</table>
	  						</td>
				  		</tr>			  
						<tr><td height="10"></td></tr>
						<tr>
							<td height="5" align="center" class="errorText">
								<html:errors/>
							</td>
						</tr>
						<tr><td height="5"></td></tr>
						<tr><td height="1" background="pictures/pixel.gif"></td></tr>
						<tr><td height="5"></td></tr>
						<tr>
							<td align="center">
								<table width="100%" cellpadding="0" cellspacing="0">
									<tr height="20">
										<td class="data3Text">
											<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerParameter.meetingPlace"/>','<bean:message key="showSellerParameter.meetingPlace.help"/>', 480, 300); Activate();" onMouseout="deActivate();">&nbsp;
											<bean:message key="showSellerParameter.meetingPlace"/>
										</td>
									</tr>
									<tr><td height="15"></td></tr>
									<tr>
										<td>
											<table cellpadding="0" cellspacing="0">
												<tr>
													<td width="30">
														<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerParameter.hasMeetingPlace"/>','<bean:message key="showSellerParameter.hasMeetingPlace.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
													</td>
													<td>
														<html:checkbox styleClass="form" styleId="hasMeetingPlace" name="sellerParameterForm" property="hasMeetingPlace" onclick="javascript:setDivVisibility();"/>
														<input type="hidden" name="hasMeetingPlace" value="false"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.hasMeetingPlace"/>&nbsp;
														<bean:message key="showSellerParameter.markMeetingPlace"/>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr><td height="15"></td></tr>
									<tr>
										<td>
											<div id="meetingPlaceDiv" style="display:none;">
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td width="180" class="data1Text">
															<bean:message key="showSellerParameter.meetingAddress1"/>
														</td>
														<td>
															<html:text styleClass="form" name="sellerParameterForm" property="meetingAddress1" size="24"/>
														</td>
													</tr>
													<tr>
														<td class="data1Text">
															<bean:message key="showSellerParameter.meetingAddress2"/>
														</td>
														<td>
															<html:text styleClass="form" name="sellerParameterForm" property="meetingAddress2" size="24"/>
														</td>
													</tr>
													<tr>
														<td class="data1Text">
															<bean:message key="showSellerParameter.meetingPostalCode"/>
														</td>
														<td>
															<html:text styleClass="form" name="sellerParameterForm" property="meetingPostalCode" size="5"/>
														</td>
													</tr>
													<tr>
														<td class="data1Text">
															<bean:message key="showSellerParameter.meetingCity"/>
														</td>
														<td>
															<html:text styleClass="form" name="sellerParameterForm" property="meetingCity" size="16"/>
														</td>
													</tr>
													<tr>
														<td class="data1Text">
															<bean:message key="showSellerParameter.meetingState"/>
														</td>
														<td>
															<html:text styleClass="form" name="sellerParameterForm" property="meetingState" size="16"/>
														</td>
													</tr>
													<tr>
														<td class="data1Text">
															<bean:message key="showSellerParameter.meetingCountry"/>
														</td>
														<td>
															<html:text styleClass="form" name="sellerParameterForm" property="meetingCountry" size="16"/>
														</td>
													</tr>
													<tr>
														<td class="data1Text">
															<bean:message key="showSellerParameter.googleMapsUrl"/>
														</td>
														<td>
															<html:text styleClass="form" name="sellerParameterForm" property="googleMapsUrl" size="36"/>
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr><td height="1" background="pictures/pixel.gif"></td></tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td align="center">
								<table width="100%" cellpadding="0" cellspacing="0">
									<tr height="20">
										<td class="data3Text">
											<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerParameter.sexualActions"/>','<bean:message key="showSellerParameter.sexualActions.help"/>', 480, 300); Activate();" onMouseout="deActivate();">&nbsp;
											<bean:message key="showSellerParameter.sexualActions"/>
										</td>
									</tr>
									<tr><td height="15"></td></tr>
									<tr>
										<td>
											<table cellpadding="0" cellspacing="0">
												<tr>
													<td>
														<html:checkbox styleClass="form" name="sellerParameterForm" property="oralSex"/>
														<input type="hidden" name="oralSex" value="false"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.oralSex"/>
													</td>
												</tr>
												<tr>
													<td>
														<html:checkbox styleClass="form" name="sellerParameterForm" property="analSex"/>
														<input type="hidden" name="analSex" value="false"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.analSex"/>
													</td>
												</tr>
												<tr>
													<td>
														<html:checkbox styleClass="form" name="sellerParameterForm" property="bdsm"/>
														<input type="hidden" name="bsdm" value="false"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.bdsm"/>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						
						<tr><td height="10"></td></tr>
						<tr><td height="1" background="pictures/pixel.gif"></td></tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td align="center">
								<table width="100%" cellpadding="0" cellspacing="0">
									<tr height="20">
										<td class="data3Text">
											<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerParameter.placesToHaveSex"/>','<bean:message key="showSellerParameter.placesToHaveSex.help"/>', 480, 300); Activate();" onMouseout="deActivate();">&nbsp;
											<bean:message key="showSellerParameter.placesToHaveSex"/>
										</td>
									</tr>
									<tr><td height="15"></td></tr>
									<tr>
										<td>
											<table cellpadding="0" cellspacing="0">
												<tr>
													<td>
														<html:checkbox styleClass="form" name="sellerParameterForm" property="inSellerHouse"/>
														<input type="hidden" name="inSellerHouse" value="false"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.inSellerHouse"/>
													</td>
												</tr>
												<tr>
													<td>
														<html:checkbox styleClass="form" name="sellerParameterForm" property="inBuyerHouse"/>
														<input type="hidden" name="inBuyerHouse" value="false"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.inBuyerHouse"/>
													</td>
												</tr>
												<tr>
													<td>
														<html:checkbox styleClass="form" name="sellerParameterForm" property="inHotel"/>
														<input type="hidden" name="inHotel" value="false"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.inHotel"/>
													</td>
												</tr>
												<tr>
													<td>
														<html:checkbox styleClass="form" name="sellerParameterForm" property="inCar"/>
														<input type="hidden" name="inCar" value="false"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.inCar"/>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr><td height="1" background="pictures/pixel.gif"></td></tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td align="center">
								<table width="100%" cellpadding="0" cellspacing="0">
									<tr height="20">
										<td class="data3Text">
											<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerParameter.contactWays"/>','<bean:message key="showSellerParameter.contactWays.help"/>', 480, 300); Activate();" onMouseout="deActivate();">&nbsp;
											<bean:message key="showSellerParameter.contactWays"/>
										</td>
									</tr>
									<tr><td height="15"></td></tr>
									<tr>
										<td>
											<table cellpadding="0" cellspacing="0">
												<tr>
													<td>
														<html:checkbox styleClass="form" name="sellerParameterForm" property="allowSms"/>
														<input type="hidden" name="allowSms" value="false"/>
													</td>
													<td class="data1Text" width="250">
														<bean:message key="showSellerParameter.allowSms"/>
													</td>
													<td class="data1Text" width="200">
														<bean:message key="showSellerParameter.phoneNumberSms"/>
													</td>
													<td>
														<html:text styleClass="form" name="sellerParameterForm" property="phoneNumberSMS" size="15"/>
													</td>
												</tr>
												<tr>
													<td>
														<html:checkbox styleClass="form" name="sellerParameterForm" property="allowPhoneCall"/>
														<input type="hidden" name="allowPhoneCall" value="false"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.allowPhoneCall"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.phoneNumberCall"/>
													</td>
													<td>
														<html:text styleClass="form" name="sellerParameterForm" property="phoneNumberCall" size="15"/>
													</td>
												</tr>
												<tr>
													<td>
														<html:checkbox styleClass="form" name="sellerParameterForm" property="allowUrl"/>
														<input type="hidden" name="allowUrl" value="false"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.allowUrl"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.url"/>
													</td>
													<td>
														<html:text styleClass="form" name="sellerParameterForm" property="url" size="15"/>
													</td>
												</tr>
												<tr>
													<td>
														<html:checkbox styleClass="form" name="sellerParameterForm" property="allowSkype"/>
														<input type="hidden" name="allowSkype" value="false"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.allowSkype"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.skypeAccount"/>
													</td>
													<td>
														<html:text styleClass="form" name="sellerParameterForm" property="skypeAccount" size="15"/>
													</td>
												</tr>
												<tr>
													<td>
														<html:checkbox styleClass="form" name="sellerParameterForm" property="allowMessenger"/>
														<input type="hidden" name="allowMessenger" value="false"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.allowMessenger"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.messengerAccount"/>
													</td>
													<td>
														<html:text styleClass="form" name="sellerParameterForm" property="messengerAccount"/>
													</td>
												</tr>
												<tr>
													<td>
														<html:checkbox styleClass="form" name="sellerParameterForm" property="allowEmail"/>
														<input type="hidden" name="allowEmail" value="false"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.allowEmail"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.emailAccount"/>:
													</td>
													<td class="data1Text">
														<b><bean:write name="sellerSession" property="email"/>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						
						<tr><td height="10"></td></tr>
						<tr><td height="1" background="pictures/pixel.gif"></td></tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td align="center">
								<table width="100%" cellpadding="0" cellspacing="0">
									<tr height="20">
										<td class="data3Text">
											<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerParameter.paymentWays"/>','<bean:message key="showSellerParameter.paymentWays.help"/>', 480, 300); Activate();" onMouseout="deActivate();">&nbsp;
											<bean:message key="showSellerParameter.paymentWays"/>
										</td>
									</tr>
									<tr><td height="15"></td></tr>
									<tr>
										<td>
											<table cellpadding="0" cellspacing="0">
												<tr>
													<td width="30">
														<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerParameter.paymentBeforeDate"/>','<bean:message key="showSellerParameter.paymentBeforeDate.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
													</td>
													<td>
														<html:checkbox styleClass="form" styleId="paymentBeforeDate" name="sellerParameterForm" property="paymentBeforeDate" onclick="javascript:setDivVisibility();"/>
														<input type="hidden" name="paymentBeforeDate" value="false"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.paymentBeforeDate"/>&nbsp;
														<bean:message key="showSellerParameter.markPaymentBeforeDate"/>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr><td height="15"></td></tr>
									<tr>
										<td>
											<div id="paymentDiv" style="display:none;">
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td>
															<html:checkbox styleClass="form" name="sellerParameterForm" property="allowPaypalPayment"/>
															<input type="hidden" name=allowPaypalPayment value="false"/>
														</td>
														<td class="data1Text" width="250">
															<bean:message key="showSellerParameter.allowPaypalPayment"/>
														</td>
														<td class="data1Text" width="200">
															<bean:message key="showSellerParameter.paypalAccount"/>
														</td>
														<td>
															<html:text styleClass="form" name="sellerParameterForm" property="paypalAccount" size="15"/>
														</td>
													</tr>
													<tr>
														<td>
															<html:checkbox styleClass="form" name="sellerParameterForm" property="allowBankPayment"/>
															<input type="hidden" name="allowBankPayment" value="false"/>
														</td>
														<td class="data1Text">
															<bean:message key="showSellerParameter.allowBankPayment"/>
														</td>
														<td class="data1Text">
															<bean:message key="showSellerParameter.bankAccount"/>
														</td>
														<td>
															<html:text styleClass="form" name="sellerParameterForm" property="bankAccount" size="25"/>
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>


						<tr><td height="10"></td></tr>
						<tr><td height="1" background="pictures/pixel.gif"></td></tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td align="center">
								<table width="100%" cellpadding="0" cellspacing="0">

									<tr height="20">
										<td class="data3Text">
											<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerParameter.displacement"/>','<bean:message key="showSellerParameter.displacement.help"/>', 480, 300); Activate();" onMouseout="deActivate();">&nbsp;
											<bean:message key="showSellerParameter.displacement"/>
										</td>
									</tr>
									<tr><td height="15"></td></tr>
									<tr>
										<td>
											<table cellpadding="0" cellspacing="0">
												<tr>
													<td width="30">
														<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerParameter.buyerPaysDisplacement"/>','<bean:message key="showSellerParameter.buyerPaysDisplacement.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
													</td>
													<td>
														<html:checkbox styleClass="form" styleId="buyerPaysDisplacement" name="sellerParameterForm" property="buyerPaysDisplacement" onclick="javascript:setDivVisibility();"/>
														<input type="hidden" name="buyerPaysDisplacement" value="false"/>
													</td>
													<td class="data1Text">
														<bean:message key="showSellerParameter.buyerPaysDisplacement"/>&nbsp;
														<bean:message key="showSellerParameter.markPaysDisplacement"/>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr><td height="15"></td></tr>
									<tr>
										<td>
											<div id="displacementDiv" style="display:none;">
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td width="30">
															<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerParameter.displacementPrize"/>','<bean:message key="showSellerParameter.displacementPrize.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
														</td>
														<td width="180" class="data1Text">
															<bean:message key="showSellerParameter.displacementPrize"/>
														</td>
														<td class="data1Text">
															<html:text styleClass="form" name="sellerParameterForm" property="displacementPrize" size="4"/>&nbsp;
															<bean:write name="sellerParameterForm" property="currencyText"/>
														</td>
													</tr>
												</table>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td height="20"></td></tr>
						
						<tr>
							<td>
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tr bgcolor="#C185AA" height="30">
										<td width="50%" class="data1Text" align="right">
											<html:submit styleClass="form"><bean:message key="showSellerParameter.save"/></html:submit>&nbsp;&nbsp;&nbsp;&nbsp;
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
				<script language="javascript" >
					javascript:setDivVisibility();
				</script>
			</td>
		</tr>
	</table>
</tiles:put>
</tiles:insert>
