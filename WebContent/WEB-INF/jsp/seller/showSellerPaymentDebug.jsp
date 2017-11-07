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
					<html:form action="setSellerPaymentDebug.do">
						<tr>
							<td align="center" class="data1Text">
								Test de compra de créditos. Sólo para debug.
							</td>
						</tr>
						<tr>
							<td height="10" align="center" class="errorText">
								<html:errors/>
							</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td align="center">
								<table width="60%" cellpadding="0" cellspacing="0" boder="0">
									<tr height="64">
										<td align="left" class="data1Text">
											Créditos 
											<html:text property="credits" styleClass="form"/>
											<html:hidden property="userId" styleClass="form"/>
											<html:hidden property="userLogin" styleClass="form"/>
											
										</td>
									</tr>								
								</table>
							</td>
						</tr>
						<tr><td height="20"></td></tr>
						<tr>
							<td align="right" class="data1Text">
								<html:submit styleClass="form">Comprar créditos</html:submit>
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
