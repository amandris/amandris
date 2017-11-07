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
				<table  width="90%" cellpadding="0" cellspacing="0" border="0" align="center">
					<tr>
			  			<td valign="top">
  						  	<table width="100%" cellpadding="0" cellspacing="0" border="0" align="left">
 						  		<tr>
  						  			<td height="10"></td>
 						  		</tr>
						  		<tr>
			  						<td width="100%">
			  						  	<table cellpadding="0" cellspacing="0" border="0" align="left">
									  		<tr valign="middle">
									  			<td valign="middle">
									  				<logic:equal name="sellerContactDetail" property="buyerHasPicture" value="1">
										  				<img src="/media/pictures/smaller/buyer_<bean:write name="sellerContactDetail" property="buyerId"/>_<bean:write name="sellerContactDetail" property="buyerMainPicture"/>_<bean:write name="sellerContactDetail" property="buyerMainPictureCode"/>.jpg"/>
										  			</logic:equal>
										  			<logic:notEqual name="sellerContactDetail" property="buyerHasPicture" value="1">
										  				<logic:equal name="sellerContactDetail" property="buyerSex" value="1">
											  				<img src="pictures/defaultGirl.gif"/>
											  			</logic:equal>
										  				<logic:equal name="sellerContactDetail" property="buyerSex" value="2">
											  				<img src="pictures/defaultBoy.gif"/>
											  			</logic:equal>
										  				<logic:equal name="sellerContactDetail" property="buyerSex" value="4">
											  				<img src="pictures/defaultShemale.gif"/>
											  			</logic:equal>
										  				<logic:equal name="sellerContactDetail" property="buyerSex" value="8">
											  				<img src="pictures/defaultBoysCouple.gif"/>
											  			</logic:equal>
										  				<logic:equal name="sellerContactDetail" property="buyerSex" value="16">
											  				<img src="pictures/defaultGirlsCouple.gif"/>
											  			</logic:equal>
										  				<logic:equal name="sellerContactDetail" property="buyerSex" value="32">
											  				<img src="pictures/defaultBoyAndGirlCouple.gif"/>
											  			</logic:equal>
										  				<logic:equal name="sellerContactDetail" property="buyerSex" value="64">
											  				<img src="pictures/defaultGroup.gif"/>
											  			</logic:equal>
										  			</logic:notEqual>
									  			</td>
									  			<td width="10"></td>
									  			<td valign="top" align="left">
									  				<table cellpadding="0" cellspacing="0" border="0" align="left">
									  					<tr align="left">
									  						<td nowrap class="data1Text" align="left">
									  							<a href="showBuyer.do?id=<bean:write name="sellerContactDetail"  property="buyerId"/>" class="data1Link">
											  						<bean:write name="sellerContactDetail" property="buyerFullLogin"/>
											  					</a>
									  						</td>
									  					</tr>
									  					<tr align="left">
									  						<td nowrap class="data1Text" align="left">
										  						<bean:write name="sellerContactDetail" property="buyerAge"/>
									  						</td>
									  					</tr>
									  					<tr align="left">
									  						<td nowrap class="data1Text" align="left">
										  						<bean:write name="sellerContactDetail" property="buyerCountry"/>
									  						</td>
									  					</tr>
									  					<tr align="left">
									  						<td nowrap class="data1Text" align="left">
										  						<bean:write name="sellerContactDetail" property="buyerState"/>
									  						</td>
									  					</tr>
									  					<tr align="left">
									  						<td nowrap class="data1Text" align="left">
										  						<bean:write name="sellerContactDetail" property="buyerCity"/>
									  						</td>
									  					</tr>										  					
									  					<tr align="left">
									  						<td nowrap class="data1Text" align="left">
										  						<span class="data1TextGreen"><b><bean:write name="sellerContactDetail" property="buyerPositiveVotes"/></b></span>/<span class="data1TextRed"><b><bean:write name="sellerContactDetail" property="buyerNegativeVotes"/></b></span>
									  						</td>
									  					</tr>
									  				</table>
									  			</td>
									  			<td width="20"></td>
									  			<td>
									  				<logic:equal name="sellerContactDetail" property="sellerVoteStatusConst" value="2">
									  					<table cellpadding="0" cellspacing="0" border="0" align="left">
															<tr align="right">
										  						<td nowrap class="data1Text" align="right">
										  							<button class="form" onclick="document.location.href='deleteSellerContact.do?id=<bean:write name="sellerContactDetail" property="id"/>'">
										  								<bean:message key="showSellerContactDetail.delete"/>
										  							</button>
										  						</td>
										  					</tr>										  																			  					
										  				</table>
													</logic:equal>
													<logic:notEqual name="sellerContactDetail" property="sellerVoteStatusConst" value="2">
									  					<logic:greaterEqual name="sellerContactDetail" property="messageStatusConst" value="3">
															<tr align="right">
										  						<td nowrap class="data1Text" align="right">
										  							<button class="form" onclick="document.location.href='deleteSellerContact.do?id=<bean:write name="sellerContactDetail" property="id"/>'">
										  								<bean:message key="showSellerContactDetail.delete"/>
										  							</button>
										  						</td>
										  					</tr>	
										  				</logic:greaterEqual>									  																			  					
									  				</logic:notEqual>
									  			</td>
									  		</tr>
									  	</table>
									</td>
								</tr>
								<tr><td height="15"></td></tr>
								<tr>
								 	<td>
								 		<table cellpadding="0" cellspacing="0" border="0" align="left">
									  		<tr>
									  			<td valign="middle">
									  				<table cellpadding="0" cellspacing="0" border="0">
									  					<tr>
									  						<td nowrap class="data1Text" >
									  							<bean:message key="showSellerContactDetail.contactDate"/>:&nbsp;
									  						</td>
									  						<td nowrpa class="data1Text">
									  							<b><bean:write name="sellerContactDetail" property="messageDate"/></b>&nbsp;<bean:message key="common.at"/>&nbsp;<b><bean:write name="sellerContactDetail" property="messageTime"/></b>&nbsp;(<bean:write name="sellerContactDetail" property="messageTimeFrom"/>)
									  						</td>
									  					</tr>
									  					<tr><td height="10"></td><td></td></tr>
									  					<tr>
									  						<td nowrap class="data1Text">
									  							<bean:message key="showSellerContactDetail.dateDate"/>:&nbsp;
									  						</td>
															<td nowrap class="data1Text">
								  							<b><bean:write name="sellerContactDetail" property="dateDate"/></b>&nbsp;<bean:message key="common.at"/>&nbsp;<b><bean:write name="sellerContactDetail" property="dateTime"/></b>
									  							<logic:greaterEqual name="sellerContactDetail" property="dateTimeToValue" value="0">
										  							(<bean:write name="sellerContactDetail" property="dateTimeTo"/>)
									  							</logic:greaterEqual>
									  							<logic:lessThan name="sellerContactDetail" property="dateTimeToValue" value="0">
										  							(<bean:message key="showSellerContactDetail.passedOff"/>)
									  							</logic:lessThan>
									  						</td>
									  					</tr>
									  					<tr><td height="10"></td><td></td></tr>
									  					<tr>
									  						<td nowrap class="data1Text" >
									  							<bean:message key="showSellerContactDetail.length"/>:&nbsp;
									  						</td>
									  						<td nowrpa class="data1Text">
									  							<b><bean:write name="sellerContactDetail" property="length"/>&nbsp;
									  							<logic:equal name="sellerContactDetail" property="length" value="1">
										  							<bean:message key="showSellerContactDetail.hour"/><b>
										  						</logic:equal>
										  						<logic:notEqual name="sellerContactDetail" property="length" value="1">
										  							<bean:message key="showSellerContactDetail.hours"/><b>
										  						</logic:notEqual>
									  						</td>
									  					</tr>
									  					<tr><td height="10"></td><td></td></tr>
									  					<tr>
									  						<td nowrap class="data1Text" >
									  							<bean:message key="showSellerContactDetail.serviceType"/>:&nbsp;
									  						</td>
									  						<td nowrpa class="data1Text">
									  							<b><bean:write name="sellerContactDetail" property="serviceTypeText"/>&nbsp;
									  						</td>
									  					</tr>
									  					<tr><td height="10"></td><td></td></tr>
									  					<tr>
									  						<td nowrap class="data1Text" >
									  							<bean:message key="showSellerContactDetail.contactStatus"/>:&nbsp;
									  						</td>
									  						<td>
									  							<table cellpadding="0" cellspacing="0" border="0">
									  								<tr>
																		<td nowrap class="data1Text" style="color:<bean:write name="sellerContactDetail" property="messageStatusColor"/>;">
												  							<b><bean:write name="sellerContactDetail" property="messageStatusText"/></b>
												  						</td>
												  						<td width="10"></td>
												  						<td>
													  						<logic:equal name="sellerContactDetail" property="messageStatusConst" value="1">
													  							<button class="form" onclick="document.location.href='showSellerReplyContact.do?id=<bean:write name="sellerContactDetail" property="id"/>'"><bean:message key="showSellerContactDetail.replyContact"/></button>
													  						</logic:equal>
													  					</td>
													  				</tr>
													  			</table>
									  						</td>									  						
									  					</tr>
									  					<logic:equal name="sellerContactDetail" property="messageStatusConst" value="3">
										  					<tr><td height="10"></td><td></td></tr>
										  					<tr>
										  						<td nowrap class="data1Text" >
										  							<bean:message key="showSellerContactDetail.messageAnswer"/>:&nbsp;
										  						</td>
										  						<td>
										  							<table cellpadding="0" cellspacing="0" border="0">
										  								<tr>
																			<td class="data1Text">
													  							<b><bean:write name="sellerContactDetail" property="messageAnswer"/></b>
													  						</td>
														  				</tr>
														  			</table>
										  						</td>									  						
										  					</tr>
										  				</logic:equal>
									  					<tr><td height="10"></td><td></td></tr>
									  					<tr>
									  						<td nowrap class="data1Text" >
									  							<bean:message key="showSellerContactDetail.paymentStatus"/>:&nbsp;
									  						</td>
									  						<td>
									  							<table cellpadding="0" cellspacing="0" border="0">
									  								<tr>
																		<td nowrap class="data1Text" style="color:<bean:write name="sellerContactDetail" property="paymentStatusColor"/>;">
												  							<b><bean:write name="sellerContactDetail" property="paymentStatusText"/></b>
												  						</td>
												  						<td width="10"></td>
												  						<td>
												  							<logic:equal name="sellerContactDetail" property="paymentStatusConst" value="1">
													  							<button class="form" onclick="document.location.href='showSellerMarkAsPay.do?id=<bean:write name="sellerContactDetail" property="id"/>'"><bean:message key="showSellerContactDetail.markAsPay"/></button>
													  						</logic:equal>
													  					</td>
													  				</tr>
													  			</table>
									  						</td>									  						
									  					</tr>
									  					<tr><td height="10"></td><td></td></tr>
									  					<tr>
									  						<td nowrap class="data1Text" >
									  							<bean:message key="showSellerContactDetail.dateStatus"/>:&nbsp;
									  						</td>
									  						<td>
									  							<table cellpadding="0" cellspacing="0" border="0">
									  								<tr>
																		<td nowrap class="data1Text" style="color:<bean:write name="sellerContactDetail" property="dateStatusColor"/>;">
												  							<b><bean:write name="sellerContactDetail" property="dateStatusText"/></b>
												  						</td>
												  						<td width="10"></td>
											  							<td>
												  							<logic:equal name="sellerContactDetail" property="dateStatusConst" value="1">
												  								<button class="form" onclick="document.location.href='showSellerCancelDate.do?id=<bean:write name="sellerContactDetail" property="id"/>'"><bean:message key="showSellerContactDetail.cancelDate"/></button>
													  						</logic:equal>
													  					</td>
													  				</tr>
													  			</table>
									  						</td>									  						
									  					</tr>
									  					<logic:equal name="sellerContactDetail" property="dateStatusConst" value="2">
										  					<tr><td height="10"></td><td></td></tr>
										  					<tr>
										  						<td nowrap class="data1Text" >
										  							<bean:message key="showSellerContactDetail.cancelDateText"/>:&nbsp;
										  						</td>
										  						<td>
										  							<table cellpadding="0" cellspacing="0" border="0">
										  								<tr>
																			<td class="data1Text">
													  							<b><bean:write name="sellerContactDetail" property="cancelDateText"/></b>
													  						</td>
														  				</tr>
														  			</table>
										  						</td>									  						
										  					</tr>
										  				</logic:equal>
									  					<tr><td height="10"></td><td></td></tr>
									  					<tr>
									  						<td nowrap class="data1Text" >
									  							<bean:message key="showSellerContactDetail.voteStatus"/>:&nbsp;
									  						</td>
									  						<td>
									  							<table cellpadding="0" cellspacing="0" border="0">
									  								<tr>
																		<td nowrap class="data1Text" style="color:<bean:write name="sellerContactDetail" property="sellerVoteStatusColor"/>;">
												  							<b><bean:write name="sellerContactDetail" property="sellerVoteStatusText"/></b>
												  						</td>
												  						<td width="10"></td>
											  							<td>
																			<logic:equal name="sellerContactDetail" property="sellerVoteStatusConst" value="1">
													  							<button class="form" onclick="document.location.href='showBuyerVoteSeller.do?id=<bean:write name="sellerContactDetail" property="id"/>'"><bean:message key="showSellerContactDetail.vote"/></button>
													  						</logic:equal>		
													  					</td>
													  					<logic:equal name="sellerContactDetail" property="sellerVote" value="1">
														  					<td class="data1Text">
														  						<b><bean:message key="showSellerContactDetail.emmitedVote"/></b>&nbsp;&nbsp;
														  					</td>
														  					<td>
														  						<img src="pictures/positiveVoteSmall.gif"/>
														  					</td>
														  				</logic:equal>
														  				<logic:equal name="sellerContactDetail" property="sellerVote" value="-1">
														  					<td class="data1Text">
														  						<b><bean:message key="showSellerContactDetail.emmitedVote"/></b>&nbsp;&nbsp;
														  					</td>
														  					<td>
														  						<img src="pictures/negativeVoteSmall.gif"/>
														  					</td>
														  				</logic:equal>
														  				<logic:equal name="sellerContactDetail" property="vote" value="1">
														  					<td width="20"></td>
														  					<td class="data1Text">
														  						<b><bean:message key="showSellerContactDetail.receivedVote"/></b>&nbsp;&nbsp;
														  					</td>
														  					<td>
														  						<img src="pictures/positiveVoteSmall.gif"/>
														  					</td>
														  				</logic:equal>
														  				<logic:equal name="sellerContactDetail" property="vote" value="-1">
															  				<td width="20"></td>
														  					<td class="data1Text">
														  						<b><bean:message key="showSellerContactDetail.receivedVote"/></b>&nbsp;&nbsp;
														  					</td>
														  					<td>
														  						<img src="pictures/negativeVoteSmall.gif"/>
														  					</td>
														  				</logic:equal>
													  				</tr>
													  			</table>								  							
									  						</td>									  						
									  					</tr>										  					
												  		<tr><td height="10"></td><td></td></tr>
									  					<tr>
									  						<td nowrap class="data1Text" >
									  							<bean:message key="showSellerContactDetail.prize"/>:&nbsp;
									  						</td>
									  						<td nowrpa class="data1Text">
									  							<logic:equal name="sellerContactDetail" property="isFree" value="1">
									  								<span style="color:#00AA00;"><b><bean:message key="showSellerContactDetail.free"/></b></span>
									  							</logic:equal>
									  							<logic:equal name="sellerContactDetail" property="isFree" value="0">
										  							<b><bean:write name="sellerContactDetail" property="price"/>&nbsp;<bean:write name="sellerContactDetail" property="currency"/></b>
										  						</logic:equal>
									  						</td>
									  					</tr>
									  					<tr><td height="10"></td><td></td></tr>
									  					<tr>
									  						<td nowrap class="data1Text" valign="top">
									  							<bean:message key="showSellerContactDetail.datePlace"/>:&nbsp;
									  						</td>
															<td class="data1Text" valign="top">
								  								<b><bean:write name="sellerContactDetail" property="address1"/>&nbsp;<bean:write name="sellerContactDetail" property="address2"/><br><bean:write name="sellerContactDetail" property="city"/>&nbsp;(<bean:write name="sellerContactDetail" property="state"/>)<br><bean:write name="sellerContactDetail" property="country"/>
									  						</td>
									  					</tr>
									  				</table>
									  			</td>
									  		</tr>
									  	</table>
			  						</td>
						  		</tr>
						  		<tr><td height="5"></td></tr>
						  	</table>
			  			</td>
					</tr>		
					<tr><td height="20"></td></tr>
					<tr>
						<td>
							<button class="form" onclick="document.location.href='showSellerSendContactMessage.do?id=<bean:write name="sellerContactDetail" property="id"/>';"><bean:message key="showSellerContactDetail.sendMessage"/></button>
						</td>
					</tr>
					<tr><td height="20"></td></tr>
					<logic:iterate name="sellerContactDetail" property="contactMessage" id="collection">
						<tr>
							<td>
								<table width="650" cellpadding="0" cellspacing="0" border="0" >
									<tr>
										<td width="8" height="24" background="pictures/messageTopLeft.gif">
										</td>
										<td height="24" background="pictures/messageTop.gif" class="data1Text">	
											<table cellpadding="0" cellspacing="0">
												<tr><td height="5"></td><td></td><td></td></tr>
												<tr>
													<logic:equal name="collection" property="sentFromBuyer" value="1">
														<td>
															<img src="pictures/receiveIcon.gif"/>															
														</td>
														<td width="10"></td>
														<td class="data1Text">
															<b><bean:message key="showSellerContactDetail.received"/>&nbsp;<bean:write name="collection" property="date"/></b>
														</td>
													</logic:equal>
													<logic:equal name="collection" property="sentFromBuyer" value="0">
														<td>
															<img src="pictures/sendIcon.gif"/>
														</td>
														<td width="10"></td>
														<td class="data1Text">
															<b><bean:message key="showSellerContactDetail.sent"/>&nbsp;<bean:write name="collection" property="date"/></b>
														</td>
													</logic:equal>
												</tr>
											</table>
										</td>
										<td width="8" height="24" background="pictures/messageTopRight.gif">
										</td>
									</tr>
									<tr valign="top">
										<td width="8" background="pictures/borderLeft.gif">
										</td>
										<td width="634">
											<table cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td class="data1Text" style="text-align:justify;">
														<bean:write name="collection" property="text"/>
													<td>
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
						<tr><td height="10"></td></tr>
					</logic:iterate>
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
