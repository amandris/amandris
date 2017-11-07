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
			  			<td valign="top" width="704">
			  				<!-- center -->
			  			  	<table width="704" cellpadding="0" cellspacing="0" border="0" valign="top">
						  		<tr>
						  			<td>
			  						  	<table width="704" cellpadding="0" cellspacing="0" border="0">
			  						  		<logic:empty name="sellerContactData" property="contacts">
			  						  			<tr>
			  						  				<td class="data1Text" align="center">
			  						  					<bean:message key="showSellerContact.contactNotExist"/>.
			  						  				</td>
			  						  			</tr>
			  						  		</logic:empty>
			  						  	
				  						  	<logic:notEmpty name="sellerContactData" property="contacts">
					  						  	<tr>
				  						  			<td></td>
			  						  				<td class="data1Text" align="center">
			  						  					<bean:message key="showSellerContact.text"/>
			  						  				</td>
			  						  				<td></td>
			  						  			</tr>
												<tr>
				  						  			<td></td><td height="10"></td><td></td>
			  						  			</tr>			  						  			
			  						  			<tr>
				  						  			<td></td>
							  						<td>
							  						  	<table width="554" cellpadding="0" cellspacing="0" border="0" align="center">
													  		<tr align="center">
										  						<td class="data1Text">
										  							<b><bean:write name="sellerContactData" property="waitingContacts"/></b>&nbsp;<bean:message key="showSellerContact.waitingContacts"/>&nbsp;&nbsp;
										  							<b><bean:write name="sellerContactData" property="waitingPayments"/></b>&nbsp;<bean:message key="showSellerContact.waitingPayments"/>&nbsp;&nbsp;
										  							<b><bean:write name="sellerContactData" property="waitingDates"/></b>&nbsp;<bean:message key="showSellerContact.waitingDates"/>&nbsp;&nbsp;
										  							<b><bean:write name="sellerContactData" property="waitingVotes"/></b>&nbsp;<bean:message key="showSellerContact.waitingVotes"/>&nbsp;&nbsp;
										  						</td>
													  		</tr>
													  	</table>
							  						</td>
							  						<td></td>
										  		</tr>
			  						  			<tr>
				  						  			<td></td><td height="10"></td><td></td>
			  						  			</tr>
				  						  		<logic:iterate name="sellerContactData" property="contacts" id="collection">
											  		<tr>
											  			<logic:equal name="collection" property="oddOrEven" value="odd">
									  						<td width="9" height="85" background="pictures/sellerContactLeftBorderOdd.gif"></td>
									  					</logic:equal>
											  			<logic:notEqual name="collection" property="oddOrEven" value="odd">
									  						<td width="9" height="85" background="pictures/sellerContactLeftBorderEven.gif"></td>
									  					</logic:notEqual>
								  						<logic:equal name="collection" property="oddOrEven" value="odd">
									  						<td height="85" width="686" bgcolor="#BC74D8">
									  					</logic:equal>
								  						<logic:notEqual name="collection" property="oddOrEven" value="odd">
									  						<td height="85" width="686" bgcolor="#F1A9FF">
									  					</logic:notEqual>
								  						  	<table width="686" cellpadding="0" cellspacing="0" border="0" >
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
														  							<b><bean:write name="collection" property="messageDate"/></b>&nbsp;<bean:message key="common.at"/>&nbsp;<b><bean:write name="collection" property="messageTime"/></b>&nbsp(<bean:write name="collection" property="messageTimeFrom"/>)
														  						</td>
														  					</tr>
														  					<tr>
														  						<td nowrap class="data1Text" align="right">
														  							<bean:message key="showSellerStart.dateDate"/>:&nbsp;
														  						</td>
																				<td nowrap class="data1Text" align="left">							  															  						
														  							<b><bean:write name="collection" property="dateDate"/></b>&nbsp;<bean:message key="common.at"/>&nbsp;<b><bean:write name="collection" property="dateTime"/></b>
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
															  							&nbsp;&nbsp;<span class="data1Text" style="cursor:default;cursor:default;" onMouseover="EnterHelpContent('<bean:message key="showSellerContact.reason"/>','<bean:write name="collection" property="messageAnswer"/>'); Activate();" onMouseout="deActivate();"><bean:message key="showSellerContact.reason"/></span>
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
															  							&nbsp;&nbsp;<span class="data1Text" style="cursor:default;cursor:default;" onMouseover="EnterHelpContent('<bean:message key="showSellerContact.cancelDateText"/>','<bean:write name="collection" property="cancelDateText"/>'); Activate();" onMouseout="deActivate();"><bean:message key="showSellerContact.cancelDateText"/></span>
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
																  						<td nowrap class="data1Text" align="right" title="<bean:message key="showSellerContact.delete"/>">
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
										</logic:notEmpty>								  	
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
