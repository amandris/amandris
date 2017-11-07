<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/amandris.tld" prefix="amandris" %>

<tiles:insert template='../tiles/amandrisBuyerTile.jsp'>
	<tiles:put name='logoTile' content='logoTile.jsp'/>
	<logic:present name="buyerSession">
		<tiles:put name='buyerMenuTile' content='buyerMenuTile.jsp'/>
	</logic:present>
	<logic:present name="sellerSession">
		<tiles:put name='sellerMenuTile' content='sellerMenuTile.jsp'/>
	</logic:present>
	<tiles:put name='footer1Tile' content='footer1Tile.jsp'/>
	<tiles:put name='footer2Tile' content='footer2Tile.jsp'/>
	<tiles:put name='footer3Tile' content='footer3Tile.jsp'/>
	<tiles:put name='body' type='string'>
	
	
	<table width="720" cellpadding="0" cellspacing="0" border="0" valign="top">
		<tr valign="top">
			<td width="240">
				<table width="240" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="240">
							<table width="240" cellpadding="0" cellspacing="0" border="0" >
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
									<td width="224" height="300">
										<table width="100%" cellpadding="0" cellspacing="0">
											<tr>
												<td>
													<table width="100%" cellpadding="0" cellspacing="0">
														<tr>
															<td valign="top">
																<table width="100%" cellpadding="0" cellspacing="0">
																	<tr>
																		<td align="center" valign="top">
																			<logic:equal name="seller" property="hasPicture" value="1">
																  				<img src="/media/pictures/smaller/seller_<bean:write name="seller" property="id"/>_<bean:write name="seller" property="mainPicture"/>_<bean:write name="seller" property="mainPictureCode"/>.jpg"/>
																  			</logic:equal>
																  			<logic:notEqual name="seller" property="hasPicture" value="1">
																  				<logic:equal name="seller" property="sexId" value="1">
																	  				<img src="pictures/defaultGirl.gif"/>
																	  			</logic:equal>
																  				<logic:equal name="seller" property="sexId" value="2">
																	  				<img src="pictures/defaultBoy.gif"/>
																	  			</logic:equal>
																  				<logic:equal name="seller" property="sexId" value="4">
																	  				<img src="pictures/defaultShemale.gif"/>
																	  			</logic:equal>
																  				<logic:equal name="seller" property="sexId" value="8">
																	  				<img src="pictures/defaultBoysCouple.gif"/>
																	  			</logic:equal>
																  				<logic:equal name="seller" property="sexId" value="16">
																	  				<img src="pictures/defaultGirlsCouple.gif"/>
																	  			</logic:equal>
																  				<logic:equal name="seller" property="sexId" value="32">
																	  				<img src="pictures/defaultBoyAndGirlCouple.gif"/>
																	  			</logic:equal>
																  				<logic:equal name="seller" property="sexId" value="64">
																	  				<img src="pictures/defaultGroup.gif"/>
																	  			</logic:equal>
																  			</logic:notEqual>
																		</td>
																	</tr>
																	<logic:equal name="seller" property="hasPicture" value="1">
																		<tr>
																			<td class="data1Text" align="center">
																				<a href="showSellerProfilePictures.do?id=<bean:write name="seller" property="id"/>" class="data1Link"><bean:write name="seller" property="pictureCount"/></a>&nbsp;
																				<logic:equal name="seller" property="pictureCount" value="1">
																					<bean:message key="showSeller.picture"/>
																				</logic:equal>
																				<logic:notEqual name="seller" property="pictureCount" value="1">
																					<bean:message key="showSeller.pictures"/>
																				</logic:notEqual>
																				
																			</td>
																		</tr>																	
																	</logic:equal>
																</table>
															</td>
															<td width="10"></td>
															<td>
																<table cellspadding="0" cellspacing="0">
																	<tr>
																		<td class="data3Text" title="<bean:write name="seller" property="login"/>">
																			<bean:write name="seller" property="briefLogin"/>
																		</td>
																	</tr>
																	<tr>
																		<td class="data2Text">
																			<b><bean:message key="showSeller.sex"/></b>:&nbsp;<bean:write name="seller" property="sex"/>
																		</td>
																	</tr>
																	<tr>
																		<td class="data2Text">
																			<b><bean:message key="showSeller.age"/></b>:&nbsp;<bean:write name="seller" property="age"/>
																		</td>
																	</tr>
																	<tr>
																		<td class="data2Text">
																			<b><bean:message key="showSeller.country"/></b>:&nbsp;<bean:write name="seller" property="country"/>
																		</td>
																	</tr>
																	<tr>
																		<td class="data2Text">
																			<b><bean:message key="showSeller.state"/></b>:&nbsp;<bean:write name="seller" property="state"/>
																		</td>
																	</tr>
																	<tr>
																		<td class="data2Text" title="<bean:write name="seller" property="city"/>">
																			<b><bean:message key="showSeller.city"/></b>:&nbsp;<bean:write name="seller" property="briefCity"/>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<table cellpadding="0" cellspacing="0">
																				<tr>
																					<td class="data2Text" title="Votos">
																						<b><span style="color:#00AA00;"><bean:write name="seller" property="positiveVotes"/></span>&nbsp;/&nbsp;<span style="color:#AA0000;"><bean:write name="seller" property="negativeVotes"/></span></b>&nbsp;
																					</td>
																					<td>
																						<logic:equal name="seller" property="userLevel" value="0">
																							<img src="pictures/userLevel0.gif" alt="<bean:message key="showSeller.userLevel0"/>"/>
																						</logic:equal>
																						<logic:equal name="seller" property="userLevel" value="1">
																							<img src="pictures/userLevel1.gif" alt="<bean:message key="showSeller.userLevel1"/>"/>
																						</logic:equal>
																						<logic:equal name="seller" property="userLevel" value="2">
																							<img src="pictures/userLevel2.gif" alt="<bean:message key="showSeller.userLevel2"/>"/>
																						</logic:equal>
																						<logic:equal name="seller" property="userLevel" value="3">
																							<img src="pictures/userLevel3.gif" alt="<bean:message key="showSeller.userLevel3"/>"/>
																						</logic:equal>
																						<logic:equal name="seller" property="userLevel" value="4">
																							<img src="pictures/userLevel4.gif" alt="<bean:message key="showSeller.userLevel4"/>"/>
																						</logic:equal>
																						<logic:equal name="seller" property="userLevel" value="5">
																							<img src="pictures/userLevel5.gif" alt="<bean:message key="showSeller.userLevel5"/>"/>
																						</logic:equal>
																						<logic:equal name="seller" property="userLevel" value="6">
																							<img src="pictures/userLevel6.gif" alt="<bean:message key="showSeller.userLevel6"/>"/>
																						</logic:equal>
																						<logic:equal name="seller" property="userLevel" value="7">
																							<img src="pictures/userLevel7.gif" alt="<bean:message key="showSeller.userLevel7"/>"/>
																						</logic:equal>
																					</td>
																				</tr>
																			</table>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<a href="showOtherSellerVote.do?id=<bean:write name="seller" property="id"/>" class="data1Link"><bean:message key="showSeller.seeAllVotes"/></a>
																		</td>
																	</tr>	
																	<logic:equal name="seller" property="hasAlbum" value="1">
																		<tr>
																			<td>
																				<logic:present name="buyerSession">
																					<a href="showAlbum.do?id=<bean:write name="seller" property="id"/>" class="data1Link"><bean:message key="showSeller.seeAlbum"/></a>
																				</logic:present>
																				<logic:present name="sellerSession">
																					<a href="showAlbum.do?id=<bean:write name="seller" property="id"/>" class="data1Link"><bean:message key="showSeller.seeAlbum"/></a>
																				</logic:present>
																				<logic:notPresent name="buyerSession">
																					<logic:notPresent name="sellerSession">
																						<a href="showNeedToRegister.do" class="data1Link"><bean:message key="showSeller.seeAlbum"/></a>
																					</logic:notPresent>
																				</logic:notPresent>
																			</td>
																		</tr>
																	</logic:equal>
																</table>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr><td height="20"></td></tr>
											<logic:notPresent name="sellerSession">
												<tr>
													<td align="center">
														<logic:present name="buyerSession">
															<a href="showBuyerStartContact.do?id=<bean:write name="seller" property="id"/>">
																<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="contactBig" border="0"/>
															</a>
														</logic:present>
														<logic:notPresent name="buyerSession">
															<a href="showNeedToRegister.do">
																<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="contactBig" border="0"/>
															</a>
														</logic:notPresent>
													</td>
												</tr>
											</logic:notPresent>
										</table>
									</td>
									<td width="8" background="pictures/borderRight.gif">
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
						</td>
					</tr>
					<tr><td height="5"></td></tr>
					<tr>
						<td width="240">
							<table width="240" cellpadding="0" cellspacing="0" border="0" >
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
									<td width="224" height="380">
										<table width="100%" cellpadding="0" cellspacing="0" border="0" >
											<tr>
												<td class="data2Text">
													<b><bean:write name="seller" property="intro"/></b>
												</td>
											</tr>
											<tr><td height="10"></td></tr>
											<tr>
												<td class="data1Text">
													<bean:write name="seller" property="text"/>
												</td>
											</tr>
											<tr><td height="15"></td></tr>
											<tr>
												<td>
													<table width="100%" cellpadding="0" cellspacing="0" border="0" >
														<tr>
															<td class="data2Text">
																<b><bean:message key="showSeller.data"/></b>
															</td>
														</tr>
														<tr><td height="10"></td></tr>
														<tr>
															<td>
																<table width="100%" cellpadding="0" cellspacing="0" border="0" >
																	<logic:notEqual name="seller" property="origin" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.origin"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="origin"/>
																			</td>
																		</tr>
																	</logic:notEqual>
																	<logic:notEqual name="seller" property="language" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.language"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="language"/>
																			</td>
																		</tr>
																	</logic:notEqual>														
																	<logic:notEqual name="seller" property="orientation" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.orientation"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="orientation"/>
																			</td>
																		</tr>
																	</logic:notEqual>														
																	<logic:notEqual name="seller" property="height" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.height"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="height"/>
																			</td>
																		</tr>
																	</logic:notEqual>														
																	<logic:notEqual name="seller" property="skinColor" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.skinColor"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="skinColor"/>
																			</td>
																		</tr>
																	</logic:notEqual>														
																	<logic:notEqual name="seller" property="hairColor" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.hairColor"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="hairColor"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="seller" property="hairLength" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.hairLength"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="hairLength"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	
																	<logic:notEqual name="seller" property="eyeColor" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.eyeColor"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="eyeColor"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="seller" property="physique" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.physique"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="physique"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="seller" property="breastSize" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.breastSize"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="breastSize"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="seller" property="pennisSize" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.pennisSize"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="pennisSize"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="seller" property="educationLevel" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.educationLevel"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="educationLevel"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="seller" property="smoker" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.smoker"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="smoker"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																</table>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
									<td width="8" background="pictures/borderRight.gif">
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
						</td>						
					</tr>	
				</table>			
			</td>
			<td width="5"></td>
			<td width="475">
				<table width="475" cellpadding="0" cellspacing="0" border="0" >
					<tr>	
						<td>
							<table width="475" cellpadding="0" cellspacing="0" border="0" >
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
									<td width="459" height="300" valign="middle">	
										<table cellpadding="0" cellspacing="0" align="center">
											<tr>
												<td align="center">
													<table cellpadding="3" cellspacing="0" border="1" class="data1Text" >
														<tr bgcolor="#AE377D">
															<td class="data2Text" style="color:#FFFFFF;">
																<b><bean:message key="showSeller.service"/></b>
															</td>
															<td class="data2Text" style="color:#FFFFFF;">
																<b><bean:message key="showSeller.price"/></b>
															</td>
															<td width="100" class="data2Text" style="color:#FFFFFF;">
																<b><bean:message key="showSeller.with"/></b>
															</td>
														</tr>
														<tr>
															<td nowrap>
																<bean:message key="showSeller.companyWithoutSex"/>
															</td>
															<td nowrap>
																<logic:notEqual name="sellerService" property="companyWithoutSexPrice" value="">
																	<logic:equal name="sellerService" property="companyWithoutSexIsToAsk" value="1">
																		<span style="color:#000AA;"><b><bean:message key="showSeller.toAsk"/><b></span>
																	</logic:equal>
																	<logic:equal name="sellerService" property="companyWithoutSexIsToAsk" value="0">
																		<logic:equal name="sellerService" property="companyWithoutSexIsFree" value="1">
																			<span style="color:#00AA00;"><b><bean:message key="showSeller.free"/><b></span>
																		</logic:equal>
																		<logic:equal name="sellerService" property="companyWithoutSexIsFree" value="0">
																			<b><bean:write name="sellerService" property="companyWithoutSexPrice"/></b>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSeller.firstHour"/><br>
																			<b><bean:write name="sellerService" property="companyWithoutSexAdditionalHoursPrice"/></b>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSeller.additionalHours"/>
																		</logic:equal>	
																	</logic:equal>											
																</logic:notEqual>
																<logic:equal name="sellerService" property="companyWithoutSexPrice" value="">
																	<bean:message key="showSeller.notAllowed"/>
																</logic:equal>
															</td>
															<td>
																&nbsp;<bean:write name="sellerService" property="companyWithoutSexSex"/>
															</td>
														</tr>
														<tr>
															<td nowrap>
																<bean:message key="showSeller.companyWithSex"/>
															</td>
															<td nowrap>
																<logic:notEqual name="sellerService" property="companyWithSexPrice" value="">
																	<logic:equal name="sellerService" property="companyWithSexIsToAsk" value="1">
																		<span style="color:#000AA;"><b><bean:message key="showSeller.toAsk"/><b></span>
																	</logic:equal>
																	<logic:equal name="sellerService" property="companyWithSexIsToAsk" value="0">
																		<logic:equal name="sellerService" property="companyWithSexIsFree" value="1">
																			<span style="color:#00AA00;"><b><bean:message key="showSeller.free"/><b></span>
																		</logic:equal>
																		<logic:equal name="sellerService" property="companyWithSexIsFree" value="0">
																			<b><bean:write name="sellerService" property="companyWithSexPrice"/></b>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSeller.firstHour"/><br>
																			<b><bean:write name="sellerService" property="companyWithSexAdditionalHoursPrice"/></b>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSeller.additionalHours"/>
																		</logic:equal>	
																	</logic:equal>											
																</logic:notEqual>
																<logic:equal name="sellerService" property="companyWithSexPrice" value="">
																	<bean:message key="showSeller.notAllowed"/>
																</logic:equal>
															</td>
															<td>
																&nbsp;<bean:write name="sellerService" property="companyWithSexSex"/>
															</td>
														</tr>
														<tr>
															<td nowrap>
																<bean:message key="showSeller.serviceSex"/>
															</td>
															<td nowrap>
																<logic:notEqual name="sellerService" property="sexPrice" value="">
																	<logic:equal name="sellerService" property="sexIsToAsk" value="1">
																		<span style="color:#000AA;"><b><bean:message key="showSeller.toAsk"/><b></span>
																	</logic:equal>
																	<logic:equal name="sellerService" property="sexIsToAsk" value="0">
																		<logic:equal name="sellerService" property="sexIsFree" value="1">
																			<span style="color:#00AA00;"><b><bean:message key="showSeller.free"/><b></span>
																		</logic:equal>
																		<logic:equal name="sellerService" property="sexIsFree" value="0">
																			<b><bean:write name="sellerService" property="sexPrice"/></b>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSeller.firstHour"/><br>
																			<b><bean:write name="sellerService" property="sexAdditionalHoursPrice"/></b>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSeller.additionalHours"/>
																		</logic:equal>
																	</logic:equal>												
																</logic:notEqual>
																
																	
																<logic:equal name="sellerService" property="sexPrice" value="">
																	<bean:message key="showSeller.notAllowed"/>
																</logic:equal>
															</td>
															<td>
																&nbsp;<bean:write name="sellerService" property="sexSex"/>
															</td>
														</tr>
														<tr>
															<td nowrap>
																<bean:message key="showSeller.eroticShow"/>
															</td>
															<td>
																<logic:notEqual name="sellerService" property="eroticShowPrice" value="">
																	<logic:equal name="sellerService" property="eroticShowIsToAsk" value="1">
																		<span style="color:#000AA;"><b><bean:message key="showSeller.toAsk"/><b></span>
																	</logic:equal>
																	<logic:equal name="sellerService" property="eroticShowIsToAsk" value="0">
																		<logic:equal name="sellerService" property="eroticShowIsFree" value="1">
																			<span style="color:#00AA00;"><b><bean:message key="showSeller.free"/><b></span>
																		</logic:equal>
																		<logic:equal name="sellerService" property="eroticShowIsFree" value="0">
																			<b><bean:write name="sellerService" property="eroticShowPrice"/></b>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSeller.firstHour"/><br>
																			<b><bean:write name="sellerService" property="eroticShowAdditionalHoursPrice"/></b>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSeller.additionalHours"/>
																		</logic:equal>		
																	</logic:equal>										
																</logic:notEqual>
																<logic:equal name="sellerService" property="eroticShowPrice" value="">
																	<bean:message key="showSeller.notAllowed"/>
																</logic:equal>
															</td>
															<td>
																&nbsp;<bean:write name="sellerService" property="eroticShowSex"/>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr><td height="7"></td></tr>
											<tr>
												<td>
													<table cellpadding="0" cellsapcing="0" border="0">
														<tr>
															<td valign="top">
																<table cellpadding="0" cellsapcing="0" border="0">
																	<tr>
																		<td>
																			<table cellpadding="0" cellspacing="0" border="0">
																				<tr>
																					<td class="data1Text" align="right">
																						<b><bean:message key="showSeller.paymentInDate"/></b>&nbsp;
																					</td>
																					<td align="left">
																						<logic:equal name="seller" property="paymentBeforeDate" value="1">
																							<img src="pictures/noIcon.gif"/>
																						</logic:equal>
																						<logic:equal name="seller" property="paymentBeforeDate" value="0">
																							<img src="pictures/yesIcon.gif"/>
																						</logic:equal>
																					</td>
																				</tr>
																				<logic:equal name="seller" property="paymentBeforeDate" value="1">																				
																					<tr>
																						<td class="data1Text" align="right">
																							<b><bean:message key="showSeller.allowBankPayment"/></b>&nbsp;
																						</td>
																						<td align="left">
																							<logic:equal name="seller" property="allowBankPayment" value="1">
																								<img src="pictures/yesIcon.gif"/>
																							</logic:equal>
																							<logic:equal name="seller" property="allowBankPayment" value="0">
																								<img src="pictures/noIcon.gif"/>
																							</logic:equal>
																						</td>
																					</tr>
																					<tr>
																						<td class="data1Text" align="right">
																							<b><bean:message key="showSeller.allowPaypalPayment"/></b>&nbsp;
																						</td>
																						<td align="left">
																							<logic:equal name="seller" property="allowPaypalPayment" value="1">
																								<img src="pictures/yesIcon.gif"/>
																							</logic:equal>
																							<logic:equal name="seller" property="allowPaypalPayment" value="0">
																								<img src="pictures/noIcon.gif"/>
																							</logic:equal>
																						</td>
																					</tr>
																				</logic:equal>																																			
																				<tr>
																					<td class="data1Text" align="right">
																						<b><bean:message key="showSeller.iPayDisplacement"/></b>&nbsp;
																					</td>
																					<td align="left">
																						<logic:equal name="seller" property="buyerPaysDisplacement" value="1">
																							<img src="pictures/noIcon.gif"/>
																						</logic:equal>
																						<logic:equal name="seller" property="buyerPaysDisplacement" value="0">
																							<img src="pictures/yesIcon.gif"/>
																						</logic:equal>
																					</td>
																				</tr>
																			</table>
																		</td>
																	</tr>
																</table>
															</td>
															<td width="10"></td>
															<td valign="top">
																<table cellpadding="0" cellsapcing="0" border="0">
																	<tr>
																		<td class="data1Text" align="right">
																			<b><bean:message key="showSeller.oralSex"/></b>&nbsp;
																		</td>
																		<td class="data1Text" align="left">
																			<logic:equal name="seller" property="oralSex" value="1">
																				<img src="pictures/yesIcon.gif"/>
																			</logic:equal>
																			<logic:equal name="seller" property="oralSex" value="0">
																				<img src="pictures/noIcon.gif"/>
																			</logic:equal>
																		</td>
																	</tr>
																	<tr>
																		<td class="data1Text" align="right">
																			<b><bean:message key="showSeller.analSex"/></b>&nbsp;
																		</td>
																		<td class="data1Text" align="left">
																			<logic:equal name="seller" property="analSex" value="1">
																				<img src="pictures/yesIcon.gif"/>
																			</logic:equal>
																			<logic:equal name="seller" property="analSex" value="0">
																				<img src="pictures/noIcon.gif"/>
																			</logic:equal>
																		</td>
																	</tr>
																	<tr>
																		<td class="data1Text" align="right">
																			<b><bean:message key="showSeller.bdsm"/></b>&nbsp;
																		</td>
																		<td class="data1Text" align="left">
																			<logic:equal name="seller" property="bdsm" value="1">
																				<img src="pictures/yesIcon.gif"/>
																			</logic:equal>
																			<logic:equal name="seller" property="bdsm" value="0">
																				<img src="pictures/noIcon.gif"/>
																			</logic:equal>
																		</td>
																	</tr>
																</table>
															</td>
															<td width="10"></td>
															<td valign="top">
																<table cellpadding="0" cellsapcing="0" border="0">
																	<tr>
																		<td class="data1Text" align="right">
																			<b><bean:message key="showSeller.inSellerHouse"/></b>&nbsp;
																		</td>
																		<td class="data1Text" align="left">
																			<logic:equal name="seller" property="inSellerHouse" value="1">
																				<img src="pictures/yesIcon.gif"/>
																			</logic:equal>
																			<logic:equal name="seller" property="inSellerHouse" value="0">
																				<img src="pictures/noIcon.gif"/>
																			</logic:equal>
																		</td>
																	</tr>
																	<tr>
																		<td class="data1Text" align="right">
																			<b><bean:message key="showSeller.inBuyerHouse"/></b>&nbsp;
																		</td>
																		<td class="data1Text" align="left">
																			<logic:equal name="seller" property="inBuyerHouse" value="1">
																				<img src="pictures/yesIcon.gif"/>
																			</logic:equal>
																			<logic:equal name="seller" property="inBuyerHouse" value="0">
																				<img src="pictures/noIcon.gif"/>
																			</logic:equal>
																		</td>
																	</tr>
																	<tr>
																		<td class="data1Text" align="right">
																			<b><bean:message key="showSeller.inHotel"/></b>&nbsp;
																		</td>
																		<td class="data1Text" align="left">
																			<logic:equal name="seller" property="inHotel" value="1">
																				<img src="pictures/yesIcon.gif"/>
																			</logic:equal>
																			<logic:equal name="seller" property="inHotel" value="0">
																				<img src="pictures/noIcon.gif"/>
																			</logic:equal>
																		</td>
																	</tr>
																	<tr>
																		<td class="data1Text" align="right">
																			<b><bean:message key="showSeller.inCar"/></b>&nbsp;
																		</td>
																		<td class="data1Text" align="left">
																			<logic:equal name="seller" property="inCar" value="1">
																				<img src="pictures/yesIcon.gif"/>
																			</logic:equal>
																			<logic:equal name="seller" property="inCar" value="0">
																				<img src="pictures/noIcon.gif"/>
																			</logic:equal>
																		</td>
																	</tr>																	
																</table>
															</td>															
														</tr>
													</table>
												</td>
											</tr>
											<tr><td height="10"></td></tr>
											<tr>
												<td align="right">
													<table cellpadding="0" cellspacing="0" border="0" align="right">
														<tr>
															<td class="data1Text">
																<b><bean:message key="showSeller.acceptedWays"/></b>
															</td>
															<td width="10"></td>
															<td>
																<img src="pictures/messagesIcon.gif" alt="<bean:message key="showSeller.amandrisMessage"/>"/>
																<logic:equal name="seller" property="allowEmail" value="1">
																	<img src="pictures/emailIcon.gif" alt="<bean:message key="showSeller.email"/>"/>
																</logic:equal>	
																<logic:equal name="seller" property="allowSms" value="1">
																	<img src="pictures/smsIcon.gif" alt="<bean:message key="showSeller.sms"/>"/>
																</logic:equal>
																<logic:equal name="seller" property="allowPhoneCall" value="1">
																	<img src="pictures/phoneCallIcon.gif" alt="<bean:message key="showSeller.phoneCall"/>"/>
																</logic:equal>
																<logic:equal name="seller" property="allowSkype" value="1">
																	<img src="pictures/skypeIcon.gif" alt="<bean:message key="showSeller.skypeCall"/>"/>
																</logic:equal>
																<logic:equal name="seller" property="allowMessenger" value="1">
																	<img src="pictures/chatIcon.gif" alt="<bean:message key="showSeller.messenger"/>"/>
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
						</td>
					</tr>
					<tr height="5"><td></td></tr>
					<tr>
						<td>
							 <table width="475" cellpadding="0" cellspacing="0" border="0" >
								<tr>	
									<td>
										<table width="235" cellpadding="0" cellspacing="0" border="0" >
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
												<td width="219" height="380">	
													<table width="100%" cellpadding="0" cellspacing="0" border="0" >
														<tr>
															<td class="data2Text">
																<b><bean:message key="showSeller.statistics"/></b>
															</td>
														</tr>
														<tr><td height="10"></td></tr>
														<tr>
															<td>
																<table width="100%" cellpadding="0" cellspacing="0" border="0" >
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showSeller.isOnline"/></b>:&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<logic:equal name="seller" property="isOnLine" value="1">
																				<bean:message key="common.yes"/>
																			</logic:equal>
																			<logic:equal name="seller" property="isOnLine" value="0">
																				<bean:message key="common.no"/>
																			</logic:equal>
																		</td>
																	</tr>
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showSeller.lastLogin"/></b>:&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<bean:write name="seller" property="lastLoginFrom"/>
																		</td>
																	</tr>
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showSeller.contactsReceived"/></b>&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<bean:write name="seller" property="contactsReceived"/>&nbsp;
																		</td>
																	</tr>
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showSeller.contactsAccepted"/></b>:&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<bean:write name="seller" property="contactsAccepted"/>&nbsp;
																			(<bean:write name="seller" property="contactsAcceptedPercentage"/>%)
																		</td>
																	</tr>
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showSeller.contactsRejected"/></b>:&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<bean:write name="seller" property="contactsRejected"/>
																		</td>
																	</tr>
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showSeller.contactsNotReplied"/></b>:&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<bean:write name="seller" property="contactsNotReplied"/>
																		</td>
																	</tr>
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showSeller.datesCanceled"/></b>:&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<bean:write name="seller" property="datesCanceled"/>
																		</td>
																	</tr>
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showSeller.positiveVotes"/></b>:&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<bean:write name="seller" property="positiveVotes"/>
																		</td>
																	</tr>
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showSeller.negativeVotes"/></b>:&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<bean:write name="seller" property="negativeVotes"/>
																		</td>
																	</tr>
																</table>
															</td>
														</tr>
														<tr><td height="10"></td></tr>														
														<tr>
															<td nowrap class="data2Text">
																<b><bean:message key="showSeller.lastVotes"/></b>
															</td>
														</tr>
														<tr><td height="8"></td></tr>		
														<tr>
															<td>
																<table width="100%" cellpadding="0" cellspacing="0" border="0" >
																	<logic:iterate name="voteCollection" id="collection">
																		<tr>
																			<td align="left" valign="top">
																				<logic:equal name="collection" property="vote" value="1">
																					<img src="pictures/positiveVote.gif" alt="Voto positivo"/>
																				</logic:equal>
																				<logic:equal name="collection" property="vote" value="-1">
																					<img src="pictures/negativeVote.gif" alt="Voto negativo"/>
																				</logic:equal>
																			</td>
																			<td>
																				<table width="100%" cellpadding="0" cellspacing="0" border="0" >
																					<tr>
																						<logic:equal name="collection" property="buyerIsPublic" value="1">
																							<td nowrap class="data1Text" align="left" valign="top" title="<bean:write name="collection" property="buyerLogin"/>">
																								(<bean:write name="collection" property="date"/>)&nbsp;
																								<a href="showBuyer.do?id=<bean:write name="collection" property="buyerId"/>" class="data1Link"><bean:write name="collection" property="briefBuyerLogin"/></a>
																							</td>
																						</logic:equal>
																						<logic:equal name="collection" property="buyerIsPublic" value="0">
																							<td nowrap class="data1Text" align="left" valign="top" title="Usuario oculto">
																								(<bean:write name="collection" property="date"/>)&nbsp;
																								<bean:message key="showSeller.hiddenUser"/>
																							</td>
																						</logic:equal>
																					</tr>
																					<tr>
																						<td nowrap class="data1Text" align="left" valign="top" title="<bean:write name="collection" property="comment"/>">
																							<b><bean:write name="collection" property="briefComment"/></b>
																						</td>
																					</tr>
																				</table>
																			</td>
																		</tr>
																	</logic:iterate>
																</table>
															</td>
														</tr>	
														<tr><td height="10"></td></tr>																	
														<tr>
															<td nowrap align="right">
																<a href="showOtherSellerVote.do?id=<bean:write name="seller" property="id"/>" class="data1Link"><bean:message key="showSeller.seeAllVotes"/></a>
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
									</td>
									<td width="5"></td>
									<td>
										<table width="235" cellpadding="0" cellspacing="0" border="0" >
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
												<td width="219" height="380">	
													<table width="100%" cellpadding="0" cellspacing="0" border="0" >
														<logic:notEqual name="seller" property="preferredText" value="">
															<tr>
																<td class="data2Text">
																	<b><bean:message key="showSeller.preferences"/></b>
																</td>
															</tr>
															<tr><td height="10"></td></tr>
															<tr>
																<td class="data1Text">
																	<bean:write name="seller" property="preferredText"/>
																</td>
															</tr>
														</logic:notEqual>
														<tr><td height="15"></td></tr>
														<tr>
															<td>
																<table width="100%" cellpadding="0" cellspacing="0" border="0" >
																	<logic:notEqual name="seller" property="preferredSex" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.sex"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="preferredSex"/>
																			</td>
																		</tr>
																	</logic:notEqual>
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showSeller.ageBetween"/></b>&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<bean:write name="seller" property="preferredAgeLow"/>&nbsp;<bean:message key="common.and"/>
																			<bean:write name="seller" property="preferredAgeHigh"/>																
																		</td>
																	</tr>
																	<logic:notEqual name="seller" property="preferredOrigin" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.origin"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="preferredOrigin"/>
																			</td>
																		</tr>
																	</logic:notEqual>
																	<logic:notEqual name="seller" property="preferredLanguage" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.language"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="preferredLanguage"/>
																			</td>
																		</tr>
																	</logic:notEqual>														
																	<logic:notEqual name="seller" property="preferredOrientation" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.orientation"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="preferredOrientation"/>
																			</td>
																		</tr>
																	</logic:notEqual>														
																	<logic:notEqual name="seller" property="preferredHeight" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.height"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="preferredHeight"/>
																			</td>
																		</tr>
																	</logic:notEqual>														
																	<logic:notEqual name="seller" property="preferredSkinColor" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.skinColor"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="preferredSkinColor"/>
																			</td>
																		</tr>
																	</logic:notEqual>														
																	<logic:notEqual name="seller" property="preferredHairColor" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.hairColor"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="preferredHairColor"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="seller" property="preferredHairLength" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.hairLength"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="preferredHairLength"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	
																	<logic:notEqual name="seller" property="preferredEyeColor" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.eyeColor"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="preferredEyeColor"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="seller" property="preferredPhysique" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.physique"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="preferredPhysique"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="seller" property="preferredBreastSize" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.breastSize"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="preferredBreastSize"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="seller" property="preferredPennisSize" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.pennisSize"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="preferredPennisSize"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="seller" property="preferredEducationLevel" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.educationLevel"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="preferredEducationLevel"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="seller" property="preferredSmoker" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showSeller.smoker"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="seller" property="preferredSmoker"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																</table>
															</td>
														</tr>
														<logic:present name="buyerSession">
															<tr><td height="10"></td></tr>
															<tr>
																<td align="center">
																	<a href="showBuyerCompatibility.do?id=<bean:write name="seller" property="id"/>" class="data1Link"><bean:message key="showSeller.checkCompatibility"/></a>
																</td>
															</tr>														
														</logic:present>
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
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	</tiles:put>
</tiles:insert>
