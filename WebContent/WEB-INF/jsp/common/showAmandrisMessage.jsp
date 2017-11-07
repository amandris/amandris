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
			<td height="450" class="errorText" align="center">	
				<table width="95%" cellpadding="0" cellspacing="0" border="0">
					<html:form action="setAmandrisMessage.do">
						<tr>
							<td class="data2Text" align="center">
								<bean:message key="showAmandrisMessage.text1"/>
							</td>
						</tr>
						<tr><td height="15"></td></tr>
						<tr>
							<td class="errorText" align="center">
								<html:errors/>
							</td>
						</tr>
						<tr><td height="15"></td></tr>
						<tr>
							<td align="center">
								<table width="80%" cellpadding="0" cellspacing="10" border="0">
									<tr valign="top">
										<td class="data1Text">
											<bean:message key="showAmandrisMessage.email"/>
										</td>
										<td>
											<html:text property="email" styleClass="form" size="40"/>
										</td>
									</tr>
									<tr valign="top">
										<td class="data1Text">
											<bean:message key="showAmandrisMessage.subject"/>
										</td>
										<td>
											<html:text property="subject" styleClass="form" size="40"/>
										</td>
									</tr>
									<tr valign="top">
										<td class="data1Text">
											<bean:message key="showAmandrisMessage.text"/>
										</td>
										<td>
											<html:textarea property="text" styleClass="form" rows="15" cols="60"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td height="20"></td></tr>
						<tr>
							<td align="center">
								<html:submit styleClass="form"><bean:message key="showAmandrisMessage.send"/></html:submit>
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
