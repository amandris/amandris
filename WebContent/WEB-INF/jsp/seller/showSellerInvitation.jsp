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

	<script language="javascript" type="text/javascript">
		function deleteInvitation(id)
		{
			if( confirm("<bean:message key="showSellerInvitation.delete.confirm"/>")) {
				document.location.href="deleteSellerInvitation.do?id=" + id;
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
			  						  		<logic:empty name="sellerInvitationData" property="invitations">
			  						  			<tr>
			  						  				<td class="data1Text" align="center">
			  						  					<bean:message key="showSellerInvitation.invitationNotExist"/>
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
											  						<a href="showSellerInvitation.do">
											  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="sellerInvitationsActive" border="0"/>
											  						</a>
										  						</td>
										  						<td width="10"></td>
										  						<td class="data2Text">
										  							<a href="showSellerMessage.do">
												  						<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="messagesInactive" border="0"/>
												  					</a>
										  						</td>
													  		</tr>
													  	</table>
							  						</td>
										  		</tr>			  						  			
			  						  		</logic:empty>
			  						  	
				  						  	<logic:notEmpty name="sellerInvitationData" property="invitations">
					  						  	<tr>
			  						  				<td class="data1Text" align="center">
			  						  					<bean:message key="showSellerInvitation.text"/>
			  						  				</td>
			  						  			</tr>
												<tr>
				  						  			<td height="10"></td>
			  						  			</tr>			  						  			
			  						  			<tr>
							  						<td class="data2Text" align="center">
								  						<bean:message key="showSellerInvitation.youHave"/>&nbsp;<b>
								  						<bean:write name="sellerInvitationData" property="totalInvitations"/></b>&nbsp;
								  						<bean:message key="showSellerInvitation.invitations"/>
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
											  						<a href="showSellerInvitation.do">
											  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="sellerInvitationsActive" border="0"/>
											  						</a>
										  						</td>
										  						<td width="10"></td>
										  						<td class="data2Text">
										  							<a href="showSellerMessage.do">
												  						<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="messagesInactive" border="0"/>
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
			  						  							<td nowrap class="data2Text">
			  						  								<b><bean:message key="showSellerInvitation.date"/></b>
			  						  							</td>
			  						  							<td nowrap class="data2Text">
			  						  								<b><bean:message key="showSellerInvitation.receiver"/></b>
			  						  							</td>
			  						  							<td nowrap class="data2Text" align="center">
			  						  								<b><bean:message key="showSellerInvitation.delete"/></b>
			  						  							</td>
			  						  						<tr>
				  						  					<logic:iterate name="sellerInvitationData" property="invitations" id="collection">
				  						  						<tr>
				  						  							<td background="pictures/pixel.gif"></td>
				  						  							<td background="pictures/pixel.gif"></td>
				  						  							<td background="pictures/pixel.gif"></td>
				  						  							<td background="pictures/pixel.gif"></td>
				  						  						</tr>
	  						  									<tr>
			  						  								<td nowrap width="10">
				  						  							</td>
				  						  							<td nowrap class="data1Text">
				  						  								<bean:write name="collection" property="date"/>
				  						  							</td>
				  						  							<td nowrap class="data1Text" title="<bean:write name="collection" property="buyerLogin"/>">
				  						  								<a href="showBuyer.do?id=<bean:write name="collection" property="buyerId"/>" class="data1Link">
					  						  								<bean:write name="collection" property="buyerBriefLogin"/>
					  						  							</a>
				  						  							</td>
				  						  												  						  							
				  						  							<td nowrap align="center">
				  						  								<a href="#" onclick="javascript:deleteInvitation(<bean:write name="collection" property="id"/>);" OnMouseOver="status='<bean:message key="showSellerInvitation.delete"/>';return true;" OnMouseOut="status='';return true;">
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
