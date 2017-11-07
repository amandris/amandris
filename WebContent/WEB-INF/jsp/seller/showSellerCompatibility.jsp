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
			<td height="450">	
				<table width="704" cellpadding="0" cellspacing="5" border="0">
					<tr>
						<td align="center">
							<table cellpadding="0" cellspacing="5" border="0" valign="top" align="center">
								<tr>
									<td class="data3Text">
										<bean:message key="showSellerCompatibility.percentage"/>: <bean:write name="compatibility" property="percentage"/>&nbsp;%
									</td>
									<td width="30"></td>
									<td class="data3Text">
										<bean:message key="showSellerCompatibility.accuracy"/>: <bean:write name="compatibility" property="accuracy"/>&nbsp;%
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
									  				<b><bean:message key="showSellerCompatibility.property"/></b>
									  			</td>
									  			<td nowrap class="data2Text" align="center">
									  				<b><bean:message key="showSellerCompatibility.buyerPreference"/></b>
									  			</td>
									  			<td nowrap class="data2Text" align="center">
									  				<b><bean:message key="showSellerCompatibility.sellerValue"/></b>
									  			</td>
									  			<td nowrap class="data2Text" align="center">
									  				<b><bean:message key="showSellerCompatibility.matchs"/></b>
									  			</td>
									  		</tr>
									  		<tr>
									  			<td background="pictures/pixel.gif"></td>
									  			<td background="pictures/pixel.gif"></td>
									  			<td background="pictures/pixel.gif"></td>
									  			<td background="pictures/pixel.gif"></td>
									  		<tr>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:message key="showSellerCompatibility.age"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:message key="showSellerCompatibility.between"/>&nbsp;<bean:write name="buyer" property="preferredAgeLow"/>&nbsp;<bean:message key="showSellerCompatibility.and"/>&nbsp;<bean:write name="buyer" property="preferredAgeHigh"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:write name="sellerSession" property="age"/>
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
									  				<logic:equal name="buyer" property="preferredSexConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyer" property="preferredSexConst" value="0">
										  				<bean:write name="buyer" property="preferredSex"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="sellerSession" property="sexConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="sellerSession" property="sexConst" value="0">
										  				<bean:write name="sellerSession" property="sex"/>
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
									  				<bean:message key="showSellerCompatibility.orientation"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyer" property="preferredOrientationConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyer" property="preferredOrientationConst" value="0">
										  				<bean:write name="buyer" property="preferredOrientation"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="sellerSession" property="orientationConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="sellerSession" property="orientationConst" value="0">
										  				<bean:write name="sellerSession" property="orientation"/>
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
									  				<bean:message key="showSellerCompatibility.physique"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyer" property="preferredPhysiqueConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyer" property="preferredPhysiqueConst" value="0">
										  				<bean:write name="buyer" property="preferredPhysique"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="sellerSession" property="physiqueConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="sellerSession" property="physiqueConst" value="0">
										  				<bean:write name="sellerSession" property="physique"/>
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
									  				<bean:message key="showSellerCompatibility.origin"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyer" property="preferredOriginConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyer" property="preferredOriginConst" value="0">
										  				<bean:write name="buyer" property="preferredOrigin"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="sellerSession" property="originConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="sellerSession" property="originConst" value="0">
										  				<bean:write name="sellerSession" property="origin"/>
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
									  				<bean:message key="showSellerCompatibility.language"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyer" property="preferredLanguageConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyer" property="preferredLanguageConst" value="0">
										  				<bean:write name="buyer" property="preferredLanguage"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<bean:write name="sellerSession" property="language1"/>
									  				<logic:present name="sellerSession" property="language2">
										  				,&nbsp;<bean:write name="sellerSession" property="language2"/>
										  			</logic:present>
									  				<logic:present name="sellerSession" property="language3">
										  				,&nbsp;<bean:write name="sellerSession" property="language3"/>
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
									  				<bean:message key="showSellerCompatibility.smoker"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyer" property="preferredSmokerConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyer" property="preferredSmokerConst" value="0">
										  				<bean:write name="buyer" property="preferredSmoker"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="sellerSession" property="smokerConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="sellerSession" property="smokerConst" value="0">
										  				<bean:write name="sellerSession" property="smoker"/>
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
									  				<bean:message key="showSellerCompatibility.height"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyer" property="preferredHeightConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyer" property="preferredHeightConst" value="0">
										  				<bean:write name="buyer" property="preferredHeight"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="sellerSession" property="heightConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="sellerSession" property="heightConst" value="0">
										  				<bean:write name="sellerSession" property="height"/>
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
									  				<bean:message key="showSellerCompatibility.educationLevel"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyer" property="preferredEducationLevelConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyer" property="preferredEducationLevelConst" value="0">
										  				<bean:write name="buyer" property="preferredEducationLevel"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="sellerSession" property="educationLevelConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="sellerSession" property="educationLevelConst" value="0">
										  				<bean:write name="sellerSession" property="educationLevel"/>
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
									  				<bean:message key="showSellerCompatibility.skinColor"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyer" property="preferredSkinColorConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyer" property="preferredSkinColorConst" value="0">
										  				<bean:write name="buyer" property="preferredSkinColor"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="sellerSession" property="skinColorConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="sellerSession" property="skinColorConst" value="0">
										  				<bean:write name="sellerSession" property="skinColor"/>
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
									  				<bean:message key="showSellerCompatibility.breastSize"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyer" property="preferredBreastSizeConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyer" property="preferredBreastSizeConst" value="0">
										  				<bean:write name="buyer" property="preferredBreastSize"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="sellerSession" property="breastSizeConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="sellerSession" property="breastSizeConst" value="0">
										  				<bean:write name="sellerSession" property="breastSize"/>
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
									  				<bean:message key="showSellerCompatibility.pennisSize"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyer" property="preferredPennisSizeConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyer" property="preferredPennisSizeConst" value="0">
										  				<bean:write name="buyer" property="preferredPennisSize"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="sellerSession" property="pennisSizeConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="sellerSession" property="pennisSizeConst" value="0">
										  				<bean:write name="sellerSession" property="pennisSize"/>
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
									  				<bean:message key="showSellerCompatibility.hairColor"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyer" property="preferredHairColorConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyer" property="preferredHairColorConst" value="0">
										  				<bean:write name="buyer" property="preferredHairColor"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="sellerSession" property="hairColorConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="sellerSession" property="hairColorConst" value="0">
										  				<bean:write name="sellerSession" property="hairColor"/>
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
									  				<bean:message key="showSellerCompatibility.hairLength"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyer" property="preferredHairLengthConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyer" property="preferredHairLengthConst" value="0">
										  				<bean:write name="buyer" property="preferredHairLength"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="sellerSession" property="hairLengthConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="sellerSession" property="hairLengthConst" value="0">
										  				<bean:write name="sellerSession" property="hairLength"/>
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
									  				<bean:message key="showSellerCompatibility.eyeColor"/>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="buyer" property="preferredEyeColorConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="buyer" property="preferredEyeColorConst" value="0">
										  				<bean:write name="buyer" property="preferredEyeColor"/>
										  			</logic:notEqual>
									  			</td>
									  			<td nowrap class="data1Text" align="center">
									  				<logic:equal name="sellerSession" property="eyeColorConst" value="0">
										  				-
										  			</logic:equal>
										  			<logic:notEqual name="sellerSession" property="eyeColorConst" value="0">
										  				<bean:write name="sellerSession" property="eyeColor"/>
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
