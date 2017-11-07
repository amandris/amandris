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
							<bean:message key="showUserTerms.title"/>
						</td>
					</tr>
					<tr>
						<td>
							<table width="98%" cellpadding="3" cellspacing="3" border="0">
								<tr>
									<td align="right">
										<table width="98%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.text1"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="98%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.text2"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="95%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term1"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="95%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term2"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="95%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term3"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="95%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term4"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="95%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term5"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="90%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term5.point1"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="90%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term5.point2"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="85%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term5.point2.first"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="85%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term5.point2.second"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="90%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term5.point3"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="90%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term5.point4"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="90%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term5.point5"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="90%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term5.point6"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="95%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term6"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="95%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term7"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="95%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term8"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="95%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term9"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="95%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term10"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="90%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term10.point1"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="90%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term10.point2"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="95%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term11"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="95%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term12"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="95%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term13"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="95%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term14"/><p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td align="right">
										<table width="95%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="20"></td>
												<td class="data1Text" style="text-align:justify;">
													<bean:message key="showUserTerms.term15"/><p>
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
							<button class="form" onclick="window.close();"><bean:message key="common.close"/></button>
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
