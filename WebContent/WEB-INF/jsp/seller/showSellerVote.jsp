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
			  				<logic:equal name="sellerSession" property="isEscort" value="0">			
				  				<!-- center -->
				  			  	<table width="704" cellpadding="0" cellspacing="0" border="0" valign="top">
							  		<tr>
							  			<td>
				  						  	<table width="704" cellpadding="0" cellspacing="0" border="0">
				  						  		<logic:empty name="sellerVoteData" property="votes">
				  						  			<tr>
				  						  				<td class="data1Text" align="center">
				  						  					<bean:message key="showSellerVote.voteNotExist"/>
				  						  				</td>
				  						  			</tr>
													<tr>
					  						  			<td height="10"></td>
				  						  			</tr>
													<tr>
								  						<td align="left">
								  						  	<table cellpadding="0" cellspacing="0" border="0" align="left">
														  		<tr align="center">
											  						<td class="data2Text">
											  							<a href="showSellerVote.do">
													  						<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="sellerReceivedVotesActive" border="0"/>
													  					</a>
											  						</td>
											  						<td width="10"></td>
											  						<td class="data2Text">
												  						<a href="showSellerGivenVote.do">
												  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="givenVotesInactive" border="0"/>
												  						</a>
											  						</td>
														  		</tr>
														  	</table>
								  						</td>
											  		</tr>			  						  			
				  						  		</logic:empty>
				  						  	
					  						  	<logic:notEmpty name="sellerVoteData" property="votes">
						  						  	<tr>
					  						  			<td></td>
				  						  				<td class="data1Text" align="center">
				  						  					<bean:message key="showSellerVote.text"/>
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
											  						<td class="data2Text">
												  						<bean:message key="showSellerVote.totalVotes"/>:&nbsp;<b><bean:write name="sellerVoteData" property="totalVotes"/></b>&nbsp;&nbsp;&nbsp;
											  							<bean:message key="showSellerVote.positiveVotes"/>:&nbsp;<b><span style="color:#00AA00;"/><bean:write name="sellerVoteData" property="positiveVotes"/></span></b>&nbsp;(<bean:write name="sellerVoteData" property="positiveVotesPercentage"/>%)&nbsp;&nbsp;&nbsp;
											  							<bean:message key="showSellerVote.negativeVotes"/>:&nbsp;<span style="color:#AA0000;"/><b><bean:write name="sellerVoteData" property="negativeVotes"/></b></span>&nbsp;&nbsp;&nbsp;
											  						</td>
														  		</tr>
														  	</table>
								  						</td>
								  						<td></td>
											  		</tr>
				  						  			<tr>
					  						  			<td></td><td height="10"></td><td></td>
				  						  			</tr>
													<tr>
					  						  			<td></td>
								  						<td align="left">
								  						  	<table cellpadding="0" cellspacing="0" border="0" align="left">
														  		<tr align="center">
											  						<td class="data2Text">
											  							<a href="showSellerVote.do">
													  						<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="sellerReceivedVotesActive" border="0"/>
													  					</a>
											  						</td>
											  						<td width="10"></td>
											  						<td class="data2Text">
												  						<a href="showSellerGivenVote.do">
												  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="givenVotesInactive" border="0"/>
												  						</a>
											  						</td>
														  		</tr>
														  	</table>
								  						</td>
								  						<td></td>
											  		</tr>
				  						  			<tr>
					  						  			<td></td><td height="10"></td><td></td>
				  						  			</tr>			  						  			
					  						  		<logic:iterate name="sellerVoteData" property="votes" id="collection">
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
									  						  	<table cellpadding="0" cellspacing="0" border="0" >
															  		<tr valign="middle">
															  			<td valign="middle" >
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
															  			<td width="10"></td>
															  			<td valign="top" align="left">
															  				<table cellpadding="0" cellspacing="0" border="0" align="left" valign="top">
															  					<tr align="left">
															  						<td nowrap class="data1Text" align="left" title="<bean:write name="collection" property="sellerLogin"/>">
															  							<a href="showBuyer.do?id=<bean:write name="collection"  property="buyerId"/>" class="data1Link">
																	  						<bean:write name="collection" property="briefBuyerLogin"/>
																	  					</a>
															  						</td>
															  					</tr>
															  					<tr><td height="8"></td></tr>
															  					<tr align="left">
															  						<td nowrap class="data1Text" align="left">
															  							<b><bean:message key="showSellerVote.date"/>:</b>&nbsp;
															  							<bean:write name="collection" property="date"/>
															  						</td>
															  					</tr>
															  					<tr><td height="8"></td></tr>
															  					<tr align="left">
															  						<td nowrap class="data1Text" align="left">
																  						<logic:equal name="collection" property="vote" value="1">
																  							<img src="pictures/positiveVote.gif" alt="<bean:message key="showSellerVote.positiveVote"/>"/>
																  						</logic:equal>
																  						<logic:equal name="collection" property="vote" value="-1">
																  							<img src="pictures/negativeVote.gif" alt="<bean:message key="showSellerVote.negativeVote"/>"/>
																  						</logic:equal>
															  						</td>
															  					</tr>
															  				</table>
															  			</td>
															  			<td width="10"></td>
															  			<td width="5" align="center"><img src="pictures/verticalSeparator.gif"/></td>
															  			<td width="10"></td>
															  			<td valign="top" align="left">
															  				<table cellpadding="0" cellspacing="0" border="0">
															  					<tr>
															  						<td class="data2Text" align="left">
															  							<bean:write name="collection" property="comment"/>
															  						</td>
															  					</tr>
															  					<logic:notEmpty name="collection" property="reply">
															  						<logic:equal name="collection" property="replyActive" value="1">
																	  					<tr><td height="5"></tr>
																	  					<tr>
																	  						<td class="data2Text" align="left">
																	  							<b><bean:message key="showSellerVote.answer"/>:</b>&nbsp;
																	  							<bean:write name="collection" property="reply"/>
																	  						</td>
																	  					</tr>
																	  				</logic:equal>
																  				</logic:notEmpty>
																				<logic:empty name="collection" property="reply">
																					<tr><td height="5"></tr>
																  					<tr>
																  						<td nowrap class="data1Text" align="left">
																  							<a href="showSellerReplyVote.do?id=<bean:write name="collection" property="id"/>" class="data1Link">
																  								<bean:message key="showSellerVote.reply"/>
																  							</a>
																  						</td>
																  					</tr>
																  				</logic:empty>															  				
															  				</table>
															  			</td>
																	  	<td valign="top" align="right">
															  				<table cellpadding="0" cellspacing="0" border="0" align="right">
															  					<tr align="right">
															  						<td nowrap class="data1Text" align="right"">
															  						</td>
															  					</tr>
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
						 </logic:equal>									 
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
