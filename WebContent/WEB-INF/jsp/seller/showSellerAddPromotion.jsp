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
		function showSellerAddPromotion()
		{
			var id = 0;
			
			if( document.getElementById( "promotion1").checked)
				id = 1;
			if( document.getElementById( "promotion2").checked)
				id = 2;
			if( document.getElementById( "promotion4").checked)
				id = 4;
			if( document.getElementById( "promotion5").checked)
				id = 5;
			if( document.getElementById( "promotion6").checked)
				id = 6;
			if( document.getElementById( "promotion8").checked)
				id = 8;

			document.location.href="showSellerAddPromotionConfirm.do?id=" + id;
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
			<td height="450" align="center">	
				<table width="90%" cellpadding="0" cellspacing="0" boder="0">
					<logic:equal name="sellerAddPromotion" property="enabled" value="1">
						<tr>
							<td align="center" class="data1Text">
								<bean:message key="showSellerAddPromotion.text"/>
							</td>
						</tr>
					</logic:equal>						
					<tr><td height="20"></td></tr>
					<logic:equal name="sellerAddPromotion" property="enabled" value="0">
						<tr>
							<td height="20" class="data1Text" align="center">
								<bean:message key="showSellerAddPromotion.notEnabled"/>
							</td>
						</tr>
					</logic:equal>
					<logic:equal name="sellerAddPromotion" property="enabled" value="1"> 					
						<tr>
							<td align="center">
								<table width="99%" cellpadding="0" cellspacing="0" boder="0">
									<tr height="40">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="promotion.1"/>','<bean:message key="showSellerAddPromotion.promotion1.help"/>'); Activate();" onMouseout="deActivate();">
										</td>
										<td align="center" class="data1Text">
											<input type="radio" id="promotion1" name="promotionType" 
											<logic:equal name="sellerAddPromotion" property="promotion1Checked" value="1"> 
												checked="checked" 
											</logic:equal> 
											<logic:equal name="sellerAddPromotion" property="promotion1Enabled" value="0">
												disabled="true"
											</logic:equal> value="1">
										</td>
										<td nowrap align="left" class="data2Text">
											<bean:message key="promotion.1"/>
										</td>
										<td nowrap align="left" class="data2Text">
											<b><bean:message key="showSellerAddPromotion.length"/></b>:
											<bean:write name="sellerAddPromotion" property="promotion1Length"/>&nbsp;<bean:message key="showSellerAddPromotion.days"/>
										</td>
									</tr>
									<tr height="40">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="promotion.2"/>','<bean:message key="showSellerAddPromotion.promotion2.help"/>'); Activate();" onMouseout="deActivate();">
										</td>
										<td align="center" class="data1Text">
											<input type="radio" id="promotion2" name="promotionType" 
											<logic:equal name="sellerAddPromotion" property="promotion2Checked" value="1"> 
												checked="checked" 
											</logic:equal> 
											<logic:equal name="sellerAddPromotion" property="promotion2Enabled" value="0">
												disabled="true"
											</logic:equal> value="2">
										</td>
										<td nowrap align="left" class="data2Text">
											<bean:message key="promotion.2"/>
										</td>
										
										<td nowrap align="left" class="data2Text">
											<b><bean:message key="showSellerAddPromotion.length"/></b>:
											<bean:write name="sellerAddPromotion" property="promotion2Length"/>&nbsp;<bean:message key="showSellerAddPromotion.days"/>
										</td>
									</tr>
									<tr height="40">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="promotion.4"/>','<bean:message key="showSellerAddPromotion.promotion4.help"/>'); Activate();" onMouseout="deActivate();">
										</td>
										<td align="center" class="data1Text">
											<input type="radio" id="promotion4" name="promotionType" 
											<logic:equal name="sellerAddPromotion" property="promotion4Checked" value="1"> 
												checked="checked" 
											</logic:equal> 
											<logic:equal name="sellerAddPromotion" property="promotion4Enabled" value="0">
												disabled="true"
											</logic:equal> value="4">
										</td>
										<td nowrap align="left" class="data2Text">
											<bean:message key="promotion.4"/>
										</td>
										
										<td nowrap align="left" class="data2Text">
											<b><bean:message key="showSellerAddPromotion.length"/></b>:
											<bean:write name="sellerAddPromotion" property="promotion4Length"/>&nbsp;<bean:message key="showSellerAddPromotion.days"/>
										</td>
									</tr>
									<tr height="40">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="promotion.5"/>','<bean:message key="showSellerAddPromotion.promotion5.help"/>'); Activate();" onMouseout="deActivate();">
										</td>
										<td align="center" class="data1Text">
											<input type="radio" id="promotion5" name="promotionType" 
											<logic:equal name="sellerAddPromotion" property="promotion5Checked" value="1"> 
												checked="checked" 
											</logic:equal> 
											<logic:equal name="sellerAddPromotion" property="promotion5Enabled" value="0">
												disabled="true"
											</logic:equal> value="5">
										</td>
										<td nowrap align="left" class="data2Text">
											<bean:message key="promotion.5"/>
										</td>
										
										<td nowrap align="left" class="data2Text">
											<b><bean:message key="showSellerAddPromotion.length"/></b>:
											<bean:write name="sellerAddPromotion" property="promotion5Length"/>&nbsp;<bean:message key="showSellerAddPromotion.days"/>
										</td>
									</tr>
									<tr height="40">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="promotion.6"/>','<bean:message key="showSellerAddPromotion.promotion6.help"/>'); Activate();" onMouseout="deActivate();">
										</td>
										<td align="center" class="data1Text">
											<input type="radio" id="promotion6" name="promotionType" 
											<logic:equal name="sellerAddPromotion" property="promotion6Checked" value="1"> 
												checked="checked" 
											</logic:equal> 
											<logic:equal name="sellerAddPromotion" property="promotion6Enabled" value="0">
												disabled="true"
											</logic:equal> value="6">
										</td>
										<td nowrap align="left" class="data2Text">
											<bean:message key="promotion.6"/>
										</td>
										
										<td nowrap align="left" class="data2Text">
											<b><bean:message key="showSellerAddPromotion.length"/></b>:
											<bean:write name="sellerAddPromotion" property="promotion6Length"/>&nbsp;<bean:message key="showSellerAddPromotion.days"/>
										</td>
									</tr>
									
									<tr height="40">
										<td align="left">
											<img src="pictures/helpIcon.gif" onMouseover="EnterHelpContent('<bean:message key="promotion.8"/>','<bean:message key="showSellerAddPromotion.promotion8.help"/>'); Activate();" onMouseout="deActivate();">
										</td>
										<td align="center" class="data1Text">
											<input type="radio" id="promotion8" name="promotionType" 
											<logic:equal name="sellerAddPromotion" property="promotion8Checked" value="1"> 
												checked="checked" 
											</logic:equal> 
											<logic:equal name="sellerAddPromotion" property="promotion8Enabled" value="0">
												disabled="true"
											</logic:equal> value="8">
										</td>
										<td nowrap align="left" class="data2Text">
											<bean:message key="promotion.8"/>
										</td>
										
										<td nowrap align="left" class="data2Text">
											<b><bean:message key="showSellerAddPromotion.length"/></b>:
											<bean:message key="showSellerAddPromotion.forever"/>
										</td>
									</tr>										
								</table>
							</td>
						</tr>
					</logic:equal>
					<tr><td height="20"></td></tr>
					<logic:equal name="sellerAddPromotion" property="enabled" value="1">
						<tr>
							<td align="right" class="data1Text">
								<button class="form" onclick="javascript:showSellerAddPromotion();"><bean:message key="showSellerAddPromotion.continue"/></button>
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
