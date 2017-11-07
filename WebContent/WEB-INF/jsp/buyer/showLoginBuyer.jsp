<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<tiles:insert template='../tiles/amandrisBuyerTile.jsp'>
	<tiles:put name='logoTile' content='logoTile.jsp'/>
	<logic:present name="buyerSession">
		<tiles:put name='buyerMenuTile' content=''/>
	</logic:present>
	<logic:present name="sellerSession">
		<tiles:put name='sellerMenuTile' content=''/>
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
				<table cellpadding="10">
					<tr>
						<td class="data3Text" align="center">
							<bean:message key="showLoginBuyer.title"/>
						</td>
					</tr>
					<tr>
						<td class="data1Text">
							<bean:message key="showLoginBuyer.text1"/>
						</td>
					</tr>
					<tr>
						<td align="center">
							<table>
								<html:form action="buyerLogin">
									<tr>
										<td width="50%" class="data1Text" align="right">
											<b><bean:message key="showLoginBuyer.login"/></b>
										</td>
										<td width="50%" align="left">
											<html:text property="login" styleClass="form" size="10"/><br>
										</td>
									</tr>
									<tr><td colspan="2" height="10"></td></tr>
									<tr>
										<td width="50%" class="data1Text" align="right">
											<b><bean:message key="showLoginBuyer.password"/></b>
										</td>
										<td width="50%" align="left">
											<html:password property="password" styleClass="form" size="10"/>
										</td>
									</tr>
									<tr><td colspan="2" height="10"></td></tr>
									<tr>
										<td colspan="2" height="20" class="errorText">
											<html:errors/>
										</td>
									</tr>
									<tr><td colspan="2" height="10"></td></tr>
									<tr>
										<td colspan="2" align="center">
											<html:submit styleClass="form"><bean:message key="showLoginBuyer.accept"/></html:submit>
										</td>
									</tr>
									<tr><td colspan="2" height="50"></td></tr>
									<tr>
										<td colspan="2" align="center">
											<a href="showBuyerPasswordReset.do" class="data2Link"><bean:message key="showLoginBuyer.forgotPassword"/></a>
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


	</tiles:put>
</tiles:insert>
