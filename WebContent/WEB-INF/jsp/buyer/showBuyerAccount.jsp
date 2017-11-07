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
					<html:form action="setBuyerAccount.do">
						<tr><td height="5"></td></tr>
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showBuyerAccount.text1"/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showBuyerAccount.text2"/>&nbsp;<a href="showPrivacyPolicy.do" class="data1Link"><bean:message key="showBuyerAccount.here"/></a>.
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
	  						<td align="left">
	  						  	<table cellpadding="0" cellspacing="0" border="0" align="left">
							  		<tr align="center">
				  						<td class="data2Text">
				  							<a href="showBuyerAccount.do">
						  						<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="buyerAccountActive" border="0"/>
						  					</a>
				  						</td>
				  						<td width="10"></td>
				  						<td class="data2Text">
					  						<a href="showBuyerPassword.do">
					  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="passwordInactive" border="0"/>
					  						</a>
				  						</td>
				  						<td width="10"></td>
				  						<td class="data2Text">
					  						<a href="showBuyerProfile.do">
					  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="profileInactive" border="0"/>
					  						</a>
				  						</td>
				  						<td width="10"></td>
				  						<td class="data2Text">
					  						<a href="showBuyerPreferences.do">
					  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="preferencesInactive" border="0"/>
					  						</a>
				  						</td>
				  						<td width="10"></td>
				  						<td class="data2Text">
					  						<a href="showBuyerPictures.do">
					  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="picturesInactive" border="0"/>
					  						</a>
				  						</td>
							  		</tr>
							  	</table>
	  						</td>
				  		</tr>			  
						<tr><td height="10"></td></tr>
						<tr>
							<td class="errorText" align="center">
								<html:errors/>
							</td>
						</tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0" align="left">
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerAccount.sex"/>','<bean:message key="showBuyerAccount.sex.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerAccount.sex"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:select property="sex" styleClass="form">
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
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerAccount.birthDate"/>','<bean:message key="showBuyerAccount.birthDate.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerAccount.birthDate"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="birthDate" styleClass="form" size="8"/>
											<bean:message key="common.requiredField"/>&nbsp;&nbsp;&nbsp;
											<bean:message key="showBuyerAccount.birthDateFormat"/>
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
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerAccount.country"/>','<bean:message key="showBuyerAccount.country.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text">
											<amandris:countryStateTag 	name="countryState" 
																		formName="buyerAccountForm" 
																		styleClass="form" 
																		countryKey="showBuyerAccount.country" 
																		stateKey="showBuyerAccount.state"
																		withAny="false"/>
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
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerAccount.city"/>','<bean:message key="showBuyerAccount.city.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerAccount.city"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="city" size="20" styleClass="form"/><bean:message key="common.requiredField"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerAccount.address1"/>','<bean:message key="showBuyerAccount.address1.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerAccount.address1"/></b>
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
											<b><bean:message key="showBuyerAccount.address2"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="address2" size="20" styleClass="form"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerAccount.postalCode"/>','<bean:message key="showBuyerAccount.postalCode.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerAccount.postalCode"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="postalCode" size="8" styleClass="form"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerAccount.name"/>','<bean:message key="showBuyerAccount.name.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerAccount.name"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="name" size="20" styleClass="form"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerAccount.surname"/>','<bean:message key="showBuyerAccount.surname.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerAccount.surname"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="surname" size="20" styleClass="form"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left" >
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerAccount.sendBulletin"/>','<bean:message key="showBuyerAccount.sendBulletin.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerAccount.sendBulletin"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:checkbox property="sendBulletin" styleClass="form"/>
											<input type="hidden" name="sendBulletin" value="false"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left" >
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerAccount.sendNews"/>','<bean:message key="showBuyerAccount.sendNews.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="30"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerAccount.sendNews"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:checkbox property="sendNews" styleClass="form"/>
											<input type="hidden" name="sendNews" value="false"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left" >
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerAccount.isPublic"/>','<bean:message key="showBuyerAccount.isPublic.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right" >
											<b><bean:message key="showBuyerAccount.isPublic"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left" >
											<html:checkbox property="isPublic" styleClass="form"/>
											<input type="hidden" name="isPublic" value="false"/>
										</td>
									</tr>
									
									
								</table>
							</td>
						</tr>
						<tr>
							<td align="right">
								<html:submit styleClass="form"><bean:message key="showBuyerAccount.save"/></html:submit>
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
