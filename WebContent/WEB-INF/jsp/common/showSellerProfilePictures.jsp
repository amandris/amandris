<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<tiles:insert template='../tiles/amandrisBuyerTile.jsp'>
	<tiles:put name='logoTile' content='logoTile.jsp'/>
	<logic:present name="buyerSession">
		<tiles:put name='buyerMenuTile' content='buyerMenuTile.jsp'/>
	</logic:present>
	<logic:present name="sellerSession">
		<tiles:put name='sellerMenuTile' content='sellerMenuTile.jsp'/>
	</logic:present>
	<tiles:put name='footer1Tile' content='footer1Tile.jsp'/>	
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
					<tr>
						<td align="center">
							<table cellspadding="0" cellspacing="0" border="0">
								<tr>
									<logic:greaterEqual name="profilePictures" property="picturesCount" value="1">
										<td align="center" width="80" class="data1Text">
											<logic:notEqual name="profilePictures" property="bigPictureIndex" value="1">
												<a href="showSellerProfilePictures.do?id=<bean:write name="profilePictures" property="userId"/>&picture=<bean:write name="profilePictures" property="picture1Index"/>" class="data1Link">
											</logic:notEqual>
											<img src="/media/pictures/smaller/<bean:write name="profilePictures" property="picture1FileName"/>" border="0"/>
											<br>
											<bean:message key="showSellerProfilePictures.picture1"/>
											<logic:notEqual name="profilePictures" property="bigPictureIndex" value="1">
												</a>
											</logic:notEqual>
										</td>
									</logic:greaterEqual>
									<logic:greaterEqual name="profilePictures" property="picturesCount" value="2">
										<td align="center" width="80" class="data1Text">
											<logic:notEqual name="profilePictures" property="bigPictureIndex" value="2">
												<a href="showSellerProfilePictures.do?id=<bean:write name="profilePictures" property="userId"/>&picture=<bean:write name="profilePictures" property="picture2Index"/>" class="data1Link">
											</logic:notEqual>
											<img src="/media/pictures/smaller/<bean:write name="profilePictures" property="picture2FileName"/>" border="0"/>
											<br>
											<bean:message key="showSellerProfilePictures.picture2"/>
											<logic:notEqual name="profilePictures" property="bigPictureIndex" value="2">
												</a>
											</logic:notEqual>
										</td>
									</logic:greaterEqual>
									<logic:greaterEqual name="profilePictures" property="picturesCount" value="3">
										<td align="center" width="80" class="data1Text">
											<logic:notEqual name="profilePictures" property="bigPictureIndex" value="3">
												<a href="showSellerProfilePictures.do?id=<bean:write name="profilePictures" property="userId"/>&picture=<bean:write name="profilePictures" property="picture3Index"/>" class="data1Link">
											</logic:notEqual>
											<img src="/media/pictures/smaller/<bean:write name="profilePictures" property="picture3FileName"/>" border="0"/>
											<br>
											<bean:message key="showSellerProfilePictures.picture3"/>
											<logic:notEqual name="profilePictures" property="bigPictureIndex" value="3">
												</a>
											</logic:notEqual>
										</td>
									</logic:greaterEqual>
									<logic:greaterEqual name="profilePictures" property="picturesCount" value="4">
										<td align="center" width="80" class="data1Text">
											<logic:notEqual name="profilePictures" property="bigPictureIndex" value="4">
												<a href="showSellerProfilePictures.do?id=<bean:write name="profilePictures" property="userId"/>&picture=<bean:write name="profilePictures" property="picture4Index"/>" class="data1Link">
											</logic:notEqual>
											<img src="/media/pictures/smaller/<bean:write name="profilePictures" property="picture4FileName"/>" border="0"/>
											<br>
											<bean:message key="showSellerProfilePictures.picture4"/>
											<logic:notEqual name="profilePictures" property="bigPictureIndex" value="4">
												</a>
											</logic:notEqual>
										</td>
									</logic:greaterEqual>
									<logic:greaterEqual name="profilePictures" property="picturesCount" value="5">
										<td align="center" width="80" class="data1Text">
											<logic:notEqual name="profilePictures" property="bigPictureIndex" value="5">
												<a href="showSellerProfilePictures.do?id=<bean:write name="profilePictures" property="userId"/>&picture=<bean:write name="profilePictures" property="picture5Index"/>" class="data1Link">
											</logic:notEqual>
											<img src="/media/pictures/smaller/<bean:write name="profilePictures" property="picture5FileName"/>" border="0"/>
											<br>
											<bean:message key="showSellerProfilePictures.picture5"/>
											<logic:notEqual name="profilePictures" property="bigPictureIndex" value="5">
												</a>
											</logic:notEqual>
										</td>
									</logic:greaterEqual>
								</tr>
							</table>	
						</td>
					</tr>
					<tr>
						<td height="40" align="center" valign="middle">
							<button class="form" onclick="document.location.href='showSeller.do?id=<bean:write name="profilePictures" property="userId"/>'"><bean:message key="showSellerProfilePictures.backToProfile"/></button>
						</td>
					</tr>
					<tr>
						<td align="center">
							<img src="/media/pictures/original/<bean:write name="profilePictures" property="bigPictureFileName"/>" border="0"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="center" valign="middle">
							<button class="form" onclick="document.location.href='showSeller.do?id=<bean:write name="profilePictures" property="userId"/>'"><bean:message key="showSellerProfilePictures.backToProfile"/></button>
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
