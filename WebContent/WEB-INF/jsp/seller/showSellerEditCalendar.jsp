<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/amandris.tld" prefix="amandris" %>

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
			<td height="450">	
				<table width="98%" cellpadding="0" cellspacing="0" border="0" align="center">
					<tr>
						<td align="center" class="data1Text">
							<bean:message key="showSellerEditCalendar.text"/>
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
					  			<logic:iterate name="editCalendar" property="dateList" id="collection1">
					  				<tr height="20">
					  					<td nowrap class="data1Text" align="right">
											<bean:write name="collection1" property="date"/>
										</td>
										<td width="12"></td>
										<logic:iterate name="collection1" property="hourList" id="collection2">
											<logic:equal name="collection2" property="status" value="1">
												<td width="20" align="center" class="freeHour">
													<a href="setSellerEditCalendar.do?date=<bean:write name="collection1" property="briefDate"/>&hour=<bean:write name="collection2" property="hour"/>&status=2&startDate=<bean:write name="editCalendar" property="startDate"/>" class="freeHourLink">
														<bean:write name="collection2" property="hour"/>
													</a>
												</td>
											</logic:equal>
											<logic:equal name="collection2" property="status" value="2">
												<td width="20" align="center" class="notFreeHour">
													<a href="setSellerEditCalendar.do?date=<bean:write name="collection1" property="briefDate"/>&hour=<bean:write name="collection2" property="hour"/>&status=1&startDate=<bean:write name="editCalendar" property="startDate"/>" class="notFreeHourLink">
														<bean:write name="collection2" property="hour"/>
													</a>
												</td>
											</logic:equal>
											<logic:equal name="collection2" property="status" value="4">
												<td width="20" align="center" class="dateHour">
													<bean:write name="collection2" property="hour"/>
												</td>
											</logic:equal>
										</logic:iterate>
									</tr>
								</logic:iterate>  						  	
							</table>
						</td>
					</tr>
					<tr>
						<td align="right">
							<table>
								<tr>
									<td>
										<a href="showSellerEditCalendar.do?startDate=<bean:write name="editCalendar" property="previousDate"/>" class="data1Link"><bean:message key="showSellerEditCalendar.see12PreviousDays"/></a>
									</td>
									<td width="20"></td>
									<td>
										<a href="showSellerEditCalendar.do?startDate=<bean:write name="editCalendar" property="nextDate"/>" class="data1Link"><bean:message key="showSellerEditCalendar.see12NextDays"/></a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr><td height="10"></td></tr>
					<tr>
						<td>
							<table width="500" cellpadding="0" cellspacing="0" border="0" align="left">
								<tr width="500">
									<td width="500">
										<table width="500" cellpadding="0" cellspacing="0" border="0" align="left">
											<tr width="500">
												<td width="21" height="20" class="freeHour">&nbsp;</td>
												<td width="5"></td>
												<td class="data1Text">
													<bean:message key="showSellerEditCalendar.freeHour"/>
												</td>
												
												<td width="30"></td>
												<td width="21" height="20" bgcolor="#EEAACC">&nbsp;</td>
												<td width="5"></td>
												<td class="data1Text">
													<bean:message key="showSellerEditCalendar.notFreeHour"/>
												</td>
												<td width="30"></td>
												
												<td width="21" height="20" bgcolor="#AA90CC">&nbsp;</td>
												<td width="5"></td>
												<td class="data1Text">
													<bean:message key="showSellerEditCalendar.dateHour"/>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr><td height="10"></td></tr>
					<tr>
						<td>
							<table width="100%" cellpadding="0" cellspacing="0" border="0" align="left">
								<tr>
									<td class="data2Text" align="right" height="30">
										<button class="form" onclick="document.location.href='showSellerStart.do'"><bean:message key="showSellerEditCalendar.end"/></button>&nbsp;&nbsp;&nbsp;&nbsp;
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
</tiles:put>
</tiles:insert>
