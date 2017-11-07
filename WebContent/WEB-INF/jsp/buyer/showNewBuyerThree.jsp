<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/amandris.tld" prefix="amandris" %>

<tiles:insert template='../tiles/amandrisBuyerTile.jsp'>
	<tiles:put name='logoTile' content='logoTile.jsp'/>
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
			<td height="450" class="errorText" align="center">	
				<table width="90%" cellpadding="0" cellspacing="0" boder="0">
					<html:form action="setNewBuyer.do">
						<html:hidden property="page" value="3"/>
						<tr><td height="15"></td></tr>
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showNewBuyerThree.text1"/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td class="errorText" align="center">
								<html:errors/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td class="data3Text" align="left">
								<b><bean:message key="showNewBuyerThree.title"/></b>
							</td>
						</tr>
						<tr><td height="5"></td></tr>
						<tr><td height="1" background="pictures/pixel.gif"></td></tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0" align="left">
									<tr height="40">
										<td align="left" >
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewBuyerThree.sendBulletin"/>','<bean:message key="showNewBuyerThree.sendBulletin.help"/>', 370, 200); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewBuyerThree.sendBulletin"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:checkbox property="sendBulletin" styleClass="form"/>
											<input type="hidden" name="sendBulletin" value="false"/>
										</td>
									</tr>
									<tr><td height="5"></td><td></td><td></td><td></td><td></td></tr>
									<tr height="40">
										<td align="left" >
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewBuyerThree.sendNews"/>','<bean:message key="showNewBuyerThree.sendNews.help"/>', 370, 200); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right">
											<b><bean:message key="showNewBuyerThree.sendNews"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:checkbox property="sendNews" styleClass="form"/>
											<input type="hidden" name="sendNews" value="false"/>
										</td>
									</tr>
									<tr><td height="5"></td><td></td><td></td><td></td><td></td></tr>
									<tr height="40">
										<td align="left" >
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewBuyerThree.isPublic"/>','<bean:message key="showNewBuyerThree.isPublic.help"/>', 370, 200); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right" >
											<b><bean:message key="showNewBuyerThree.isPublic"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left" >
											<html:checkbox property="isPublic" styleClass="form"/>
											<input type="hidden" name="isPublic" value="false"/>
										</td>
									</tr>
									<tr><td height="5"></td><td></td><td></td><td></td><td></td></tr>
									<tr height="30">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterFixedHelpContent('<bean:message key="showNewBuyerThree.acceptTerms"/>','<bean:message key="showNewBuyerThree.acceptTerms.help"/>', 370, 200); FixedActivate();" onMouseout="FixedDeActivate();">
										</td>
										<td width="10"></td>
										<td class="data1Text" align="right" >
											<b><bean:message key="showNewBuyerThree.acceptTerms"/></b>
										</td>
										<td width="5"></td>
										<td class="data1Text" align="left">
											<html:checkbox property="acceptTerms" styleClass="form"/>
											<input type="hidden" name="acceptTerms" value="false"/>
											<a href="showUserTerms.do" target="_blank" class="data1Link"><bean:message key="showNewBuyerThree.readTerms"/></a>
										</td>
									</tr>
									<tr><td height="40"></td><td></td><td></td><td></td><td></td></tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table width="100%">
									<tr>
										<td align="left">
											<input type="button" class="form" onclick="javascript:history.back();" value="&lt;&lt;&nbsp;<bean:message key="showNewBuyerThree.back"/>">
										</td>
										<td align="right">
											<input type="button" onclick="form.submit();this.disabled='true';" class="form" value="<bean:message key="showNewBuyerThree.save"/>" />
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
			</td>
		</tr>
	</table>


	</tiles:put>
</tiles:insert>
