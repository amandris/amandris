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
							<bean:message key="showSellerPictures.text1"/>
						</td>
					</tr>
					<tr><td height="5"></td></tr>
					<tr>
						<td class="data1Text" align="center">
							<bean:message key="showSellerPictures.text2"/>&nbsp;<a href="showPictureRules.do" class="data1Link"><bean:message key="showSellerPictures.here"/></a>
						</td>
					</tr>
					<tr><td height="10"></td></tr>
					<tr>
  						<td align="left">
  						  	<table cellpadding="0" cellspacing="0" border="0" align="left">
						  		<tr align="center">
			  						<td class="data2Text">
			  							<a href="showSellerAccount.do">
					  						<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="accountInactive" border="0"/>
					  					</a>
			  						</td>
			  						<td width="10"></td>
			  						<td class="data2Text">
				  						<a href="showSellerPassword.do">
				  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="passwordInactive" border="0"/>
				  						</a>
			  						</td>
			  						<td width="10"></td>
			  						<td class="data2Text">
				  						<a href="showSellerProfile.do">
				  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="profileInactive" border="0"/>
				  						</a>
			  						</td>
			  						<logic:equal name="sellerSession" property="isEscort" value="0">	
				  						<td width="10"></td>
				  						<td class="data2Text">
					  						<a href="showSellerPreferences.do">
					  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="preferencesInactive" border="0"/>
					  						</a>
				  						</td>
				  					</logic:equal>
			  						<td width="10"></td>
			  						<td class="data2Text">
				  						<a href="showSellerPictures.do">
				  							<html:img bundle="IMAGE_RESOURCE_KEY" srcKey="sellerPicturesActive" border="0"/>
				  						</a>
			  						</td>
						  		</tr>
						  	</table>
  						</td>
			  		</tr>			  
					<tr><td height="10"></td></tr>
					<tr>
						<td class="errorText" align="center">
							<html:errors/>
						</td>
					</tr>
					<tr>
						<td>
							<table cellpadding="0" cellsapcing="0" border="0">
								<html:form action="setSellerPicture.do"  method="POST" enctype="multipart/form-data">
									<tr height="70">
										<td width="30" align="center">
											<logic:equal name="sellerSession" property="mainPicture" value="1">
												<img src="pictures/mainPictureIcon.gif" alt="<bean:message key="showSellerPictures.mainPicture"/>"/>
											</logic:equal>
											<logic:equal name="sellerSession" property="picture1Waiting" value="1">
												<img src="pictures/eyeIcon.gif" alt="<bean:message key="showSellerPictures.waitingForRevision"/>"/>
											</logic:equal>
										</td>
										<td width="80" align="center">
											<logic:greaterThan name="sellerSession" property="picture1" value="1">
												<img src="/media/pictures/smaller/seller_<bean:write name="sellerSession" property="id"/>_1_<bean:write name="sellerSession" property="picture1"/>.jpg"/>
											</logic:greaterThan>
											<logic:equal name="sellerSession" property="picture1" value="0">
												<img src="pictures/emptyPicture.gif"/>
											</logic:equal>
										</td>
										<td width="250" align="center">
											<logic:equal name="sellerSession" property="picture1" value="0">
												<html:file property="pictureFile" styleClass="form"/>
												<html:hidden property="index" value="1"/>
											</logic:equal>
										</td>
										<td width="70" align="center">
											<logic:greaterThan name="sellerSession" property="picture1" value="0">
												<input type="button" class="form" onclick="document.location.href='deleteSellerPicture.do?index=1'" value="<bean:message key="showSellerPictures.delete"/>"/>
											</logic:greaterThan>
											<logic:equal name="sellerSession" property="picture1" value="0">
												<html:submit styleClass="form" onclick="document.getElementById('uploadDiv').style.visibility='visible';document.getElementById('uploadBackgroundDiv').style.visibility='visible';"><bean:message key="showSellerPictures.add"/></html:submit>
											</logic:equal>
										</td>
										<td width="200" align="center">
											<logic:greaterThan name="sellerSession" property="picture1" value="1">
												<logic:notEqual name="sellerSession" property="mainPicture" value="1">
													<logic:notEqual name="sellerSession" property="picture1Waiting" value="1">
														<input type="button" class="form" onclick="document.location.href='setSellerMarkAsMainPicture.do?index=1'" value="<bean:message key="showSellerPictures.markAsMain"/>"/>
													</logic:notEqual>
												</logic:notEqual>
											</logic:greaterThan>
										</td>
										<td width="60" align="center">
											<logic:greaterThan name="sellerSession" property="picture1" value="1">
												<input type="button" class="form" onclick="document.location.href='showSellerSeePicture.do?index=1'" value="<bean:message key="showSellerPictures.see"/>"/>
											</logic:greaterThan>
										</td>
									</tr>
								</html:form>
								<html:form action="setSellerPicture.do"  method="POST" enctype="multipart/form-data">
									<tr height="70">
										<td width="30" align="center">
											<logic:equal name="sellerSession" property="mainPicture" value="2">
												<img src="pictures/mainPictureIcon.gif" alt="<bean:message key="showSellerPictures.mainPicture"/>"/>
											</logic:equal>
											<logic:equal name="sellerSession" property="picture2Waiting" value="1">
												<img src="pictures/eyeIcon.gif" alt="<bean:message key="showSellerPictures.waitingForRevision"/>"/>
											</logic:equal>
										</td>
										<td width="80" align="center">
											<logic:greaterThan name="sellerSession" property="picture2" value="1">
												<img src="/media/pictures/smaller/seller_<bean:write name="sellerSession" property="id"/>_2_<bean:write name="sellerSession" property="picture2"/>.jpg"/>
											</logic:greaterThan>
											<logic:equal name="sellerSession" property="picture2" value="0">
												<img src="pictures/emptyPicture.gif"/>
											</logic:equal>
										</td>
										<td width="250" align="center">
											<logic:equal name="sellerSession" property="picture2" value="0">
												<html:file property="pictureFile" styleClass="form"/>
												<html:hidden property="index" value="2"/>
											</logic:equal>
										</td>
										<td width="70" align="center">
											<logic:greaterThan name="sellerSession" property="picture2" value="0">
												<input type="button" class="form" onclick="document.location.href='deleteSellerPicture.do?index=2'" value="<bean:message key="showSellerPictures.delete"/>"/>
											</logic:greaterThan>
											<logic:equal name="sellerSession" property="picture2" value="0">
												<html:submit styleClass="form" onclick="document.getElementById('uploadDiv').style.visibility='visible';document.getElementById('uploadBackgroundDiv').style.visibility='visible';"><bean:message key="showSellerPictures.add"/></html:submit>
											</logic:equal>
										</td>
										<td width="200" align="center">
											<logic:greaterThan name="sellerSession" property="picture2" value="1">
												<logic:notEqual name="sellerSession" property="mainPicture" value="2">
													<logic:notEqual name="sellerSession" property="picture2Waiting" value="1">
														<input type="button" class="form" onclick="document.location.href='setSellerMarkAsMainPicture.do?index=2'" value="<bean:message key="showSellerPictures.markAsMain"/>"/>
													</logic:notEqual>
												</logic:notEqual>
											</logic:greaterThan>
										</td>
										<td width="60" align="center">
											<logic:greaterThan name="sellerSession" property="picture2" value="1">
												<input type="button" class="form" onclick="document.location.href='showSellerSeePicture.do?index=2'" value="<bean:message key="showSellerPictures.see"/>"/>
											</logic:greaterThan>
										</td>
									</tr>
								</html:form>
								<html:form action="setSellerPicture.do"  method="POST" enctype="multipart/form-data">
									<tr height="70">
										<td width="30" align="center">
											<logic:equal name="sellerSession" property="mainPicture" value="3">
												<img src="pictures/mainPictureIcon.gif" alt="<bean:message key="showSellerPictures.mainPicture"/>"/>
											</logic:equal>
											<logic:equal name="sellerSession" property="picture3Waiting" value="1">
												<img src="pictures/eyeIcon.gif" alt="<bean:message key="showSellerPictures.waitingForRevision"/>"/>
											</logic:equal>
										</td>
										<td width="80" align="center">
											<logic:greaterThan name="sellerSession" property="picture3" value="1">
												<img src="/media/pictures/smaller/seller_<bean:write name="sellerSession" property="id"/>_3_<bean:write name="sellerSession" property="picture3"/>.jpg"/>
											</logic:greaterThan>
											<logic:equal name="sellerSession" property="picture3" value="0">
												<img src="pictures/emptyPicture.gif"/>
											</logic:equal>
										</td>
										<td width="250" align="center">
											<logic:equal name="sellerSession" property="picture3" value="0">
												<html:file property="pictureFile" styleClass="form"/>
												<html:hidden property="index" value="3"/>
											</logic:equal>
										</td>
										<td width="70" align="center">
											<logic:greaterThan name="sellerSession" property="picture3" value="0">
												<input type="button" class="form" onclick="document.location.href='deleteSellerPicture.do?index=3'" value="<bean:message key="showSellerPictures.delete"/>"/>
											</logic:greaterThan>
											<logic:equal name="sellerSession" property="picture3" value="0">
												<html:submit styleClass="form" onclick="document.getElementById('uploadDiv').style.visibility='visible';document.getElementById('uploadBackgroundDiv').style.visibility='visible';"><bean:message key="showSellerPictures.add"/></html:submit>
											</logic:equal>
										</td>
										<td width="200" align="center">
											<logic:greaterThan name="sellerSession" property="picture3" value="1">
												<logic:notEqual name="sellerSession" property="mainPicture" value="3">
													<logic:notEqual name="sellerSession" property="picture3Waiting" value="1">
														<input type="button" class="form" onclick="document.location.href='setSellerMarkAsMainPicture.do?index=3'" value="<bean:message key="showSellerPictures.markAsMain"/>"/>
													</logic:notEqual>
												</logic:notEqual>
											</logic:greaterThan>
										</td>
										<td width="60" align="center">
											<logic:greaterThan name="sellerSession" property="picture3" value="1">
												<input type="button" class="form" onclick="document.location.href='showSellerSeePicture.do?index=3'" value="<bean:message key="showSellerPictures.see"/>"/>
											</logic:greaterThan>
										</td>
									</tr>
								</html:form>
	
								<html:form action="setSellerPicture.do"  method="POST" enctype="multipart/form-data">
									<tr height="70">
										<td width="30" align="center">
											<logic:equal name="sellerSession" property="mainPicture" value="4">
												<img src="pictures/mainPictureIcon.gif" alt="<bean:message key="showSellerPictures.mainPicture"/>"/>
											</logic:equal>
											<logic:equal name="sellerSession" property="picture4Waiting" value="1">
												<img src="pictures/eyeIcon.gif" alt="<bean:message key="showSellerPictures.waitingForRevision"/>"/>
											</logic:equal>
										</td>
										<td width="80" align="center">
											<logic:greaterThan name="sellerSession" property="picture4" value="1">
												<img src="/media/pictures/smaller/seller_<bean:write name="sellerSession" property="id"/>_4_<bean:write name="sellerSession" property="picture4"/>.jpg"/>
											</logic:greaterThan>
											<logic:equal name="sellerSession" property="picture4" value="0">
												<img src="pictures/emptyPicture.gif"/>
											</logic:equal>
										</td>
										<td width="250" align="center">
											<logic:equal name="sellerSession" property="picture4" value="0">
												<html:file property="pictureFile" styleClass="form"/>
												<html:hidden property="index" value="4"/>
											</logic:equal>
										</td>
										<td width="70" align="center">
											<logic:greaterThan name="sellerSession" property="picture4" value="0">
												<input type="button" class="form" onclick="document.location.href='deleteSellerPicture.do?index=4'" value="<bean:message key="showSellerPictures.delete"/>"/>
											</logic:greaterThan>
											<logic:equal name="sellerSession" property="picture4" value="0">
												<html:submit styleClass="form" onclick="document.getElementById('uploadDiv').style.visibility='visible';document.getElementById('uploadBackgroundDiv').style.visibility='visible';"><bean:message key="showSellerPictures.add"/></html:submit>
											</logic:equal>
										</td>
										<td width="200" align="center">
											<logic:greaterThan name="sellerSession" property="picture4" value="1">
												<logic:notEqual name="sellerSession" property="mainPicture" value="4">
													<logic:notEqual name="sellerSession" property="picture4Waiting" value="1">
														<input type="button" class="form" onclick="document.location.href='setSellerMarkAsMainPicture.do?index=4'" value="<bean:message key="showSellerPictures.markAsMain"/>"/>
													</logic:notEqual>
												</logic:notEqual>
											</logic:greaterThan>
										</td>
										<td width="60" align="center">
											<logic:greaterThan name="sellerSession" property="picture4" value="1">
												<input type="button" class="form" onclick="document.location.href='showSellerSeePicture.do?index=4'" value="<bean:message key="showSellerPictures.see"/>"/>
											</logic:greaterThan>
										</td>
									</tr>
								</html:form>
							
								<html:form action="setSellerPicture.do"  method="POST" enctype="multipart/form-data">
									<tr height="70">
										<td width="30" align="center">
											<logic:equal name="sellerSession" property="mainPicture" value="5">
												<img src="pictures/mainPictureIcon.gif" alt="<bean:message key="showSellerPictures.mainPicture"/>"/>
											</logic:equal>
											<logic:equal name="sellerSession" property="picture5Waiting" value="1">
												<img src="pictures/eyeIcon.gif" alt="<bean:message key="showSellerPictures.waitingForRevision"/>"/>
											</logic:equal>
										</td>
										<td width="80" align="center">
											<logic:greaterThan name="sellerSession" property="picture5" value="1">
												<img src="/media/pictures/smaller/seller_<bean:write name="sellerSession" property="id"/>_5_<bean:write name="sellerSession" property="picture5"/>.jpg"/>
											</logic:greaterThan>
											<logic:equal name="sellerSession" property="picture5" value="0">
												<img src="pictures/emptyPicture.gif"/>
											</logic:equal>
										</td>
										<td width="250" align="center">
											<logic:equal name="sellerSession" property="picture5" value="0">
												<html:file property="pictureFile" styleClass="form"/>
												<html:hidden property="index" value="5"/>
											</logic:equal>
										</td>
										<td width="70" align="center">
											<logic:greaterThan name="sellerSession" property="picture5" value="0">
												<input type="button" class="form" onclick="document.location.href='deleteSellerPicture.do?index=5'" value="<bean:message key="showSellerPictures.delete"/>"/>
											</logic:greaterThan>
											<logic:equal name="sellerSession" property="picture5" value="0">
												<html:submit styleClass="form" onclick="document.getElementById('uploadDiv').style.visibility='visible';document.getElementById('uploadBackgroundDiv').style.visibility='visible';"><bean:message key="showSellerPictures.add"/></html:submit>
											</logic:equal>
										</td>
										<td width="200" align="center">
											<logic:greaterThan name="sellerSession" property="picture5" value="1">
												<logic:notEqual name="sellerSession" property="mainPicture" value="5">
													<logic:notEqual name="sellerSession" property="picture5Waiting" value="1">
														<input type="button" class="form" onclick="document.location.href='setSellerMarkAsMainPicture.do?index=5'" value="<bean:message key="showSellerPictures.markAsMain"/>"/>
													</logic:notEqual>
												</logic:notEqual>
											</logic:greaterThan>
										</td>
										<td width="60" align="center">
											<logic:greaterThan name="sellerSession" property="picture5" value="1">
												<input type="button" class="form" onclick="document.location.href='showSellerSeePicture.do?index=5'" value="<bean:message key="showSellerPictures.see"/>"/>
											</logic:greaterThan>
										</td>
									</tr>
								</html:form>
										
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
	
	<div id="uploadBackgroundDiv" style="position:absolute;top:90;visibility:hidden;filter:alpha(opacity=25);opacity: 0.25;-moz-opacity:0.25;">
		<table width="720" height="620" style="background:black;">
			<tr width="100%">
				<td width="100%" align="center" valign="middle">
					
				</td>
			</tr>
		</table>
	</div>
	
	<div id="uploadDiv" style="position:absolute;top:280;visibility:hidden;">
		<table width="720">
			<tr width="100%">
				<td width="100%" align="center" valign="middle">
					<table width="300" height="180" cellpadding="4" class="activationDivTable">
						<tr width="100%">
							<td width="100%" align="center" class="data3Text">
								<bean:message key="showSellerPictures.divText1"/>
							</td>
						</tr>
						<tr><td height="5"></td></tr>
						<tr width="100%">
							<td width="100%" align="center" class="data2Text">
								<bean:message key="showSellerPictures.divText2"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	


	</tiles:put>
</tiles:insert>
