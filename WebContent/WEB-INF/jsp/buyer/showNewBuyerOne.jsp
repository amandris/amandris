<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/amandris.tld" prefix="amandris" %>

<tiles:insert template='../tiles/amandrisBuyerTile.jsp'>
	<tiles:put name='logoTile' content='logoTile.jsp'/>
	<tiles:put name='footer1Tile' content='footer1Tile.jsp'/>
	<tiles:put name='footer2Tile' content='footer2Tile.jsp'/>
	<tiles:put name='footer3Tile' content='footer3Tile.jsp'/>
	<tiles:put name='body' type='string'>
	
	<script language="javascript" type="text/javascript">
		function showCheckUserName()
		{
			var value = "";
			
			value = document.getElementById( "login").value;
			
			var url="showCheckUserName.do?userName=" + value + "&type=buyer";
			
			window.open(url, "Amandris" ,"height=230px,width=216px,top=200px, left=200px, toolbar=no,minimize=no,status=no,memubar=no,location=no,scrollbars=no");
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
					<html:form action="showNewBuyerTwo.do">
						<html:hidden property="page" value="1"/>
						<tr><td height="5"></td></tr>
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showNewBuyerOne.text1"/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showNewBuyerOne.text2"/>&nbsp;<a href="showPrivacyPolicy.do" class="data1Link"><bean:message key="showNewBuyerOne.here"/></a>.
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td class="errorText" align="center">
								<html:errors/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td class="data3Text" align="left">
								<b><bean:message key="showNewBuyerOne.title"/></b>
							</td>
						</tr>
						<tr><td height="5"></td></tr>
						<tr><td height="1" background="pictures/pixel.gif"></td></tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0" align="left">
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewBuyerOne.login"/>','<bean:message key="showNewBuyerOne.login.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewBuyerOne.login"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="login" styleId="login" size="20" styleClass="form"/><bean:message key="common.requiredField"/>&nbsp;&nbsp;&nbsp;
											<input type="button" class="form" onclick="javascript:showCheckUserName();" value="<bean:message key="showNewBuyerOne.checkAvailability"/>">
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewBuyerOne.password"/>','<bean:message key="showNewBuyerOne.password.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewBuyerOne.password"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:password property="password" size="15" styleClass="form"/><bean:message key="common.requiredField"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewBuyerOne.repeatPassword"/>','<bean:message key="showNewBuyerOne.repeatPassword.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewBuyerOne.repeatPassword"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:password property="repeatPassword" size="15" styleClass="form"/><bean:message key="common.requiredField"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewBuyerOne.email"/>','<bean:message key="showNewBuyerOne.email.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewBuyerOne.email"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="email" size="20" styleClass="form"/><bean:message key="common.requiredField"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewBuyerOne.repeatEmail"/>','<bean:message key="showNewBuyerOne.repeatEmail.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewBuyerOne.repeatEmail"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="repeatEmail" size="20" styleClass="form"/><bean:message key="common.requiredField"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewBuyerOne.sex"/>','<bean:message key="showNewBuyerOne.sex.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewBuyerOne.sex"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:select property="sex" styleClass="form">
												<html:option value="-1"><bean:message key="showNewBuyerOne.selectYourSex"/></html:option>
												<html:option value="1"><bean:message key="sex.1"/></html:option>
												<html:option value="2"><bean:message key="sex.2"/></html:option>
												<html:option value="4"><bean:message key="sex.4"/></html:option>
												<html:option value="8"><bean:message key="sex.8"/></html:option>
												<html:option value="16"><bean:message key="sex.16"/></html:option>
												<html:option value="32"><bean:message key="sex.32"/></html:option>
												<html:option value="64"><bean:message key="sex.64"/></html:option>
											</html:select>
											<bean:message key="common.requiredField"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewBuyerOne.birthDate"/>','<bean:message key="showNewBuyerOne.birthDate.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewBuyerOne.birthDate"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="birthDate" styleClass="form" size="8"/>
											<bean:message key="common.requiredField"/>&nbsp;&nbsp;&nbsp;
											<bean:message key="showNewBuyerOne.birthDateFormat"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td height="5"></td></tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0" align="left">
									<tr>
										<td align="left" valign="top">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewBuyerOne.country"/>','<bean:message key="showNewBuyerOne.country.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text">
											<amandris:countryStateTag 	name="countryState" 
																		formName="newBuyerForm" 
																		styleClass="form" 
																		countryKey="showNewBuyerOne.country" 
																		stateKey="showNewBuyerOne.state"
																		withAny="false"
																		withEmpty="true"/>
																		
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td height="5"></td></tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0" align="left">
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewBuyerOne.city"/>','<bean:message key="showNewBuyerOne.city.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewBuyerOne.city"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="city" size="20" styleClass="form"/><bean:message key="common.requiredField"/>
										</td>
									</tr>
									
									<%--
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewBuyerOne.address1"/>','<bean:message key="showNewBuyerOne.address1.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewBuyerOne.address1"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="address1" size="20" styleClass="form"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewBuyerOne.address2"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="address2" size="20" styleClass="form"/>
										</td>
									</tr>
									
									
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewBuyerOne.postalCode"/>','<bean:message key="showNewBuyerOne.postalCode.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewBuyerOne.postalCode"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="postalCode" size="8" styleClass="form"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewBuyerOne.name"/>','<bean:message key="showNewBuyerOne.name.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewBuyerOne.name"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="name" size="20" styleClass="form"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewBuyerOne.surname"/>','<bean:message key="showNewBuyerOne.surname.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewBuyerOne.surname"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="surname" size="20" styleClass="form"/>
										</td>
									</tr>
									--%>
								</table>
							</td>
						</tr>
						<tr>
							<td align="right">
								<html:submit styleClass="form"><bean:message key="showNewBuyerOne.continue"/></html:submit>
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
