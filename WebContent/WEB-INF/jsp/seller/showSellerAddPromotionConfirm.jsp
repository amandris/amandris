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
	
	<script language="javascript" type="text/javascript">
		
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
				<tr><td height="10"></td></tr>
					<tr>
						<td align="center" class="data1Text">
							<table cellpadding="0" cellspacing="0" border="0" align="center">
								<tr>
									<td class="data1Text" align="center" >
										<bean:message key="showSellerAddPromotionConfirm.text1"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr><td height="10"></td></tr>
					<tr>
						<td align="center" class="data1Text">
							<table cellpadding="0" cellspacing="0" border="0" align="center">
								<tr><td height="10"></td><td></td><td></td></tr>
								<tr height="30">
									<td nowrap align="right" class="data2Text" valign="top">
										<b><bean:message key="showSellerAddPromotionConfirm.promotion"/>:</b>
									</td>
									<td width="15"></td>
									<td align="left" class="data3Text" valign="top">
										<b>
										<logic:equal name="sellerAddPromotionConfirm" property="promotionType" value="1">
	  										<bean:message key="promotion.1"/>
	  									</logic:equal>
	  									<logic:equal name="sellerAddPromotionConfirm" property="promotionType" value="2">
	  										<bean:message key="promotion.2"/>
	  									</logic:equal>
	  									<logic:equal name="sellerAddPromotionConfirm" property="promotionType" value="3">
	  										<bean:message key="promotion.3"/>
	  									</logic:equal>
	  									<logic:equal name="sellerAddPromotionConfirm" property="promotionType" value="4">
	  										<bean:message key="promotion.4"/>
	  									</logic:equal>
	  									<logic:equal name="sellerAddPromotionConfirm" property="promotionType" value="5">
	  										<bean:message key="promotion.5"/>
	  									</logic:equal>
	  									<logic:equal name="sellerAddPromotionConfirm" property="promotionType" value="6">
	  										<bean:message key="promotion.6"/>
	  									</logic:equal>
	  									<logic:equal name="sellerAddPromotionConfirm" property="promotionType" value="7">
	  										<bean:message key="promotion.7"/>
	  									</logic:equal>
	  									<logic:equal name="sellerAddPromotionConfirm" property="promotionType" value="8">
	  										<bean:message key="promotion.8"/>
	  									</logic:equal>
	  									</b>
									</td>
								</tr>
								<logic:notEqual name="sellerAddPromotionConfirm" property="promotionType" value="8">
									<tr height="30">
										<td nowrap align="right" class="data2Text" valign="top">
											<b><bean:message key="showSellerAddPromotionConfirm.length"/>:</b>
										</td>
										<td width="15"></td>
										<td align="left" class="data3Text" valign="top">
											<b><bean:write name="sellerAddPromotionConfirm" property="promotionLength"/></b>&nbsp;días
										</td>
									</tr>
								</logic:notEqual>
								<tr height="30">
									<td nowrap align="right" class="data2Text" valign="top">
										<b><bean:message key="showSellerAddPromotionConfirm.endDate"/>:</b>
									</td>
									<td width="15"></td>
									<td align="left" class="data3Text" valign="top">
										<b><bean:write name="sellerAddPromotionConfirm" property="endDate"/></b>&nbsp;
									</td>
								</tr>
								
							</table>
						</td>
					</tr>
					<tr><td height="40"></td></tr>
					<logic:equal name="sellerAddPromotionConfirm" property="enoughCredits" value="0">
						<tr>
							<td align="center" class="data1Text">
								<table cellpadding="0" cellspacing="0" border="0" align="center">
									<tr>
										<td class="data2Text" align="center" style="color:#FF0000;">
											<bean:message key="showSellerAddPromotionConfirm.notEnoughCredits"/>
										</td>
									</tr>
									<tr><td height="10"></td></tr>
									<tr>
										<td class="data2Text" align="center">
											<button class="form" onclick="document.location.href='showSellerPromotion.do'"><bean:message key="showSellerAddPromotionConfirm.backToPromotion"/></button>&nbsp;&nbsp;&nbsp;&nbsp;
											<button class="form" onclick="document.location.href='showSellerBuyCredits.do'"><bean:message key="showSellerAddPromotionConfirm.gotoBuyCredits"/></button>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</logic:equal>
					<logic:equal name="sellerAddPromotionConfirm" property="enoughCredits" value="1">
						<logic:equal name="sellerAddPromotionConfirm" property="promotionAlreadyActive" value="1">
							<tr>
								<td align="center" class="data1Text">
									<table cellpadding="0" cellspacing="0" border="0" align="center">
										<tr>
											<td class="data2Text" align="center" style="color:#FF0000;">
												<bean:message key="showSellerAddPromotionConfirm.promotionAlreadyExists"/>
											</td>
										</tr>
										<tr><td height="10"></td></tr>
										<tr>
											<td class="data2Text" align="center">
												<button class="form" onclick="document.location.href='showSellerPromotion.do'"><bean:message key="showSellerAddPromotionConfirm.backToPromotion"/></button>&nbsp;&nbsp;&nbsp;&nbsp;
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</logic:equal>
					</logic:equal>
					<logic:equal name="sellerAddPromotionConfirm" property="enoughCredits" value="1">
						<logic:equal name="sellerAddPromotionConfirm" property="promotionAlreadyActive" value="0">
							<tr>
								<td align="center" class="data1Text">
									<table cellpadding="0" cellspacing="0" border="0" align="center">
										<tr>
											<td class="data2Text" align="center">
												<bean:message key="showSellerAddPromotionConfirm.startPromotionText"/>
											</td>
										</tr>
										<tr><td height="10"></td></tr>
										<tr>
											<td class="data2Text" align="center">
												<button class="form" onclick="javascript:history.back();">&lt;&lt;&nbsp;<bean:message key="showSellerAddPromotionConfirm.back"/></button>&nbsp;&nbsp;&nbsp;&nbsp;
												<button class="form" onclick="document.location.href='setSellerPromotion.do'"><bean:message key="showSellerAddPromotionConfirm.startPromotion"/></button>&nbsp;&nbsp;&nbsp;&nbsp;
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</logic:equal>
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
