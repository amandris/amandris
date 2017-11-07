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
					<html:form action="setBuyerProfile.do">
						<tr><td height="5"></td></tr>
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showBuyerProfile.text1"/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
	  						<td align="left">
	  						  	<table cellpadding="0" cellspacing="0" border="0" align="left">
							  		<tr align="center">
				  						<td class="data2Text">
				  							<a href="showBuyerAccount.do">
						  						<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="accountInactive" border="0"/>
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
					  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="buyerProfileActive" border="0"/>
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
										<td align="left" valign="top">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerProfile.intro"/>','<bean:message key="showBuyerProfile.intro.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right" valign="top">
											<b><bean:message key="showBuyerProfile.intro"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left" valign="top">
											<html:textarea property="intro" cols="40" rows="3" styleClass="form"/><bean:message key="common.requiredField"/>
										</td>
									</tr>
									<tr><td height="5"></td><td></td><td></td><td></td><td></td></tr>
									<tr height="30">
										<td align="left"  valign="top">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerProfile.text"/>','<bean:message key="showBuyerProfile.text.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right" valign="top">
											<b><bean:message key="showBuyerProfile.text"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left" valign="top">
											<html:textarea property="text" cols="40" rows="7" styleClass="form"/><bean:message key="common.requiredField"/>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerProfile.height"/>','<bean:message key="showBuyerProfile.height.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerProfile.height"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:select property="height" styleClass="form">
												<html:option value="0"><bean:message key="showBuyerProfile.na"/></html:option>
												<html:option value="1"><bean:message key="height.1"/></html:option>
												<html:option value="2"><bean:message key="height.2"/></html:option>
												<html:option value="4"><bean:message key="height.4"/></html:option>
												<html:option value="8"><bean:message key="height.8"/></html:option>
												<html:option value="16"><bean:message key="height.16"/></html:option>
												<html:option value="32"><bean:message key="height.32"/></html:option>
												<html:option value="64"><bean:message key="height.64"/></html:option>
											</html:select>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerProfile.physique"/>','<bean:message key="showBuyerProfile.physique.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerProfile.physique"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:select property="physique" styleClass="form">
												<html:option value="0"><bean:message key="showBuyerProfile.na"/></html:option>
												<html:option value="1"><bean:message key="physique.1"/></html:option>
												<html:option value="2"><bean:message key="physique.2"/></html:option>
												<html:option value="4"><bean:message key="physique.4"/></html:option>
												<html:option value="8"><bean:message key="physique.8"/></html:option>
												<html:option value="16"><bean:message key="physique.16"/></html:option>
											</html:select>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerProfile.skinColor"/>','<bean:message key="showBuyerProfile.skinColor.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerProfile.skinColor"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:select property="skinColor" styleClass="form">
												<html:option value="0"><bean:message key="showBuyerProfile.na"/></html:option>
												<html:option value="1"><bean:message key="skinColor.1"/></html:option>
												<html:option value="2"><bean:message key="skinColor.2"/></html:option>
												<html:option value="4"><bean:message key="skinColor.4"/></html:option>
												<html:option value="8"><bean:message key="skinColor.8"/></html:option>
											</html:select>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerProfile.origin"/>','<bean:message key="showBuyerProfile.origin.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerProfile.origin"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:select property="origin" styleClass="form">
												<html:option value="0"><bean:message key="showBuyerProfile.na"/></html:option>
												<html:option value="1"><bean:message key="origin.1"/></html:option>
												<html:option value="2"><bean:message key="origin.2"/></html:option>
												<html:option value="4"><bean:message key="origin.4"/></html:option>
												<html:option value="8"><bean:message key="origin.8"/></html:option>
												<html:option value="16"><bean:message key="origin.16"/></html:option>
												<html:option value="32"><bean:message key="origin.32"/></html:option>
												<html:option value="64"><bean:message key="origin.64"/></html:option>
											</html:select>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerProfile.hairColor"/>','<bean:message key="showBuyerProfile.hairColor.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerProfile.hairColor"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:select property="hairColor" styleClass="form">
												<html:option value="0"><bean:message key="showBuyerProfile.na"/></html:option>
												<html:option value="1"><bean:message key="hairColor.1"/></html:option>
												<html:option value="2"><bean:message key="hairColor.2"/></html:option>
												<html:option value="4"><bean:message key="hairColor.4"/></html:option>
												<html:option value="8"><bean:message key="hairColor.8"/></html:option>
												<html:option value="16"><bean:message key="hairColor.16"/></html:option>
											</html:select>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerProfile.hairLength"/>','<bean:message key="showBuyerProfile.hairLength.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerProfile.hairLength"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:select property="hairLength" styleClass="form">
												<html:option value="0"><bean:message key="showBuyerProfile.na"/></html:option>
												<html:option value="1"><bean:message key="hairLength.1"/></html:option>
												<html:option value="2"><bean:message key="hairLength.2"/></html:option>
												<html:option value="4"><bean:message key="hairLength.4"/></html:option>
												<html:option value="8"><bean:message key="hairLength.8"/></html:option>
												<html:option value="16"><bean:message key="hairLength.16"/></html:option>
											</html:select>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerProfile.eyeColor"/>','<bean:message key="showBuyerProfile.eyeColor.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerProfile.eyeColor"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:select property="eyeColor" styleClass="form">
												<html:option value="0"><bean:message key="showBuyerProfile.na"/></html:option>
												<html:option value="1"><bean:message key="eyeColor.1"/></html:option>
												<html:option value="2"><bean:message key="eyeColor.2"/></html:option>
												<html:option value="4"><bean:message key="eyeColor.4"/></html:option>
												<html:option value="8"><bean:message key="eyeColor.8"/></html:option>
											</html:select>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerProfile.pennisSize"/>','<bean:message key="showBuyerProfile.pennisSize.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerProfile.pennisSize"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:select property="pennisSize" styleClass="form">
												<html:option value="0"><bean:message key="showBuyerProfile.na"/></html:option>
												<html:option value="1"><bean:message key="pennisSize.1"/></html:option>
												<html:option value="2"><bean:message key="pennisSize.2"/></html:option>
												<html:option value="4"><bean:message key="pennisSize.4"/></html:option>
												<html:option value="8"><bean:message key="pennisSize.8"/></html:option>
											</html:select>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerProfile.breastSize"/>','<bean:message key="showBuyerProfile.breastSize.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerProfile.breastSize"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:select property="breastSize" styleClass="form">
												<html:option value="0"><bean:message key="showBuyerProfile.na"/></html:option>
												<html:option value="1"><bean:message key="breastSize.1"/></html:option>
												<html:option value="2"><bean:message key="breastSize.2"/></html:option>
												<html:option value="4"><bean:message key="breastSize.4"/></html:option>
												<html:option value="8"><bean:message key="breastSize.8"/></html:option>
											</html:select>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerProfile.orientation"/>','<bean:message key="showBuyerProfile.orientation.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerProfile.orientation"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:select property="orientation" styleClass="form">
												<html:option value="0"><bean:message key="showBuyerProfile.na"/></html:option>
												<html:option value="1"><bean:message key="orientation.1"/></html:option>
												<html:option value="2"><bean:message key="orientation.2"/></html:option>
												<html:option value="4"><bean:message key="orientation.4"/></html:option>
												<html:option value="8"><bean:message key="orientation.8"/></html:option>
											</html:select>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerProfile.smoker"/>','<bean:message key="showBuyerProfile.smoker.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerProfile.smoker"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:select property="smoker" styleClass="form">
												<html:option value="0"><bean:message key="showBuyerProfile.na"/></html:option>
												<html:option value="1"><bean:message key="smoker.1"/></html:option>
												<html:option value="2"><bean:message key="smoker.2"/></html:option>
												<html:option value="4"><bean:message key="smoker.4"/></html:option>
											</html:select>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerProfile.educationLevel"/>','<bean:message key="showBuyerProfile.educationLevel.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerProfile.educationLevel"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:select property="educationLevel" styleClass="form">
												<html:option value="0"><bean:message key="showBuyerProfile.na"/></html:option>
												<html:option value="1"><bean:message key="educationLevel.1"/></html:option>
												<html:option value="2"><bean:message key="educationLevel.2"/></html:option>
												<html:option value="4"><bean:message key="educationLevel.4"/></html:option>
												<html:option value="8"><bean:message key="educationLevel.8"/></html:option>
											</html:select>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showBuyerProfile.language"/>','<bean:message key="showBuyerProfile.language.help"/>', 480, 300); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerProfile.language1"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:select property="language1" styleClass="form">
												<html:option value="0"><bean:message key="showBuyerProfile.na"/></html:option>
												<html:option value="1"><bean:message key="language.1"/></html:option>
												<html:option value="2"><bean:message key="language.2"/></html:option>
												<html:option value="4"><bean:message key="language.4"/></html:option>
												<html:option value="8"><bean:message key="language.8"/></html:option>
												<html:option value="8"><bean:message key="language.16"/></html:option>
												<html:option value="8"><bean:message key="language.32"/></html:option>
												<html:option value="8"><bean:message key="language.64"/></html:option>
												<html:option value="8"><bean:message key="language.128"/></html:option>
												<html:option value="8"><bean:message key="language.256"/></html:option>
											</html:select>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerProfile.language2"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:select property="language2" styleClass="form">
												<html:option value="0"><bean:message key="showBuyerProfile.na"/></html:option>
												<html:option value="1"><bean:message key="language.1"/></html:option>
												<html:option value="2"><bean:message key="language.2"/></html:option>
												<html:option value="4"><bean:message key="language.4"/></html:option>
												<html:option value="8"><bean:message key="language.8"/></html:option>
												<html:option value="8"><bean:message key="language.16"/></html:option>
												<html:option value="8"><bean:message key="language.32"/></html:option>
												<html:option value="8"><bean:message key="language.64"/></html:option>
												<html:option value="8"><bean:message key="language.128"/></html:option>
												<html:option value="8"><bean:message key="language.256"/></html:option>
											</html:select>
										</td>
									</tr>
									<tr height="30">
										<td align="left">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showBuyerProfile.language3"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:select property="language3" styleClass="form">
												<html:option value="0"><bean:message key="showBuyerProfile.na"/></html:option>
												<html:option value="1"><bean:message key="language.1"/></html:option>
												<html:option value="2"><bean:message key="language.2"/></html:option>
												<html:option value="4"><bean:message key="language.4"/></html:option>
												<html:option value="8"><bean:message key="language.8"/></html:option>
												<html:option value="8"><bean:message key="language.16"/></html:option>
												<html:option value="8"><bean:message key="language.32"/></html:option>
												<html:option value="8"><bean:message key="language.64"/></html:option>
												<html:option value="8"><bean:message key="language.128"/></html:option>
												<html:option value="8"><bean:message key="language.256"/></html:option>
											</html:select>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td height="40"></td></tr>
						<tr>
							<td align="right">
								<html:submit styleClass="form"><bean:message key="showBuyerProfile.save"/></html:submit>
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
