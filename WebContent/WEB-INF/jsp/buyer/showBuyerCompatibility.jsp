<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<tiles:insert template='../tiles/amandrisBuyerTile.jsp'>
	<tiles:put name='logoTile' content='logoTile.jsp'/>
	<tiles:put name='buyerMenuTile' content='buyerMenuTile.jsp'/>
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
				<table width="704" cellpadding="0" cellspacing="5" border="0">
					<tr>
						<td align="center">
							<table cellpadding="0" cellspacing="5" border="0" valign="top" align="center">
								<tr>
									<td class="data3Text">
										<bean:message key="showBuyerCompatibility.percentage"/>: <bean:write name="compatibility" property="percentage"/>&nbsp;%
									</td>
									<td width="30"></td>
									<td class="data3Text">
										<bean:message key="showBuyerCompatibility.accuracy"/>: <bean:write name="compatibility" property="accuracy"/>&nbsp;%
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr><td height="10"></td></tr>
					<tr>
			  			<td valign="top">
			  			  	<table width="100%" cellpadding="0" cellspacing="5" border="0" valign="top" align="center">
						  		<tr>
						  			<td class="data1Text">
						  			  	<table  width="80%" cellpadding="0" cellspacing="0" border="0" valign="top" align="center">
									  		<tr>
									  			<td class="data2Text" align="center">
									  				<b><bean:message key="showBuyerCompatibility.property"/></b>
									  			</td>
									  			<td nowrap class="data2Text" align="center">
									  				<b><bean:message key="showBuyerCompatibility.sellerPreference"/></b>
									  			</td>
									  			<td nowrap class="data2Text" align="center">
									  				<b><bean:message key="showBuyerCompatibility.buyerValue"/></b>
									  			</td>
									  			<td nowrap class="data2Text" align="center">
									  				<b><bean:message key="showBuyerCompatibility.matchs"/></b>
									  			</td>
									  		</tr>
									  		<tr>
									  			<td background="pictures/pixel.gif"></td>
									  			<td background="pictures/pixel.gif"></td>
									  			<td background="pictures/pixel.gif"></td>
									  			<td background="pictures/pixel.gif"></td>
									  		<tr>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:message key="showBuyerCompatibility.age"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:message key="showBuyerCompatibility.between"/>&nbsp;<bean:write name="seller" property="preferredAgeLow"/>&nbsp;<bean:message key="showBuyerCompatibility.and"/>&nbsp;<bean:write name="seller" property="preferredAgeHigh"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:write name="buyerSession" property="age"/>
									  			</td>
									  			<td class="data1Text" align="center">
									  				<logic:equal name="compatibility" property="age" value="1">
									  					<img src="pictures/yesIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="age" value="0">
									  					<img src="pictures/noIcon.gif"/>
									  				</logic:equal>
									  			</td>
									  		</tr>
											<tr>
									  			<td nowrap class="data1Text" align="center">
									  				Sexo
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="seller" property="preferredSexConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="seller" property="preferredSexConst" value="0">
										  				<bean:write name="seller" property="preferredSex"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyerSession" property="sexConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyerSession" property="sexConst" value="0">
										  				<bean:write name="buyerSession" property="sex"/>
										  			</logic:notEqual>
									  			</td>
									  			<td class="data1Text" align="center">
										  			<logic:equal name="compatibility" property="sex" value="2">
									  					<img src="pictures/unknownIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="sex" value="1">
									  					<img src="pictures/yesIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="sex" value="0">
									  					<img src="pictures/noIcon.gif"/>
									  				</logic:equal>
									  			</td>
									  		</tr>
									  		<tr>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:message key="showBuyerCompatibility.orientation"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="seller" property="preferredOrientationConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="seller" property="preferredOrientationConst" value="0">
										  				<bean:write name="seller" property="preferredOrientation"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyerSession" property="orientationConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyerSession" property="orientationConst" value="0">
										  				<bean:write name="buyerSession" property="orientation"/>
										  			</logic:notEqual>
									  			</td>
									  			<td class="data1Text" align="center">
										  			<logic:equal name="compatibility" property="orientation" value="2">
									  					<img src="pictures/unknownIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="orientation" value="1">
									  					<img src="pictures/yesIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="orientation" value="0">
									  					<img src="pictures/noIcon.gif"/>
									  				</logic:equal>
									  			</td>
									  		</tr>
									  		<tr>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:message key="showBuyerCompatibility.physique"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="seller" property="preferredPhysiqueConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="seller" property="preferredPhysiqueConst" value="0">
										  				<bean:write name="seller" property="preferredPhysique"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyerSession" property="physiqueConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyerSession" property="physiqueConst" value="0">
										  				<bean:write name="buyerSession" property="physique"/>
										  			</logic:notEqual>
									  			</td>
									  			<td class="data1Text" align="center">
										  			<logic:equal name="compatibility" property="physique" value="2">
									  					<img src="pictures/unknownIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="physique" value="1">
									  					<img src="pictures/yesIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="physique" value="0">
									  					<img src="pictures/noIcon.gif"/>
									  				</logic:equal>
									  			</td>
									  		</tr>
									  		<tr>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:message key="showBuyerCompatibility.origin"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="seller" property="preferredOriginConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="seller" property="preferredOriginConst" value="0">
										  				<bean:write name="seller" property="preferredOrigin"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyerSession" property="originConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyerSession" property="originConst" value="0">
										  				<bean:write name="buyerSession" property="origin"/>
										  			</logic:notEqual>
									  			</td>
									  			<td class="data1Text" align="center">
										  			<logic:equal name="compatibility" property="origin" value="2">
									  					<img src="pictures/unknownIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="origin" value="1">
									  					<img src="pictures/yesIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="origin" value="0">
									  					<img src="pictures/noIcon.gif"/>
									  				</logic:equal>
									  			</td>
									  		</tr>
									  		<tr>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:message key="showBuyerCompatibility.language"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="seller" property="preferredLanguageConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="seller" property="preferredLanguageConst" value="0">
										  				<bean:write name="seller" property="preferredLanguage"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:write name="buyerSession" property="language1"/>
									  				<logic:present name="buyerSession" property="language2">
										  				,&nbsp;<bean:write name="buyerSession" property="language2"/>
										  			</logic:present>
									  				<logic:present name="buyerSession" property="language3">
										  				,&nbsp;<bean:write name="buyerSession" property="language3"/>
										  			</logic:present>
									  			</td>
									  			<td class="data1Text" align="center">
										  			<logic:equal name="compatibility" property="origin" value="2">
									  					<img src="pictures/unknownIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="origin" value="1">
									  					<img src="pictures/yesIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="origin" value="0">
									  					<img src="pictures/noIcon.gif"/>
									  				</logic:equal>
									  			</td>
									  		</tr>
									  		<tr>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:message key="showBuyerCompatibility.smoker"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="seller" property="preferredSmokerConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="seller" property="preferredSmokerConst" value="0">
										  				<bean:write name="seller" property="preferredSmoker"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyerSession" property="smokerConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyerSession" property="smokerConst" value="0">
										  				<bean:write name="buyerSession" property="smoker"/>
										  			</logic:notEqual>
									  			</td>
									  			<td class="data1Text" align="center">
										  			<logic:equal name="compatibility" property="smoker" value="2">
									  					<img src="pictures/unknownIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="smoker" value="1">
									  					<img src="pictures/yesIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="smoker" value="0">
									  					<img src="pictures/noIcon.gif"/>
									  				</logic:equal>
									  			</td>
									  		</tr>
									  		<tr>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:message key="showBuyerCompatibility.height"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="seller" property="preferredHeightConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="seller" property="preferredHeightConst" value="0">
										  				<bean:write name="seller" property="preferredHeight"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyerSession" property="heightConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyerSession" property="heightConst" value="0">
										  				<bean:write name="buyerSession" property="height"/>
										  			</logic:notEqual>
									  			</td>
									  			<td class="data1Text" align="center">
										  			<logic:equal name="compatibility" property="height" value="2">
									  					<img src="pictures/unknownIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="height" value="1">
									  					<img src="pictures/yesIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="height" value="0">
									  					<img src="pictures/noIcon.gif"/>
									  				</logic:equal>
									  			</td>
									  		</tr>
									  		<tr>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:message key="showBuyerCompatibility.educationLevel"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="seller" property="preferredEducationLevelConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="seller" property="preferredEducationLevelConst" value="0">
										  				<bean:write name="seller" property="preferredEducationLevel"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyerSession" property="educationLevelConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyerSession" property="educationLevelConst" value="0">
										  				<bean:write name="buyerSession" property="educationLevel"/>
										  			</logic:notEqual>
									  			</td>
									  			<td class="data1Text" align="center">
										  			<logic:equal name="compatibility" property="educationLevel" value="2">
									  					<img src="pictures/unknownIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="educationLevel" value="1">
									  					<img src="pictures/yesIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="educationLevel" value="0">
									  					<img src="pictures/noIcon.gif"/>
									  				</logic:equal>
									  			</td>
									  		</tr>
									  		<tr>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:message key="showBuyerCompatibility.skinColor"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="seller" property="preferredSkinColorConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="seller" property="preferredSkinColorConst" value="0">
										  				<bean:write name="seller" property="preferredSkinColor"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyerSession" property="skinColorConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyerSession" property="skinColorConst" value="0">
										  				<bean:write name="buyerSession" property="skinColor"/>
										  			</logic:notEqual>
									  			</td>
									  			<td class="data1Text" align="center">
										  			<logic:equal name="compatibility" property="skinColor" value="2">
									  					<img src="pictures/unknownIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="skinColor" value="1">
									  					<img src="pictures/yesIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="skinColor" value="0">
									  					<img src="pictures/noIcon.gif"/>
									  				</logic:equal>
									  			</td>
									  		</tr>
									  		<tr>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:message key="showBuyerCompatibility.breastSize"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="seller" property="preferredBreastSizeConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="seller" property="preferredBreastSizeConst" value="0">
										  				<bean:write name="seller" property="preferredBreastSize"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyerSession" property="breastSizeConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyerSession" property="breastSizeConst" value="0">
										  				<bean:write name="buyerSession" property="breastSize"/>
										  			</logic:notEqual>
									  			</td>
									  			<td class="data1Text" align="center">
										  			<logic:equal name="compatibility" property="breastSize" value="2">
									  					<img src="pictures/unknownIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="breastSize" value="1">
									  					<img src="pictures/yesIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="breastSize" value="0">
									  					<img src="pictures/noIcon.gif"/>
									  				</logic:equal>
									  			</td>
									  		</tr>
									  		<tr>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:message key="showBuyerCompatibility.pennisSize"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="seller" property="preferredPennisSizeConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="seller" property="preferredPennisSizeConst" value="0">
										  				<bean:write name="seller" property="preferredPennisSize"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyerSession" property="pennisSizeConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyerSession" property="pennisSizeConst" value="0">
										  				<bean:write name="buyerSession" property="pennisSize"/>
										  			</logic:notEqual>
									  			</td>
									  			<td class="data1Text" align="center">
										  			<logic:equal name="compatibility" property="pennisSize" value="2">
									  					<img src="pictures/unknownIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="pennisSize" value="1">
									  					<img src="pictures/yesIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="pennisSize" value="0">
									  					<img src="pictures/noIcon.gif"/>
									  				</logic:equal>
									  			</td>
									  		</tr>
									  		<tr>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:message key="showBuyerCompatibility.hairColor"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="seller" property="preferredHairColorConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="seller" property="preferredHairColorConst" value="0">
										  				<bean:write name="seller" property="preferredHairColor"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyerSession" property="hairColorConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyerSession" property="hairColorConst" value="0">
										  				<bean:write name="buyerSession" property="hairColor"/>
										  			</logic:notEqual>
									  			</td>
									  			<td class="data1Text" align="center">
										  			<logic:equal name="compatibility" property="hairColor" value="2">
									  					<img src="pictures/unknownIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="hairColor" value="1">
									  					<img src="pictures/yesIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="hairColor" value="0">
									  					<img src="pictures/noIcon.gif"/>
									  				</logic:equal>
									  			</td>
									  		</tr>
									  		<tr>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:message key="showBuyerCompatibility.hairLength"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="seller" property="preferredHairLengthConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="seller" property="preferredHairLengthConst" value="0">
										  				<bean:write name="seller" property="preferredHairLength"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyerSession" property="hairLengthConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyerSession" property="hairLengthConst" value="0">
										  				<bean:write name="buyerSession" property="hairLength"/>
										  			</logic:notEqual>
									  			</td>
									  			<td class="data1Text" align="center">
										  			<logic:equal name="compatibility" property="hairLength" value="2">
									  					<img src="pictures/unknownIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="hairLength" value="1">
									  					<img src="pictures/yesIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="hairLength" value="0">
									  					<img src="pictures/noIcon.gif"/>
									  				</logic:equal>
									  			</td>
									  		</tr>
									  		<tr>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:message key="showBuyerCompatibility.eyeColor"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="seller" property="preferredEyeColorConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="seller" property="preferredEyeColorConst" value="0">
										  				<bean:write name="seller" property="preferredEyeColor"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyerSession" property="eyeColorConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyerSession" property="eyeColorConst" value="0">
										  				<bean:write name="buyerSession" property="eyeColor"/>
										  			</logic:notEqual>
									  			</td>
									  			<td class="data1Text" align="center">
										  			<logic:equal name="compatibility" property="eyeColor" value="2">
									  					<img src="pictures/unknownIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="eyeColor" value="1">
									  					<img src="pictures/yesIcon.gif"/>
									  				</logic:equal>
									  				<logic:equal name="compatibility" property="eyeColor" value="0">
									  					<img src="pictures/noIcon.gif"/>
									  				</logic:equal>
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
