<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/amandris.tld" prefix="amandris" %>

<tiles:insert template='../tiles/amandrisBuyerTile.jsp'>
	<tiles:put name='logoTile' content='logoTile.jsp'/>
	<tiles:put name='buyerMenuTile' content='buyerMenuTile.jsp'/>
	<tiles:put name='footer2Tile' content='footer2Tile.jsp'/>
	<tiles:put name='footer3Tile' content='footer3Tile.jsp'/>
	<tiles:put name='body' type='string'>
	
	<script language="javascript" type="text/javascript">
		
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
				<table width="98%" cellpadding="0" cellspacing="0" border="0" align="center">
					<html:form action="setBuyerVoteSeller.do">
						<tr>
							<td align="center" class="data1Text">
								<bean:message key="showBuyerVoteSeller.text1"/>
							</td>
						</tr>
						<tr><td height="15"></td></tr>
						<tr>
							<td align="center" class="data1Text">
								<bean:message key="showBuyerVoteSeller.text2"/>
							</td>
						</tr>
						<tr><td height="15"></td></tr>
						<tr>
							<td align="center" class="data1Text">
								<bean:message key="showBuyerVoteSeller.text3"/>&nbsp;<bean:message key="showBuyerVoteSeller.click"/>&nbsp;<a href="showVoteRules.do" class="data1Link"><bean:message key="showBuyerVoteSeller.here"/></a>&nbsp;<bean:message key="showBuyerVoteSeller.toSeeRules"/>
							</td>
						</tr>
						<tr>
							<td height="30" class="errorText" align="center">
								<html:hidden property="contactId"/>
								<html:errors/>
							</td>
						</tr>
						<tr>
							<td align="center" class="data1Text">
								<table cellpadding="0" cellspacing="0" border="0" align="left">
									<tr height="30">
										<td nowrap align="right" class="data2Text" valign="top">
											<img src="pictures/positiveVote.gif"/>
										</td>
										<td width="15"></td>
										<td align="left" class="data3Text" valign="top">
											<html:radio property="vote" value="1"/><bean:message key="showBuyerVoteSeller.positiveVote"/>
										</td>
									</tr>
									<tr height="30">
										<td nowrap align="right" class="data2Text" valign="top">
											<img src="pictures/negativeVote.gif"/>
										</td>
										<td width="15"></td>
										<td align="left" class="data3Text" valign="top">
											<html:radio property="vote" value="-1"/><bean:message key="showBuyerVoteSeller.negativeVote"/>
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
										<td align="left" class="data2Text" valign="top">
											<b><bean:message key="showBuyerVoteSeller.comment"/></b>&nbsp;(<bean:message key="showBuyerVoteSeller.maximun"/>)
										</td>
									</tr>
									<tr><td height="5"></td></tr>
									<tr>
										<td align="left" class="data2Text" valign="top">
											<html:text property="text" styleClass="form" size="130"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td height="60"></td></tr>
						<tr>
							<td>
								<table width="100%" cellpadding="0" cellspacing="0" border="0" align="left">
									<tr>
										<td align="center" class="data1Text" >
											<bean:message key="showBuyerVoteSeller.text4"/>
										</td>
									</tr>
									<tr><td height="15"></td></tr>
									<tr>
										<td>
											<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr bgcolor="#C185AA" height="30">
													<td width="100%" class="data1Text" align="right">
														<html:submit styleClass="form"><bean:message key="showBuyerVoteSeller.accept"/></html:submit>&nbsp;&nbsp;&nbsp;&nbsp;
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
			</td>
		</tr>
	</table>
</tiles:put>
</tiles:insert>
