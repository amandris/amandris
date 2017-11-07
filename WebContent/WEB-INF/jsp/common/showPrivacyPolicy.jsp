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
							<bean:message key="showPrivacyPolicy.title"/>
						</td>
					</tr>
					<tr>
						<td>
							<table width="98%" cellpadding="5" cellspacing="5" border="0">
								<tr>
									<td class="data2Text">
										<b>1-<bean:message key="showPrivacyPolicy.term1"/></b>
									</td>
								</tr>
								<tr>
									<td>
										<table width="98%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showPrivacyPolicy.term1Text"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td class="data2Text">
										<b>2-<bean:message key="showPrivacyPolicy.term2"/></b>
									</td>
								</tr>
								<tr>
									<td>
										<table width="98%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showPrivacyPolicy.term2Text"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td class="data2Text">
										<b>3-<bean:message key="showPrivacyPolicy.term3"/></b>
									</td>
								</tr>
								<tr>
									<td>
										<table width="98%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showPrivacyPolicy.term3Text"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td class="data2Text">
										<b>4-<bean:message key="showPrivacyPolicy.term4"/></b>
									</td>
								</tr>
								<tr>
									<td>
										<table width="98%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showPrivacyPolicy.term4Text"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td class="data2Text">
										<b>5-<bean:message key="showPrivacyPolicy.term5"/></b>
									</td>
								</tr>
								<tr>
									<td>
										<table width="98%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showPrivacyPolicy.term5Text"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td class="data2Text">
										<b>6-<bean:message key="showPrivacyPolicy.term6"/></b>
									</td>
								</tr>
								<tr>
									<td>
										<table width="98%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showPrivacyPolicy.term6Text"/><p>
												</td>
											</tr>
										</table>
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
