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
					<html:form action="setSellerEditService.do">
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showSellerEditService.text1"/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showSellerEditService.text2"/>
							</td>
						</tr>
						<tr><td height="5"></td></tr>
						<tr>
							<td height="10" align="center" class="errorText">
								<html:errors/>
								<html:hidden name="editServiceForm" property="serviceType"/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>

						<tr>
							<td align="center">
								<table width="90%" cellpadding="0" cellspacing="0">
								<tr height="30">
										<td valign="top" align="left" class="data3Text">
											<bean:message key="showSellerEditService.serviceType"/>:&nbsp;
											<bean:write name="editServiceForm" property="serviceTypeText"/>
										</td>
									</tr>
									<tr><td height="15"></td></tr>
									<tr height="30">
										<td valign="top" align="left" class="data3Text">
											<bean:message key="showSellerEditService.sex"/>
										</td>
									</tr>
									<tr>
										<td valign="top" align="left" class="data1Text">
											&nbsp;&nbsp;(<bean:message key="showSellerEditService.text3"/>)
										</td>
									</tr>
									<tr><td height="15"></td></tr>
									<tr>
										<td>
											<table cellpadding="0" cellspacing="0">
												<tr>
													<td align="right" valign="top" width="40">
														<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="sex.1"/>','<bean:message key="showSellerEditService.sex1.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
													</td>
													<td align="center" class="data1Text" width="30">
														<html:checkbox styleClass="form" name="editServiceForm" property="sex1Checked"/>
														<input type="hidden" name="sex1Checked" value="false"/>
													</td>
													<td align="left" class="data1Text">
														<bean:message key="sex.1"/>
													</td>
												</tr>
												<tr>
													<td align="right" valign="top" width="40">
														<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="sex.2"/>','<bean:message key="showSellerEditService.sex2.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
													</td>
													<td align="center" class="data1Text" width="30">
														<html:checkbox styleClass="form" name="editServiceForm" property="sex2Checked"/>
														<input type="hidden" name="sex2Checked" value="false"/>
													</td>
													<td align="left" class="data1Text">
														<bean:message key="sex.2"/>
													</td>
												</tr>
												<tr>
													<td align="right" valign="top" width="40">
														<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="sex.4"/>','<bean:message key="showSellerEditService.sex4.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
													</td>
													<td align="center" class="data1Text" width="30">
														<html:checkbox styleClass="form" name="editServiceForm" property="sex4Checked"/>
														<input type="hidden" name="sex4Checked" value="false"/>
													</td>
													<td align="left" class="data1Text">
														<bean:message key="sex.4"/>
													</td>
												</tr>
												<tr>
													<td align="right" valign="top" width="40">
														<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="sex.8"/>','<bean:message key="showSellerEditService.sex8.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
													</td>
													<td align="center" class="data1Text" width="30">
														<html:checkbox styleClass="form" name="editServiceForm" property="sex8Checked"/>
														<input type="hidden" name="sex8Checked" value="false"/>
													</td>
													<td align="left" class="data1Text">
														<bean:message key="sex.8"/>
													</td>
												</tr>
												<tr>
													<td align="right" valign="top" width="40">
														<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="sex.16"/>','<bean:message key="showSellerEditService.sex16.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
													</td>
													<td align="center" class="data1Text" width="30">
														<html:checkbox styleClass="form" name="editServiceForm" property="sex16Checked"/>
														<input type="hidden" name="sex16Checked" value="false"/>
													</td>
													<td align="left" class="data1Text">
														<bean:message key="sex.16"/>
													</td>
												</tr>
												<tr>
													<td align="right" valign="top" width="40">
														<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="sex.32"/>','<bean:message key="showSellerEditService.sex32.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
													</td>
													<td align="center" class="data1Text" width="30">
														<html:checkbox styleClass="form" name="editServiceForm" property="sex32Checked"/>
														<input type="hidden" name="sex32Checked" value="false"/>
													</td>
													<td align="left" class="data1Text">
														<bean:message key="sex.32"/>
													</td>
												</tr>
												<tr>
													<td align="right" valign="top" width="40">
														<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="sex.64"/>','<bean:message key="showSellerEditService.sex64.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
													</td>
													<td align="center" class="data1Text" width="30">
														<html:checkbox styleClass="form" name="editServiceForm" property="sex64Checked"/>
														<input type="hidden" name="sex64Checked" value="false"/>
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
											<bean:message key="showSellerEditService.price"/>
										</td>
									</tr>
									<tr>
										<td>
											<table cellpadding="0" cellspacing="0">
												<tr height="25">
													<td align="right" valign="middle" width="40">
														<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerEditService.free"/>','<bean:message key="showSellerEditService.free.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
													</td>
													<td align="center" class="data1Text" width="30">
														<html:checkbox styleId="isFree" styleClass="form" name="editServiceForm" property="isFree" onclick="javascript:setDivVisibility();"/>
														<input type="hidden" name="isFree" value="false">
													</td>
													<td align="left" class="data1Text">
														<bean:message key="showSellerEditService.free"/>&nbsp;<bean:message key="showSellerEditService.doNotPay"/>
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
															<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerEditService.firstHourPrice"/>','<bean:message key="showSellerEditService.firstHourPrice.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
														</td>
														<td width="30"></td>
														<td align="left" class="data1Text">
															<bean:message key="showSellerEditService.firstHourPrice"/>
														</td>
														<td align="center" class="data1Text">
															&nbsp;<html:text styleClass="form" styleId="firstHourPrice" name="editServiceForm" property="firstHourPrice" size="3"/>&nbsp;
														</td>
														<td align="left" class="data1Text">
															<bean:write name="editServiceForm" property="currency"/>
														</td>
													</tr>
													<tr height="25">
														<td align="right" valign="middle" width="40">
															<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="showSellerEditService.additionalHoursPrice"/>','<bean:message key="showSellerEditService.additionalHoursPrice.help"/>', 480, 300); Activate();" onMouseout="deActivate();">
														</td>
														<td width="30"></td>
														<td align="left" class="data1Text">
															<bean:message key="showSellerEditService.additionalHoursPrice"/>
														</td>
														<td align="center" class="data1Text">
															&nbsp;<html:text styleClass="form" styleId="additionalHoursPrice" name="editServiceForm" property="additionalHoursPrice" size="3"/>&nbsp;
														</td>
														<td align="left" class="data1Text">
															<bean:write name="editServiceForm" property="currency"/>
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
											<html:submit styleClass="form"><bean:message key="showSellerEditService.editService"/></html:submit>&nbsp;&nbsp;&nbsp;&nbsp;
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
