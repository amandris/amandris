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
					<html:form action="setSellerAccount.do">
						<tr><td height="5"></td></tr>
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showSellerAccount.text1"/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showSellerAccount.text2"/>&nbsp;<a href="showPrivacyPolicy.do" class="data1Link"><bean:message key="showSellerAccount.here"/></a>.
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
	  						<td align="left">
	  						  	<table cellpadding="0" cellspacing="0" border="0" align="left">
							  		<tr align="center">
				  						<td class="data2Text">
				  							<a href="showSellerAccount.do">
						  						<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="sellerAccountActive" border="0"/>
						  					</a>
				  						</td>
				  						<td width="10"></td>
				  						<td class="data2Text">
					  						<a href="showSellerPassword.do">
					  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="passwordInactive" border="0"/>
					  						</a>
				  						</td>
				  						<td width="10"></td>
				  						<td class="data2Text">
					  						<a href="showSellerProfile.do">
					  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="profileInactive" border="0"/>
					  						</a>
				  						</td>
				  						<logic:equal name="sellerSession" property="isEscort" value="0">	
					  						<td width="10"></td>
					  						<td class="data2Text">
						  						<a href="showSellerPreferences.do">
						  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="preferencesInactive" border="0"/>
						  						</a>
					  						</td>
					  					</logic:equal>
				  						<td width="10"></td>
				  						<td class="data2Text">
					  						<a href="showSellerPictures.do">
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
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showSellerAccount.sex"/>','<bean:message key="showSellerAccount.sex.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showSellerAccount.sex"/></b>
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
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showSellerAccount.birthDate"/>','<bean:message key="showSellerAccount.birthDate.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showSellerAccount.birthDate"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="birthDate" styleClass="form" size="8"/>
											<bean:message key="common.requiredField"/>&nbsp;&nbsp;&nbsp;
											<bean:message key="showSellerAccount.birthDateFormat"/>
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
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showSellerAccount.country"/>','<bean:message key="showSellerAccount.country.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text">
											<amandris:countryStateTag 	name="countryState" 
																		formName="sellerAccountForm" 
																		styleClass="form" 
																		countryKey="showSellerAccount.country" 
																		stateKey="showSellerAccount.state"
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
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showSellerAccount.city"/>','<bean:message key="showSellerAccount.city.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showSellerAccount.city"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="city" size="20" styleClass="form"/><bean:message key="common.requiredField"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showSellerAccount.address1"/>','<bean:message key="showSellerAccount.address1.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showSellerAccount.address1"/></b>
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
											<b><bean:message key="showSellerAccount.address2"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="address2" size="20" styleClass="form"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showSellerAccount.postalCode"/>','<bean:message key="showSellerAccount.postalCode.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showSellerAccount.postalCode"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="postalCode" size="8" styleClass="form"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showSellerAccount.name"/>','<bean:message key="showSellerAccount.name.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showSellerAccount.name"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="name" size="20" styleClass="form"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showSellerAccount.surname"/>','<bean:message key="showSellerAccount.surname.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showSellerAccount.surname"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:text property="surname" size="20" styleClass="form"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left" >
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showSellerAccount.sendNews"/>','<bean:message key="showSellerAccount.sendNews.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="30"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showSellerAccount.sendNews"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:checkbox property="sendNews" styleClass="form"/>
											<input type="hidden" name="sendNews" value="false"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="right">
								<html:submit styleClass="form"><bean:message key="showSellerAccount.save"/></html:submit>
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
