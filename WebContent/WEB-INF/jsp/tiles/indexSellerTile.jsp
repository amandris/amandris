<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-tiles.tld' prefix='tiles' %>

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
			<table cellpadding="0" cellspacing="0" border="0" >
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" >
							<tr>
								<td width="126" valign="top">
									<table  cellpadding="3" cellspacing="0" border="0" >
										<tr>
											<td width="126" height="35" background="pictures/sellerStep1Header.gif">
											</td>
										</tr>
										<tr>
											<td class="stepsText" align="center">
												<bean:message key="indexSeller.step1"/>
											</td>
										</tr>
										<tr><td height="10"></td></tr>
										<tr>
											<td width="126" height="35" background="pictures/sellerStep2Header.gif">
											</td>
										</tr>
										<tr>
											<td class="stepsText" align="center">
												<bean:message key="indexSeller.step2"/>
											</td>
										</tr>
										<tr><td height="10"></td></tr>
										<tr>
											<td width="126" height="35" background="pictures/sellerStep3Header.gif">
											</td>
										</tr>
										<tr>
											<td class="stepsText" align="center">
												<bean:message key="indexSeller.step3"/>
											</td>
										</tr>
										<tr><td height="15"></td></tr>
									</table>																	
								</td>
								<td width="20"></td>
								<td width="188" valign="top">
									<table  cellpadding="0" cellspacing="0" border="0" >
										<tr>
											<td align="center" class="sellerTitle1Text">
												<bean:message key="indexSeller.text1"/>
											</td>
										</tr>
										<tr><td height="8"></td></tr>
										<tr>
											<td align="center" class="text1">
												<bean:message key="indexSeller.smallText1"/>
											</td>
										</tr>		
										<tr><td height="8"></td></tr>
										<tr>
											<td align="center" class="sellerTitle1Text">
												<bean:message key="indexSeller.text2"/>
											</td>
										</tr>													
										<tr><td height="8"></td></tr>		
										<tr>
											<td align="center" class="text1">
												<bean:message key="indexSeller.smallText2"/>
											</td>
										</tr>	
										<tr><td height="8"></td></tr>																							
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr><td height="70"></td></tr>	
				<tr>
					<td align="center"> 
						<table cellpadding="0" cellspacing="0" border="0" >
							<tr>
								<td>
									<a href="showNewSellerOne.do">
										<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="registerAsSeller" border="0"/>
									</a>
								</td>
								<td width="10"></td>
								<td>
									<a href="javascript:popup('sellerDemo','flash/sellerDemo.html','640','480')">
										<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="sellerDemo" border="0"/>
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