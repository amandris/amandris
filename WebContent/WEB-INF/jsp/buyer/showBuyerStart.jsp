<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

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
			<td height="450">	
				<table  cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td>
						  	<table width="704" cellpadding="0" cellspacing="0" border="0">
						  		<tr>
						  			<td width="150">
						  				<!-- Left -->
						  			  	<table width="150" cellpadding="2" cellspacing="0" border="0" >
									  		<tr>
						  						<td class="data1Text" title="<bean:write name="buyerStartData" property="login"/>">	
						  							<bean:message key="showBuyerStart.welcome"/>, <b><bean:write name="buyerStartData" property="briefLogin"/></b>
						  						</td>
									  		</tr>
									  		<%-- 
									  		<tr>
						  						<td class="data1Text">	
						  							<bean:message key="showBuyerStart.youHave"/>&nbsp;<b><bean:write name="buyerStartData" property="credits"/></b>&nbsp;<bean:message key="showBuyerStart.credits"/>
						  						</td>
									  		</tr>
									  		
									  		<tr>
						  						<td>	
						  							<a href="showBuyerBuyCredits.do" class="data1Link"><bean:message key="showBuyerStart.buyMoreCredits"/></a>
						  						</td>
									  		</tr>
									  		--%>
									  		<logic:equal name="buyerStartData" property="hasPenddingTasks" value="1">
										  		<tr><td height="15"></td></tr>
										  		<tr>
										  			<td>
										  				<table width="90%" class="penddingTasksTable">
										  					<tr>
										  						<td class="data2Text">
										  							<bean:message key="showBuyerStart.penddingTasks"/>
										  						</td>
										  					</tr>
										  					<tr>
										  						<td class="data1Text">
										  							<logic:equal name="buyerStartData" property="preferencesSaved" value="0">
										  								<li><a href="showBuyerPreferences.do" class="data1Link"><bean:message key="showBuyerStart.preferences"/></li></a>
										  							</logic:equal>
										  							<logic:equal name="buyerStartData" property="picturesSaved" value="0">
										  								<li><a href="showBuyerPictures.do" class="data1Link"><bean:message key="showBuyerStart.pictures"/></li></a>
										  							</logic:equal>
										  						</td>
										  					</tr>
										  					<tr><td height="10"></td></tr>
										  				</table>
										  			</td>
										  		</tr>
									  		</logic:equal>
									  		<tr><td height="15"></td></tr>
									  		<tr>
									  			<td>
										  			<table cellpadding="0" cellsapcing="0">
									  					<tr>
									  						<td class="data1Text">	
																<span class="data1TextGreen"><b><bean:write name="buyerStartData" property="positiveVotes"/></b></span>&nbsp;/
																<span class="data1TextRed"><b><bean:write name="buyerStartData" property="negativeVotes"/></b></span>
									  						</td>
									  						<td width="5"></td>
									  						<td class="data1TextGreen">	
															<td>
																<logic:equal name="buyerStartData" property="userLevel" value="0">
																	<img src="pictures/userLevel0.gif" alt="<bean:message key="showBuyerStart.userLevel0"/>"/>
																</logic:equal>
																<logic:equal name="buyerStartData" property="userLevel" value="1">
																	<img src="pictures/userLevel1.gif" alt="<bean:message key="showBuyerStart.userLevel1"/>"/>
																</logic:equal>
																<logic:equal name="buyerStartData" property="userLevel" value="2">
																	<img src="pictures/userLevel2.gif" alt="<bean:message key="showBuyerStart.userLevel2"/>"/>
																</logic:equal>
																<logic:equal name="buyerStartData" property="userLevel" value="3">
																	<img src="pictures/userLevel3.gif" alt="<bean:message key="showBuyerStart.userLevel3"/>"/>
																</logic:equal>
																<logic:equal name="buyerStartData" property="userLevel" value="4">
																	<img src="pictures/userLevel4.gif" alt="<bean:message key="showBuyerStart.userLevel4"/>"/>
																</logic:equal>
																<logic:equal name="buyerStartData" property="userLevel" value="5">
																	<img src="pictures/userLevel5.gif" alt="<bean:message key="showBuyerStart.userLevel5"/>"/>
																</logic:equal>
																<logic:equal name="buyerStartData" property="userLevel" value="6">
																	<img src="pictures/userLevel6.gif" alt="<bean:message key="showBuyerStart.userLevel6"/>"/>
																</logic:equal>
																<logic:equal name="buyerStartData" property="userLevel" value="7">
																	<img src="pictures/userLevel7.gif" alt="<bean:message key="showBuyerStart.userLevel7"/>"/>
																</logic:equal>
																		
									  						</td>
									  					</tr>
									  				</table>
									  			</td>
									  		</tr>
									  		<tr>
						  						<td class="data1Text">	
													<b><bean:write name="buyerStartData" property="positiveVotesPercent"/><b/><bean:message key="showBuyerStart.positiveVotesPercentage"/>
						  						</td>
									  		</tr>	
									  		<tr>
						  						<td>	
						  							<a href="showBuyerVote.do" class="data1Link"><bean:message key="showBuyerStart.allMyVotes"/></a>
						  						</td>
									  		</tr>			  				  		
											<tr><td height="15"></td></tr>
									  		<tr>
						  						<td class="data1text">	
						  							<a href="showBuyerMessage.do" class="data1Link"><bean:write name="buyerStartData" property="newMessages"/></a>&nbsp;<bean:message key="showBuyerStart.newMessages"/>
						  						</td>
									  		</tr>	
									  		<tr>
						  						<td class="data1text">	
						  							<a href="showBuyerInvitation.do" class="data1Link"><bean:write name="buyerStartData" property="newInvitations"/></a>&nbsp;<bean:message key="showBuyerStart.newInvitations"/>
						  						</td>
									  		</tr>	
											<tr><td height="15"></td></tr>		
											<tr>
												<td class="data1Text">
													<logic:equal name="buyerStartData" property="hasPicture" value="1">
														&nbsp;&nbsp;&nbsp;<img src="/media/pictures/smaller/buyer_<bean:write name="buyerStartData" property="id"/>_<bean:write name="buyerStartData" property="mainPicture"/>_<bean:write name="buyerStartData" property="mainPictureCode"/>.jpg">
													</logic:equal>
													<logic:equal name="buyerStartData" property="hasPicture" value="0">
														<a href="showBuyerPictures.do" class="data1Link"><bean:message key="showBuyerStart.addPictures"/></a>
													</logic:equal>
												</td>
											</tr>
									  		<tr>
						  						<td>	
						  							<a href="showBuyerAccount.do" class="data1Link"><bean:message key="showBuyerStart.editProfile"/></a>
						  						</td>
									  		</tr>	
									  		<logic:equal name="buyerStartData" property="hasPicture" value="1">
										  		<tr>
							  						<td>	
							  							<a href="showBuyerPictures.do" class="data1Link"><bean:message key="showBuyerStart.editPictures"/></a>
							  						</td>
										  		</tr>	
										  	</logic:equal>
									  		<tr>
						  						<td>	
						  							<a href="showBuyer.do?id=<bean:write name="buyerStartData" property="id"/>" class="data1Link"><bean:message key="showBuyerStart.seeProfile"/></a>
						  						</td>
									  		</tr>	
									  		
									  	</table>
						  			</td>
						  			<td valign="top" width="554">
						  				<!-- center -->
						  			  	<table width="554" cellpadding="0" cellspacing="0" border="0" valign="top">
									  		<tr>
						  						<td>
						  						  	<table width="554" cellpadding="0" cellspacing="0" border="0" align="center">
												  		<tr align="center">
									  						<td class="data1Text">
									  							<b><bean:write name="buyerContactData" property="waitingContacts"/></b>&nbsp;<bean:message key="showBuyerStart.waitingContacts"/>&nbsp;&nbsp;
									  							<b><bean:write name="buyerContactData" property="waitingPayments"/></b>&nbsp;<bean:message key="showBuyerStart.waitingPayments"/>&nbsp;&nbsp;
									  							<b><bean:write name="buyerContactData" property="waitingDates"/></b>&nbsp;<bean:message key="showBuyerStart.waitingDates"/>&nbsp;&nbsp;
									  							<b><bean:write name="buyerContactData" property="waitingVotes"/></b>&nbsp;<bean:message key="showBuyerStart.waitingVotes"/>&nbsp;&nbsp;
									  						</td>
												  		</tr>
												  	</table>
						  						</td>
									  		</tr>
									  		<tr><td height="10"></td></tr>
									  		<tr>
									  			<td>
						  						  	<table width="554" cellpadding="0" cellspacing="0" border="0">
						  						  		<logic:empty name="buyerContactData" property="contacts">
						  						  			<tr>
						  						  				<td class="data1Text" align="center">
						  						  					<bean:message key="showBuyerStart.contactNotExist"/>.&nbsp;<bean:message key="common.click"/>&nbsp;<a href="showBuyerSellerSearch.do" class="data1Link"><bean:message key="common.here"/></a>&nbsp;<bean:message key="showBuyerStart.toMakeYourFirstContact"/>
						  						  				</td>
						  						  			</tr>
						  						  		</logic:empty>
						  						  	
							  						  	<logic:notEmpty name="buyerContactData" property="contacts">
							  						  		<logic:iterate name="buyerContactData" property="contacts" id="collection">
														  		<tr>
													  			<logic:equal name="collection" property="oddOrEven" value="odd">
											  						<td width="9" height="85" background="pictures/buyerContactLeftBorderOdd.gif"></td>
											  					</logic:equal>
													  			<logic:notEqual name="collection" property="oddOrEven" value="odd">
											  						<td width="9" height="85" background="pictures/buyerContactLeftBorderEven.gif"></td>
											  					</logic:notEqual>
										  						<logic:equal name="collection" property="oddOrEven" value="odd">
											  						<td height="85" width="522" bgcolor="#C185AA">
											  					</logic:equal>
										  						<logic:notEqual name="collection" property="oddOrEven" value="odd">
											  						<td height="85" width="522" bgcolor="#E5B8D3">
											  					</logic:notEqual>
											  						  	<table width="536" cellpadding="0" cellspacing="0" border="0" >
																	  		<tr valign="middle">
																	  			<td valign="middle">
																	  				<logic:equal name="collection" property="sellerHasPicture" value="1">
																		  				<img src="/media/pictures/smaller/seller_<bean:write name="collection" property="sellerId"/>_<bean:write name="collection" property="sellerMainPicture"/>_<bean:write name="collection" property="sellerMainPictureCode"/>.jpg"/>
																		  			</logic:equal>
																		  			<logic:notEqual name="collection" property="sellerHasPicture" value="1">
																		  				<logic:equal name="collection" property="sellerSex" value="1">
																			  				<img src="pictures/defaultGirl.gif"/>
																			  			</logic:equal>
																		  				<logic:equal name="collection" property="sellerSex" value="2">
																			  				<img src="pictures/defaultBoy.gif"/>
																			  			</logic:equal>
																		  				<logic:equal name="collection" property="sellerSex" value="4">
																			  				<img src="pictures/defaultShemale.gif"/>
																			  			</logic:equal>
																		  				<logic:equal name="collection" property="sellerSex" value="8">
																			  				<img src="pictures/defaultBoysCouple.gif"/>
																			  			</logic:equal>
																		  				<logic:equal name="collection" property="sellerSex" value="16">
																			  				<img src="pictures/defaultGirlsCouple.gif"/>
																			  			</logic:equal>
																		  				<logic:equal name="collection" property="sellerSex" value="32">
																			  				<img src="pictures/defaultBoyAndGirlCouple.gif"/>
																			  			</logic:equal>
																		  				<logic:equal name="collection" property="sellerSex" value="64">
																			  				<img src="pictures/defaultGroup.gif"/>
																			  			</logic:equal>
																		  			</logic:notEqual>
																	  			</td>
																	  			<td valign="top" align="left">
																	  				<table cellpadding="0" cellspacing="0" border="0" align="left">
																	  					<tr align="left">
																	  						<td nowrap class="data1Text" align="left">
																	  							<a href="showSeller.do?id=<bean:write name="collection"  property="sellerId"/>" class="data1Link">
																			  						<bean:write name="collection" property="sellerLogin"/>
																			  					</a>
																	  						</td>
																	  					</tr>
																	  					<tr align="left">
																	  						<td nowrap class="data1Text" align="left">
																		  						<bean:write name="collection" property="sellerAge"/>
																	  						</td>
																	  					</tr>
																	  					<tr align="left">
																	  						<td nowrap class="data1Text" align="left">
																		  						<bean:write name="collection" property="sellerCountry"/>
																	  						</td>
																	  					</tr>
																	  					<tr align="left">
																	  						<td nowrap class="data1Text" align="left">
																		  						<bean:write name="collection" property="sellerState"/>
																	  						</td>
																	  					</tr>
																	  					<tr align="left">
																	  						<td nowrap class="data1Text" align="left">
																		  						<bean:write name="collection" property="sellerCity"/>
																	  						</td>
																	  					</tr>										  					
																	  					<tr align="left">
																	  						<td nowrap class="data1Text" align="left">
																		  						<span class="data1TextGreen"><b><bean:write name="collection" property="sellerPositiveVotes"/></b></span>/<span class="data1TextRed"><b><bean:write name="collection" property="sellerNegativeVotes"/></b></span>
																	  						</td>
																	  					</tr>
																	  				</table>
																	  			</td>
																	  			<td width="5"></td>
																	  			<td valign="middle">
																	  				<table cellpadding="0" cellspacing="0" border="0">
																	  					<tr>
																	  						<td nowrap class="data1Text" align="right">
																	  							<bean:message key="showBuyerStart.contactDate"/>:&nbsp;
																	  						</td>
																	  						<td nowrpa class="data1Text" align="left">
																	  							<b><bean:write name="collection" property="messageBriefDate"/></b>&nbsp;<bean:message key="common.at"/>&nbsp;<b><bean:write name="collection" property="messageTime"/></b>&nbsp(<bean:write name="collection" property="messageTimeFrom"/>)
																	  						</td>
																	  					</tr>
																	  					<tr>
																	  						<td nowrap class="data1Text" align="right">
																	  							<bean:message key="showBuyerStart.dateDate"/>:&nbsp;
																	  						</td>
																							<td nowrap class="data1Text" align="left">							  															  						
																	  							<b><bean:write name="collection" property="dateBriefDate"/></b>&nbsp;<bean:message key="common.at"/>&nbsp;<b><bean:write name="collection" property="dateTime"/></b>
																	  							<logic:greaterEqual name="collection" property="dateTimeToValue" value="0">
																		  							(<bean:write name="collection" property="dateTimeTo"/>)
																	  							</logic:greaterEqual>
																	  							<logic:lessThan name="collection" property="dateTimeToValue" value="0">
																		  							(<bean:message key="showBuyerStart.passedOff"/>)
																	  							</logic:lessThan>
																	  						</td>
																	  					</tr>
																	  					<tr>
																	  						<td nowrap class="data1Text" align="right">
																	  							<bean:message key="showBuyerStart.contactStatus"/>:&nbsp;
																	  						</td>
																							<td nowrap class="data1Text" align="left" style="color:<bean:write name="collection" property="messageStatusColor"/>;">
																	  							<b><bean:write name="collection" property="messageStatusText"/></b>
																	  							<logic:equal name="collection" property="messageStatusConst" value="1">
																		  							&nbsp;&nbsp;<a href="showBuyerSendContactMessage.do?id=<bean:write name="collection" property="id"/>" class="data1Link"><bean:message key="showBuyerStart.sendMessage"/></a>
																		  						</logic:equal>
																		  						<logic:equal name="collection" property="messageStatusConst" value="2">
																		  							&nbsp;&nbsp;<a href="showBuyerSellerContactWays.do?id=<bean:write name="collection" property="id"/>" class="data1Link"><bean:message key="showBuyerStart.seeContactData"/></a>
																		  						</logic:equal>
																		  						<logic:equal name="collection" property="messageStatusConst" value="3">
																		  							&nbsp;&nbsp;<span class="data1Text" style="cursor:default;cursor:default;" onMouseover="EnterHelpContent('<bean:message key="showBuyerStart.reason"/>','<bean:write name="collection" property="messageAnswer"/>'); Activate();" onMouseout="deActivate();"><bean:message key="showBuyerStart.reason"/></span>
																		  						</logic:equal>
																		  						
																	  						</td>									  						
																	  					</tr>
																	  					<tr>
																	  						<td nowrap class="data1Text" align="right">
																	  							<bean:message key="showBuyerStart.paymentStatus"/>:&nbsp;
																	  						</td>
																							<td nowrap class="data1Text" align="left" style="color:<bean:write name="collection" property="paymentStatusColor"/>;">
																	  							<b><bean:write name="collection" property="paymentStatusText"/></b>
																	  							<logic:equal name="collection" property="paymentStatusConst" value="1">
																		  							&nbsp;&nbsp;<a href="showBuyerPay.do?id=<bean:write name="collection" property="id"/>" class="data1Link"><bean:message key="showBuyerStart.pay"/></a>
																		  						</logic:equal>
																	  							
																	  						</td>									  						
																	  					</tr>
																	  					<tr>
																	  						<td nowrap class="data1Text" align="right">
																	  							<bean:message key="showBuyerStart.dateStatus"/>:&nbsp;
																	  						</td>
																							<td nowrap class="data1Text" align="left" style="color:<bean:write name="collection" property="dateStatusColor"/>;">
																	  							<b><bean:write name="collection" property="dateStatusText"/></b>
																	  							<logic:equal name="collection" property="dateStatusConst" value="1">
																		  							&nbsp;&nbsp;<a href="showBuyerCancelDate.do?id=<bean:write name="collection" property="id"/>" class="data1Link"><bean:message key="showBuyerStart.cancelDate"/></a>
																		  						</logic:equal>
																		  						<logic:equal name="collection" property="dateStatusConst" value="2">
																		  							&nbsp;&nbsp;<span class="data1Text" style="cursor:default;cursor:default;" onMouseover="EnterHelpContent('<bean:message key="showBuyerStart.cancelDateText"/>','<bean:write name="collection" property="cancelDateText"/>'); Activate();" onMouseout="deActivate();"><bean:message key="showBuyerStart.cancelDateText"/></span>
																		  						</logic:equal>
																	  						</td>									  						
																	  					</tr>
																	  					<tr>
																	  						<td nowrap class="data1Text" align="right">
																	  							<bean:message key="showBuyerStart.voteStatus"/>:&nbsp;
																	  						</td>
																							<td nowrap class="data1Text" align="left" style="color:<bean:write name="collection" property="voteStatusColor"/>;">
																	  							<b><bean:write name="collection" property="voteStatusText"/></b>
																	  							&nbsp;&nbsp;
																	  							
																	  							<span style="color:#000000;">
																		  							<logic:equal name="collection" property="vote" value="1">
																			  							<img src="pictures/positiveVoteSmall.gif" alt="<bean:message key="showBuyerStart.positiveEmmitedVote"/>"/>
																			  						</logic:equal>
																			  						<logic:equal name="collection" property="vote" value="-1">
																			  							<img src="pictures/negativeVoteSmall.gif" alt="<bean:message key="showBuyerStart.negativeEmmitedVote"/>"/>
																			  						</logic:equal>
																			  						
																			  						<logic:equal name="collection" property="sellerVote" value="1">
																			  							<b>/</b>&nbsp;<img src="pictures/positiveVoteSmall.gif" alt="<bean:message key="showBuyerStart.positiveReceivedVote"/>"/>
																			  						</logic:equal>
																			  						<logic:equal name="collection" property="sellerVote" value="-1">
																			  							</b>/</b>&nbsp;<img src="pictures/negativeVoteSmall.gif" alt="<bean:message key="showBuyerStart.negativeReceivedVote"/>"/>
																			  						</logic:equal>
																			  						
																									<logic:equal name="collection" property="voteStatusConst" value="1">
																			  							&nbsp;&nbsp;<a href="showBuyerVoteSeller.do?id=<bean:write name="collection" property="id"/>" class="data1Link"><bean:message key="showBuyerStart.vote"/></a>
																			  						</logic:equal>
																			  					</span>
																			  					
																	  						</td>									  						
																	  					</tr>										  					
																	  				</table>
																	  			</td>
																			  	<td valign="top" align="right">
																	  				<table cellpadding="0" cellspacing="0" border="0" align="right">
																	  					<tr align="right">
																	  						<td nowrap class="data1Text" align="right" title="<bean:message key="showBuyerStart.details"/>">
																	  							<a href="showBuyerContactDetail.do?id=<bean:write name="collection" property="id"/>">
																		  							<img src="pictures/detailsIcon.gif" border="0"/>
																		  						</a>
																	  						</td>
																	  					</tr>
																	  					<logic:equal name="collection" property="voteStatusConst" value="2">
																							<tr align="right">
																		  						<td nowrap class="data1Text" align="right" title="<bean:message key="showBuyerStart.deleteContact"/>">
																		  							<a href="deleteBuyerContact.do?id=<bean:write name="collection" property="id"/>">
																			  							<img src="pictures/deleteIcon.gif" border="0"/>
																			  						</a>
																		  						</td>
																		  					</tr>										  																			  					
																		  				</logic:equal>
																		  				<logic:notEqual name="collection" property="voteStatusConst" value="2">
																		  					<logic:greaterEqual name="collection" property="messageStatusConst" value="3">
																								<tr align="right">
																			  						<td nowrap class="data1Text" align="right" title="<bean:message key="showBuyerStart.deleteContact"/>">
																			  							<a href="deleteBuyerContact.do?id=<bean:write name="collection" property="id"/>">
																							  				<img src="pictures/deleteIcon.gif" border="0"/>
																							  			</a>
																			  						</td>
																			  					</tr>	
																			  				</logic:greaterEqual>									  																			  					
																		  				</logic:notEqual>
																  					</table>
																  				</td>
																	  		</tr>
																	  	</table>
											  						</td>
										  						<logic:equal name="collection" property="oddOrEven" value="odd">
											  						<td width="9" height="85" background="pictures/buyerContactRightBorderOdd.gif"></td>
											  					</logic:equal>
										  						<logic:notEqual name="collection" property="oddOrEven" value="odd">
											  						<td width="9" height="85" background="pictures/buyerContactRightBorderEven.gif"></td>
											  					</logic:notEqual>
													  		</tr>
													  		<tr><td height="5"></td><td></td><td></td></tr>
													  		<tr>
													  	</logic:iterate>
													  	<tr>
													  		<td></td>
													  		<td align="right">
													  			<a href="showBuyerContact.do" class="data1Link">
													  				<bean:message key="showBuyerStart.allMyContacts"/>
													  			</a>
													  		</td>
													  		<td></td>
													  	</tr>
													</logic:notEmpty>								  	
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
