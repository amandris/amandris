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
			<td height="450" class="errorText" align="center">	
				<table width="100%" cellpadding="0" cellspacing="5" border="0">
					<tr>
						<td class="data3Text">
							<bean:message key="showVoteRules.title"/>
						</td>
					</tr>
					<tr>
						<td>
							<table width="100%" cellpadding="8" cellspacing="5" border="0" align="center">
								<tr>
									<td class="data1Text" style="text-align:justify;">
										<bean:message key="showVoteRules.text1"/>
									</td>
								</tr>
								<tr>
									<td class="data1Text" style="text-align:justify;">
										<bean:message key="showVoteRules.text2"/>
									</td>
								</tr>
								
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<b><bean:message key="showVoteRules.rules"/></b>
						</td>
						</tr>
					<tr>
						<td>
							<table width="98%" cellpadding="5" cellspacing="5" border="0">
								<tr>
									<td class="data1Text">
										<ul>
											<li><bean:message key="showVoteRules.rule1"/></li><p>
											<li><bean:message key="showVoteRules.rule2"/></li><p>
											<li><bean:message key="showVoteRules.rule3"/></li><p>
											<li><bean:message key="showVoteRules.rule4"/></li><p>
											<li><bean:message key="showVoteRules.rule5"/></li><p>
										</ul>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<b><bean:message key="showVoteRules.recommendations"/></b>
						</td>
					</tr>
					<tr>
						<td>
							<table width="98%" cellpadding="5" cellspacing="5" border="0">
								<tr>
									<td class="data1Text">
										<ul>
											<li><bean:message key="showVoteRules.recommendation1"/></li><p>
											<li><bean:message key="showVoteRules.recommendation2"/></li><p>
											<li><bean:message key="showVoteRules.recommendation3"/></li><p>
											<li><bean:message key="showVoteRules.recommendation4"/></li><p>
											<li><bean:message key="showVoteRules.recommendation5"/></li><p>
										</ul>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<b><bean:message key="showVoteRules.rightExamples"/></b>
						</td>
					</tr>
					<tr>
						<td align="left">
							<table cellpadding="1" cellspacing="0" border="0">
								<tr>
									<td width="30"></td>
									<td>
										<img src="pictures/negativeVote.gif">
									</td>
									<td class="data1Text">
										<bean:message key="showVoteRules.rightExample1"/>
									</td>
								</tr>
								<tr>
									<td width="30"></td>
									<td>
										<img src="pictures/negativeVote.gif">
									</td>
									<td class="data1Text">
										<bean:message key="showVoteRules.rightExample2"/>
									</td>
								</tr>
								<tr>
									<td width="30"></td>
									<td>
										<img src="pictures/positiveVote.gif">
									</td>
									<td class="data1Text">
										<bean:message key="showVoteRules.rightExample3"/>
									</td>
								</tr>
								<tr>
									<td width="30"></td>
									<td>
										<img src="pictures/negativeVote.gif">
									</td>
									<td class="data1Text">
										<bean:message key="showVoteRules.rightExample4"/>
									</td>
								</tr>
								<tr>
									<td width="30"></td>
									<td>
										<img src="pictures/negativeVote.gif">
									</td>
									<td class="data1Text">
										<bean:message key="showVoteRules.rightExample5"/>
									</td>
								</tr>
							</table>	
						</td>
					</tr>
					<tr><td height="10"></td></tr>
					<tr>
						<td>
							<b><bean:message key="showVoteRules.wrongExamples"/></b>
						</td>
					</tr>
					<tr>
						<td align="left">
							<table cellpadding="1" cellspacing="0" border="0">
								<tr>
									<td width="30"></td>
									<td>
										<img src="pictures/negativeVote.gif">
									</td>
									<td class="data1Text">
										<bean:message key="showVoteRules.wrongExample1"/>
									</td>
								</tr>
								<tr>
									<td width="30"></td>
									<td>
										<img src="pictures/negativeVote.gif">
									</td>
									<td class="data1Text">
										<bean:message key="showVoteRules.wrongExample2"/>
									</td>
								</tr>
								<tr>
									<td width="30"></td>
									<td>
										<img src="pictures/negativeVote.gif">
									</td>
									<td class="data1Text">
										<bean:message key="showVoteRules.wrongExample3"/>
									</td>
								</tr>
								<tr>
									<td width="30"></td>
									<td>
										<img src="pictures/positiveVote.gif">
									</td>
									<td class="data1Text">
										<bean:message key="showVoteRules.wrongExample4"/>
									</td>
								</tr>
							</table>	
						</td>
					</tr>
					<tr>
						<td align="center">
							<button class="form" onclick="history.back();"><bean:message key="common.back"/></button>
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
