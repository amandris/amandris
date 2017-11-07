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
					<logic:equal name="sellerSession" property="isEscort" value="1">
						<tr><td height="500">&nbsp;</td></tr>
					</logic:equal>
					<logic:equal name="sellerSession" property="isEscort" value="0">
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showSellerPromotion.text1"/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td class="data1Text" align="center">
								<bean:message key="showSellerPromotion.text2"/>
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
					  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="serviceInactive" border="0"/>
					  						</a>
				  						</td>
				  						<td width="10"></td>
				  						<td class="data2Text">
					  						<a href="showSellerParameter.do">
					  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="parameterInactive" border="0"/>
					  						</a>
				  						</td>
				  						<td width="10"></td>
				  						<td class="data2Text">
					  						<a href="showSellerPromotion.do">
					  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="promotionActive" border="0"/>
					  						</a>
				  						</td>
							  		</tr>
							  	</table>
	  						</td>
				  		</tr>			  
						<tr><td height="10"></td></tr>
						<tr>
							<td width="100%">
								<table width="100%" cellpadding="0" cellspacing="0" border="0" align="left">
	
									<tr><td height="10"></td></tr>
									<tr><td height="1" background="pictures/pixel.gif"></td></tr>
									<tr><td height="10"></td></tr>
									<tr height="30">
										<td class="data1Text" align="left">
											<bean:message key="showSellerPromotion.text3"/>
										</td>
									</tr>
									<tr height="30">
										<td class="data1Text">
											<button class="form" onclick="document.location.href='showSellerAddPromotion.do'"><bean:message key="showSellerPromotion.addNewPromotion"/></button>
										</td>
									</tr>
									<tr><td height="10"></td></tr>
									<tr><td height="1" background="pictures/pixel.gif"></td></tr>
									<tr><td height="10"></td></tr>
									
									<logic:empty name="sellerPromotionData" property="promotions">
										<tr height="30">
											<td class="data1Text" align="center">
												<bean:message key="showSellerPromotion.text4"/>
											</td>
										</tr>
									</logic:empty>
									
									<logic:notEmpty name="sellerPromotionData" property="promotions">
										<tr>
							  				<td>
	 						  					<table width="100%" cellpadding="3" cellspacing="0">
	 						  						<tr bgcolor="#E5B8D3">
	  						  							<td nowrap width="10">
	 						  							</td>
	 						  							<td nowrap class="data2Text">
	 						  								<b><bean:message key="showSellerPromotion.type"/></b>
	 						  							</td>
	 						  							<td nowrap class="data2Text">
	 						  								<b><bean:message key="showSellerPromotion.startDate"/></b>
	 						  							</td>
	 						  							<td nowrap class="data2Text">
	 						  								<b><bean:message key="showSellerPromotion.endDate"/></b>
	 						  							</td>
	 						  							<td nowrap class="data2Text" align="center">
	 						  							</td>
	 						  						<tr>
	  						  					<logic:iterate name="sellerPromotionData" property="promotions" id="collection">
	  						  						<tr>
		  						  						<td background="pictures/pixel.gif"></td>
	  						  							<td background="pictures/pixel.gif"></td>
	  						  							<td background="pictures/pixel.gif"></td>
	  						  							<td background="pictures/pixel.gif"></td>
	  						  							<td background="pictures/pixel.gif"></td>
	  						  						</tr>
				  									<logic:equal name="collection" property="oddOrEven" value="odd">
							  							<tr bgcolor="#FFFBE9" height="30">
							  						</logic:equal>
									  				<logic:notEqual name="collection" property="oddOrEven" value="odd">
							  							<tr height="30">
							  						</logic:notEqual>
						  								<td nowrap width="10">
	  						  							</td>
										  				<td nowrap align="left" class="data1Text">
										  					<b>
						  									<logic:equal name="collection" property="promotionConst" value="1">
						  										<bean:message key="promotion.1"/>
						  									</logic:equal>
						  									<logic:equal name="collection" property="promotionConst" value="2">
						  										<bean:message key="promotion.2"/>
						  									</logic:equal>
						  									<logic:equal name="collection" property="promotionConst" value="3">
						  										<bean:message key="promotion.3"/>
						  									</logic:equal>
						  									<logic:equal name="collection" property="promotionConst" value="4">
						  										<bean:message key="promotion.4"/>
						  									</logic:equal>
						  									<logic:equal name="collection" property="promotionConst" value="5">
						  										<bean:message key="promotion.5"/>
						  									</logic:equal>
						  									<logic:equal name="collection" property="promotionConst" value="6">
						  										<bean:message key="promotion.6"/>
						  									</logic:equal>
						  									<logic:equal name="collection" property="promotionConst" value="7">
						  										<bean:message key="promotion.7"/>
						  									</logic:equal>
						  									<logic:equal name="collection" property="promotionConst" value="8">
						  										<bean:message key="promotion.8"/>
						  									</logic:equal>
						  									</b>
	  						  							</td>
	  						  							<td nowrap class="data1Text">
	  						  								<bean:write name="collection" property="startDate"/>
	  						  							</td>
	  						  							<td nowrap class="data1Text" >
	  						  								<bean:write name="collection" property="endDate"/>
	  						  							</td>
	  						  							<td nowrap class="data1Text">
	  						  								<logic:equal name="collection" property="promotionConst" value="8">
	  						  									<button class="form" onclick="document.location.href='showSellerAlbum.do'"><bean:message key="showSellerPromotion.editAlbum"/></button>
	  						  								</logic:equal>
	  						  							</td>
								  				</logic:iterate>
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
								  	</logic:notEmpty>
								</table>
							</td>
						</tr>
					</logic:equal>
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
