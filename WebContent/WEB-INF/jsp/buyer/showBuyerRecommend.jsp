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
  			  	<table width="704" cellpadding="0" cellspacing="0" border="0" valign="top">
			  		<tr>
			  			<td>
  						  	<table width="704" cellpadding="0" cellspacing="0" border="0">
  						  		<html:form action="setBuyerRecommend.do">
	  						  		<tr>
  						  				<td class="data3Text" align="center">
  						  					<b><bean:message key="showBuyerRecommend.title"/></b>
  						  				</td>
  						  			</tr>
  						  			<tr><td height="20"></td></tr>
		  						  	<tr>
  						  				<td class="data1Text" align="center">
  						  					<bean:message key="showBuyerRecommend.text"/>
  						  				</td>
  						  			</tr>
									<tr>
	  						  			<td height="30" class="errorText" align="center" valign="middle">
	  						  				<html:errors/>
	  						  			</td>
  						  			</tr>			  						  			
  						  			<tr>
  						  				<td  align="center">
  						  					<table width="50%" cellpadding="3" cellspacing="0">
  						  						<tr>
  						  							<td nowrap class="data2Text">
  						  								<bean:message key="showBuyerRecommend.name"/>
  						  							</td>
  						  							<td>
  						  								<b><html:text property="name" styleClass="form"  size="40"/></b>
  						  							</td>
  						  						</tr>
  						  						<tr>
  						  							<td nowrap class="data2Text">
  						  								<bean:message key="showBuyerRecommend.email"/>
  						  							</td>
  						  							<td>
  						  								<b><html:text property="email" styleClass="form"  size="40"/></b>
  						  							</td>
  						  						</tr>
  						  						<tr>
  						  							<td nowrap class="data2Text" valign="top">
  						  								<bean:message key="showBuyerRecommend.message"/>
  						  							</td>
  						  							<td>
  						  								<b><html:textarea property="message" styleClass="form" cols="40" rows="10"/></b>
  						  							</td>
  						  						</tr>
								  			</table>
								  		</td>
								  	</tr>
								  	<tr><td height="40"></td></tr>
								  	<tr>
								  		<td align="center">
								  			<html:submit styleClass="form"><bean:message key="showBuyerRecommend.send"/></html:submit>
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
