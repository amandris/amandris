<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-tiles.tld' prefix='tiles' %>
<%@ taglib uri='/WEB-INF/amandris.tld' prefix='amandris' %>

<table width="348" cellpadding="0" cellspacing="0" border="0" >
	<tr>
		<td width="8" height="8" background="pictures/borderTopLeft.gif">
		</td>
		<td height="8" background="pictures/borderTop.gif" >	
		</td>
		<td width="8" height="8" background="pictures/borderTopRight.gif">
		</td>
	</tr>
	
	<tr>
		<td width="8" background="pictures/borderLeft.gif">
		</td>
		<td height="450">	
			<table  cellpadding="0" cellspacing="0" border="0" >
				<tr>
					<td>
						<table  cellpadding="0" cellspacing="0" border="0" >
							<tr>
								<td width="126" valign="top">
									<table  cellpadding="3" cellspacing="0" border="0" >
										<tr>
											<td width="126" height="35" background="pictures/buyerStep1Header.gif">
											</td>
										</tr>
										<tr>
											<td class="stepsText" align="center">
												<bean:message key="indexBuyer.step1"/>
											</td>
										</tr>
										<tr><td height="10"></td></tr>
										<tr>
											<td width="126" height="35" background="pictures/buyerStep2Header.gif">
											</td>
										</tr>
										<tr>
											<td class="stepsText" align="center">
												<bean:message key="indexBuyer.step2"/>
											</td>
										</tr>
										<tr><td height="10"></td></tr>
										<tr>
											<td width="126" height="35" background="pictures/buyerStep3Header.gif">
											</td>
										</tr>
										<tr>
											<td class="stepsText" align="center">
												<bean:message key="indexBuyer.step3"/>
											</td>
										</tr>
									</table>																	
								</td>

								<td width="208" valign="top">
									<table  cellpadding="0" cellspacing="0" border="0" >
										<tr>
											<td align="center" class="buyerTitle1Text">
												<bean:message key="indexBuyer.text1"/>
											</td>
										</tr>
										<tr><td height="8"></td></tr>
										<tr>
											<td align="center" class="text1">
												<bean:message key="indexBuyer.smallText"/>
											</td>
										</tr>		
										<tr><td height="8"></td></tr>
										<tr>
											<td align="center" class="buyerTitle1Text">
												<bean:message key="indexBuyer.text2"/>
											</td>
										</tr>													
										<tr><td height="8"></td></tr>		
										
										<tr>
											<td>
												<form action="showBuyerSellerCollection.do">
													<table cellpadding="0" cellspacing="0" border="0">													
														<tr>
															<td>
																<table cellpadding="0" cellspacing="0" border="0">													
																	<tr>
																		<td align="right" class="text1" width="65">
																			<bean:message key="indexBuyer.iAm"/>&nbsp;
																		</td>
																		<td>
																			<select name="mySex" class="form">
																				<option VALUE="2" selected><bean:message key="sex.2"/></option>
			              														<option VALUE="1"><bean:message key="sex.1"/></option>
			              														<option VALUE="4"><bean:message key="sex.4"/></option>
			              														<option VALUE="8"><bean:message key="sex.8"/></option>
			              														<option VALUE="16"><bean:message key="sex.16"/></option>
			              														<option VALUE="32"><bean:message key="sex.32"/></option>
			              														<option VALUE="64"><bean:message key="sex.64"/></option>
			              													</select>
																		</td>
																	</tr>
																</table>
															</td>
														<tr><td height="8"></td></tr>				
														<tr>
															<td>
																<table cellpadding="0" cellspacing="0" border="0">													
																	<tr>
																		<td align="right" class="text1" width="65">
																			<bean:message key="indexBuyer.searching"/>&nbsp;
																		</td>
																		<td>
																			<select name="sex" class="form">
																				<option VALUE="2"><bean:message key="sex.2"/></option>
			              														<option VALUE="1" selected><bean:message key="sex.1"/></option>
			              														<option VALUE="4"><bean:message key="sex.4"/></option>
			              														<option VALUE="8"><bean:message key="sex.8"/></option>
			              														<option VALUE="16"><bean:message key="sex.16"/></option>
			              														<option VALUE="32"><bean:message key="sex.32"/></option>
			              														<option VALUE="64"><bean:message key="sex.64"/></option>
			              													</select>
																		</td>
																	</tr>
																</table>
															</td>
														</tr>
														<tr><td height="8"></td></tr>			
														
														<amandris:indexCountryStateTag 	name="countryState" 
																						styleClass="form" 
																						countryKey="indexBuyer.country" 
																						stateKey="indexBuyer.state"/>
															
														
														<tr><td height="8"></td></tr>				
														<tr>
															<td>
																<table cellpadding="0" cellspacing="0" border="0">													
																	<tr>
																		<td align="right" class="text1" width="65">
																			<bean:message key="indexBuyer.between"/>&nbsp;
																		</td>
																		<td nowrap class="text1">
																			<input type="text" name="ageLow" class="form" size="1" value="18">
																			<bean:message key="indexBuyer.and"/>
																			<input type="text" name="ageHigh" class="form" size="1" value="99">&nbsp;<bean:message key="indexBuyer.years"/>
																		</td>
																	</tr>
																</table>
															</td>
														</tr>																
														<tr><td height="8"></td></tr>																																
														<tr>
															<td align="center" >
																<html:image bundle="IMAGE_RESOURCE_KEY" srcKey="search" />
															</td>
														</tr>
													</table>
												</form>
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
						<table cellpadding="0" cellspacing="0" border="0" >
							<tr>
								<td>
									<a href="showNewBuyerOne.do">
										<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="registerAsBuyer" border="0"/>
									</a>
								</td>
								<td width="10"></td>
								<td>
									<a href="javascript:popup('buyerDemo','flash/buyerDemo.html','640','480')">
										<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="buyerDemo" border="0"/>
									</a>
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