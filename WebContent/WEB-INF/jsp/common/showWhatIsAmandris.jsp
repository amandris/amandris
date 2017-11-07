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
				<table width="85%" cellpadding="0" cellspacing="10" border="0">
					<tr>
						<td class="data3Text">
							<b><bean:message key="showWhatIsAmandris.title"/></b>
						</td>
					</tr>
					<tr>
						<td class="data2Text" style="text-align:justify;">
							<bean:message key="showWhatIsAmandris.text1"/>
						</td>
					</tr>
					<tr><td height="15"></td></tr>
					<tr>
						<td align="center" class="data1Text">
							<img src="pictures/whatIsAmandris1.gif"/><br>
							<bean:message key="showWhatIsAmandris.picture1"/>
						</td>
					</tr>
					<tr><td height="15"></td></tr>
					
					<tr>
						<td class="data2Text" style="text-align:justify;">
							<bean:message key="showWhatIsAmandris.text2"/>
						</td>
					</tr>
					<tr><td height="15"></td></tr>
					<tr>
						<td align="center" class="data1Text">
							<img src="pictures/whatIsAmandris2.gif"/><br>
							<bean:message key="showWhatIsAmandris.picture2"/>
						</td>
					</tr>
					<tr><td height="15"></td></tr>
					
					<tr>
						<td class="data2Text" style="text-align:justify;">
							<bean:message key="showWhatIsAmandris.text3"/>
						</td>
					</tr>
					<tr><td height="15"></td></tr>
					<tr>
						<td align="center" class="data1Text">
							<img src="pictures/whatIsAmandris3.gif"/><br>
							<bean:message key="showWhatIsAmandris.picture3"/>
						</td>
					</tr>
					<tr><td height="15"></td></tr>
					
					<tr>
						<td class="data2Text" style="text-align:justify;">
							<bean:message key="showWhatIsAmandris.text4"/>
						</td>
					</tr>
					<tr><td height="15"></td></tr>
					<tr>
						<td align="center" class="data1Text">
							<img src="pictures/whatIsAmandris4.gif"/><br>
							<bean:message key="showWhatIsAmandris.picture4"/>
						</td>
					</tr>
					<tr><td height="15"></td></tr>
					
					<tr>
						<td class="data2Text" style="text-align:justify;">
							<bean:message key="showWhatIsAmandris.text5"/>
						</td>
					</tr>
					<tr><td height="15"></td></tr>
					<tr>
						<td align="center" class="data1Text">
							<img src="pictures/whatIsAmandris5.gif"/><br>
							<bean:message key="showWhatIsAmandris.picture5"/>
						</td>
					</tr>
					<tr><td height="15"></td></tr>
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
