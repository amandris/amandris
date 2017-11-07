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
			if( document.getElementById( "isFree").checked){
				document.getElementById( "textDiv").style.visibility="hidden";	
				document.getElementById( "firstHourPrice").value="";	
				document.getElementById( "additionalHoursPrice").value="";
			} else { 
				document.getElementById( "textDiv").style.visibility="visible";	
				document.getElementById( "firstHourPrice").value="0";	
				document.getElementById( "additionalHoursPrice").value="0";
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
				<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
					<html:form action="setSellerService.do">
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showSellerAddService.text1"/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showSellerAddService.text2"/>
							</td>
						</tr>
						<tr><td height="5"></td></tr>
						<tr>
							<td height="10" align="center" class="errorText">
								<html:errors/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<logic:equal name="addServiceForm" property="noMoreServiceAvailable" value="1">
							<tr>
								<td class="data2Text" align="center">
									<b><bean:message key="showSellerAddService.noService"/></b>
								</td>
							</tr>
						</logic:equal>
						<logic:equal name="addServiceForm" property="noMoreServiceAvailable" value="0">
							<tr>
								<td align="center">
									<table width="90%" cellpadding="0" cellspacing="0">
										<tr height="30">
											<td valign="top" align="left" class="data3Text">
												<bean:message key="showSellerAddService.serviceType"/>
											</td>
										</tr>
										<tr>
											<td>
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td align="right" valign="top" width="40">
															<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="service.1"/>','<bean:message key="showSellerAddService.service1.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
														</td>
														<td align="center" class="data1Text" width="30">
															<logic:equal name="addServiceForm" property="companyWithoutSexEnabled" value="1">
																<html:radio styleClass="form" name="addServiceForm" property="serviceType" value="1"/>
															</logic:equal>
															<logic:equal name="addServiceForm" property="companyWithoutSexEnabled" value="0">
																<input type="radio" class="form" disabled/>
															</logic:equal>
														</td>
														<td align="left" class="data1Text">
															<bean:message key="service.1"/>
														</td>
													</tr>
													<tr>
														<td align="right" valign="top">
															<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="service.2"/>','<bean:message key="showSellerAddService.service2.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
														</td>
														<td align="center" class="data1Text">
															<logic:equal name="addServiceForm" property="companyWithSexEnabled" value="1">
																<html:radio styleClass="form" name="addServiceForm" property="serviceType" value="2"/>
															</logic:equal>
															<logic:equal name="addServiceForm" property="companyWithSexEnabled" value="0">
																<input type="radio" class="form" disabled/>
															</logic:equal>
														</td>
														<td class="data1Text">
															<bean:message key="service.2"/>
														</td>
													</tr>
													<tr>
														<td align="right" valign="top">
															<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="service.4"/>','<bean:message key="showSellerAddService.service4.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
														</td>
														<td align="center" class="data1Text">
															<logic:equal name="addServiceForm" property="sexEnabled" value="1">
																<html:radio styleClass="form" name="addServiceForm" property="serviceType" value="4"/>
															</logic:equal>
															<logic:equal name="addServiceForm" property="sexEnabled" value="0">
																<input type="radio" class="form" disabled/>
															</logic:equal>
														</td>
														<td class="data1Text">
															<bean:message key="service.4"/>
														</td>
													</tr>
													<tr>
														<td align="right" valign="top">
															<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="service.8"/>','<bean:message key="showSellerAddService.service8.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
														</td>
														<td align="center" class="data1Text">
															<logic:equal name="addServiceForm" property="eroticShowEnabled" value="1">
																<html:radio styleClass="form" name="addServiceForm" property="serviceType" value="8"/>
															</logic:equal>
															<logic:equal name="addServiceForm" property="eroticShowEnabled" value="0">
																<input type="radio" class="form" disabled/>
															</logic:equal>
														</td>
														<td class="data1Text">
															<bean:message key="service.8"/>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr><td height="15"></td></tr>
										<tr height="30">
											<td valign="top" align="left" class="data3Text">
												<bean:message key="showSellerAddService.sex"/>
											</td>
										</tr>
										<tr>
											<td>
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td align="right" valign="top" width="40">
															<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="sex.1"/>','<bean:message key="showSellerAddService.sex1.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
														</td>
														<td align="center" class="data1Text" width="30">
															<html:checkbox styleClass="form" name="addServiceForm" property="sex1Checked"/>
														</td>
														<td align="left" class="data1Text">
															<bean:message key="sex.1"/>
														</td>
													</tr>
													<tr>
														<td align="right" valign="top" width="40">
															<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="sex.2"/>','<bean:message key="showSellerAddService.sex2.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
														</td>
														<td align="center" class="data1Text" width="30">
															<html:checkbox styleClass="form" name="addServiceForm" property="sex2Checked"/>
														</td>
														<td align="left" class="data1Text">
															<bean:message key="sex.2"/>
														</td>
													</tr>
													<tr>
														<td align="right" valign="top" width="40">
															<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="sex.4"/>','<bean:message key="showSellerAddService.sex4.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
														</td>
														<td align="center" class="data1Text" width="30">
															<html:checkbox styleClass="form" name="addServiceForm" property="sex4Checked"/>
														</td>
														<td align="left" class="data1Text">
															<bean:message key="sex.4"/>
														</td>
													</tr>
													<tr>
														<td align="right" valign="top" width="40">
															<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="sex.8"/>','<bean:message key="showSellerAddService.sex8.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
														</td>
														<td align="center" class="data1Text" width="30">
															<html:checkbox styleClass="form" name="addServiceForm" property="sex8Checked"/>
														</td>
														<td align="left" class="data1Text">
															<bean:message key="sex.8"/>
														</td>
													</tr>
													<tr>
														<td align="right" valign="top" width="40">
															<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="sex.16"/>','<bean:message key="showSellerAddService.sex16.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
														</td>
														<td align="center" class="data1Text" width="30">
															<html:checkbox styleClass="form" name="addServiceForm" property="sex16Checked"/>
														</td>
														<td align="left" class="data1Text">
															<bean:message key="sex.16"/>
														</td>
													</tr>
													<tr>
														<td align="right" valign="top" width="40">
															<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="sex.32"/>','<bean:message key="showSellerAddService.sex32.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
														</td>
														<td align="center" class="data1Text" width="30">
															<html:checkbox styleClass="form" name="addServiceForm" property="sex32Checked"/>
														</td>
														<td align="left" class="data1Text">
															<bean:message key="sex.32"/>
														</td>
													</tr>
													<tr>
														<td align="right" valign="top" width="40">
															<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="sex.64"/>','<bean:message key="showSellerAddService.sex64.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
														</td>
														<td align="center" class="data1Text" width="30">
															<html:checkbox styleClass="form" name="addServiceForm" property="sex64Checked"/>
														</td>
														<td align="left" class="data1Text">
															<bean:message key="sex.64"/>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr><td height="15"></td></tr>
										<tr height="30">
											<td valign="top" align="left" class="data3Text">
												<bean:message key="showSellerAddService.price"/>
											</td>
										</tr>
										<tr>
											<td>
												<table cellpadding="0" cellspacing="0">
													<tr height="25">
														<td align="right" valign="middle" width="40">
															<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerAddService.free"/>','<bean:message key="showSellerAddService.free.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
														</td>
														<td align="center" class="data1Text" width="30">
															<html:checkbox styleId="isFree" styleClass="form" name="addServiceForm" property="isFree" onclick="javascript:setDivVisibility();"/>
															<input type="hidden" name="isFree" value="false">
														</td>
														<td align="left" class="data1Text">
															<bean:message key="showSellerAddService.free"/>&nbsp;<bean:message key="showSellerAddService.doNotPay"/>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td>
												<div id="textDiv" style="visibility:hidden;">
													<table cellpadding="0" cellspacing="0">
														<tr height="25">
															<td align="right" valign="middle" width="40">
																<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerAddService.firstHourPrice"/>','<bean:message key="showSellerAddService.firstHourPrice.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
															</td>
															<td width="30"></td>
															<td align="left" class="data1Text">
																<bean:message key="showSellerAddService.firstHourPrice"/>
															</td>
															<td align="center" class="data1Text">
																&nbsp;<html:text styleClass="form" styleId="firstHourPrice" name="addServiceForm" property="firstHourPrice" size="3"/>&nbsp;
															</td>
															<td align="left" class="data1Text">
																<bean:write name="addServiceForm" property="currency"/>
															</td>
														</tr>
														<tr height="25">
															<td align="right" valign="middle" width="40">
																<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerAddService.additionalHoursPrice"/>','<bean:message key="showSellerAddService.additionalHoursPrice.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
															</td>
															<td width="30"></td>
															<td align="left" class="data1Text">
																<bean:message key="showSellerAddService.additionalHoursPrice"/>
															</td>
															<td align="center" class="data1Text">
																&nbsp;<html:text styleClass="form" styleId="additionalHoursPrice" name="addServiceForm" property="additionalHoursPrice" size="3"/>&nbsp;
															</td>
															<td align="left" class="data1Text">
																<bean:write name="addServiceForm" property="currency"/>
															</td>
														</tr>
													</table>
												</div>
											</td>
										</tr>
									</table>
									
								</td>
							</tr>
							<tr><td height="70"></td></tr>
							<tr>
								<td>
									<table width="100%" cellpadding="0" cellspacing="0" border="0">
										<tr bgcolor="#C185AA" height="30">
											<td width="50%" class="data1Text" align="left">
												&nbsp;&nbsp;&nbsp;&nbsp;<button class="form" onclick="javascript:history.back();">&lt;&lt;&nbsp;<bean:message key="showSellerEditService.back"/></button>
											</td>
											<td width="50%" class="data1Text" align="right">
												<html:submit styleClass="form"><bean:message key="showSellerAddService.addService"/></html:submit>&nbsp;&nbsp;&nbsp;&nbsp;
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</logic:equal>
						<logic:equal name="addServiceForm" property="noMoreServiceAvailable" value="1">
							<tr><td height="270"></td></tr>
							<tr>
								<td>
									<table width="100%" cellpadding="0" cellspacing="0" border="0">
										<tr bgcolor="#C185AA" height="30">
											<td width="100%" class="data1Text" align="left">
												&nbsp;&nbsp;&nbsp;&nbsp;<button class="form" onclick="javascript:history.back();">&lt;&lt;&nbsp;<bean:message key="showSellerAddService.back"/></button>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</logic:equal>
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
