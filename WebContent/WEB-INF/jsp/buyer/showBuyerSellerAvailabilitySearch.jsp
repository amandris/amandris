<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/amandris.tld" prefix="amandris" %>


<tiles:insert template='../tiles/amandrisBuyerTile.jsp'>
	<tiles:put name='logoTile' content='logoTile.jsp'/>
	<logic:present name="buyerSession">
		<tiles:put name='buyerMenuTile' content='buyerMenuTile.jsp'/>
	</logic:present>
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
			<td>	
				<table width="704" cellpadding="0" cellspacing="0" border="0" align="center">
					<html:form action="showBuyerSellerAvailabilityCollection.do">
						<tr><td height="10"></td></tr>							
						<tr>
							<td>
								<table width="704" cellpadding="0" cellspacing="0" border="0">
									<tr>
										<td align="center">
											<a href="showBuyerSellerSearch.do">
					  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="buyerSellerSearchInactive" border="0"/>
					  						</a>
										</td>
										<td align="center">
											<a href="showBuyerSellerAvailabilitySearch.do">
					  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="buyerSellerAvailabilitySearchActive" border="0"/>
					  						</a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr><td height="1" background="pictures/pixel.gif"></td></tr>
						<tr>
							<td height="20" class="errorText" align="center">
								<html:errors/>
							</td>
						</tr>
						<tr>
							<td>
								<table width="80%" cellpadding="0" cellspacing="0" border="0" align="center">
									<tr>
										<td class="data1Text"  valign="top">
											<b><bean:message key="showBuyerSellerAvailabilitySearch.searching"/></b><br>
												<html:checkbox property="sex_girl"><bean:message key="sex.1"/></html:checkbox><br>
												<input type="hidden" name="sex_girl" value="false">
												<html:checkbox property="sex_boy"><bean:message key="sex.2"/></html:checkbox><br>
												<input type="hidden" name="sex_boy" value="false">
												<html:checkbox property="sex_shemale"><bean:message key="sex.4"/></html:checkbox><br>
												<input type="hidden" name="sex_shemale" value="false">
												<html:checkbox property="sex_boysCouple"><bean:message key="sex.8"/></html:checkbox><br>
												<input type="hidden" name="sex_boysCouple" value="false">
												<html:checkbox property="sex_girlsCouple"><bean:message key="sex.16"/></html:checkbox><br>
												<input type="hidden" name="sex_girlsCouple" value="false">
												<html:checkbox property="sex_boyAndGirlCouple"><bean:message key="sex.32"/></html:checkbox><br>
												<input type="hidden" name="sex_boyAndGirlCouple" value="false">
												<html:checkbox property="sex_group"><bean:message key="sex.64"/></html:checkbox><br>
												<input type="hidden" name="sex_group" value="false">
										</td>
										<td class="data1Text"  valign="top">
											<b><bean:message key="showBuyerSellerAvailabilitySearch.between"/>&nbsp;
											<html:text styleClass="form" property="ageLow" size="1"/>&nbsp;<bean:message key="showBuyerSellerAvailabilitySearch.and"/>&nbsp;
											<html:text styleClass="form" property="ageHigh" size="1"/>&nbsp;<bean:message key="showBuyerSellerAvailabilitySearch.years"/></b><br><br>
											<amandris:countryStateTag 	name="countryState" 
																		formName="buyerSellerAvailabilitySearchForm" 
																		styleClass="form" 
																		countryKey="showBuyerSellerAvailabilitySearch.country" 
																		stateKey="showBuyerSellerAvailabilitySearch.state"/>
										</td>												
									</tr>
								</table>
							</td>
						</tr>
						<tr><td height="15"></td></tr>
						<tr>
							<td>
								<table width="50%" cellpadding="0" cellspacing="0" border="0" align="center">
									<tr valign="top">
										<td class="data1Text">
											<bean:message key="showBuyerSellerAvailabilitySearch.date"/>&nbsp;
											<html:text property="date" styleId="date" styleClass="form" size="8"/>
											<a href="javascript:;" onClick="showCalendar('date','<html:rewrite page="/html/calendar.html" />');">
												<img src="pictures/calendar.gif" border="0"/>
											</a>
										</td>
										<td class="data1Text">
											<bean:message key="showBuyerSellerAvailabilitySearch.hour"/>&nbsp;
											<html:select property="hour" styleClass="form">
												<html:option value="0">00:00</html:option>
												<html:option value="1">01:00</html:option>
												<html:option value="2">02:00</html:option>
												<html:option value="3">03:00</html:option>
												<html:option value="4">04:00</html:option>
												<html:option value="5">05:00</html:option>
												<html:option value="6">06:00</html:option>
												<html:option value="7">07:00</html:option>
												<html:option value="8">08:00</html:option>
												<html:option value="9">09:00</html:option>
												<html:option value="10">10:00</html:option>
												<html:option value="11">11:00</html:option>
												<html:option value="12">12:00</html:option>
												<html:option value="13">13:00</html:option>
												<html:option value="14">14:00</html:option>
												<html:option value="15">15:00</html:option>
												<html:option value="16">16:00</html:option>
												<html:option value="17">17:00</html:option>
												<html:option value="18">18:00</html:option>
												<html:option value="19">19:00</html:option>
												<html:option value="20">20:00</html:option>
												<html:option value="21">21:00</html:option>
												<html:option value="22">22:00</html:option>
												<html:option value="23">23:00</html:option>
											</html:select>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td height="15"></td></tr>
						<tr>
							<td nowrap class="data1Text" width="704" height="30" bgcolor="#C185AA" align="right">
								<html:submit styleClass="form"><bean:message key="showBuyerSellerAvailabilitySearch.fastSearch"/></html:submit>&nbsp;&nbsp;
							</td>
						</tr>	
						<tr><td height="15"></td></tr>
						<tr>
							<td>
								<table width="80%" cellpadding="0" cellspacing="0" border="0" align="center">
									<tr valign="top">
										<td width="25%" class="data1Text" valign="top">
											<html:checkbox property="isOnline"><bean:message key="showBuyerSellerAvailabilitySearch.isOnline"/></html:checkbox>
											<input type="hidden" name="isOnline" value="false">
										</td>
										<td width="25%" class="data1Text" valign="top">
											<html:checkbox property="isFreeContact"><bean:message key="showBuyerSellerAvailabilitySearch.isFreeContact"/></html:checkbox>
											<input type="hidden" name="isFreeContact" value="false">
										</td>
										<td width="25%" class="data1Text" valign="top">
												<html:checkbox property="hasAlbum"><bean:message key="showBuyerSellerAvailabilitySearch.hasAlbum"/></html:checkbox><br>
												<input type="hidden" name="hasAlbum" value="false">
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td height="15"></td></tr>
						<tr><td height="1" background="pictures/pixel.gif"></td></tr>
						<tr><td height="15"></td></tr>
						<tr>
							<td>
								<table width="559" cellpadding="0" cellspacing="0" border="0" align="center">
									<tr valign="top">
										<td width="25%" class="data1Text" valign="top">
											<b><bean:message key="showBuyerSellerAvailabilitySearch.origin"/></b><br>
												<html:checkbox property="origin_caucasic"><bean:message key="origin.1"/></html:checkbox><br>
												<input type="hidden" name="origin_caucasic" value="false">
												<html:checkbox property="origin_indian"><bean:message key="origin.2"/></html:checkbox><br>
												<input type="hidden" name="origin_indian" value="false">
												<html:checkbox property="origin_oriental"><bean:message key="origin.4"/></html:checkbox><br>
												<input type="hidden" name="origin_oriental" value="false">
												<html:checkbox property="origin_african"><bean:message key="origin.8"/></html:checkbox><br>
												<input type="hidden" name="origin_african" value="false">
												<html:checkbox property="origin_arabian"><bean:message key="origin.16"/></html:checkbox><br>
												<input type="hidden" name="origin_arabian" value="false">
												<html:checkbox property="origin_hispanic"><bean:message key="origin.32"/></html:checkbox><br>
												<input type="hidden" name="origin_hispanic" value="false">
												<html:checkbox property="origin_mediterranean"><bean:message key="origin.64"/></html:checkbox><br>
												<input type="hidden" name="origin_mediterranean" value="false">
										</td>
										<td width="25%" class="data1Text" valign="top">
											<b><bean:message key="showBuyerSellerAvailabilitySearch.skinColor"/></b><br>
												<html:checkbox property="skinColor_white"><bean:message key="skinColor.1"/></html:checkbox><br>
												<input type="hidden" name="skinColor_white" value="false">
												<html:checkbox property="skinColor_dark"><bean:message key="skinColor.2"/></html:checkbox><br>
												<input type="hidden" name="skinColor_dark" value="false">
												<html:checkbox property="skinColor_veryDark"><bean:message key="skinColor.4"/></html:checkbox><br>
												<input type="hidden" name="skinColor_veryDark" value="false">
												<html:checkbox property="skinColor_black"><bean:message key="skinColor.8"/></html:checkbox><br>
												<input type="hidden" name="skinColor_black" value="false">
										</td>
										<td width="25%" class="data1Text" valign="top">
											<b><bean:message key="showBuyerSellerAvailabilitySearch.hairColor"/></b><br>
												<html:checkbox property="hairColor_white"><bean:message key="hairColor.1"/></html:checkbox><br>
												<input type="hidden" name="hairColor_white" value="false">
												<html:checkbox property="hairColor_blonde"><bean:message key="hairColor.2"/></html:checkbox><br>
												<input type="hidden" name="hairColor_blonde" value="false">
												<html:checkbox property="hairColor_brown"><bean:message key="hairColor.4"/></html:checkbox><br>
												<input type="hidden" name="hairColor_brown" value="false">
												<html:checkbox property="hairColor_red"><bean:message key="hairColor.8"/></html:checkbox><br>
												<input type="hidden" name="hairColor_red" value="false">
												<html:checkbox property="hairColor_dark"><bean:message key="hairColor.16"/></html:checkbox><br>
												<input type="hidden" name="hairColor_dark" value="false">
										</td>
										<td width="25%" class="data1Text" valign="top">
											<b><bean:message key="showBuyerSellerAvailabilitySearch.hairLength"/></b><br>
												<html:checkbox property="hairLength_noHair"><bean:message key="hairLength.1"/></html:checkbox><br>
												<input type="hidden" name="hairLength_noHair" value="false">
												<html:checkbox property="hairLength_short"><bean:message key="hairLength.2"/></html:checkbox><br>
												<input type="hidden" name="hairLength_short" value="false">
												<html:checkbox property="hairLength_untilNeck"><bean:message key="hairLength.4"/></html:checkbox><br>
												<input type="hidden" name="hairLength_untilNeck" value="false">
												<html:checkbox property="hairLength_untilShoulders"><bean:message key="hairLength.8"/></html:checkbox><br>
												<input type="hidden" name="hairLength_untilShoulders" value="false">
												<html:checkbox property="hairLength_beyondShoulders"><bean:message key="hairLength.16"/></html:checkbox><br>
												<input type="hidden" name="hairLength_beyondShoulders" value="false">
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td height="15"></td></tr>
						<tr><td height="1" background="pictures/pixel.gif"></td></tr>
						<tr><td height="15"></td></tr>
						<tr>
							<td>
								<table width="559" cellpadding="0" cellspacing="0" border="0" align="center">
									<tr valign="top">
										<td width="25%" class="data1Text" valign="top">
											<b><bean:message key="showBuyerSellerAvailabilitySearch.eyeColor"/></b><br>
												<html:checkbox property="eyeColor_green"><bean:message key="eyeColor.1"/></html:checkbox><br>
												<input type="hidden" name="eyeColor_green" value="false">
												<html:checkbox property="eyeColor_blue"><bean:message key="eyeColor.2"/></html:checkbox><br>
												<input type="hidden" name="eyeColor_blue" value="false">
												<html:checkbox property="eyeColor_brown"><bean:message key="eyeColor.4"/></html:checkbox><br>
												<input type="hidden" name="eyeColor_brown" value="false">
												<html:checkbox property="eyeColor_black"><bean:message key="eyeColor.8"/></html:checkbox><br>
												<input type="hidden" name="eyeColor_black" value="false">
										</td>
										<td width="25%" class="data1Text" valign="top">
											<b><bean:message key="showBuyerSellerAvailabilitySearch.language"/></b><br>
												<html:checkbox property="language_spanish"><bean:message key="language.1"/></html:checkbox><br>
												<input type="hidden" name="language_spanish" value="false">
												<html:checkbox property="language_english"><bean:message key="language.2"/></html:checkbox><br>
												<input type="hidden" name="language_english" value="false">
												<html:checkbox property="language_portuguese"><bean:message key="language.4"/></html:checkbox><br>
												<input type="hidden" name="language_portuguese" value="false">
												<html:checkbox property="language_french"><bean:message key="language.8"/></html:checkbox><br>
												<input type="hidden" name="language_french" value="false">
												<html:checkbox property="language_german"><bean:message key="language.16"/></html:checkbox><br>
												<input type="hidden" name="language_german" value="false">
												<html:checkbox property="language_italian"><bean:message key="language.32"/></html:checkbox><br>
												<input type="hidden" name="language_italian" value="false">
												<html:checkbox property="language_japanesse"><bean:message key="language.64"/></html:checkbox><br>
												<input type="hidden" name="language_japanesse" value="false">
												<html:checkbox property="language_chinesse"><bean:message key="language.128"/></html:checkbox><br>
												<input type="hidden" name="language_chinesse" value="false">
												<html:checkbox property="language_arabian"><bean:message key="language.256"/></html:checkbox><br>
												<input type="hidden" name="language_arabian" value="false">
										</td>
										<td width="25%" class="data1Text" valign="top">
											<b><bean:message key="showBuyerSellerAvailabilitySearch.educationLevel"/></b><br>
												<html:checkbox property="educationLevel_primary"><bean:message key="educationLevel.1"/></html:checkbox><br>
												<input type="hidden" name="educationLevel_primary" value="false">
												<html:checkbox property="educationLevel_seconday"><bean:message key="educationLevel.2"/></html:checkbox><br>
												<input type="hidden" name="educationLevel_seconday" value="false">
												<html:checkbox property="educationLevel_universitary"><bean:message key="educationLevel.4"/></html:checkbox><br>
												<input type="hidden" name="educationLevel_universitary" value="false">
												<html:checkbox property="educationLevel_postDegree"><bean:message key="educationLevel.8"/></html:checkbox><br>
												<input type="hidden" name="educationLevel_postDegree" value="false">
										</td>
										<td width="25%" class="data1Text" valign="top">
											<b><bean:message key="showBuyerSellerAvailabilitySearch.smoker"/></b><br>
												<html:checkbox property="smoker_noSmoker"><bean:message key="smoker.1"/></html:checkbox><br>
												<input type="hidden" name="smoker_noSmoker" value="false">
												<html:checkbox property="smoker_eventuallySmoker"><bean:message key="smoker.2"/></html:checkbox><br>
												<input type="hidden" name="smoker_eventuallySmoker" value="false">
												<html:checkbox property="smoker_smoker"><bean:message key="smoker.4"/></html:checkbox><br>
												<input type="hidden" name="smoker_smoker" value="false">
										</td>
									</tr>
								</table>
							</td>
						</tr>	
						<tr><td height="15"></td></tr>
						<tr><td height="1" background="pictures/pixel.gif"></td></tr>
						<tr><td height="15"></td></tr>
						<tr>
							<td>
								<table width="559" cellpadding="0" cellspacing="0" border="0" align="center">
									<tr valign="top">
										<td width="25%" class="data1Text" valign="top">
											<b><bean:message key="showBuyerSellerAvailabilitySearch.physique"/></b><br>
												<html:checkbox property="physique_thin"><bean:message key="physique.1"/></html:checkbox><br>
												<input type="hidden" name="physique_thin" value="false">
												<html:checkbox property="physique_normal"><bean:message key="physique.2"/></html:checkbox><br>
												<input type="hidden" name="physique_normal" value="false">
												<html:checkbox property="physique_fat"><bean:message key="physique.4"/></html:checkbox><br>
												<input type="hidden" name="physique_fat" value="false">
												<html:checkbox property="physique_muscled"><bean:message key="physique.8"/></html:checkbox><br>
												<input type="hidden" name="physique_muscled" value="false">
												<html:checkbox property="physique_atlethic"><bean:message key="physique.16"/></html:checkbox><br>
												<input type="hidden" name="physique_atlethic" value="false">
										</td>
										<td width="25%" class="data1Text" valign="top">
											<b><bean:message key="showBuyerSellerAvailabilitySearch.height"/></b><br>
												<html:checkbox property="height_lessThan150"><bean:message key="height.1"/></html:checkbox><br>
												<input type="hidden" name="height_lessThan150" value="false">
												<html:checkbox property="height_between150And159"><bean:message key="height.2"/></html:checkbox><br>
												<input type="hidden" name="height_between150And159" value="false">
												<html:checkbox property="height_between160And169"><bean:message key="height.4"/></html:checkbox><br>
												<input type="hidden" name="height_between160And169" value="false">
												<html:checkbox property="height_between170And179"><bean:message key="height.8"/></html:checkbox><br>
												<input type="hidden" name="height_between170And179" value="false">
												<html:checkbox property="height_between180And189"><bean:message key="height.16"/></html:checkbox><br>
												<input type="hidden" name="height_between180And189" value="false">
												<html:checkbox property="height_between190And200"><bean:message key="height.32"/></html:checkbox><br>
												<input type="hidden" name="height_between190And200" value="false">
												<html:checkbox property="height_moreThan200"><bean:message key="height.64"/></html:checkbox><br>
												<input type="hidden" name="height_moreThan200" value="false">
										</td>
										<td width="25%" class="data1Text" valign="top">
											<b><bean:message key="showBuyerSellerAvailabilitySearch.orientation"/></b><br>
												<html:checkbox property="orientation_heterosexual"><bean:message key="orientation.1"/></html:checkbox><br>
												<input type="hidden" name="orientation_heterosexual" value="false">
												<html:checkbox property="orientation_homosexual"><bean:message key="orientation.2"/></html:checkbox><br>
												<input type="hidden" name="orientation_homosexual" value="false">
												<html:checkbox property="orientation_bisexual"><bean:message key="orientation.4"/></html:checkbox><br>
												<input type="hidden" name="orientation_bisexual" value="false">
												<html:checkbox property="orientation_bicurious"><bean:message key="orientation.8"/></html:checkbox><br>
												<input type="hidden" name="orientation_bicurious" value="false">
										</td>
										<td width="25%" class="data1Text" valign="top">
										</td>
									</tr>
								</table>
							</td>
						</tr>	
						<tr><td height="15"></td></tr>
						<tr><td height="1" background="pictures/pixel.gif"></td></tr>
						<tr><td height="15"></td></tr>
						<tr>
							<td>
								<table width="559" cellpadding="0" cellspacing="0" border="0" align="center">
									<tr valign="top">
										<td class="data1Text" valign="top">
											<b><bean:message key="showBuyerSellerAvailabilitySearch.pennisSize"/></b><br>
												<html:checkbox property="pennisSize_normal"><bean:message key="pennisSize.1"/></html:checkbox><br>
												<input type="hidden" name="pennisSize_normal" value="false">
												<html:checkbox property="pennisSize_biggerThanNormal"><bean:message key="pennisSize.2"/></html:checkbox><br>
												<input type="hidden" name="pennisSize_biggerThanNormal" value="false">
												<html:checkbox property="pennisSize_big"><bean:message key="pennisSize.4"/></html:checkbox><br>
												<input type="hidden" name="pennisSize_big" value="false">
												<html:checkbox property="pennisSize_veryBig"><bean:message key="pennisSize.8"/></html:checkbox><br>
												<input type="hidden" name="pennisSize_veryBig" value="false">
										</td>
										<td class="data1Text" valign="top">
											<b><bean:message key="showBuyerSellerAvailabilitySearch.breastSize"/></b><br>
												<html:checkbox property="breastSize_small"><bean:message key="breastSize.1"/></html:checkbox><br>
												<input type="hidden" name="breastSize_small" value="false">
												<html:checkbox property="breastSize_normal"><bean:message key="breastSize.2"/></html:checkbox><br>
												<input type="hidden" name="breastSize_normal" value="false">													
												<html:checkbox property="breastSize_big"><bean:message key="breastSize.4"/></html:checkbox><br>
												<input type="hidden" name="breastSize_big" value="false">
												<html:checkbox property="breastSize_veryBig"><bean:message key="breastSize.8"/></html:checkbox><br>
												<input type="hidden" name="breastSize_veryBig" value="false">
										</td>
										<td width="25%" class="data1Text" valign="top">
										<td width="25%" class="data1Text" valign="top">
									</tr>
								</table>
							</td>
						</tr>	
						<tr><td height="30"></td></tr>																																						
						<tr>
							<td nowrap class="data1Text" width="704" height="30" bgcolor="#C185AA" align="right">
								<bean:message key="showBuyerSellerAvailabilitySearch.show"/>&nbsp;
								<html:select property="itemsPerPage" styleClass="form">
									<html:option value="4">4</html:option>
									<html:option value="8">8</html:option>
									<html:option value="16">16</html:option>
									<html:option value="20">20</html:option>
								</html:select>
								&nbsp;<bean:message key="showBuyerSellerAvailabilitySearch.itemsPerPage"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="showBuyerSellerAvailabilitySearch.orderedBy"/>
								<html:select property="orderedBy" styleClass="form">
									<html:option value="seller.lastLogin"><bean:message key="showBuyerSellerAvailabilitySearch.lastLogin"/></html:option>
									<html:option value="seller.positiveVotes"><bean:message key="showBuyerSellerAvailabilitySearch.positiveVote"/></html:option>
									<html:option value="seller.contactsReceived"><bean:message key="showBuyerSellerAvailabilitySearch.contactsReceived"/></html:option>
									<html:option value="seller.contactsAccepted"><bean:message key="showBuyerSellerAvailabilitySearch.contactsAccepted"/></html:option>
									<html:option value="seller.birthDate"><bean:message key="showBuyerSellerAvailabilitySearch.age"/></html:option>
									<html:option value="seller.login"><bean:message key="showBuyerSellerAvailabilitySearch.login"/></html:option>
								</html:select>
								&nbsp;&nbsp;
								<html:submit styleClass="form"><bean:message key="common.search"/></html:submit>&nbsp;&nbsp;
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
