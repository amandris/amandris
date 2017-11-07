<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

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
			  						  		<logic:empty name="otherSellerGivenVoteData" property="votes">
			  						  			<tr>
			  						  				<td class="data1Text" align="center">
			  						  					<bean:message key="showOtherSellerGivenVote.voteNotExist"/>
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
										  							<a href="showOtherSellerVote.do?id=<bean:write name="otherSellerGivenVoteData" property="id"/>">
												  						<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="receivedVotesInactive" border="0"/>
												  					</a>
										  						</td>
										  						<td width="10"></td>
										  						<td class="data2Text">
											  						<a href="showOtherSellerGivenVote.do?id=<bean:write name="otherSellerGivenVoteData" property="id"/>">
											  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="sellerGivenVotesActive" border="0"/>
											  						</a>
										  						</td>
													  		</tr>
													  	</table>
							  						</td>
										  		</tr>
			  						  		</logic:empty>
			  						  	
				  						  	<logic:notEmpty name="otherSellerGivenVoteData" property="votes">
					  						  	<tr>
				  						  			<td></td>
			  						  				<td class="data1Text" align="center">
			  						  					<bean:message key="showOtherSellerGivenVote.text"/>
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
											  						<bean:message key="showOtherSellerGivenVote.totalVotes"/>:&nbsp;<b><bean:write name="otherSellerGivenVoteData" property="totalVotes"/></b>&nbsp;&nbsp;&nbsp;
										  							<bean:message key="showOtherSellerGivenVote.positiveVotes"/>:&nbsp;<b><span style="color:#00AA00;"/><bean:write name="otherSellerGivenVoteData" property="positiveVotes"/></span></b>&nbsp;(<bean:write name="otherSellerGivenVoteData" property="positiveVotesPercentage"/>%)&nbsp;&nbsp;&nbsp;
										  							<bean:message key="showOtherSellerGivenVote.negativeVotes"/>:&nbsp;<span style="color:#AA0000;"/><b><bean:write name="otherSellerGivenVoteData" property="negativeVotes"/></b></span>&nbsp;&nbsp;&nbsp;
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
										  							<a href="showOtherSellerVote.do?id=<bean:write name="otherSellerGivenVoteData" property="id"/>">
												  						<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="receivedVotesInactive" border="0"/>
												  					</a>
										  						</td>
										  						<td width="10"></td>
										  						<td class="data2Text">
											  						<a href="showOtherSellerGivenVote.do?id=<bean:write name="otherSellerGivenVoteData" property="id"/>">
											  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="sellerGivenVotesActive" border="0"/>
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
				  						  		<logic:iterate name="otherSellerGivenVoteData" property="votes" id="collection">
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
														  						<logic:equal name="collection" property="buyerIsPublic" value="1">
															  						<td nowrap class="data1Text" align="left" title="<bean:write name="collection" property="buyerLogin"/>">
															  							<a href="showBuyer.do?id=<bean:write name="collection"  property="buyerId"/>" class="data1Link">
																	  						<bean:write name="collection" property="briefBuyerLogin"/>
																	  					</a>
															  						</td>
															  					</logic:equal>
																				<logic:notEqual name="collection" property="buyerIsPublic" value="1">
															  						<td nowrap class="data1Text" align="left" title="<bean:write name="collection" property="buyerLogin"/>">
																  						<bean:message key="showOtherSellerVote.hiddenUser"/>
															  						</td>
															  					</logic:notEqual>				
														  					</tr>
														  					<tr><td height="8"></td></tr>
														  					<tr align="left">
														  						<td nowrap class="data1Text" align="left">
														  							<b><bean:message key="showOtherSellerGivenVote.date"/>:</b>&nbsp;
														  							<bean:write name="collection" property="date"/>
														  						</td>
														  					</tr>
														  					<tr><td height="8"></td></tr>
														  					<tr align="left">
														  						<td nowrap class="data1Text" align="left">
															  						<logic:equal name="collection" property="vote" value="1">
															  							<img src="pictures/positiveVote.gif" alt="<bean:message key="showOtherSellerGivenVote.positiveVote"/>"/>
															  						</logic:equal>
															  						<logic:equal name="collection" property="vote" value="-1">
															  							<img src="pictures/negativeVote.gif" alt="<bean:message key="showOtherSellerGivenVote.negativeVote"/>"/>
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
															  					<tr><td height="5"></tr>
															  					<tr>
															  						<td class="data2Text" align="left">
															  							<b><bean:message key="showOtherSellerGivenVote.answer"/>:</b>&nbsp;
															  							<bean:write name="collection" property="reply"/>
															  						</td>
															  					</tr>
															  				</logic:notEmpty>
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
