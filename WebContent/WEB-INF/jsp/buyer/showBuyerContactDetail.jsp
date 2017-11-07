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
									  				<logic:equal name="buyerContactDetail" property="sellerHasPicture" value="1">
										  				<img src="/media/pictures/smaller/seller_<bean:write name="buyerContactDetail" property="sellerId"/>_<bean:write name="buyerContactDetail" property="sellerMainPicture"/>_<bean:write name="buyerContactDetail" property="sellerMainPictureCode"/>.jpg"/>
										  			</logic:equal>
										  			<logic:notEqual name="buyerContactDetail" property="sellerHasPicture" value="1">
										  				<logic:equal name="buyerContactDetail" property="sellerSex" value="1">
											  				<img src="pictures/defaultGirl.gif"/>
											  			</logic:equal>
										  				<logic:equal name="buyerContactDetail" property="sellerSex" value="2">
											  				<img src="pictures/defaultBoy.gif"/>
											  			</logic:equal>
										  				<logic:equal name="buyerContactDetail" property="sellerSex" value="4">
											  				<img src="pictures/defaultShemale.gif"/>
											  			</logic:equal>
										  				<logic:equal name="buyerContactDetail" property="sellerSex" value="8">
											  				<img src="pictures/defaultBoysCouple.gif"/>
											  			</logic:equal>
										  				<logic:equal name="buyerContactDetail" property="sellerSex" value="16">
											  				<img src="pictures/defaultGirlsCouple.gif"/>
											  			</logic:equal>
										  				<logic:equal name="buyerContactDetail" property="sellerSex" value="32">
											  				<img src="pictures/defaultBoyAndGirlCouple.gif"/>
											  			</logic:equal>
										  				<logic:equal name="buyerContactDetail" property="sellerSex" value="64">
											  				<img src="pictures/defaultGroup.gif"/>
											  			</logic:equal>
										  			</logic:notEqual>
									  			</td>
									  			<td width="10"></td>
									  			<td valign="top" align="left">
									  				<table cellpadding="0" cellspacing="0" border="0" align="left">
									  					<tr align="left">
									  						<td nowrap class="data1Text" align="left">
									  							<a href="showSeller.do?id=<bean:write name="buyerContactDetail"  property="sellerId"/>" class="data1Link">
											  						<bean:write name="buyerContactDetail" property="sellerFullLogin"/>
											  					</a>
									  						</td>
									  					</tr>
									  					<tr align="left">
									  						<td nowrap class="data1Text" align="left">
										  						<bean:write name="buyerContactDetail" property="sellerAge"/>
									  						</td>
									  					</tr>
									  					<tr align="left">
									  						<td nowrap class="data1Text" align="left">
										  						<bean:write name="buyerContactDetail" property="sellerCountry"/>
									  						</td>
									  					</tr>
									  					<tr align="left">
									  						<td nowrap class="data1Text" align="left">
										  						<bean:write name="buyerContactDetail" property="sellerState"/>
									  						</td>
									  					</tr>
									  					<tr align="left">
									  						<td nowrap class="data1Text" align="left">
										  						<bean:write name="buyerContactDetail" property="sellerCity"/>
									  						</td>
									  					</tr>										  					
									  					<tr align="left">
									  						<td nowrap class="data1Text" align="left">
										  						<span class="data1TextGreen"><b><bean:write name="buyerContactDetail" property="sellerPositiveVotes"/></b></span>/<span class="data1TextRed"><b><bean:write name="buyerContactDetail" property="sellerNegativeVotes"/></b></span>
									  						</td>
									  					</tr>
									  				</table>
									  			</td>
									  			<td width="20"></td>
									  			<td>
									  				<logic:equal name="buyerContactDetail" property="voteStatusConst" value="2">
									  					<table cellpadding="0" cellspacing="0" border="0" align="left">
															<tr align="right">
										  						<td nowrap class="data1Text" align="right">
										  							<button class="form" onclick="document.location.href='deleteBuyerContact.do?id=<bean:write name="buyerContactDetail" property="id"/>'">
										  								<bean:message key="showBuyerContactDetail.delete"/>
										  							</button>
										  						</td>
										  					</tr>										  																			  					
										  				</table>
													</logic:equal>
													<logic:notEqual name="buyerContactDetail" property="voteStatusConst" value="2">
								  					<logic:greaterEqual name="buyerContactDetail" property="messageStatusConst" value="3">
														<tr align="right">
									  						<td nowrap class="data1Text" align="right">
									  							<button class="form" onclick="document.location.href='deleteBuyerContact.do?id=<bean:write name="buyerContactDetail" property="id"/>'">
									  								<bean:message key="showBuyerContactDetail.delete"/>
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
									  							<bean:message key="showBuyerContactDetail.contactDate"/>:&nbsp;
									  						</td>
									  						<td nowrpa class="data1Text">
									  							<b><bean:write name="buyerContactDetail" property="messageDate"/></b>&nbsp;<bean:message key="common.at"/>&nbsp;<b><bean:write name="buyerContactDetail" property="messageTime"/></b>&nbsp;(<bean:write name="buyerContactDetail" property="messageTimeFrom"/>)
									  						</td>
									  					</tr>
									  					<tr><td height="10"></td><td></td></tr>
									  					<tr>
									  						<td nowrap class="data1Text">
									  							<bean:message key="showBuyerContactDetail.dateDate"/>:&nbsp;
									  						</td>
															<td nowrap class="data1Text">
								  							<b><bean:write name="buyerContactDetail" property="dateDate"/></b>&nbsp;<bean:message key="common.at"/>&nbsp;<b><bean:write name="buyerContactDetail" property="dateTime"/></b>
									  							<logic:greaterEqual name="buyerContactDetail" property="dateTimeToValue" value="0">
										  							(<bean:write name="buyerContactDetail" property="dateTimeTo"/>)
									  							</logic:greaterEqual>
									  							<logic:lessThan name="buyerContactDetail" property="dateTimeToValue" value="0">
										  							(<bean:message key="showBuyerContactDetail.passedOff"/>)
									  							</logic:lessThan>
									  						</td>
									  					</tr>
									  					<tr><td height="10"></td><td></td></tr>
									  					<tr>
									  						<td nowrap class="data1Text" >
									  							<bean:message key="showBuyerContactDetail.length"/>:&nbsp;
									  						</td>
									  						<td nowrpa class="data1Text">
									  							<b><bean:write name="buyerContactDetail" property="length"/>&nbsp;
									  							<logic:equal name="buyerContactDetail" property="length" value="1">
										  							<bean:message key="showBuyerContactDetail.hour"/><b>
										  						</logic:equal>
										  						<logic:notEqual name="buyerContactDetail" property="length" value="1">
										  							<bean:message key="showBuyerContactDetail.hours"/><b>
										  						</logic:notEqual>
									  						</td>
									  					</tr>
									  					<tr><td height="10"></td><td></td></tr>
									  					<tr>
									  						<td nowrap class="data1Text" >
									  							<bean:message key="showBuyerContactDetail.serviceType"/>:&nbsp;
									  						</td>
									  						<td nowrpa class="data1Text">
									  							<b><bean:write name="buyerContactDetail" property="serviceTypeText"/>&nbsp;
									  						</td>
									  					</tr>
									  					<tr><td height="10"></td><td></td></tr>
									  					<tr>
									  						<td nowrap class="data1Text" >
									  							<bean:message key="showBuyerContactDetail.contactStatus"/>:&nbsp;
									  						</td>
									  						<td>
									  							<table cellpadding="0" cellspacing="0" border="0">
									  								<tr>
																		<td nowrap class="data1Text" style="color:<bean:write name="buyerContactDetail" property="messageStatusColor"/>;">
												  							<b><bean:write name="buyerContactDetail" property="messageStatusText"/></b>
												  						</td>
												  						<td width="10"></td>
												  						<td>
													  						<logic:equal name="buyerContactDetail" property="messageStatusConst" value="2">
													  							<button class="form" onclick="document.location.href='showBuyerSellerContactWays.do?id=<bean:write name="buyerContactDetail" property="id"/>'"><bean:message key="showBuyerContactDetail.seeContactData"/></button>
													  						</logic:equal>
													  					</td>
													  				</tr>
													  			</table>
									  						</td>									  						
									  					</tr>
									  					<logic:equal name="buyerContactDetail" property="messageStatusConst" value="3">
										  					<tr><td height="10"></td><td></td></tr>
										  					<tr>
										  						<td nowrap class="data1Text" >
										  							<bean:message key="showBuyerContactDetail.messageAnswer"/>:&nbsp;
										  						</td>
										  						<td>
										  							<table cellpadding="0" cellspacing="0" border="0">
										  								<tr>
																			<td class="data1Text">
													  							<b><bean:write name="buyerContactDetail" property="messageAnswer"/></b>
													  						</td>
														  				</tr>
														  			</table>
										  						</td>									  						
										  					</tr>
										  				</logic:equal>
									  					<tr><td height="10"></td><td></td></tr>
									  					<tr>
									  						<td nowrap class="data1Text" >
									  							<bean:message key="showBuyerContactDetail.paymentStatus"/>:&nbsp;
									  						</td>
									  						<td>
									  							<table cellpadding="0" cellspacing="0" border="0">
									  								<tr>
																		<td nowrap class="data1Text" style="color:<bean:write name="buyerContactDetail" property="paymentStatusColor"/>;">
												  							<b><bean:write name="buyerContactDetail" property="paymentStatusText"/></b>
												  						</td>
												  						<td width="10"></td>
												  						<td>
												  							<logic:equal name="buyerContactDetail" property="paymentStatusConst" value="1">
													  							<button class="form" onclick="document.location.href='showBuyerPay.do?id=<bean:write name="buyerContactDetail" property="id"/>'"><bean:message key="showBuyerContactDetail.pay"/></button>
													  						</logic:equal>
													  					</td>
													  				</tr>
													  			</table>
									  						</td>									  						
									  					</tr>
									  					<tr><td height="10"></td><td></td></tr>
									  					<tr>
									  						<td nowrap class="data1Text" >
									  							<bean:message key="showBuyerContactDetail.dateStatus"/>:&nbsp;
									  						</td>
									  						<td>
									  							<table cellpadding="0" cellspacing="0" border="0">
									  								<tr>
																		<td nowrap class="data1Text" style="color:<bean:write name="buyerContactDetail" property="dateStatusColor"/>;">
												  							<b><bean:write name="buyerContactDetail" property="dateStatusText"/></b>
												  						</td>
												  						<td width="10"></td>
											  							<td>
												  							<logic:equal name="buyerContactDetail" property="dateStatusConst" value="1">
												  								<button class="form" onclick="document.location.href='showBuyerCancelDate.do?id=<bean:write name="buyerContactDetail" property="id"/>'"><bean:message key="showBuyerContactDetail.cancelDate"/></button>
													  						</logic:equal>
													  					</td>
													  				</tr>
													  			</table>
									  						</td>									  						
									  					</tr>
									  					<logic:equal name="buyerContactDetail" property="dateStatusConst" value="2">
										  					<tr><td height="10"></td><td></td></tr>
										  					<tr>
										  						<td nowrap class="data1Text" >
										  							<bean:message key="showBuyerContactDetail.cancelDateText"/>:&nbsp;
										  						</td>
										  						<td>
										  							<table cellpadding="0" cellspacing="0" border="0">
										  								<tr>
																			<td class="data1Text">
													  							<b><bean:write name="buyerContactDetail" property="cancelDateText"/></b>
													  						</td>
														  				</tr>
														  			</table>
										  						</td>									  						
										  					</tr>
										  				</logic:equal>
									  					<tr><td height="10"></td><td></td></tr>
									  					<tr>
									  						<td nowrap class="data1Text" >
									  							<bean:message key="showBuyerContactDetail.voteStatus"/>:&nbsp;
									  						</td>
									  						<td>
									  							<table cellpadding="0" cellspacing="0" border="0">
									  								<tr>
																		<td nowrap class="data1Text" style="color:<bean:write name="buyerContactDetail" property="voteStatusColor"/>;">
												  							<b><bean:write name="buyerContactDetail" property="voteStatusText"/></b>
												  						</td>
												  						<td width="10"></td>
											  							<td>
																			<logic:equal name="buyerContactDetail" property="voteStatusConst" value="1">
													  							<button class="form" onclick="document.location.href='showBuyerVoteSeller.do?id=<bean:write name="buyerContactDetail" property="id"/>'"><bean:message key="showBuyerContactDetail.vote"/></button>
													  						</logic:equal>		
													  					</td>
													  					<logic:equal name="buyerContactDetail" property="vote" value="1">
														  					<td class="data1Text">
														  						<b><bean:message key="showBuyerContactDetail.emmitedVote"/></b>&nbsp;&nbsp;
														  					</td>
														  					<td>
														  						<img src="pictures/positiveVoteSmall.gif"/>
														  					</td>
														  				</logic:equal>
														  				<logic:equal name="buyerContactDetail" property="vote" value="-1">
														  					<td class="data1Text">
														  						<b><bean:message key="showBuyerContactDetail.emmitedVote"/></b>&nbsp;&nbsp;
														  					</td>
														  					<td>
														  						<img src="pictures/negativeVoteSmall.gif"/>
														  					</td>
														  				</logic:equal>
														  				<logic:equal name="buyerContactDetail" property="sellerVote" value="1">
														  					<td width="20"></td>
														  					<td class="data1Text">
														  						<b><bean:message key="showBuyerContactDetail.receivedVote"/></b>&nbsp;&nbsp;
														  					</td>
														  					<td>
														  						<img src="pictures/positiveVoteSmall.gif"/>
														  					</td>
														  				</logic:equal>
														  				<logic:equal name="buyerContactDetail" property="sellerVote" value="-1">
															  				<td width="20"></td>
														  					<td class="data1Text">
														  						<b><bean:message key="showBuyerContactDetail.receivedVote"/></b>&nbsp;&nbsp;
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
									  							<bean:message key="showBuyerContactDetail.prize"/>:&nbsp;
									  						</td>
									  						<td nowrpa class="data1Text">
									  							<logic:equal name="buyerContactDetail" property="isFree" value="1">
									  								<span style="color:#00AA00;"><b><bean:message key="showBuyerContactDetail.free"/></b></span>
									  							</logic:equal>
									  							<logic:equal name="buyerContactDetail" property="isFree" value="0">
										  							<b><bean:write name="buyerContactDetail" property="price"/>&nbsp;<bean:write name="buyerContactDetail" property="currency"/></b>
										  						</logic:equal>
									  						</td>
									  					</tr>
									  					<tr><td height="10"></td><td></td></tr>
									  					<tr>
									  						<td nowrap class="data1Text" valign="top">
									  							<bean:message key="showBuyerContactDetail.datePlace"/>:&nbsp;
									  						</td>
															<td class="data1Text" valign="top">
								  								<b><bean:write name="buyerContactDetail" property="address1"/>&nbsp;<bean:write name="buyerContactDetail" property="address2"/><br><bean:write name="buyerContactDetail" property="city"/>&nbsp;(<bean:write name="buyerContactDetail" property="state"/>)<br><bean:write name="buyerContactDetail" property="country"/>
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
							<button class="form" onclick="document.location.href='showBuyerSendContactMessage.do?id=<bean:write name="buyerContactDetail" property="id"/>';"><bean:message key="showBuyerContactDetail.sendMessage"/></button>
						</td>
					</tr>
					<tr><td height="20"></td></tr>
					<logic:iterate name="buyerContactDetail" property="contactMessage" id="collection">
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
															<img src="pictures/sendIcon.gif"/>															
														</td>
														<td width="10"></td>
														<td class="data1Text">
															<b><bean:message key="showBuyerContactDetail.sent"/>&nbsp;<bean:write name="collection" property="date"/></b>
														</td>
													</logic:equal>
													<logic:equal name="collection" property="sentFromBuyer" value="0">
														<td>
															<img src="pictures/receiveIcon.gif"/>
														</td>
														<td width="10"></td>
														<td class="data1Text">
															<b><bean:message key="showBuyerContactDetail.received"/>&nbsp;<bean:write name="collection" property="date"/></b>
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
