<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/amandris.tld" prefix="amandris" %>

<tiles:insert template='../tiles/amandrisBuyerTile.jsp'>
	<tiles:put name='logoTile' content='logoTile.jsp'/>
	<tiles:put name='buyerMenuTile' content='buyerMenuTile.jsp'/>
	<tiles:put name='footer1Tile' content='footer1Tile.jsp'/>
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
			<td height="450">	
				<table  cellpadding="0" cellspacing="0" border="0">
					<tr>
			  			<td valign="top" width="704">
			  			  	<table width="704" cellpadding="0" cellspacing="0" border="0" valign="top">
			  			  	
			  			  		<logic:notEmpty name="firstPlaceSellerCollection">
						  			<tr>
						  				<td align="center">
							  				<table width="100%" cellpadding="0" cellspacing="0" border="0" >
												<tr>
													<td width="8" height="8" background="pictures/borderTopLeft.gif">
													</td>
													<td height="8" background="pictures/borderTop.gif" >	
													</td>
													<td width="8" height="8" background="pictures/borderTopRight.gif">
													</td>
												</tr>
												<tr>
													<td width="8" background="pictures/borderLeft.gif">
													</td>
													<td>	
														<table cellpadding="0" cellspacing="3" border="0" >
															<tr>
																<td align="left" class="data2Text">
																	<b><bean:message key="showBuyerSellerCollection.firstPlace"/></b>
																</td>
															</tr>
															<tr valign="top">
																<logic:iterate name="firstPlaceSellerCollection" id="collection">
																	<td>
																		<table cellpadding="0" cellspacing="3" border="0" >
																			<tr>
																				<td valign="top">
																					<logic:equal name="collection" property="hasPicture" value="1">
																		  				<img src="/media/pictures/smaller/seller_<bean:write name="collection" property="id"/>_<bean:write name="collection" property="mainPicture"/>_<bean:write name="collection" property="mainPictureCode"/>.jpg"/>
																		  			</logic:equal>
																		  			<logic:notEqual name="collection" property="hasPicture" value="1">
																		  				<logic:equal name="collection" property="sexId" value="1">
																			  				<img src="pictures/defaultGirl.gif"/>
																			  			</logic:equal>
																		  				<logic:equal name="collection" property="sexId" value="2">
																			  				<img src="pictures/defaultBoy.gif"/>
																			  			</logic:equal>
																		  				<logic:equal name="collection" property="sexId" value="4">
																			  				<img src="pictures/defaultShemale.gif"/>
																			  			</logic:equal>
																		  				<logic:equal name="collection" property="sexId" value="8">
																			  				<img src="pictures/defaultBoysCouple.gif"/>
																			  			</logic:equal>
																		  				<logic:equal name="collection" property="sexId" value="16">
																			  				<img src="pictures/defaultGirlsCouple.gif"/>
																			  			</logic:equal>
																		  				<logic:equal name="collection" property="sexId" value="32">
																			  				<img src="pictures/defaultBoyAndGirlCouple.gif"/>
																			  			</logic:equal>
																		  				<logic:equal name="collection" property="sexId" value="64">
																			  				<img src="pictures/defaultGroup.gif"/>
																			  			</logic:equal>
																		  			</logic:notEqual>
																				</td>
																				<td align="left" width="80" valign="top">
																	  				<table cellpadding="0" cellspacing="0" border="0" align="left">
																	  					<tr align="left">
																	  						<td nowrap class="data1Text" align="left">
																	  							<a href="showSeller.do?id=<bean:write name="collection" property="id"/>" class="data1Link">
																			  						<bean:write name="collection" property="briefLogin"/>
																			  					</a>
																	  						</td>
																	  					</tr>
																	  					<tr align="left">
																	  						<td class="data1Text" align="left">
																		  						<bean:write name="collection" property="sex"/>
																	  						</td>
																	  					</tr>
																	  					<tr align="left">
																	  						<td nowrap class="data1Text" align="left">
																		  						<bean:write name="collection" property="age"/>
																	  						</td>
																	  					</tr>
																	  					<tr align="left">
																	  						<td nowrap class="data1Text" align="left">
																		  						<bean:write name="collection" property="briefCity"/>
																	  						</td>
																	  					</tr>										  					
																	  					<tr align="left">
																	  						<td nowrap class="data1Text" align="left">
																		  						<bean:write name="collection" property="state"/>
																	  						</td>
																	  					</tr>
																	  					<tr align="left">
																	  						<td nowrap class="data1Text" align="left">
																		  						<bean:write name="collection" property="country"/>
																	  						</td>
																	  					</tr>
																	  				</table>
																	  			</td>
																			</tr>
																		</table>
																	</td>
																</logic:iterate>
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
								</logic:notEmpty>
			  			  	
			  			  	
			  			  		<tr>
			  			  			<td align="right">
			  			  				<table width="704" cellpadding="0" cellspacing="0" border="0" valign="top">
						  			  		<tr>
		  						  				<logic:notEmpty name="sellerCollection">
							  			  			<td width="550" align="left" class="data1Text">
							  			  				<b><bean:write name="pager" property="size"/>&nbsp;<bean:message key="showBuyerSellerCollection.found"/></b>
				  						  			</td>
				  						  			<td>
								  			  			<amandris:pagerTag 	styleClass="pagerTextLink" 
																	name="pager" 
																	action ="showBuyerSellerCollection.do?foo" 
																	maxPages="7" 
																	previousImageOn="pictures/previousOn.gif" 
																	nextImageOn="pictures/nextOn.gif" 
																	previousImageOff="pictures/previousOff.gif" 
																	nextImageOff="pictures/nextOff.gif"/>
													</td>
												</logic:notEmpty>
											</tr>
										</table>
			  			  			</td>
			  			  		</tr>
						  		<tr>
						  			<td>
			  						  	<table width="704" cellpadding="0" cellspacing="0" border="0">
			  						  		<logic:empty name="sellerCollection">
			  						  			<tr>
			  						  				<td class="data1Text" align="center">
			  						  					<bean:message key="showBuyerSellerCollection.notFound"/>
			  						  				</td>
			  						  			</tr>
			  						  		</logic:empty>
			  						  		
				  						  	<logic:notEmpty name="sellerCollection">
				  						  		<logic:iterate name="sellerCollection" id="collection">
											  		<tr>
											  			<logic:equal name="collection" property="oddOrEven" value="odd">
											  				<logic:equal name="collection" property="highlighted" value="0">
										  						<td width="9" height="85" background="pictures/buyerContactLeftBorderOdd.gif"></td>
										  					</logic:equal>
										  					<logic:equal name="collection" property="highlighted" value="1">
										  						<td width="9" height="85" background="pictures/buyerContactLeftBorderOddHighlighted.gif"></td>
										  					</logic:equal>
										  					<logic:equal name="collection" property="highlighted" value="2">
										  						<td width="9" height="85" background="pictures/buyerContactLeftBorderHighlighted2.gif"></td>
										  					</logic:equal>
									  					</logic:equal>
											  			<logic:notEqual name="collection" property="oddOrEven" value="odd">
									  						<logic:equal name="collection" property="highlighted" value="0">
										  						<td width="9" height="85" background="pictures/buyerContactLeftBorderEven.gif"></td>
										  					</logic:equal>
										  					<logic:equal name="collection" property="highlighted" value="1">
										  						<td width="9" height="85" background="pictures/buyerContactLeftBorderEvenHighlighted.gif"></td>
										  					</logic:equal>
										  					<logic:equal name="collection" property="highlighted" value="2">
										  						<td width="9" height="85" background="pictures/buyerContactLeftBorderHighlighted2.gif"></td>
										  					</logic:equal>
									  					</logic:notEqual>
								  						<logic:equal name="collection" property="oddOrEven" value="odd">
									  						<logic:equal name="collection" property="highlighted" value="0">
										  						<td height="85" width="672" bgcolor="#C185AA">
										  					</logic:equal>
										  					<logic:equal name="collection" property="highlighted" value="1">
										  						<td height="85" width="672" background="pictures/buyerContactCenterOddHighlighted.gif">
										  					</logic:equal>
										  					<logic:equal name="collection" property="highlighted" value="2">
										  						<td height="85" width="672" background="pictures/buyerContactCenterHighlighted2.gif">
										  					</logic:equal>
									  					</logic:equal>
								  						<logic:notEqual name="collection" property="oddOrEven" value="odd">
									  						<logic:equal name="collection" property="highlighted" value="0">
										  						<td height="85" width="672" bgcolor="#E5B8D3">
										  					</logic:equal>
										  					<logic:equal name="collection" property="highlighted" value="1">
										  						<td height="85" width="672" background="pictures/buyerContactCenterEvenHighlighted.gif">
										  					</logic:equal>
										  					<logic:equal name="collection" property="highlighted" value="2">
										  						<td height="85" width="672" background="pictures/buyerContactCenterHighlighted2.gif">
										  					</logic:equal>
									  					</logic:notEqual>
								  						  	<table width="686" cellpadding="0" cellspacing="0" border="0" >
														  		<tr valign="middle">
														  			<td valign="middle" width="60">
														  				<logic:equal name="collection" property="hasPicture" value="1">
															  				<img src="/media/pictures/smaller/seller_<bean:write name="collection" property="id"/>_<bean:write name="collection" property="mainPicture"/>_<bean:write name="collection" property="mainPictureCode"/>.jpg"/>
															  			</logic:equal>
															  			<logic:notEqual name="collection" property="hasPicture" value="1">
															  				<logic:equal name="collection" property="sexId" value="1">
																  				<img src="pictures/defaultGirl.gif"/>
																  			</logic:equal>
															  				<logic:equal name="collection" property="sexId" value="2">
																  				<img src="pictures/defaultBoy.gif"/>
																  			</logic:equal>
															  				<logic:equal name="collection" property="sexId" value="4">
																  				<img src="pictures/defaultShemale.gif"/>
																  			</logic:equal>
															  				<logic:equal name="collection" property="sexId" value="8">
																  				<img src="pictures/defaultBoysCouple.gif"/>
																  			</logic:equal>
															  				<logic:equal name="collection" property="sexId" value="16">
																  				<img src="pictures/defaultGirlsCouple.gif"/>
																  			</logic:equal>
															  				<logic:equal name="collection" property="sexId" value="32">
																  				<img src="pictures/defaultBoyAndGirlCouple.gif"/>
																  			</logic:equal>
															  				<logic:equal name="collection" property="sexId" value="64">
																  				<img src="pictures/defaultGroup.gif"/>
																  			</logic:equal>
															  			</logic:notEqual>
														  			</td>
														  			<td valign="top" align="left" width="90">
														  				<table cellpadding="0" cellspacing="0" border="0" align="left">
														  					<tr align="left">
														  						<td nowrap class="data1Text" align="left">
														  							<a href="showSeller.do?id=<bean:write name="collection" property="id"/>" class="data1Link">
																  						<bean:write name="collection" property="briefLogin"/>
																  					</a>
														  						</td>
														  					</tr>
														  					<tr align="left">
														  						<td nowrap class="data1Text" align="left">
															  						<bean:write name="collection" property="sex"/>
														  						</td>
														  					</tr>
														  					<tr align="left">
														  						<td nowrap class="data1Text" align="left">
															  						<bean:write name="collection" property="age"/>
														  						</td>
														  					</tr>
														  					<tr align="left">
														  						<td nowrap class="data1Text" align="left">
															  						<bean:write name="collection" property="state"/>
														  						</td>
														  					</tr>
														  					<tr align="left">
														  						<td nowrap class="data1Text" align="left">
															  						<bean:write name="collection" property="briefCity"/>
														  						</td>
														  					</tr>										  					
														  					<tr align="left">
														  						<td nowrap class="data1Text" align="left">
															  						<span class="data1TextGreen"><b><bean:write name="collection" property="positiveVotes"/></b></span>/<span class="data1TextRed"><b><bean:write name="collection" property="negativeVotes"/></b></span>
														  						</td>
														  					</tr>
														  				</table>
														  			</td>
														  			<td width="9" align="center"><img src="pictures/verticalSeparator.gif"/></td>
														  			<td valign="top" align="left" width="155">
														  				<table cellpadding="0" cellspacing="0" border="0" align="left">
														  					<tr align="left">
														  						<td nowrap class="data1Text" align="left">
															  						<b><bean:write name="collection" property="briefIntro"/></b>
														  						</td>
														  					</tr>
														  					<tr align="left">
														  						<td class="data1Text" align="left">
															  						<bean:write name="collection" property="briefText"/>
														  						</td>
														  					</tr>
														  				</table>
														  			</td>
														  			<td width="9" align="center"><img src="pictures/verticalSeparator.gif"/></td>
														  			<td valign="top" align="left" width="180">
														  				<logic:equal name="collection" property="isEscort" value="0">
															  				<table cellpadding="0" cellspacing="0" border="0" align="center">
															  					<tr align="left">
															  						<td nowrap class="data1Text" align="right">
																  						<b><bean:message key="showBuyerSellerCollection.contactsReceived"/>:</b>&nbsp;
															  						</td>
															  						<td nowrap class="data1Text" align="left">
																  						<bean:write name="collection" property="contactsReceived"/>
															  						</td>
															  					</tr>
															  					<tr align="left">
															  						<td nowrap class="data1Text" align="right">
																  						<b><bean:message key="showBuyerSellerCollection.contactsAccepted"/>:</b>&nbsp;
															  						</td>
															  						<td nowrap class="data1Text" align="left">
																  						<bean:write name="collection" property="contactsAccepted"/> (<bean:write name="collection" property="contactsAcceptedPercentage"/>%)
															  						</td>
															  					</tr>
															  					<tr><td height="10"></td></tr>
															  					<tr align="left">
															  						<td nowrap class="data1Text" align="right">
																  						<b><bean:message key="showBuyerSellerCollection.contactsRejected"/>:</b>&nbsp;
															  						</td>
															  						<td nowrap class="data1Text" align="left">
																  						<bean:write name="collection" property="contactsRejected"/>
															  						</td>
															  					</tr>
																				<tr align="left">
															  						<td nowrap class="data1Text" align="right">
																  						<b><bean:message key="showBuyerSellerCollection.contactsNotReplied"/>:</b>&nbsp;
															  						</td>
															  						<td nowrap class="data1Text" align="left">
																  						<bean:write name="collection" property="contactsNotReplied"/>
															  						</td>
															  					</tr>														  					
															  					<tr align="left">
															  						<td nowrap class="data1Text" align="right">
																  						<b><bean:message key="showBuyerSellerCollection.contactsCancelled"/>:</b>&nbsp;
															  						</td>
															  						<td nowrap class="data1Text" align="left">
																  						<bean:write name="collection" property="datesCanceled"/>
															  						</td>
															  					</tr>
															  				</table>
															  			</logic:equal>
															  			<logic:equal name="collection" property="isEscort" value="1">
															  				<table align="center" height="70">
															  					<tr align="center" valign="middle" height="70">
															  						<td class="data3Text" align="center" valign="middle" style="color:#600060;" height="70">
															  							<bean:message key="showBuyerSellerCollection.isEscort"/>
															  						</td>
															  					</tr>
															  				</table>
															  			</logic:equal>
														  			</td>
														  			<td width="9" align="center"><img src="pictures/verticalSeparator.gif"/></td>
																		<td valign="top" align="left">
														  				<table cellpadding="0" cellspacing="0" border="0" align="left">
														  					
														  					<tr align="left">
														  						<td nowrap class="data1Text" align="left">
															  						<b><bean:message key="showBuyerSellerCollection.isEscort"/>:</b>
															  						<logic:equal name="collection" property="isEscort" value="1">
															  							<bean:message key="common.yes"/>
															  						</logic:equal>
															  						<logic:equal name="collection" property="isEscort" value="0">
															  							<bean:message key="common.no"/>
															  						</logic:equal>
														  						</td>
														  					</tr>
														  					
														  					<tr><td height="20"></td></tr>
														  					<tr>
														  						<td align="center">
														  							<logic:present name="buyerSession">
															  							<a href="showBuyerStartContact.do?id=<bean:write name="collection" property="id"/>">
																  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="contactEven" border="0"/>
																  						</a>
																  					</logic:present>
																  					<logic:notPresent name="buyerSession">
															  							<a href="showNeedToRegister.do">
																  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="contactEven" border="0"/>
																  						</a>
																  					</logic:notPresent>
															  					</td>
														  					</tr>
														  				</table>
														  			</td>														  			
														  		</tr>
														  	</table>
							  							</td>
							  							<logic:equal name="collection" property="oddOrEven" value="odd">
											  				<logic:equal name="collection" property="highlighted" value="0">
										  						<td width="9" height="85" background="pictures/buyerContactRightBorderOdd.gif"></td>
										  					</logic:equal>
										  					<logic:equal name="collection" property="highlighted" value="1">
										  						<td width="9" height="85" background="pictures/buyerContactRightBorderOddHighlighted.gif"></td>
										  					</logic:equal>
										  					<logic:equal name="collection" property="highlighted" value="2">
										  						<td width="9" height="85" background="pictures/buyerContactRightBorderHighlighted2.gif"></td>
										  					</logic:equal>
									  					</logic:equal>
											  			<logic:notEqual name="collection" property="oddOrEven" value="odd">
									  						<logic:equal name="collection" property="highlighted" value="0">
										  						<td width="9" height="85" background="pictures/buyerContactRightBorderEven.gif"></td>
										  					</logic:equal>
										  					<logic:equal name="collection" property="highlighted" value="1">
										  						<td width="9" height="85" background="pictures/buyerContactRightBorderEvenHighlighted.gif"></td>
										  					</logic:equal>
										  					<logic:equal name="collection" property="highlighted" value="2">
										  						<td width="9" height="85" background="pictures/buyerContactRightBorderHighlighted2.gif"></td>
										  					</logic:equal>
									  					</logic:notEqual>
											  		</tr>
											  		<tr><td height="5"></td><td></td><td></td></tr>
										  		<tr>
										  	</logic:iterate>
										</logic:notEmpty>								  	
								  	</table>
		  						</td>
					  		</tr>
							<tr>
		  			  			<td align="right">
		  			  				<table width="704" cellpadding="0" cellspacing="0" border="0" valign="top">
					  			  		<tr>
						  			  		<logic:notEmpty name="sellerCollection">
						  			  			<td width="550" align="left" class="data1Text">
						  			  				&nbsp;
						  			  			</td>
			  						  			<td>
			  						  				
							  			  			<amandris:pagerTag 	styleClass="pagerTextLink" 
																name="pager" 
																action ="showBuyerSellerCollection.do?foo" 
																maxPages="7" 
																previousImageOn="pictures/previousOn.gif" 
																nextImageOn="pictures/nextOn.gif" 
																previousImageOff="pictures/previousOff.gif" 
																nextImageOff="pictures/nextOff.gif"/>
												</td>
											</logic:notEmpty>
										</tr>
									</table>
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

	</tiles:put>
</tiles:insert>
