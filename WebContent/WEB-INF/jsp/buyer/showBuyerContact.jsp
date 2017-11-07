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
			  			<td valign="top" width="704">
			  				<!-- center -->
			  			  	<table width="704" cellpadding="0" cellspacing="0" border="0" valign="top">
						  		<tr>
						  			<td>
			  						  	<table width="704" cellpadding="0" cellspacing="0" border="0">
			  						  		<logic:empty name="buyerContactData" property="contacts">
			  						  			<tr>
			  						  				<td class="data1Text" align="center">
			  						  					<bean:message key="showBuyerContact.contactNotExist"/>.&nbsp;<bean:message key="common.click"/>&nbsp;<a href="showBuyerSellerSearch.do" class="data1Link"><bean:message key="common.here"/></a>&nbsp;<bean:message key="showBuyerContact.toMakeYourFirstContact"/>
			  						  				</td>
			  						  			</tr>
			  						  		</logic:empty>
			  						  	
				  						  	<logic:notEmpty name="buyerContactData" property="contacts">
					  						  	<tr>
				  						  			<td></td>
			  						  				<td class="data1Text" align="center">
			  						  					<bean:message key="showBuyerContact.text"/>
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
										  							<b><bean:write name="buyerContactData" property="waitingContacts"/></b>&nbsp;<bean:message key="showBuyerContact.waitingContacts"/>&nbsp;&nbsp;
										  							<b><bean:write name="buyerContactData" property="waitingPayments"/></b>&nbsp;<bean:message key="showBuyerContact.waitingPayments"/>&nbsp;&nbsp;
										  							<b><bean:write name="buyerContactData" property="waitingDates"/></b>&nbsp;<bean:message key="showBuyerContact.waitingDates"/>&nbsp;&nbsp;
										  							<b><bean:write name="buyerContactData" property="waitingVotes"/></b>&nbsp;<bean:message key="showBuyerContact.waitingVotes"/>&nbsp;&nbsp;
										  						</td>
													  		</tr>
													  	</table>
							  						</td>
							  						<td></td>
										  		</tr>
			  						  			<tr>
				  						  			<td></td><td height="10"></td><td></td>
			  						  			</tr>
				  						  		<logic:iterate name="buyerContactData" property="contacts" id="collection">
											  		<tr>
											  			<logic:equal name="collection" property="oddOrEven" value="odd">
									  						<td width="9" height="85" background="pictures/buyerContactLeftBorderOdd.gif"></td>
									  					</logic:equal>
											  			<logic:notEqual name="collection" property="oddOrEven" value="odd">
									  						<td width="9" height="85" background="pictures/buyerContactLeftBorderEven.gif"></td>
									  					</logic:notEqual>
								  						<logic:equal name="collection" property="oddOrEven" value="odd">
									  						<td height="85" width="686" bgcolor="#C185AA">
									  					</logic:equal>
								  						<logic:notEqual name="collection" property="oddOrEven" value="odd">
									  						<td height="85" width="686" bgcolor="#E5B8D3">
									  					</logic:notEqual>
								  						  	<table width="686" cellpadding="0" cellspacing="0" border="0" >
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
														  							<bean:message key="showBuyerContact.contactDate"/>:&nbsp;
														  						</td>
														  						<td nowrpa class="data1Text" align="left">
														  							<b><bean:write name="collection" property="messageDate"/></b>&nbsp;<bean:message key="common.at"/>&nbsp;<b><bean:write name="collection" property="messageTime"/></b>&nbsp(<bean:write name="collection" property="messageTimeFrom"/>)
														  						</td>
														  					</tr>
														  					<tr>
														  						<td nowrap class="data1Text" align="right">
														  							<bean:message key="showBuyerContact.dateDate"/>:&nbsp;
														  						</td>
																				<td nowrap class="data1Text" align="left">							  															  						
														  							<b><bean:write name="collection" property="dateDate"/></b>&nbsp;<bean:message key="common.at"/>&nbsp;<b><bean:write name="collection" property="dateTime"/></b>
														  							<logic:greaterEqual name="collection" property="dateTimeToValue" value="0">
															  							(<bean:write name="collection" property="dateTimeTo"/>)
														  							</logic:greaterEqual>
														  							<logic:lessThan name="collection" property="dateTimeToValue" value="0">
															  							(<bean:message key="showBuyerContact.passedOff"/>)
														  							</logic:lessThan>
														  						</td>
														  					</tr>
														  					<tr>
														  						<td nowrap class="data1Text" align="right">
														  							<bean:message key="showBuyerContact.contactStatus"/>:&nbsp;
														  						</td>
																				<td nowrap class="data1Text" align="left" style="color:<bean:write name="collection" property="messageStatusColor"/>;">
														  							<b><bean:write name="collection" property="messageStatusText"/></b>
														  							<logic:equal name="collection" property="messageStatusConst" value="1">
															  							&nbsp;&nbsp;<a href="showBuyerSendContactMessage.do?id=<bean:write name="collection" property="id"/>" class="data1Link"><bean:message key="showBuyerContact.sendMessage"/></a>
															  						</logic:equal>
															  						<logic:equal name="collection" property="messageStatusConst" value="2">
															  							&nbsp;&nbsp;<a href="showBuyerSellerContactWays.do?id=<bean:write name="collection" property="id"/>" class="data1Link"><bean:message key="showBuyerContact.seeContactData"/></a>
															  						</logic:equal>
															  						<logic:equal name="collection" property="messageStatusConst" value="3">
															  							&nbsp;&nbsp;<span class="data1Text" style="cursor:default;cursor:default;" onMouseover="EnterHelpContent('<bean:message key="showBuyerContact.reason"/>','<bean:write name="collection" property="messageAnswer"/>'); Activate();" onMouseout="deActivate();"><bean:message key="showBuyerContact.reason"/></span>
															  						</logic:equal>
														  						</td>									  						
														  					</tr>
														  					<tr>
														  						<td nowrap class="data1Text" align="right">
														  							<bean:message key="showBuyerContact.paymentStatus"/>:&nbsp;
														  						</td>
																				<td nowrap class="data1Text" align="left" style="color:<bean:write name="collection" property="paymentStatusColor"/>;">
														  							<b><bean:write name="collection" property="paymentStatusText"/></b>
														  							<logic:equal name="collection" property="paymentStatusConst" value="1">
															  							&nbsp;&nbsp;<a href="showBuyerPay.do?id=<bean:write name="collection" property="id"/>" class="data1Link"><bean:message key="showBuyerContact.pay"/></a>
															  						</logic:equal>
														  						</td>									  						
														  					</tr>
														  					<tr>
														  						<td nowrap class="data1Text" align="right">
														  							<bean:message key="showBuyerContact.dateStatus"/>:&nbsp;
														  						</td>
																				<td nowrap class="data1Text" align="left" style="color:<bean:write name="collection" property="dateStatusColor"/>;">
														  							<b><bean:write name="collection" property="dateStatusText"/></b>
														  							<logic:equal name="collection" property="dateStatusConst" value="1">
															  							&nbsp;&nbsp;<a href="showBuyerCancelDate.do?id=<bean:write name="collection" property="id"/>" class="data1Link"><bean:message key="showBuyerContact.cancelDate"/></a>
															  						</logic:equal>
															  						<logic:equal name="collection" property="dateStatusConst" value="2">
															  							&nbsp;&nbsp;<span class="data1Text" style="cursor:default;cursor:default;" onMouseover="EnterHelpContent('<bean:message key="showBuyerContact.cancelDateText"/>','<bean:write name="collection" property="cancelDateText"/>'); Activate();" onMouseout="deActivate();"><bean:message key="showBuyerContact.cancelDateText"/></span>
															  						</logic:equal>
														  						</td>									  						
														  					</tr>
														  					<tr>
														  						<td nowrap class="data1Text" align="right">
														  							<bean:message key="showBuyerContact.voteStatus"/>:&nbsp;
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
																  							<b>/</b>&nbsp;<img src="pictures/negativeVoteSmall.gif" alt="<bean:message key="showBuyerStart.negativeReceivedVote"/>"/>
																  						</logic:equal>
														  							</span>
														  							
																					<logic:equal name="collection" property="voteStatusConst" value="1">
															  							&nbsp;&nbsp;<a href="showBuyerVoteSeller.do?id=<bean:write name="collection" property="id"/>" class="data1Link"><bean:message key="showBuyerContact.vote"/></a>
															  						</logic:equal>										  							
														  						</td>									  						
														  					</tr>										  					
														  				</table>
														  			</td>
																  	<td valign="top" align="right">
														  				<table cellpadding="0" cellspacing="0" border="0" align="right">
														  					<tr align="right">
														  						<td nowrap class="data1Text" align="right" title="<bean:message key="showBuyerContact.details"/>">
														  							<a href="showBuyerContactDetail.do?id=<bean:write name="collection" property="id"/>">
																		  				<img src="pictures/detailsIcon.gif" border="0"/>
																		  			</a>
														  						</td>
														  					</tr>
														  					<logic:equal name="collection" property="voteStatusConst" value="2">
																				<tr align="right">
															  						<td nowrap class="data1Text" align="right" title="<bean:message key="showBuyerContact.delete"/>">
															  							<a href="deleteBuyerContact.do?id=<bean:write name="collection" property="id"/>">
																			  				<img src="pictures/deleteIcon.gif" border="0"/>
																			  			</a>
															  						</td>
															  					</tr>										  																			  					
															  				</logic:equal>
															  				<logic:notEqual name="collection" property="voteStatusConst" value="2">
															  					<logic:greaterEqual name="collection" property="messageStatusConst" value="3">
																					<tr align="right">
																  						<td nowrap class="data1Text" align="right" title="<bean:message key="showBuyerContact.delete"/>">
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
