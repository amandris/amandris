<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

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
						  						<td class="data1Text" title="<bean:write name="sellerStartData" property="login"/>">	
						  							<bean:message key="showSellerStart.welcome"/>, <b><bean:write name="sellerStartData" property="briefLogin"/></b>
						  						</td>
									  		</tr>
									  		
									  		<logic:equal name="sellerStartData" property="hasPenddingTasks" value="1">
										  		<tr><td height="15"></td></tr>
										  		<tr>
										  			<td>
										  				<table width="90%%" class="penddingTasksTable">
										  					<tr>
										  						<td class="data2Text">
										  							<span style="color:red"><bean:message key="showSellerStart.penddingTasks"/></span>
										  						</td>
										  					</tr>
										  					<tr>
										  						<td class="data1Text">
										  							<logic:equal name="sellerStartData" property="calendarSaved" value="0">
										  								<li><a href="showSellerCalendar.do" class="data1Link"><bean:message key="showSellerStart.calendar"/></li></a>
										  							</logic:equal>
										  							<logic:equal name="sellerStartData" property="servicesSaved" value="0">
										  								<li><a href="showSellerService.do" class="data1Link"><bean:message key="showSellerStart.services"/></li></a>
										  							</logic:equal>
										  							<logic:equal name="sellerStartData" property="parametersSaved" value="0">
										  								<li><a href="showSellerParameter.do" class="data1Link"><bean:message key="showSellerStart.parameters"/></li></a>
										  							</logic:equal>
										  							<logic:equal name="sellerStartData" property="picturesSaved" value="0">
										  								<li><a href="showSellerPictures.do" class="data1Link"><bean:message key="showSellerStart.pictures"/></li></a>
										  							</logic:equal>
										  							<logic:equal name="sellerSession" property="isEscort" value="0">
											  							<logic:equal name="sellerStartData" property="preferencesSaved" value="0">
											  								<li><a href="showSellerPreferences.do" class="data1Link"><bean:message key="showSellerStart.preferences"/></li></a>
											  							</logic:equal>
											  						</logic:equal>
										  						</td>
										  					</tr>
										  					<tr><td height="10"></td></tr>
										  				</table>
										  			</td>
										  		</tr>
									  		</logic:equal>
									  		<logic:equal name="sellerSession" property="isEscort" value="0">
										  		<tr><td height="15"></td></tr>
										  		<tr>
										  			<td>
											  			<table cellpadding="0" cellsapcing="0">
										  					<tr>
										  						<td class="data1Text">	
																	<span class="data1TextGreen"><b><bean:write name="sellerStartData" property="positiveVotes"/></b></span>&nbsp;/
																	<span class="data1TextRed"><b><bean:write name="sellerStartData" property="negativeVotes"/></b></span>
										  						</td>
										  						<td width="5"></td>
										  						<td class="data1TextGreen">	
																<td>
																	<logic:equal name="sellerStartData" property="userLevel" value="0">
																		<img src="pictures/userLevel0.gif" alt="<bean:message key="showSellerStart.userLevel0"/>"/>
																	</logic:equal>
																	<logic:equal name="sellerStartData" property="userLevel" value="1">
																		<img src="pictures/userLevel1.gif" alt="<bean:message key="showSellerStart.userLevel1"/>"/>
																	</logic:equal>
																	<logic:equal name="sellerStartData" property="userLevel" value="2">
																		<img src="pictures/userLevel2.gif" alt="<bean:message key="showSellerStart.userLevel2"/>"/>
																	</logic:equal>
																	<logic:equal name="sellerStartData" property="userLevel" value="3">
																		<img src="pictures/userLevel3.gif" alt="<bean:message key="showSellerStart.userLevel3"/>"/>
																	</logic:equal>
																	<logic:equal name="sellerStartData" property="userLevel" value="4">
																		<img src="pictures/userLevel4.gif" alt="<bean:message key="showSellerStart.userLevel4"/>"/>
																	</logic:equal>
																	<logic:equal name="sellerStartData" property="userLevel" value="5">
																		<img src="pictures/userLevel5.gif" alt="<bean:message key="showSellerStart.userLevel5"/>"/>
																	</logic:equal>
																	<logic:equal name="sellerStartData" property="userLevel" value="6">
																		<img src="pictures/userLevel6.gif" alt="<bean:message key="showSellerStart.userLevel6"/>"/>
																	</logic:equal>
																	<logic:equal name="sellerStartData" property="userLevel" value="7">
																		<img src="pictures/userLevel7.gif" alt="<bean:message key="showSellerStart.userLevel7"/>"/>
																	</logic:equal>
																			
										  						</td>
										  					</tr>
										  				</table>
										  			</td>
										  		</tr>
										  		<tr>
							  						<td class="data1Text">	
														<b><bean:write name="sellerStartData" property="positiveVotesPercent"/><b/><bean:message key="showSellerStart.positiveVotesPercentage"/>
							  						</td>
										  		</tr>	
										  		<tr>
							  						<td>	
							  							<a href="showSellerVote.do" class="data1Link"><bean:message key="showSellerStart.allMyVotes"/></a>
							  						</td>
										  		</tr>			  				  		
												<tr><td height="15"></td></tr>
											</logic:equal>
									  		<tr>
						  						<td class="data1text">	
						  							<a href="showSellerMessage.do" class="data1Link"><bean:write name="sellerStartData" property="newMessages"/></a>&nbsp;<bean:message key="showSellerStart.newMessages"/>
						  						</td>
									  		</tr>	
											<tr><td height="15"></td></tr>		
											<tr>
												<td class="data1Text">
													<logic:equal name="sellerStartData" property="hasPicture" value="1">
														&nbsp;&nbsp;&nbsp;<img src="/media/pictures/smaller/seller_<bean:write name="sellerStartData" property="id"/>_<bean:write name="sellerStartData" property="mainPicture"/>_<bean:write name="sellerStartData" property="mainPictureCode"/>.jpg">
													</logic:equal>
													<logic:equal name="sellerStartData" property="hasPicture" value="0">
														<logic:equal name="sellerSession" property="isEscort" value="0">
															<a href="showSellerPictures.do" class="data1Link"><bean:message key="showSellerStart.addPictures"/></a>
														</logic:equal>
														<logic:equal name="sellerSession" property="isEscort" value="1">
															<a href="showSellerPictures.do" class="data1Link"><bean:message key="showSellerStart.addPictures"/></a>
														</logic:equal>
													</logic:equal>
												</td>
											</tr>
									  		<tr>
						  						<td>	
						  							<a href="showSellerAccount.do" class="data1Link"><bean:message key="showSellerStart.editProfile"/></a>
						  						</td>
									  		</tr>	
									  		<logic:equal name="sellerStartData" property="hasPicture" value="1">
										  		<tr>
							  						<td>	
							  							<a href="showSellerPictures.do" class="data1Link"><bean:message key="showSellerStart.editPictures"/></a>
							  						</td>
										  		</tr>	
										  	</logic:equal>
									  		<tr>
						  						<td>	
						  							<a href="showSeller.do?id=<bean:write name="sellerStartData" property="id"/>" class="data1Link"><bean:message key="showSellerStart.seeProfile"/></a>
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
									  							<b><bean:write name="sellerContactData" property="waitingContacts"/></b>&nbsp;<bean:message key="showSellerStart.waitingContacts"/>&nbsp;&nbsp;
									  							<b><bean:write name="sellerContactData" property="waitingPayments"/></b>&nbsp;<bean:message key="showSellerStart.waitingPayments"/>&nbsp;&nbsp;
									  							<b><bean:write name="sellerContactData" property="waitingDates"/></b>&nbsp;<bean:message key="showSellerStart.waitingDates"/>&nbsp;&nbsp;
									  							<b><bean:write name="sellerContactData" property="waitingVotes"/></b>&nbsp;<bean:message key="showSellerStart.waitingVotes"/>&nbsp;&nbsp;
									  						</td>
												  		</tr>
												  	</table>
						  						</td>
									  		</tr>
									  		<tr><td height="10"></td></tr>
									  		<tr>
									  			<td>
						  						  	<table width="554" cellpadding="0" cellspacing="0" border="0">
						  						  		<logic:empty name="sellerContactData" property="contacts">
						  						  			<tr>
						  						  				<td class="data1Text" align="center">
						  						  					<bean:message key="showSellerStart.contactNotExist"/>.
						  						  				</td>
						  						  			</tr>
						  						  		</logic:empty>
						  						  	
							  						  	<logic:notEmpty name="sellerContactData" property="contacts">
							  						  		<logic:iterate name="sellerContactData" property="contacts" id="collection">
														  		<tr>
													  			<logic:equal name="collection" property="oddOrEven" value="odd">
											  						<td width="9" height="85" background="pictures/sellerContactLeftBorderOdd.gif"></td>
											  					</logic:equal>
													  			<logic:notEqual name="collection" property="oddOrEven" value="odd">
											  						<td width="9" height="85" background="pictures/sellerContactLeftBorderEven.gif"></td>
											  					</logic:notEqual>
										  						<logic:equal name="collection" property="oddOrEven" value="odd">
											  						<td height="85" width="522" bgcolor="#BC74D8">
											  					</logic:equal>
										  						<logic:notEqual name="collection" property="oddOrEven" value="odd">
											  						<td height="85" width="522" bgcolor="#F1A9FF">
											  					</logic:notEqual>
											  						  	<table width="536" cellpadding="0" cellspacing="0" border="0" >
																	  		<tr valign="middle">
																	  			<td valign="middle">
																	  				<logic:equal name="collection" property="buyerHasPicture" value="1">
																		  				<img src="/media/pictures/smaller/buyer_<bean:write name="collection" property="buyerId"/>_<bean:write name="collection" property="buyerMainPicture"/>_<bean:write name="collection" property="buyerMainPictureCode"/>.jpg"/>
																		  			</logic:equal>
																		  			<logic:notEqual name="collection" property="buyerHasPicture" value="1">
																		  				<logic:equal name="collection" property="buyerSex" value="1">
																			  				<img src="pictures/defaultGirl.gif"/>
																			  			</logic:equal>
																		  				<logic:equal name="collection" property="buyerSex" value="2">
																			  				<img src="pictures/defaultBoy.gif"/>
																			  			</logic:equal>
																		  				<logic:equal name="collection" property="buyerSex" value="4">
																			  				<img src="pictures/defaultShemale.gif"/>
																			  			</logic:equal>
																		  				<logic:equal name="collection" property="buyerSex" value="8">
																			  				<img src="pictures/defaultBoysCouple.gif"/>
																			  			</logic:equal>
																		  				<logic:equal name="collection" property="buyerSex" value="16">
																			  				<img src="pictures/defaultGirlsCouple.gif"/>
																			  			</logic:equal>
																		  				<logic:equal name="collection" property="buyerSex" value="32">
																			  				<img src="pictures/defaultBoyAndGirlCouple.gif"/>
																			  			</logic:equal>
																		  				<logic:equal name="collection" property="buyerSex" value="64">
																			  				<img src="pictures/defaultGroup.gif"/>
																			  			</logic:equal>
																		  			</logic:notEqual>
																	  			</td>
																	  			<td valign="top" align="left">
																	  				<table cellpadding="0" cellspacing="0" border="0" align="left">
																	  					<tr align="left">
																	  						<td nowrap class="data1Text" align="left">
																	  							<a href="showBuyer.do?id=<bean:write name="collection"  property="buyerId"/>" class="data1Link">
																			  						<bean:write name="collection" property="buyerLogin"/>
																			  					</a>
																	  						</td>
																	  					</tr>
																	  					<tr align="left">
																	  						<td nowrap class="data1Text" align="left">
																		  						<bean:write name="collection" property="buyerAge"/>
																	  						</td>
																	  					</tr>
																	  					<tr align="left">
																	  						<td nowrap class="data1Text" align="left">
																		  						<bean:write name="collection" property="buyerCountry"/>
																	  						</td>
																	  					</tr>
																	  					<tr align="left">
																	  						<td nowrap class="data1Text" align="left">
																		  						<bean:write name="collection" property="buyerState"/>
																	  						</td>
																	  					</tr>
																	  					<tr align="left">
																	  						<td nowrap class="data1Text" align="left">
																		  						<bean:write name="collection" property="buyerCity"/>
																	  						</td>
																	  					</tr>										  					
																	  					<tr align="left">
																	  						<td nowrap class="data1Text" align="left">
																		  						<span class="data1TextGreen"><b><bean:write name="collection" property="buyerPositiveVotes"/></b></span>/<span class="data1TextRed"><b><bean:write name="collection" property="buyerNegativeVotes"/></b></span>
																	  						</td>
																	  					</tr>
																	  				</table>
																	  			</td>
																	  			<td width="5"></td>
																	  			<td valign="middle">
																	  				<table cellpadding="0" cellspacing="0" border="0">
																	  					<tr>
																	  						<td nowrap class="data1Text" align="right">
																	  							<bean:message key="showSellerStart.contactDate"/>:&nbsp;
																	  						</td>
																	  						<td nowrap class="data1Text" align="left">
																	  							<b><bean:write name="collection" property="messageBriefDate"/></b>&nbsp;<bean:message key="common.at"/>&nbsp;<b><bean:write name="collection" property="messageTime"/></b>&nbsp(<bean:write name="collection" property="messageTimeFrom"/>)
																	  						</td>
																	  					</tr>
																	  					<tr>
																	  						<td nowrap class="data1Text" align="right">
																	  							<bean:message key="showSellerStart.dateDate"/>:&nbsp;
																	  						</td>
																							<td nowrap class="data1Text" align="left">							  															  						
																	  							<b><bean:write name="collection" property="dateBriefDate"/></b>&nbsp;<bean:message key="common.at"/>&nbsp;<b><bean:write name="collection" property="dateTime"/></b>
																	  							<logic:greaterEqual name="collection" property="dateTimeToValue" value="0">
																		  							(<bean:write name="collection" property="dateTimeTo"/>)
																	  							</logic:greaterEqual>
																	  							<logic:lessThan name="collection" property="dateTimeToValue" value="0">
																		  							(<bean:message key="showSellerStart.passedOff"/>)
																	  							</logic:lessThan>
																	  						</td>
																	  					</tr>
																	  					<tr>
																	  						<td nowrap class="data1Text" align="right">
																	  							<bean:message key="showSellerStart.contactStatus"/>:&nbsp;
																	  						</td>
																							<td nowrap class="data1Text" align="left" style="color:<bean:write name="collection" property="messageStatusColor"/>;">
																	  							<b><bean:write name="collection" property="messageStatusText"/></b>
																	  							<logic:equal name="collection" property="messageStatusConst" value="1">
																		  							&nbsp;&nbsp;<a href="showSellerReplyContact.do?id=<bean:write name="collection" property="id"/>" class="data1Link"><bean:message key="showSellerStart.replyContact"/></a>
																		  						</logic:equal>
																		  						<logic:equal name="collection" property="messageStatusConst" value="3">
																		  							&nbsp;&nbsp;<span class="data1Text" style="cursor:default;cursor:default;" onMouseover="EnterHelpContent('<bean:message key="showSellerStart.reason"/>','<bean:write name="collection" property="messageAnswer"/>'); Activate();" onMouseout="deActivate();"><bean:message key="showSellerStart.reason"/></span>
																		  						</logic:equal>
																	  						</td>									  						
																	  					</tr>
																	  					<tr>
																	  						<td nowrap class="data1Text" align="right">
																	  							<bean:message key="showSellerStart.paymentStatus"/>:&nbsp;
																	  						</td>
																							<td nowrap class="data1Text" align="left" style="color:<bean:write name="collection" property="paymentStatusColor"/>;">
																	  							<b><bean:write name="collection" property="paymentStatusText"/></b>
																	  							<logic:equal name="collection" property="paymentStatusConst" value="1">
																		  							&nbsp;&nbsp;<a href="showSellerMarkAsPay.do?id=<bean:write name="collection" property="id"/>" class="data1Link"><bean:message key="showSellerStart.markAsPayed"/></a>
																		  						</logic:equal>
																	  							
																	  						</td>									  						
																	  					</tr>
																	  					<tr>
																	  						<td nowrap class="data1Text" align="right">
																	  							<bean:message key="showSellerStart.dateStatus"/>:&nbsp;
																	  						</td>
																							<td nowrap class="data1Text" align="left" style="color:<bean:write name="collection" property="dateStatusColor"/>;">
																	  							<b><bean:write name="collection" property="dateStatusText"/></b>
																	  							<logic:equal name="collection" property="dateStatusConst" value="1">
																		  							&nbsp;&nbsp;<a href="showSellerCancelDate.do?id=<bean:write name="collection" property="id"/>" class="data1Link"><bean:message key="showSellerStart.cancelDate"/></a>
																		  						</logic:equal>
																		  						<logic:equal name="collection" property="dateStatusConst" value="2">
																		  							&nbsp;&nbsp;<span class="data1Text" style="cursor:default;cursor:default;" onMouseover="EnterHelpContent('<bean:message key="showSellerStart.cancelDateText"/>','<bean:write name="collection" property="cancelDateText"/>'); Activate();" onMouseout="deActivate();"><bean:message key="showSellerStart.cancelDateText"/></span>
																		  						</logic:equal>
																	  						</td>									  						
																	  					</tr>
																	  					<tr>
																	  						<td nowrap class="data1Text" align="right">
																	  							<bean:message key="showSellerStart.voteStatus"/>:&nbsp;
																	  						</td>
																							<td nowrap class="data1Text" align="left" style="color:<bean:write name="collection" property="sellerVoteStatusColor"/>;">
																	  							<b><bean:write name="collection" property="sellerVoteStatusText"/></b>
																	  							&nbsp;&nbsp;
																	  							
																	  							<span style="color:#000000;">
																		  							<logic:equal name="collection" property="sellerVote" value="1">
																			  							<img src="pictures/positiveVoteSmall.gif" alt="<bean:message key="showSellerStart.positiveEmmitedVote"/>"/>
																			  						</logic:equal>
																			  						<logic:equal name="collection" property="sellerVote" value="-1">
																			  							<img src="pictures/negativeVoteSmall.gif" alt="<bean:message key="showSellerStart.negativeEmmitedVote"/>"/>
																			  						</logic:equal>
																			  						
																			  						<logic:equal name="collection" property="vote" value="1">
																			  							<b>/</b>&nbsp;<img src="pictures/positiveVoteSmall.gif" alt="<bean:message key="showSellerStart.positiveReceivedVote"/>"/>
																			  						</logic:equal>
																			  						<logic:equal name="collection" property="vote" value="-1">
																			  							</b>/</b>&nbsp;<img src="pictures/negativeVoteSmall.gif" alt="<bean:message key="showSellerStart.negativeReceivedVote"/>"/>
																			  						</logic:equal>
																			  						
																									<logic:equal name="collection" property="sellerVoteStatusConst" value="1">
																			  							&nbsp;&nbsp;<a href="showSellerVoteBuyer.do?id=<bean:write name="collection" property="id"/>" class="data1Link"><bean:message key="showSellerStart.vote"/></a>
																			  						</logic:equal>
																			  					</span>
																			  					
																	  						</td>									  						
																	  					</tr>										  					
																	  				</table>
																	  			</td>
																			  	<td valign="top" align="right">
																	  				<table cellpadding="0" cellspacing="0" border="0" align="right">
																	  					<tr align="right">
																	  						<td nowrap class="data1Text" align="right" title="<bean:message key="showSellerStart.details"/>">
																	  							<a href="showSellerContactDetail.do?id=<bean:write name="collection" property="id"/>">
																		  							<img src="pictures/detailsIcon.gif" border="0"/>
																		  						</a>
																	  						</td>
																	  					</tr>
																	  					<logic:equal name="collection" property="sellerVoteStatusConst" value="2">
																							<tr align="right">
																		  						<td nowrap class="data1Text" align="right" title="<bean:message key="showSellerStart.deleteContact"/>">
																		  							<a href="deleteSellerContact.do?id=<bean:write name="collection" property="id"/>">
																			  							<img src="pictures/deleteIcon.gif" border="0"/>
																			  						</a>
																		  						</td>
																		  					</tr>										  																			  					
																		  				</logic:equal>
																		  				<logic:notEqual name="collection" property="sellerVoteStatusConst" value="2">
																		  					<logic:greaterEqual name="collection" property="messageStatusConst" value="3">
																								<tr align="right">
																			  						<td nowrap class="data1Text" align="right" title="<bean:message key="showSellerStart.deleteContact"/>">
																			  							<a href="deleteSellerContact.do?id=<bean:write name="collection" property="id"/>">
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
											  						<td width="9" height="85" background="pictures/sellerContactRightBorderOdd.gif"></td>
											  					</logic:equal>
										  						<logic:notEqual name="collection" property="oddOrEven" value="odd">
											  						<td width="9" height="85" background="pictures/sellerContactRightBorderEven.gif"></td>
											  					</logic:notEqual>
													  		</tr>
													  		<tr><td height="5"></td><td></td><td></td></tr>
													  		<tr>
													  	</logic:iterate>
													  	<tr>
													  		<td></td>
													  		<td align="right">
													  			<a href="showSellerContact.do" class="data1Link">
													  				<bean:message key="showSellerStart.allMyContacts"/>
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



	<% 
	com.amandris.clients.web.view.SellerStartView sellerStartView;
	com.amandris.clients.web.util.SellerSession sellerSession;
	sellerStartView = ( com.amandris.clients.web.view.SellerStartView) request.getAttribute( "sellerStartData");
	sellerSession = ( com.amandris.clients.web.util.SellerSession) session.getAttribute( "sellerSession");
	boolean go = false;
	if( sellerSession.getIsEscort().intValue() == 0 && (sellerStartView.getParametersSaved().equals("0") || sellerStartView.getServicesSaved().equals("0") || sellerStartView.getCalendarSaved().equals("0"))){
		go = true;
	} else if( sellerSession.getIsEscort().intValue() == 1 && ( sellerSession.getSubscriptionUntil() == null || sellerSession.getSubscriptionUntil().before( new java.util.Date()))){
		go = true;
	}
	if(  go){%>
	
		<div id="activationBackgroundDiv" style="position:absolute;top:90;visibility:visible;filter:alpha(opacity=25);opacity: 0.25;-moz-opacity:0.25;">
			<table width="720" height="517" style="background:black;">
				<tr width="100%">
					<td width="100%" align="center" valign="middle">
						
					</td>
				</tr>
			</table>
		</div>
		
		<div id="activationDiv" style="position:absolute;top:220;visibility:visible;">
			<table width="720">
				<tr width="100%">
					<td width="100%" align="center" valign="middle">
						<table width="300" height="200" cellpadding="4" class="activationDivTable">
							<tr width="100%">
								<td width="100%" align="center" class="data3Text">
									<bean:message key="showSellerStart.divText1"/>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr width="100%">
								<td width="100%" align="center" class="data2Text">
									<bean:message key="showSellerStart.divText2"/>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr width="100%">
								<td width="100%" align="center" class="data2Text">
									<bean:message key="showSellerStart.divText3"/>
								</td>
							</tr>
							<logic:equal name="sellerStartData" property="calendarSaved" value="0">
								
								<tr width="100%">
									<td width="100%" align="center" class="data2Text">
										<b><bean:message key="showSellerStart.calendar"/></b>
									</td>
								</tr>
 							</logic:equal>
 							<logic:equal name="sellerStartData" property="servicesSaved" value="0">
 								
								<tr width="100%">
									<td width="100%" align="center" class="data2Text">
										<b><bean:message key="showSellerStart.services"/></b>
									</td>
								</tr>
 							</logic:equal>
 							<logic:equal name="sellerStartData" property="parametersSaved" value="0">
 								
								<tr width="100%">
									<td width="100%" align="center" class="data2Text">
										<b><bean:message key="showSellerStart.parameters"/></b>
									</td>
								</tr>
 							</logic:equal>
							
							<tr><td height="10"></td></tr>
							<tr width="100%">
								<td width="100%" align="center" class="data1Text">
									<input class="form" type="button" value="<bean:message key="showSellerStart.divText4"/>" onclick="document.getElementById('activationDiv').style.visibility='hidden';document.getElementById('activationBackgroundDiv').style.visibility='hidden';"/>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	
	<%}%>

	</tiles:put>
</tiles:insert>
