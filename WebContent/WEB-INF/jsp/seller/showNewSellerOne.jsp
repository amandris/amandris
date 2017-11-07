<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/amandris.tld" prefix="amandris" %>

<tiles:insert template='../tiles/amandrisSellerTile.jsp'>
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
			
			var url="showCheckUserName.do?userName=" + value + "&type=seller";
			
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
					<html:form action="showNewSellerTwo.do">
						<html:hidden property="page" value="1"/>
						<html:hidden property="isEscort" value="0"/>
						<tr><td height="5"></td></tr>
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showNewSellerOne.text1"/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showNewSellerOne.text2"/>&nbsp;<a href="showPrivacyPolicy.do" class="data1Link"><bean:message key="showNewSellerOne.here"/></a>.
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
								<b><bean:message key="showNewSellerOne.title"/></b>
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
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewSellerOne.login"/>','<bean:message key="showNewSellerOne.login.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewSellerOne.login"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="login" styleId="login" size="20" styleClass="form"/><bean:message key="common.requiredField"/>&nbsp;&nbsp;&nbsp;
											<input type="button" class="form" onclick="javascript:showCheckUserName();" value="<bean:message key="showNewSellerOne.checkAvailability"/>">
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewSellerOne.password"/>','<bean:message key="showNewSellerOne.password.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewSellerOne.password"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:password property="password" size="15" styleClass="form"/><bean:message key="common.requiredField"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewSellerOne.repeatPassword"/>','<bean:message key="showNewSellerOne.repeatPassword.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewSellerOne.repeatPassword"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:password property="repeatPassword" size="15" styleClass="form"/><bean:message key="common.requiredField"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewSellerOne.email"/>','<bean:message key="showNewSellerOne.email.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewSellerOne.email"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="email" size="20" styleClass="form"/><bean:message key="common.requiredField"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewSellerOne.repeatEmail"/>','<bean:message key="showNewSellerOne.repeatEmail.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewSellerOne.repeatEmail"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="repeatEmail" size="20" styleClass="form"/><bean:message key="common.requiredField"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewSellerOne.sex"/>','<bean:message key="showNewSellerOne.sex.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewSellerOne.sex"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:select property="sex" styleClass="form">
												<html:option value="-1"><bean:message key="showNewSellerOne.selectYourSex"/></html:option>
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
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewSellerOne.birthDate"/>','<bean:message key="showNewSellerOne.birthDate.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewSellerOne.birthDate"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="birthDate" styleClass="form" size="8"/>
											<bean:message key="common.requiredField"/>&nbsp;&nbsp;&nbsp;
											<bean:message key="showNewSellerOne.birthDateFormat"/>
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
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewSellerOne.country"/>','<bean:message key="showNewSellerOne.country.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text">
											<amandris:countryStateTag 	name="countryState" 
																		formName="newSellerForm" 
																		styleClass="form" 
																		countryKey="showNewSellerOne.country" 
																		stateKey="showNewSellerOne.state"
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
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewSellerOne.city"/>','<bean:message key="showNewSellerOne.city.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewSellerOne.city"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="city" size="20" styleClass="form"/><bean:message key="common.requiredField"/>
										</td>
									</tr>
									<%--
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewSellerOne.address1"/>','<bean:message key="showNewSellerOne.address1.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewSellerOne.address1"/></b>
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
											<b><bean:message key="showNewSellerOne.address2"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="address2" size="20" styleClass="form"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewSellerOne.postalCode"/>','<bean:message key="showNewSellerOne.postalCode.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewSellerOne.postalCode"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="postalCode" size="8" styleClass="form"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewSellerOne.name"/>','<bean:message key="showNewSellerOne.name.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewSellerOne.name"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="name" size="20" styleClass="form"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewSellerOne.surname"/>','<bean:message key="showNewSellerOne.surname.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewSellerOne.surname"/></b>
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
								<html:submit styleClass="form"><bean:message key="showNewSellerOne.continue"/></html:submit>
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
