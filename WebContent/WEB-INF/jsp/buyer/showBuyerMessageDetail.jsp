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
			if( confirm("<bean:message key="showBuyerMessageDetail.deleteMessage.confirm"/>")) {
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
				<table width="704" cellpadding="0" cellspacing="5" border="0">
					<tr>
			  			<td valign="top">
			  			  	<table  width="80%" cellpadding="0" cellspacing="5" border="0" valign="top" align="center">
						  		<tr>
						  			<td class="data1Text">
			  							<b><bean:message key="showBuyerMessageDetail.sender"/></b>:&nbsp;<bean:write name="buyerMessage" property="sender"/>
			  						</td>
						  		</tr>
						  		<tr>
						  			<td class="data1Text">
			  							<b><bean:message key="showBuyerMessageDetail.date"/></b>:&nbsp;<bean:write name="buyerMessage" property="date"/>
			  						</td>
						  		</tr>
						  		<tr>
						  			<td class="data1Text">
			  							<b><bean:message key="showBuyerMessageDetail.subject"/></b>:&nbsp;<bean:write name="buyerMessage" property="subject"/>
			  						</td>
						  		</tr>
						  		
						  	</table>
			  			</td>
					</tr>
					<tr><td></td></tr>
					<tr>
						<td>
							<table width="80%" cellpadding="5" cellspacing="0" border="0" valign="top" align="center">
								<tr>
									<td>
										<img src="pictures/mailboxIcon.gif"/>
										<a href="showBuyerMessage.do" class="data1Link"><bean:message key="showBuyerMessageDetail.goToMailbox"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
										
										<img src="pictures/deleteIcon2.gif"/>
										<a href="#" onclick="javascript:deleteMessage(<bean:write name="buyerMessage" property="id"/>);" OnMouseOver="status='<bean:message key="showBuyerMessageDetail.deleteMessage"/>';return true;" OnMouseOut="status='';return true;" class="data1Link"><bean:message key="showBuyerMessageDetail.deleteMessage"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
										
										<img src="pictures/newMessageIcon.gif"/>
										<a href="markBuyerMessageAsNew.do?id=<bean:write name="buyerMessage" property="id"/>" class="data1Link"><bean:message key="showBuyerMessageDetail.markAsNew"/></a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
			  			<td valign="top">
			  			  	<table width="80%" height="320" cellpadding="5" cellspacing="0" border="1" valign="top" align="center">
						  		<tr>
						  			<logic:equal name="buyerMessage" property="isHtml" value="1">
							  			<td valign="top">
				  							<bean:write name="buyerMessage" property="text" filter="false"/>
				  						</td>
				  					</logic:equal>
						  			<logic:notEqual name="buyerMessage" property="isHtml" value="1">
							  			<td class="data1Text" valign="top">
				  							<bean:write name="buyerMessage" property="text" filter="true"/>
				  						</td>
				  					</logic:notEqual>
				  					
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
