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
	
	<script language="javascript" type="text/javascript">
		function deleteMessage(id)
		{
			if( confirm("<bean:message key="showBuyerMessage.delete.confirm"/>")) {
				document.location.href="deleteBuyerMessage.do?id=" + id;
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
				<table  cellpadding="0" cellspacing="0" border="0">
					<tr>
			  			<td valign="top" width="704">
			  				<!-- center -->
			  			  	<table width="704" cellpadding="0" cellspacing="0" border="0" valign="top">
						  		<tr>
						  			<td>
			  						  	<table width="704" cellpadding="0" cellspacing="0" border="0">
			  						  		<logic:empty name="buyerMessageData" property="messages">
			  						  			<tr>
			  						  				<td class="data1Text" align="center">
			  						  					<bean:message key="showBuyerMessage.messageNotExist"/>
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
											  						<a href="showBuyerInvitation.do">
											  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="invitationsInactive" border="0"/>
											  						</a>
										  						</td>
										  						<td width="10"></td>
										  						<td class="data2Text">
										  							<a href="showBuyerMessage.do">
												  						<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="buyerMessagesActive" border="0"/>
												  					</a>
										  						</td>
													  		</tr>
													  	</table>
							  						</td>
										  		</tr>			  						  			
			  						  		</logic:empty>
			  						  	
				  						  	<logic:notEmpty name="buyerMessageData" property="messages">
					  						  	<tr>
			  						  				<td class="data1Text" align="center">
			  						  					<bean:message key="showBuyerMessage.text"/>
			  						  				</td>
			  						  			</tr>
												<tr>
				  						  			<td height="10"></td>
			  						  			</tr>			  						  			
			  						  			<tr>
							  						<td class="data2Text" align="center">
								  						<bean:message key="showBuyerMessage.youHave"/>&nbsp;<b>
								  						<bean:write name="buyerMessageData" property="totalMessages"/></b>&nbsp;
								  						<bean:message key="showBuyerMessage.messages"/>&nbsp;(
								  						<bean:write name="buyerMessageData" property="newMessages"/>&nbsp;
								  						<bean:message key="showBuyerMessage.new"/>)
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
											  						<a href="showBuyerInvitation.do">
											  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="invitationsInactive" border="0"/>
											  						</a>
										  						</td>
										  						<td width="10"></td>
										  						<td class="data2Text">
										  							<a href="showBuyerMessage.do">
												  						<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="buyerMessagesActive" border="0"/>
												  					</a>
										  						</td>
													  		</tr>
													  	</table>
							  						</td>
										  		</tr>
			  						  			<tr>
				  						  			<td height="10"></td>
			  						  			</tr>			  		
			  						  			<tr>
			  						  				<td>
			  						  					<table width="100%" cellpadding="3" cellspacing="0">
			  						  						<tr bgcolor="#E5B8D3">
				  						  						<td nowrap width="10">
			  						  							</td>
				  						  						<td nowrap width="1%">
			  						  							</td>
			  						  							<td nowrap class="data2Text">
			  						  								<b><bean:message key="showBuyerMessage.date"/></b>
			  						  							</td>
			  						  							<td nowrap class="data2Text">
			  						  								<b><bean:message key="showBuyerMessage.sender"/></b>
			  						  							</td>
			  						  							<td nowrap class="data2Text">
			  						  								<b><bean:message key="showBuyerMessage.subject"/></b>
			  						  							</td>
			  						  							<td nowrap class="data2Text" align="center">
			  						  								<b><bean:message key="showBuyerMessage.delete"/></b>
			  						  							</td>
			  						  						<tr>
				  						  					<logic:iterate name="buyerMessageData" property="messages" id="collection">
				  						  						<tr>
					  						  						<td background="pictures/pixel.gif"></td>
				  						  							<td background="pictures/pixel.gif"></td>
				  						  							<td background="pictures/pixel.gif"></td>
				  						  							<td background="pictures/pixel.gif"></td>
				  						  							<td background="pictures/pixel.gif"></td>
				  						  							<td background="pictures/pixel.gif"></td>
				  						  						</tr>
												  				<logic:equal name="collection" property="isNew" value="1">
		  						  									<tr bgcolor="#FFFBE9">
		  						  								</logic:equal>
												  				<logic:notEqual name="collection" property="isNew" value="1">
		  						  									<tr>
		  						  								</logic:notEqual>
			  						  								<td nowrap width="10">
				  						  							</td>
													  				<td align="center">
				  						  								<logic:equal name="collection" property="isNew" value="1">
				  						  									<img src="pictures/newMessageIcon.gif" alt="<bean:message key="showBuyerMessage.newMessage"/>">
				  						  								</logic:equal>
				  						  							</td>
				  						  							<td nowrap class="data1Text">
				  						  								<bean:write name="collection" property="date"/>
				  						  							</td>
				  						  							<td nowrap >
				  						  								<a href="showBuyerMessageDetail.do?id=<bean:write name="collection" property="id"/>" class="data1Link">
					  						  								<bean:write name="collection" property="sender"/>
					  						  							</a>
				  						  							</td>
				  						  							<td nowrap class="data1Text" title="<bean:write name="collection" property="subject"/>">
				  						  								<bean:write name="collection" property="briefSubject"/>
				  						  							</td>
				  						  							<td nowrap align="center">
				  						  								<a href="#" onclick="javascript:deleteMessage(<bean:write name="collection" property="id"/>);" OnMouseOver="status='<bean:message key="showBuyerMessage.delete"/>';return true;" OnMouseOut="status='';return true;">
					  						  								<img src="pictures/deleteIcon2.gif" border="0"/>
					  						  							</a>
				  						  							</td>
					  						  						<tr>
											  				</logic:iterate>
																<tr>
																	<td background="pictures/pixel.gif"></td>
				  						  							<td background="pictures/pixel.gif"></td>
				  						  							<td background="pictures/pixel.gif"></td>
				  						  							<td background="pictures/pixel.gif"></td>
				  						  							<td background="pictures/pixel.gif"></td>
				  						  							<td background="pictures/pixel.gif"></td>
				  						  						</tr>											  				
											  			</table>
											  		</td>
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
