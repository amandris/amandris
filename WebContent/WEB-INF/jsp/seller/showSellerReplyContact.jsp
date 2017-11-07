<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/amandris.tld" prefix="amandris" %>

<tiles:insert template='../tiles/amandrisSellerTile.jsp'>
	<tiles:put name='logoTile' content='logoTile.jsp'/>
	<tiles:put name='sellerMenuTile' content='sellerMenuTile.jsp'/>
	<tiles:put name='footer2Tile' content='footer2Tile.jsp'/>
	<tiles:put name='footer3Tile' content='footer3Tile.jsp'/>
	<tiles:put name='body' type='string'>
	
	<script language="javascript" type="text/javascript">
		function setDivVisibility()
		{
			if( document.getElementById( "reply1").checked){
				document.getElementById( "textDiv").style.visibility="hidden";	
				document.getElementById( "textField").value="";	
			}
			
			if( document.getElementById( "reply2").checked){
				document.getElementById( "textDiv").style.visibility="visible";	
			}
		}
	</script>	
	
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
				<table width="99%" cellpadding="0" cellspacing="0" border="0" align="center">
					
					<html:form action="setSellerReplyContact.do">
						<tr>
							<td align="center" class="data1Text">
								<bean:message key="showSellerReplyContact.text1"/>
							</td>
						</tr>
						<tr><td height="15"></td></tr>
						<tr>
							<td align="center" class="data1Text">
								<bean:message key="showSellerReplyContact.text2"/>
							</td>
						</tr>
						<tr><td height="15"></td></tr>
						<tr>
							<td align="center" class="errorText">
								<html:errors/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr><td height="1" background="pictures/pixel.gif"></td></tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td height="30" class="data2Text">
								<b>Detalles de la cita</b>
							</td>
						</tr>
						<tr>
							<td>
								<table width="80%" align="center">						
									<tr>
				  						<td width="100%" >
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
										  						<td nowrap class="data1Text" align="right">
										  							<bean:message key="showSellerReplyContact.contactDate"/>:&nbsp;
										  						</td>
										  						<td nowrpa class="data1Text">
										  							<b><bean:write name="sellerContactDetail" property="messageDate"/></b>&nbsp;<bean:message key="common.at"/>&nbsp;<b><bean:write name="sellerContactDetail" property="messageTime"/></b>&nbsp;(<bean:write name="sellerContactDetail" property="messageTimeFrom"/>)
										  						</td>
										  					</tr>
										  					<tr><td height="10"></td><td></td></tr>
										  					<tr>
										  						<td nowrap class="data1Text" align="right">
										  							<bean:message key="showSellerReplyContact.dateDate"/>:&nbsp;
										  						</td>
																<td nowrap class="data1Text">
									  							<b><bean:write name="sellerContactDetail" property="dateDate"/></b>&nbsp;<bean:message key="common.at"/>&nbsp;<b><bean:write name="sellerContactDetail" property="dateTime"/></b>
										  							<logic:greaterEqual name="sellerContactDetail" property="dateTimeToValue" value="0">
											  							(<bean:write name="sellerContactDetail" property="dateTimeTo"/>)
										  							</logic:greaterEqual>
										  							<logic:lessThan name="sellerContactDetail" property="dateTimeToValue" value="0">
											  							(<bean:message key="showSellerReplyContact.passedOff"/>)
										  							</logic:lessThan>
										  						</td>
										  					</tr>
										  					<tr><td height="10"></td><td></td></tr>
										  					<tr>
										  						<td nowrap class="data1Text" align="right">
										  							<bean:message key="showSellerReplyContact.length"/>:&nbsp;
										  						</td>
										  						<td nowrpa class="data1Text">
										  							<b><bean:write name="sellerContactDetail" property="length"/>&nbsp;
										  							<logic:equal name="sellerContactDetail" property="length" value="1">
											  							<bean:message key="showSellerReplyContact.hour"/><b>
											  						</logic:equal>
											  						<logic:notEqual name="sellerContactDetail" property="length" value="1">
											  							<bean:message key="showSellerReplyContact.hours"/><b>
											  						</logic:notEqual>
										  						</td>
										  					</tr>
										  					<tr><td height="10"></td><td></td></tr>
										  					<tr>
										  						<td nowrap class="data1Text" align="right">
										  							<bean:message key="showSellerReplyContact.serviceType"/>:&nbsp;
										  						</td>
										  						<td nowrpa class="data1Text">
										  							<b><bean:write name="sellerContactDetail" property="serviceTypeText"/>&nbsp;
										  						</td>
										  					</tr>
										  					<tr><td height="10"></td><td></td></tr>
										  					<tr>
										  						<td nowrap class="data1Text" align="right">
										  							<bean:message key="showSellerReplyContact.prize"/>:&nbsp;
										  						</td>
										  						<td nowrpa class="data1Text">
										  							<logic:equal name="sellerContactDetail" property="isFree" value="1">
										  								<span style="color:#00AA00;"><b><bean:message key="showSellerReplyContact.free"/></b></span>
										  							</logic:equal>
										  							<logic:equal name="sellerContactDetail" property="isFree" value="0">
											  							<b><bean:write name="sellerContactDetail" property="price"/>&nbsp;<bean:write name="sellerContactDetail" property="currency"/></b>
											  						</logic:equal>
										  						</td>
										  					</tr>
										  					<tr><td height="10"></td><td></td></tr>
										  					<tr>
										  						<td nowrap class="data1Text" valign="top" align="right">
										  							<bean:message key="showSellerReplyContact.datePlace"/>:&nbsp;
										  						</td>
																<td nowrap class="data1Text" valign="top">
									  								<b><bean:write name="sellerContactDetail" property="address1"/>&nbsp;<bean:write name="sellerContactDetail" property="address2"/><br><bean:write name="sellerContactDetail" property="city"/>&nbsp;(<bean:write name="sellerContactDetail" property="state"/>)<br><bean:write name="sellerContactDetail" property="country"/>
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
						<tr><td height="10"></td></tr>
						<tr><td height="1" background="pictures/pixel.gif"></td></tr>
						<tr><td height="15"></td></tr>
						<tr>
							<td align="center" class="data1Text">
								<table cellpadding="0" cellspacing="0" border="0" align="left">
									<tr height="80">
										<td nowrap align="right" class="data2Text" valign="top">
											<img src="pictures/acceptContact.gif"/>
										</td>
										<td width="8"></td>
										<td nowrap align="left" class="data3Text"  valign="middle">
											<html:radio styleId="reply1" property="reply" value="1" onclick="javascript:setDivVisibility();"/><bean:message key="showSellerReplyContact.acceptContact"/>&nbsp;
										</td>
										<td nowrap align="left" class="data1Text"  valign="middle">
											(<bean:message key="showSellerReplyContact.acceptContact.help"/>)
										</td>
									</tr>
									<tr height="80">
										<td nowrap align="right" class="data2Text" valign="top">
											<img src="pictures/rejectContact.gif"/>
										</td>
										<td width="8"></td>
										<td nowrap align="left" class="data3Text" valign="middle">
											<html:radio styleId="reply2" property="reply" value="2" onclick="javascript:setDivVisibility();"/><bean:message key="showSellerReplyContact.rejectContact"/>&nbsp;
										</td>
										<td nowrap align="left" class="data1Text"  valign="middle">
											(<bean:message key="showSellerReplyContact.rejectContact.help"/>)
										</td>
										
									</tr>
								</table>
							</td>
						</tr>
						<tr><td height="5"></td></tr>
						<tr>
							<td>
								<div id="textDiv" style="visibility:hidden;">
									<table cellpadding="0" cellspacing="0" border="0" align="left">
										<tr>
											<td align="left" class="data2Text" valign="top">
												<b><bean:message key="showSellerReplyContact.comment"/></b>&nbsp;(<bean:message key="showSellerReplyContact.maximun"/>)
											</td>
										</tr>
										<tr><td height="5"></td></tr>
										<tr>
											<td align="left" class="data2Text" valign="top">
												<html:text styleId="textField" property="text" styleClass="form" size="130"/>
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						<tr><td height="20"></td></tr>
						<tr>
							<td>
								<table width="100%" cellpadding="0" cellspacing="0" border="0" align="left">
									<tr>
										<td>
											<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr bgcolor="#C185AA" height="30">
													<td width="100%" class="data1Text" align="right">
														<html:submit styleClass="form"><bean:message key="showSellerReplyContact.accept"/></html:submit>&nbsp;&nbsp;&nbsp;&nbsp;
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</html:form>
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
				<script language="javascript">
					setDivVisibility();
				</script>
			</td>
		</tr>
	</table>
</tiles:put>
</tiles:insert>
