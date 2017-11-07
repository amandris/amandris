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
			<td height="450" align="center">	
				<table width="90%" cellspadding="0" cellspacing="0" border="0">
					<tr>
						<td class="data1Text" align="center">
							<bean:message key="showSellerAlbum.text1"/>
						</td>
					</tr>
					<tr><td height="10"></td></tr>
					<tr>
						<td class="data1Text" align="center">
							<bean:message key="showSellerAlbum.text2"/>&nbsp;<a href="showPictureRules.do" class="data1Link"><bean:message key="showSellerAlbum.here"/></a>.
						</td>
					</tr>
					<tr><td height="10"></td></tr>
					<tr><td height="1" background="pictures/pixel.gif"></td></tr>
					<tr><td height="10"></td></tr>
					<tr>
						<td class="errorText" align="center">
							<html:errors/>
						</td>
					</tr>
					<tr>
						<td>
							<table cellspadding="5" cellspacing="5" border="0">
								<html:form action="setSellerAlbumElement.do" method="POST" enctype="multipart/form-data">
									<tr>
										<td class="data1Text" align="center">
											<html:file property="pictureFile" styleClass="form"/>
										</td>
										<td>
											<html:submit styleClass="form"><bean:message key="showSellerAlbum.save"/></html:submit>
										</td>
									</tr>
								</html:form>
							</table>
						</td>
					</tr>
					<tr><td height="10"></td></tr>
					<tr><td height="1" background="pictures/pixel.gif"></td></tr>
					<tr><td height="10"></td></tr>
					<tr>
						<td class="data1Text" align="center">
							<table>
								<logic:iterate name="sellerAlbumElement" id="collection1">
									<tr>
										<logic:iterate name="collection1" id="collection2">
											<td align="center">
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td align="center">
															<a href="showSellerSeeAlbumPicture.do?id=<bean:write name="collection2" property="id"/>">
																<img src="/media/album/smaller/seller_<bean:write name="collection2" property="sellerId"/>_<bean:write name="collection2" property="code"/>.jpg" border="0" alt="<bean:message key="showSellerAlbum.clickForRealSize"/>"/>
															</a>
														</td>
													</tr>
													<tr>
														<td align="center">
															<table>
																<tr>
																	<td>
																		<logic:equal name="collection2" property="active" value="0">
																			<img src="pictures/eyeIcon.gif" border="0" alt="<bean:message key="showSellerAlbum.isWaiting"/>"/>
																		</logic:equal>
																	</td>
																	<td>
																		<button class="form" onclick="document.location.href='deleteSellerAlbumPicture.do?id=<bean:write name="collection2" property="id"/>'";><bean:message key="showSellerAlbum.delete"/></button>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</logic:iterate>
									</tr>
								</logic:iterate>	
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
