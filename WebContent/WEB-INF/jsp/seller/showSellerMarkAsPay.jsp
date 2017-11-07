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
			<td height="450" align="center">	
				<table width="90%" cellspadding="0" cellspacing="0" border="0">
					<html:form action="setSellerMarkAsPay.do">
						<tr><td height="20"></td></tr>
						<logic:equal name="pay" property="buyerMadePayment" value="0">
							<tr>
								<td class="data1Text" align="center" >
									<bean:message key="showSellerMarkAsPay.text1"/>
								</td>
							</tr>
						</logic:equal>
						<logic:equal name="pay" property="buyerMadePayment" value="1">
							<tr>
								<td class="data1Text" align="center" >
									<bean:message key="showSellerMarkAsPay.text3"/>
								</td>
							</tr>
						</logic:equal>
						<tr><td height="5"></td></tr>
						<tr>
							<td class="data1Text" align="center" >
								<b><bean:message key="showSellerMarkAsPay.text2"/></b>
							</td>
						</tr>	
						<tr>
							<td height="20" class="errorText" align="center">
								<html:errors/>
							</td>
						</tr>		
						<tr>
							<td class="data3Text" align="left" >
								<bean:message key="showSellerMarkAsPay.price"/>:&nbsp;<bean:write name="pay" property="price"/>&nbsp;<bean:write name="pay" property="currency"/>
							</td>
						</tr>	
						
						<tr><td height="10"></td></tr>		
						<tr>
							<td class="data2Text" align="left" >
								<table cellpadding="0" cellspacing="0" border="0">
									<tr height="35">
										<td width="5"></td>
										<td class="data2Text">
											<b><bean:message key="showSellerMarkAsPay.allowBankPayment"/>:</b>
										</td>
										<td width="5"></td>
										<td>
											<logic:equal name="pay" property="allowBankPayment" value="1">
												<img src="pictures/yesIcon.gif"/>&nbsp;&nbsp;&nbsp;
											</logic:equal>
											<logic:equal name="pay" property="allowBankPayment" value="0">
												<img src="pictures/noIcon.gif"/>
											</logic:equal>
										</td>
										<td width="50"></td>
										<td class="data2Text">
											<logic:equal name="pay" property="allowBankPayment" value="1">
												<b><bean:message key="showSellerMarkAsPay.bankAccount"/>:</b>
											</logic:equal>
										</td>
										<td width="5"></td>
										<td class="data2Text">
											<logic:equal name="pay" property="allowBankPayment" value="1">
												<bean:write name="pay" property="bankAccount"/>
											</logic:equal>
										</td>
									</tr>
									<tr height="35">
										<td width="5"></td>
										<td class="data2Text">
											<b><bean:message key="showSellerMarkAsPay.allowPaypalPayment"/>:</b>
										</td>
										<td width="5"></td>
										<td>
											<logic:equal name="pay" property="allowPaypalPayment" value="1">
												<img src="pictures/yesIcon.gif"/>&nbsp;&nbsp;&nbsp;
											</logic:equal>
											<logic:equal name="pay" property="allowPaypalPayment" value="0">
												<img src="pictures/noIcon.gif"/>
											</logic:equal>
										</td>
										<td width="50"></td>
										<td class="data2Text">
											<logic:equal name="pay" property="allowPaypalPayment" value="1">
												<b><bean:message key="showSellerMarkAsPay.paypalAccount"/>:</b>
											</logic:equal>
										</td>
										<td width="5"></td>
										<td class="data2Text">
											<logic:equal name="pay" property="allowPaypalPayment" value="1">
												<bean:write name="pay" property="paypalAccount"/>
											</logic:equal>
										</td>
									</tr>								
								</table>
							</td>
						</tr>
						<tr><td height="10"></td></tr>		
						<tr>
							<td class="data1Text">
								<bean:message key="showSellerMarkAsPay.optionalText"/>
							</td>
						</tr>
						<tr><td height="5"></td></tr>		
						<tr>
							<td>
								<html:textarea property="text" styleClass="form" cols="60" rows="7"></html:textarea>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td>
								<html:submit styleClass="form"><bean:message key="showSellerMarkAsPay.done"/></html:submit>
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
