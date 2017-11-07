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
			<td width="355">
				<table width="355" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td width="355">
							<table width="355" cellpadding="0" cellspacing="0" border="0" >
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
									<td width="339" height="300">
										<table width="100%" cellpadding="0" cellspacing="0">
											<tr>
												<td>
													<table width="100%" cellpadding="0" cellspacing="0">
														<tr>
															<td valign="top">
																<table width="100%" cellpadding="0" cellspacing="0">
																	<tr>
																		<td align="center" valign="top">
																			<logic:equal name="buyer" property="hasPicture" value="1">
																  				<img src="/media/pictures/smaller/buyer_<bean:write name="buyer" property="id"/>_<bean:write name="buyer" property="mainPicture"/>_<bean:write name="buyer" property="mainPictureCode"/>.jpg"/>
																  			</logic:equal>
																  			<logic:notEqual name="buyer" property="hasPicture" value="1">
																  				<logic:equal name="buyer" property="sexId" value="1">
																	  				<img src="pictures/defaultGirl.gif"/>
																	  			</logic:equal>
																  				<logic:equal name="buyer" property="sexId" value="2">
																	  				<img src="pictures/defaultBoy.gif"/>
																	  			</logic:equal>
																  				<logic:equal name="buyer" property="sexId" value="4">
																	  				<img src="pictures/defaultShemale.gif"/>
																	  			</logic:equal>
																  				<logic:equal name="buyer" property="sexId" value="8">
																	  				<img src="pictures/defaultBoysCouple.gif"/>
																	  			</logic:equal>
																  				<logic:equal name="buyer" property="sexId" value="16">
																	  				<img src="pictures/defaultGirlsCouple.gif"/>
																	  			</logic:equal>
																  				<logic:equal name="buyer" property="sexId" value="32">
																	  				<img src="pictures/defaultBoyAndGirlCouple.gif"/>
																	  			</logic:equal>
																  				<logic:equal name="buyer" property="sexId" value="64">
																	  				<img src="pictures/defaultGroup.gif"/>
																	  			</logic:equal>
																  			</logic:notEqual>
																		</td>
																	</tr>
																	<logic:equal name="buyer" property="hasPicture" value="1">
																		<tr>
																			<td class="data1Text" align="center">
																				<a href="showBuyerProfilePictures.do?id=<bean:write name="buyer" property="id"/>" class="data1Link"><bean:write name="buyer" property="pictureCount"/></a>&nbsp;
																				<logic:equal name="buyer" property="pictureCount" value="1">
																					<bean:message key="showBuyer.picture"/>
																				</logic:equal>
																				<logic:notEqual name="buyer" property="pictureCount" value="1">
																					<bean:message key="showBuyer.pictures"/>
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
																		<td class="data3Text" title="<bean:write name="buyer" property="login"/>">
																			<bean:write name="buyer" property="briefLogin"/>
																		</td>
																	</tr>
																	<tr>
																		<td class="data2Text">
																			<b><bean:message key="showBuyer.sex"/></b>:&nbsp;<bean:write name="buyer" property="sex"/>
																		</td>
																	</tr>
																	<tr>
																		<td class="data2Text">
																			<b><bean:message key="showBuyer.age"/></b>:&nbsp;<bean:write name="buyer" property="age"/>
																		</td>
																	</tr>
																	<tr>
																		<td class="data2Text">
																			<b><bean:message key="showBuyer.country"/></b>:&nbsp;<bean:write name="buyer" property="country"/>
																		</td>
																	</tr>
																	<tr>
																		<td class="data2Text">
																			<b><bean:message key="showBuyer.state"/></b>:&nbsp;<bean:write name="buyer" property="state"/>
																		</td>
																	</tr>
																	<tr>
																		<td class="data2Text" title="<bean:write name="buyer" property="city"/>">
																			<b><bean:message key="showBuyer.city"/></b>:&nbsp;<bean:write name="buyer" property="briefCity"/>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<table cellpadding="0" cellspacing="0">
																				<tr>
																					<td class="data2Text" title="Votos">
																						<b><span style="color:#00AA00;"><bean:write name="buyer" property="positiveVotes"/></span>&nbsp;/&nbsp;<span style="color:#AA0000;"><bean:write name="buyer" property="negativeVotes"/></span></b>&nbsp;
																					</td>
																					<td>
																						<logic:equal name="buyer" property="userLevel" value="0">
																							<img src="pictures/userLevel0.gif" alt="<bean:message key="showBuyer.userLevel0"/>"/>
																						</logic:equal>
																						<logic:equal name="buyer" property="userLevel" value="1">
																							<img src="pictures/userLevel1.gif" alt="<bean:message key="showBuyer.userLevel1"/>"/>
																						</logic:equal>
																						<logic:equal name="buyer" property="userLevel" value="2">
																							<img src="pictures/userLevel2.gif" alt="<bean:message key="showBuyer.userLevel2"/>"/>
																						</logic:equal>
																						<logic:equal name="buyer" property="userLevel" value="3">
																							<img src="pictures/userLevel3.gif" alt="<bean:message key="showBuyer.userLevel3"/>"/>
																						</logic:equal>
																						<logic:equal name="buyer" property="userLevel" value="4">
																							<img src="pictures/userLevel4.gif" alt="<bean:message key="showBuyer.userLevel4"/>"/>
																						</logic:equal>
																						<logic:equal name="buyer" property="userLevel" value="5">
																							<img src="pictures/userLevel5.gif" alt="<bean:message key="showBuyer.userLevel5"/>"/>
																						</logic:equal>
																						<logic:equal name="buyer" property="userLevel" value="6">
																							<img src="pictures/userLevel6.gif" alt="<bean:message key="showBuyer.userLevel6"/>"/>
																						</logic:equal>
																						<logic:equal name="buyer" property="userLevel" value="7">
																							<img src="pictures/userLevel7.gif" alt="<bean:message key="showBuyer.userLevel7"/>"/>
																						</logic:equal>
																					</td>
																				</tr>
																			</table>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<a href="showOtherBuyerVote.do?id=<bean:write name="buyer" property="id"/>" class="data1Link"><bean:message key="showBuyer.seeAllVotes"/></a>
																		</td>
																	</tr>	
																</table>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr><td height="20"></td></tr>
											<logic:present name="sellerSession">
												<tr>
													<td align="center">
														<a href="showSellerStartInvitation.do?id=<bean:write name="buyer" property="id"/>">
															<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="sendInvitationBig" border="0"/>
														</a>
													</td>
												</tr>
											</logic:present>
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
						<td width="355">
							<table width="355" cellpadding="0" cellspacing="0" border="0" >
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
									<td width="339" height="340">
										<table width="100%" cellpadding="0" cellspacing="0" border="0" >
											<tr>
												<td class="data2Text">
													<b><bean:write name="buyer" property="intro"/></b>
												</td>
											</tr>
											<tr><td height="10"></td></tr>
											<tr>
												<td class="data1Text">
													<bean:write name="buyer" property="text"/>
												</td>
											</tr>
											<tr><td height="15"></td></tr>
											<tr>
												<td>
													<table width="100%" cellpadding="0" cellspacing="0" border="0" >
														<tr>
															<td class="data2Text">
																<b><bean:message key="showBuyer.data"/></b>
															</td>
														</tr>
														<tr><td height="10"></td></tr>
														<tr>
															<td>
																<table width="100%" cellpadding="0" cellspacing="0" border="0" >
																	<logic:notEqual name="buyer" property="origin" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.origin"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="origin"/>
																			</td>
																		</tr>
																	</logic:notEqual>
																	<logic:notEqual name="buyer" property="language" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.language"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="language"/>
																			</td>
																		</tr>
																	</logic:notEqual>														
																	<logic:notEqual name="buyer" property="orientation" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.orientation"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="orientation"/>
																			</td>
																		</tr>
																	</logic:notEqual>														
																	<logic:notEqual name="buyer" property="height" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.height"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="height"/>
																			</td>
																		</tr>
																	</logic:notEqual>														
																	<logic:notEqual name="buyer" property="skinColor" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.skinColor"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="skinColor"/>
																			</td>
																		</tr>
																	</logic:notEqual>														
																	<logic:notEqual name="buyer" property="hairColor" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.hairColor"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="hairColor"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="buyer" property="hairLength" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.hairLength"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="hairLength"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	
																	<logic:notEqual name="buyer" property="eyeColor" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.eyeColor"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="eyeColor"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="buyer" property="physique" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.physique"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="physique"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="buyer" property="breastSize" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.breastSize"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="breastSize"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="buyer" property="pennisSize" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.pennisSize"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="pennisSize"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="buyer" property="educationLevel" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.educationLevel"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="educationLevel"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="buyer" property="smoker" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.smoker"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="smoker"/>
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
			<td width="360">
				<table width="360" cellpadding="0" cellspacing="0" border="0" >
					<tr>
						<td>
							 <table width="360" cellpadding="0" cellspacing="0" border="0" >
								<tr>	
									<td>
										<table width="360" cellpadding="0" cellspacing="0" border="0" >
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
												<td width="344" height="300">	
													<table width="100%" cellpadding="0" cellspacing="0" border="0" >
														<tr>
															<td class="data2Text">
																<b><bean:message key="showBuyer.statistics"/></b>
															</td>
														</tr>
														<tr><td height="10"></td></tr>
														<tr>
															<td>
																<table width="100%" cellpadding="0" cellspacing="0" border="0" >
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showBuyer.isOnline"/></b>:&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<logic:equal name="buyer" property="isOnLine" value="1">
																				<bean:message key="common.yes"/>
																			</logic:equal>
																			<logic:equal name="buyer" property="isOnLine" value="0">
																				<bean:message key="common.no"/>
																			</logic:equal>
																		</td>
																	</tr>
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showBuyer.lastLogin"/></b>:&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<bean:write name="buyer" property="lastLoginFrom"/>
																		</td>
																	</tr>
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showBuyer.contactsSent"/></b>&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<bean:write name="buyer" property="contactsSent"/>&nbsp;
																		</td>
																	</tr>
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showBuyer.contactsAccepted"/></b>:&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<bean:write name="buyer" property="contactsAccepted"/>&nbsp;
																			(<bean:write name="buyer" property="contactsAcceptedPercentage"/>%)
																		</td>
																	</tr>
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showBuyer.contactsRejected"/></b>:&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<bean:write name="buyer" property="contactsRejected"/>
																		</td>
																	</tr>
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showBuyer.contactsNotReplied"/></b>:&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<bean:write name="buyer" property="contactsNotReplied"/>
																		</td>
																	</tr>
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showBuyer.datesCanceled"/></b>:&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<bean:write name="buyer" property="datesCanceled"/>
																		</td>
																	</tr>
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showBuyer.positiveVotes"/></b>:&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<bean:write name="buyer" property="positiveVotes"/>
																		</td>
																	</tr>
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showBuyer.negativeVotes"/></b>:&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<bean:write name="buyer" property="negativeVotes"/>
																		</td>
																	</tr>
																</table>
															</td>
														</tr>
														<tr><td height="10"></td></tr>														
														<tr>
															<td nowrap class="data2Text">
																<b><bean:message key="showBuyer.lastVotes"/></b>
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
																						<td nowrap class="data1Text" align="left" valign="top" title="<bean:write name="collection" property="sellerLogin"/>">
																							(<bean:write name="collection" property="date"/>)&nbsp;
																							<a href="showSeller.do?id=<bean:write name="collection" property="sellerId"/>" class="data1Link"><bean:write name="collection" property="briefSellerLogin"/></a>
																						</td>
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
																<a href="showOtherBuyerVote.do?id=<bean:write name="buyer" property="id"/>" class="data1Link"><bean:message key="showBuyer.seeAllVotes"/></a>
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
								<tr>
								<tr><td height="5"></td></tr>
								<tr>
									<td>
										<table width="360" cellpadding="0" cellspacing="0" border="0" >
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
												<td width="344" height="340">	
													<table width="100%" cellpadding="0" cellspacing="0" border="0" >
														<logic:notEqual name="buyer" property="preferredText" value="">
															<tr>
																<td class="data2Text">
																	<b><bean:message key="showBuyer.preferences"/></b>
																</td>
															</tr>
															<tr><td height="10"></td></tr>
															<tr>
																<td class="data1Text">
																	<bean:write name="buyer" property="preferredText"/>
																</td>
															</tr>
														</logic:notEqual>
														<tr><td height="15"></td></tr>
														<tr>
															<td>
																<table width="100%" cellpadding="0" cellspacing="0" border="0" >
																	<logic:notEqual name="buyer" property="preferredSex" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.sex"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="preferredSex"/>
																			</td>
																		</tr>
																	</logic:notEqual>
																	<tr>
																		<td nowrap class="data1Text" align="right" valign="top">
																		<b><bean:message key="showBuyer.ageBetween"/></b>&nbsp;
																		</td>
																		<td class="data1Text" align="left" valign="top">
																			<bean:write name="buyer" property="preferredAgeLow"/>&nbsp;<bean:message key="common.and"/>
																			<bean:write name="buyer" property="preferredAgeHigh"/>																
																		</td>
																	</tr>
																	<logic:notEqual name="buyer" property="preferredOrigin" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.origin"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="preferredOrigin"/>
																			</td>
																		</tr>
																	</logic:notEqual>
																	<logic:notEqual name="buyer" property="preferredLanguage" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.language"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="preferredLanguage"/>
																			</td>
																		</tr>
																	</logic:notEqual>														
																	<logic:notEqual name="buyer" property="preferredOrientation" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.orientation"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="preferredOrientation"/>
																			</td>
																		</tr>
																	</logic:notEqual>														
																	<logic:notEqual name="buyer" property="preferredHeight" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.height"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="preferredHeight"/>
																			</td>
																		</tr>
																	</logic:notEqual>														
																	<logic:notEqual name="buyer" property="preferredSkinColor" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.skinColor"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="preferredSkinColor"/>
																			</td>
																		</tr>
																	</logic:notEqual>														
																	<logic:notEqual name="buyer" property="preferredHairColor" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.hairColor"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="preferredHairColor"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="buyer" property="preferredHairLength" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.hairLength"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="preferredHairLength"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	
																	<logic:notEqual name="buyer" property="preferredEyeColor" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.eyeColor"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="preferredEyeColor"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="buyer" property="preferredPhysique" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.physique"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="preferredPhysique"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="buyer" property="preferredBreastSize" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.breastSize"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="preferredBreastSize"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="buyer" property="preferredPennisSize" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.pennisSize"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="preferredPennisSize"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="buyer" property="preferredEducationLevel" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.educationLevel"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="preferredEducationLevel"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																	<logic:notEqual name="buyer" property="preferredSmoker" value="0">
																		<tr>
																			<td nowrap class="data1Text" align="right" valign="top">
																			<b><bean:message key="showBuyer.smoker"/></b>:&nbsp;
																			</td>
																			<td class="data1Text" align="left" valign="top">
																				<bean:write name="buyer" property="preferredSmoker"/>
																			</td>
																		</tr>
																	</logic:notEqual>																		
																</table>
															</td>
														</tr>
														<logic:present name="sellerSession">
															<tr><td height="10"></td></tr>
															<tr>
																<td align="center">
																	<a href="showSellerCompatibility.do?id=<bean:write name="buyer" property="id"/>" class="data1Link"><bean:message key="showBuyer.checkCompatibility"/></a>
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
