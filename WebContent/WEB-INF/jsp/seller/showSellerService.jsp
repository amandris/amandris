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
			<td height="450" class="errorText" align="center">	
				<table width="90%" cellpadding="0" cellspacing="0" boder="0">
					<tr><td height="5"></td></tr>
					<tr>
						<td class="data1Text" align="center">
							<bean:message key="showSellerService.text1"/>
						</td>
					</tr>
					<tr><td height="10"></td></tr>
					<tr>
						<td class="data1Text" align="center">
							<bean:message key="showSellerService.text2"/>
						</td>
					</tr>
					<tr><td height="10"></td></tr>
					<tr>
  						<td align="left">
  						  	<table cellpadding="0" cellspacing="0" border="0" align="left">
						  		<tr align="center">
							  		<td class="data2Text">
			  							<a href="showSellerCalendar.do">
					  						<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="calendarInactive" border="0"/>
					  					</a>
			  						</td>
			  						<td width="10"></td>
			  						<td class="data2Text">
				  						<a href="showSellerService.do">
				  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="serviceActive" border="0"/>
				  						</a>
			  						</td>
			  						<td width="10"></td>
			  						<td class="data2Text">
				  						<a href="showSellerParameter.do">
				  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="parameterInactive" border="0"/>
				  						</a>
			  						</td>
			  						<logic:equal name="sellerSession" property="isEscort" value="0">
				  						<td width="10"></td>
				  						<td class="data2Text">
					  						<a href="showSellerPromotion.do">
					  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="promotionInactive" border="0"/>
					  						</a>
				  						</td>
				  					</logic:equal>
						  		</tr>
						  	</table>
  						</td>
			  		</tr>			  
					<tr>
						<td width="100%">
							<table width="100%" cellpadding="0" cellspacing="0" border="0" align="left">

								<tr><td height="10"></td></tr>
								<tr><td height="1" background="pictures/pixel.gif"></td></tr>
								<tr><td height="10"></td></tr>
								<tr height="30">
									<td class="data1Text" align="left">
										<bean:message key="showSellerService.text3"/>
									</td>
								</tr>
								<tr height="30">
									<td class="data1Text">
										<button class="form" onclick="document.location.href='showSellerAddService.do'"><bean:message key="showSellerService.addNewService"/></button>
									</td>
								</tr>
								<tr><td height="10"></td></tr>
								<tr><td height="1" background="pictures/pixel.gif"></td></tr>
								<tr><td height="10"></td></tr>
								
								<logic:equal name="sellerService" property="noService" value="1">
									<tr height="30">
										<td class="data1Text" align="center">
											<bean:message key="showSellerService.text4"/>
										</td>
									</tr>
								</logic:equal>
								
								<logic:equal name="sellerService" property="noService" value="0">
									<tr>
						  				<td>
 						  					<table width="100%" cellpadding="3" cellspacing="0">
 						  						<tr bgcolor="#E5B8D3">
  						  							<td nowrap width="10">
 						  							</td>
 						  							<td nowrap class="data2Text">
 						  								<b><bean:message key="showSellerService.type"/></b>
 						  							</td>
 						  							<td nowrap class="data2Text">
 						  								<b><bean:message key="showSellerService.sex"/></b>
 						  							</td>
 						  							<td nowrap class="data2Text">
 						  								<b><bean:message key="showSellerService.price"/></b>
 						  							</td>
 						  							<td nowrap class="data2Text" align="center">
 						  							</td>
 						  						<tr>
  						  					<logic:notEqual name="sellerService" property="companyWithoutSexSex" value="">
  						  						<tr>
	  						  						<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  						</tr>
					  							<tr bgcolor="#FFFBE9" height="30">
					  								<td nowrap width="10">
  						  							</td>
									  				<td nowrap align="left" class="data1Text">
									  					<b>
					  										<bean:message key="service.1"/>
					  									</b>
  						  							</td>
  						  							<td class="data1Text">
  						  								<bean:write name="sellerService" property="companyWithoutSexSex"/>
  						  							</td>
  						  							<td nowrap class="data1Text" >
  						  								<logic:equal name="sellerService" property="companyWithoutSexIsFree" value="0">
	  						  								<bean:write name="sellerService" property="companyWithoutSexPrice"/></b>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSellerService.firstHour"/><br>
															<bean:write name="sellerService" property="companyWithoutSexAdditionalHoursPrice"/></b>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSellerService.additionalHours"/>
	  						  							</logic:equal>
	  						  							<logic:equal name="sellerService" property="companyWithoutSexIsFree" value="1">
	  						  								<bean:message key="showSellerService.free"/>
	  						  							</logic:equal>
  						  							</td>
  						  							<td nowrap class="data1Text">
					  									<button class="form" onclick="document.location.href='showSellerEditService.do?id=1'"><bean:message key="showSellerService.editService"/></button>
  						  							</td>
  						  						</tr>
							  				</logic:notEqual>
							  				<logic:notEqual name="sellerService" property="companyWithSexSex" value="">
  						  						<tr>
	  						  						<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  						</tr>
					  							<tr bgcolor="#FFFBE9" height="30">
					  								<td nowrap width="10">
  						  							</td>
									  				<td nowrap align="left" class="data1Text">
									  					<b>
					  										<bean:message key="service.2"/>
					  									</b>
  						  							</td>
  						  							<td class="data1Text">
  						  								<bean:write name="sellerService" property="companyWithSexSex"/>
  						  							</td>
  						  							<td nowrap class="data1Text" >
  						  								<logic:equal name="sellerService" property="companyWithSexIsFree" value="0">
	  						  								<bean:write name="sellerService" property="companyWithSexPrice"/></b>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSellerService.firstHour"/><br>
															<bean:write name="sellerService" property="companyWithSexAdditionalHoursPrice"/></b>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSellerService.additionalHours"/>
	  						  							</logic:equal>
	  						  							<logic:equal name="sellerService" property="companyWithSexIsFree" value="1">
	  						  								<bean:message key="showSellerService.free"/>
	  						  							</logic:equal>
  						  							</td>
  						  							<td nowrap class="data1Text">
					  									<button class="form" onclick="document.location.href='showSellerEditService.do?id=2'"><bean:message key="showSellerService.editService"/></button>
  						  							</td>
  						  						</tr>
							  				</logic:notEqual>
							  				<logic:notEqual name="sellerService" property="sexSex" value="">
  						  						<tr>
	  						  						<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  						</tr>
					  							<tr bgcolor="#FFFBE9" height="30">
					  								<td width="10">
  						  							</td>
									  				<td nowrap align="left" class="data1Text">
									  					<b>
					  										<bean:message key="service.4"/>
					  									</b>
  						  							</td>
  						  							<td class="data1Text">
  						  								<bean:write name="sellerService" property="sexSex"/>
  						  							</td>
  						  							<td nowrap class="data1Text" >
  						  								<logic:equal name="sellerService" property="sexIsFree" value="0">
	  						  								<bean:write name="sellerService" property="sexPrice"/></b>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSellerService.firstHour"/><br>
															<bean:write name="sellerService" property="sexAdditionalHoursPrice"/></b>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSellerService.additionalHours"/>
	  						  							</logic:equal>
	  						  							<logic:equal name="sellerService" property="sexIsFree" value="1">
	  						  								<bean:message key="showSellerService.free"/>
	  						  							</logic:equal>
  						  							</td>
  						  							<td nowrap class="data1Text">
					  									<button class="form" onclick="document.location.href='showSellerEditService.do?id=4'"><bean:message key="showSellerService.editService"/></button>
  						  							</td>
  						  						</tr>
							  				</logic:notEqual>
							  				<logic:notEqual name="sellerService" property="eroticShowSex" value="">
  						  						<tr>
	  						  						<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  						</tr>
					  							<tr bgcolor="#FFFBE9" height="30">
					  								<td nowrap width="10">
  						  							</td>
									  				<td nowrap align="left" class="data1Text">
									  					<b>
					  										<bean:message key="service.8"/>
					  									</b>
  						  							</td>
  						  							<td class="data1Text">
  						  								<bean:write name="sellerService" property="eroticShowSex"/>
  						  							</td>
  						  							<td nowrap class="data1Text" >
  						  								<logic:equal name="sellerService" property="eroticShowIsFree" value="0">
	  						  								<bean:write name="sellerService" property="eroticShowPrice"/></b>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSellerService.firstHour"/><br>
															<bean:write name="sellerService" property="eroticShowAdditionalHoursPrice"/></b>&nbsp;<bean:write name="sellerService" property="currency"/>&nbsp;<bean:message key="showSellerService.additionalHours"/>
	  						  							</logic:equal>
	  						  							<logic:equal name="sellerService" property="eroticShowIsFree" value="1">
	  						  								<bean:message key="showSellerService.free"/>
	  						  							</logic:equal>
  						  							</td>
  						  							<td nowrap class="data1Text">
					  									<button class="form" onclick="document.location.href='showSellerEditService.do?id=8'"><bean:message key="showSellerService.editService"/></button>
  						  							</td>
  						  						</tr>
							  				</logic:notEqual>
												<tr>
													<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  							<td background="pictures/pixel.gif"></td>
  						  						</tr>											  				
								  			</table>
								  		</td>
								  	</tr>
								  </logic:equal>
							</table>
						</td>
					</tr>
					<tr><td height="20"></td></tr>
					<tr>
						<td align="center">
							<button class="form" onclick="document.location.href='showSellerChangeCurrency.do'"><bean:message key="showSellerService.changeCurrency"/></button>
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
	
	
	<% if(  request.getParameter( "activation") != null && request.getParameter( "activation").equals( "1")){%>
	
		<div id="activationBackgroundDiv" style="position:absolute;top:90;visibility:visible;filter:alpha(opacity=25);opacity: 0.25;-moz-opacity:0.25;">
			<table width="720" height="517" style="background:black;">
				<tr width="100%">
					<td width="100%" align="center" valign="middle">
						
					</td>
				</tr>
			</table>
		</div>
		
		<div id="activationDiv" style="position:absolute;top:230;visibility:visible;">
			<table width="720">
				<tr width="100%">
					<td width="100%" align="center" valign="middle">
						<table width="270" height="200" cellpadding="5" class="activationDivTable">
							<tr width="100%">
								<td width="100%" align="center" class="data3Text">
									<bean:message key="showSellerService.divText1"/>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr width="100%">
								<td width="100%" align="center" class="data2Text">
									<bean:message key="showSellerService.divText2"/>
								</td>
							</tr>
							<tr><td height="5"></td></tr>
							<tr width="100%">
								<td width="100%" align="center" class="data2Text">
									<bean:message key="showSellerService.divText3"/>
								</td>
							</tr>
							<tr><td height="10"></td></tr>
							<tr width="100%">
								<td width="100%" align="center" class="data1Text">
									<input class="form" type="button" value="<bean:message key="showSellerService.divText4"/>" onclick="document.getElementById('activationDiv').style.visibility='hidden';document.getElementById('activationBackgroundDiv').style.visibility='hidden';"/>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	
	<%}%>

	</tiles:put>
</tiles:insert>
