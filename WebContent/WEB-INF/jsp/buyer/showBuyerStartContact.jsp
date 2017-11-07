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
		function setDate( date, hour)
		{
			document.getElementById( "date").value=date;
			document.getElementById( "hour").value=hour + ":00";
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
				<table width="98%" cellpadding="0" cellspacing="0" border="0" align="center">
					<html:form action="showBuyerConfirmContact.do">
						<tr>
							<td align="center" class="data1Text">
								<b><bean:message key="showBuyerStartContact.text"/></b>
								<html:hidden name="buyerStartContact" property="sellerId"/>
							</td>
						</tr>
						<tr><td height="5"></td></tr>
						<tr>
							<td align="center" class="errorText">
								<html:errors/>
							</td>
						</tr>
						<tr><td height="15"></td></tr>
						<tr>
				  			<td>
					  			<table cellpadding="0" cellspacing="1" border="0" align="center">
						  			<logic:iterate name="buyerStartContact" property="dateList" id="collection1">
						  				<tr height="20">
						  					<td nowrap class="data1Text" align="right">
												<bean:write name="collection1" property="date"/>
											</td>
											<td width="12"></td>
											<logic:iterate name="collection1" property="hourList" id="collection2">
												<logic:equal name="collection2" property="status" value="1">
													<td style="cursor:pointer;cursor:hand;" width="20" align="center" class="freeHour" onmouseover="this.className='freeHourActive';"  onmouseout="this.className='freeHour';" onclick="javascript:setDate( '<bean:write name="collection1" property="briefDate"/>', '<bean:write name="collection2" property="hour"/>');">
														<bean:write name="collection2" property="hour"/>
													</td>
												</logic:equal>
												<logic:equal name="collection2" property="status" value="2">
													<td width="20" align="center" bgcolor="#EEAACC" class="data1Text">
														<bean:write name="collection2" property="hour"/>
													</td>
												</logic:equal>
											</logic:iterate>
										</tr>
									</logic:iterate>  						  	
								</table>
							</td>
						</tr>
						<tr align="right">
							<td align="right">
					  			<table width="80%" cellpadding="0" cellspacing="0" border="0" align="right">
					  				<tr>
					  					<td width="30%">
											&nbsp;
										</td>
					  					<td align="right">
											<a href="showBuyerStartContact.do?id=<bean:write name="buyerStartContact" property="sellerId"/>&startDate=<bean:write name="previousStartDate"/>" class="data1Link">&lt;&lt;&nbsp;<bean:message key="showBuyerStartContact.see12PreviousDays"/></a>
										</td>
										<td align="right">
											<a href="showBuyerStartContact.do?id=<bean:write name="buyerStartContact" property="sellerId"/>&startDate=<bean:write name="nextStartDate"/>" class="data1Link"><bean:message key="showBuyerStartContact.see12NextDays"/>&nbsp;&gt;&gt;</a>
										</td>
									<tr>
								</table>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0" align="left">
									<tr>
										<td>
											<table cellpadding="0" cellspacing="0" border="0" align="left">
												<tr>
													<td width="21" height="20" class="freeHour">
													</td>
													<td width="5"></td>
													<td class="data1Text">
														<bean:message key="showBuyerStartContact.freeHour"/>
													</td>
													<td width="30"></td>
													<td width="21" height="20" bgcolor="#EEAACC">
													</td>
													<td width="5"></td>
													<td class="data1Text">
														<bean:message key="showBuyerStartContact.notFreeHour"/>
													</td>
												</tr>
											</table>
										</td>
										<td width="60"></td>
										<td>
											<table cellpadding="0" cellspacing="0" border="0" align="center">
												<tr>
													<td nowrap class="data1Text">
														<bean:message key="showBuyerStartContact.day"/>
													</td>
													<td width="5"></td>
													<td>
														<html:text styleClass="form" property="date" styleId="date" size="6"/>
													</td>
													<td width="20"></td>
													<td nowrap class="data1Text">
														<bean:message key="showBuyerStartContact.hour"/>
													</td>
													<td width="5"></td>
													<td>
														<html:text styleClass="form" property="hour" styleId="hour" size="4"/>
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
						<tr><td height="10"></td></tr>
						<tr>
							<td>
								
								<table cellpadding="0" cellspacing="0" border="0" align="left">
									<tr>
										<td>
											<table cellpadding="0" cellspacing="0" border="0" align="left">
												<tr>
													<td class="data2Text">
														<bean:message key="showBuyerStartContact.dateLength"/>&nbsp;
														<html:select styleClass="form" property="length">
															<html:option value="1">1</html:option>
															<html:option value="2">2</html:option>
															<html:option value="3">3</html:option>
															<html:option value="4">4</html:option>
															<html:option value="5">5</html:option>
															<html:option value="6">6</html:option>
															<html:option value="7">7</html:option>
															<html:option value="8">8</html:option>
															<html:option value="9">9</html:option>
															<html:option value="10">10</html:option>
															<html:option value="11">11</html:option>
															<html:option value="12">12</html:option>
															<html:option value="13">13</html:option>
															<html:option value="14">14</html:option>
															<html:option value="15">15</html:option>
															<html:option value="16">16</html:option>
															<html:option value="17">17</html:option>
															<html:option value="18">18</html:option>
															<html:option value="19">19</html:option>
															<html:option value="20">20</html:option>
															<html:option value="21">21</html:option>
															<html:option value="22">22</html:option>
															<html:option value="23">23</html:option>
															<html:option value="24">24</html:option>
														</html:select>&nbsp;<bean:message key="showBuyerStartContact.hours"/>
													</td>
												</tr>
												<tr><td height="10"></td></tr>
												<tr>
													<td class="data1Text">
														<logic:equal name="buyerStartContact" property="allowCompanyWithoutSex" value="1">
															<html:radio property="serviceType" value="1"/>
															<bean:message key="showBuyerStartContact.companyWithoutSex"/>&nbsp;<b>
															<logic:equal name="buyerStartContact" property="companyWithoutSexIsFree" value="1">
																<span style="color:#00AA00;">(<bean:message key="showBuyerStartContact.free"/>)</span><br>
															</logic:equal>
															<logic:equal name="buyerStartContact" property="companyWithoutSexIsFree" value="0">
																(<bean:write name="buyerStartContact" property="companyWithoutSexFirstHourPrize"/>&nbsp;<bean:write name="buyerStartContact" property="currency"/>&nbsp;<bean:message key="showBuyerStartContact.firstHour"/>&nbsp;+&nbsp;<bean:write name="buyerStartContact" property="companyWithoutSexAdditionalHoursPrize"/>&nbsp;<bean:write name="buyerStartContact" property="currency"/>&nbsp;<bean:message key="showBuyerStartContact.additionalHours"/>)<br>
															</logic:equal>
															</b>
														</logic:equal>
														
														<logic:equal name="buyerStartContact" property="allowCompanyWithSex" value="1">
															<html:radio property="serviceType" value="2"/>
															<bean:message key="showBuyerStartContact.companyWithSex"/>&nbsp;<b>
															<logic:equal name="buyerStartContact" property="companyWithSexIsFree" value="1">
																<span style="color:#00AA00;">(<bean:message key="showBuyerStartContact.free"/>)</span><br>
															</logic:equal>
															<logic:equal name="buyerStartContact" property="companyWithSexIsFree" value="0">
																(<bean:write name="buyerStartContact" property="companyWithSexFirstHourPrize"/>&nbsp;<bean:write name="buyerStartContact" property="currency"/>&nbsp;<bean:message key="showBuyerStartContact.firstHour"/>&nbsp;+&nbsp;<bean:write name="buyerStartContact" property="companyWithSexAdditionalHoursPrize"/>&nbsp;<bean:write name="buyerStartContact" property="currency"/>&nbsp;<bean:message key="showBuyerStartContact.additionalHours"/>)<br>
															</logic:equal>
															</b>
														</logic:equal>
														
														
														<logic:equal name="buyerStartContact" property="allowSex" value="1">
															<html:radio property="serviceType" value="4"/>
															<bean:message key="showBuyerStartContact.sex"/>&nbsp;<b>
															<logic:equal name="buyerStartContact" property="sexIsFree" value="1">
																<span style="color:#00AA00;">(<bean:message key="showBuyerStartContact.free"/>)</span><br>
															</logic:equal>
															<logic:equal name="buyerStartContact" property="sexIsFree" value="0">
																(<bean:write name="buyerStartContact" property="sexFirstHourPrize"/>&nbsp;<bean:write name="buyerStartContact" property="currency"/>&nbsp;<bean:message key="showBuyerStartContact.firstHour"/>&nbsp;+&nbsp;<bean:write name="buyerStartContact" property="sexAdditionalHoursPrize"/>&nbsp;<bean:write name="buyerStartContact" property="currency"/>&nbsp;<bean:message key="showBuyerStartContact.additionalHours"/>)<br>
															</logic:equal>
															</b>
														</logic:equal>
														
														
														<logic:equal name="buyerStartContact" property="allowEroticShow" value="1">
															<html:radio property="serviceType" value="8"/>
															<bean:message key="showBuyerStartContact.eroticShow"/>&nbsp;<b>
															<logic:equal name="buyerStartContact" property="eroticShowIsFree" value="1">
																<span style="color:#00AA00;">(<bean:message key="showBuyerStartContact.free"/>)</span><br>
															</logic:equal>
															<logic:equal name="buyerStartContact" property="eroticShowIsFree" value="0">
																(<bean:write name="buyerStartContact" property="eroticShowFirstHourPrize"/>&nbsp;<bean:write name="buyerStartContact" property="currency"/>&nbsp;<bean:message key="showBuyerStartContact.firstHour"/>&nbsp;+&nbsp;<bean:write name="buyerStartContact" property="eroticShowAdditionalHoursPrize"/>&nbsp;<bean:write name="buyerStartContact" property="currency"/>&nbsp;<bean:message key="showBuyerStartContact.additionalHours"/>)<br>
															</logic:equal>
															</b>
														</logic:equal>
													</td>
												</tr>
											</table>
										</td>
										<td>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr><td height="1" background="pictures/pixel.gif"></td></tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0" align="left">
									<tr>
										<td class="data2Text">
											<bean:message key="showBuyerStartContact.meetingPlace"/>
										</td>
									</tr>
									<tr><td height="10"></td></tr>
									<logic:equal name="buyerStartContact" property="allowOtherPlace" value="1">
										<tr>
											<td>
												<table cellpadding="0" cellspacing="0" border="0" align="left">
													<tr>
														<td class="data1Text">
															<html:radio property="meetingPlaceType" value="1"/><bean:message key="showBuyerStartContact.sellerMeetingPlace"/>&nbsp;
														</td>
													</tr>
													<tr><td height="5"></td></tr>
													<tr>
														<td>
															<table cellpadding="0" cellspacing="0" border="0" align="left">
																<tr>
																	<td width="20"></td>
																	<td class="data1Text">
																		<b>
																			<bean:write name="buyerStartContact" property="sellerAddress1"/>&nbsp;<bean:write name="buyerStartContact" property="sellerAddress2"/><br>
																			<bean:write name="buyerStartContact" property="sellerCity"/>&nbsp;(<bean:write name="buyerStartContact" property="sellerState"/>)<br>
																			<bean:write name="buyerStartContact" property="sellerCountry"/>
																		</b>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr><td height="10"></td></tr>
									</logic:equal>
									
									<tr>
										<td>
											<table cellpadding="0" cellspacing="0" border="0" align="left">
												<tr>
													<td class="data1Text">
														<html:radio property="meetingPlaceType" value="2"/><bean:message key="showBuyerStartContact.buyerMeetingPlace"/>
														<logic:equal name="buyerStartContact" property="buyerPaysDisplacement" value="1">
															<b>(<bean:message key="showBuyerStartContact.suplement"/>&nbsp;<bean:write name="buyerStartContact" property="displacementPrize"/>&nbsp;<bean:write name="buyerStartContact" property="currency"/>)</b>
														</logic:equal>
													</td>
												</tr>
												<tr><td height="5"></td></tr>
												<tr>
													<td>
														<table cellpadding="0" cellspacing="0" border="0" align="left">
															<tr>
																<td width="20"></td>
																<td class="data1Text">
																	<amandris:countryStateTag 	name="countryState" 
																								formName="startContactForm" 
																								styleClass="form" 
																								countryKey="showBuyerStartContact.country" 
																								stateKey="showBuyerStartContact.state"
																								withAny="false"/>
																</td>
															</tr>
															<tr><td height="10"></td><td></td></tr>
															<tr>
																<td width="20"></td>
																<td class="data1Text">
																	<table cellpadding="0" cellspacing="0" border="0" align="left">
																		<tr>
																			<td class="data1Text" >
																				<b><bean:message key="showBuyerStartContact.address1"/></b>
																			</td>
																			<td width="5"></td>
																			<td>
																				<html:text property="address1" styleClass="form"/><br>
																			</td>
																		</tr>
																		<tr><td height="10"></td><td></td></tr>
																		<tr>
																			<td class="data1Text">
																				<b><bean:message key="showBuyerStartContact.address2"/></b>
																			</td>
																			<td width="5"></td>
																			<td>
																				<html:text property="address2" styleClass="form"/><br>
																			</td>
																		</tr>
																		<tr><td height="10"></td><td></td></tr>
																		<tr>
																			<td class="data1Text">
																				<b><bean:message key="showBuyerStartContact.city"/></b>
																			</td>
																			<td width="5"></td>
																			<td>
																				<html:text property="city" styleClass="form"/><br>
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
								</table>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr><td height="1" background="pictures/pixel.gif"></td></tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td>
								<table cellpadding="0" cellspacing="0" border="0" align="left">
									<tr>
										<td class="data2Text">
											<bean:message key="showBuyerStartContact.optionalText"/>
										</td>
									</tr>
									<tr><td height="10"></td></tr>
									<tr>
										<td>
											<html:textarea property="text" styleClass="form" cols="60" rows="10"/><br>

										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr><td height="1" background="pictures/pixel.gif"></td></tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td>
								<table width="100%" cellpadding="0" cellspacing="0" border="0" align="left">
									<tr>
										<td class="data2Text" align="right" bgcolor="#C185AA" height="30">
											<html:submit styleClass="form"><bean:message key="showBuyerStartContact.continue"/></html:submit>&nbsp;&nbsp;&nbsp;&nbsp;
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
