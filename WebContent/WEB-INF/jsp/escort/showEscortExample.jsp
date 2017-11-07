<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/amandris.tld" prefix="amandris" %>

<tiles:insert template='../tiles/amandrisSellerTile.jsp'>
	<tiles:put name='logoTile' content='logoTile.jsp'/>
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
				<table width="98%" cellpadding="0" cellspacing="0" border="0">
					<tr><td height="5"></td></tr>
					<tr>
						<td class="data2Text" align="center">
							Ejemplos de perfiles: Normal y Profesional
						</td>
					</tr>
					<tr><td height="10"></td></tr>
					<tr><td height="1" background="pictures/pixel.gif"></td></tr>
					<tr><td height="10"></td></tr>
					<tr align="center">
						<td>
							<table cellpadding="3" cellspacing="2" border="0" class="data1Text" >
								<tr>
									<td class="data3Text" align="center">
										Normal
									</td>
									<td  class="data3Text" align="center">
										Profesional
									</td>
								</tr>
								<tr style="vertical-align:top;">
									<td>
										<img src="pictures/normalProfileExample.jpg"/>
									</td>
									<td>
										<img src="pictures/premiumProfileExample.jpg"/>
									</td>
								</tr>
								<tr>
									<td valign="top">
										<ul>
											<li>Gratuito</li>
											<li>Muestra estadísticas, votos recibidos y preferencias</li>
											<li>Cambios ilimitados en las fotos y la información del perfil</li>
											<li>Los demandantes registrados en Amandris le pueden pedir citas de forma gratuita</li>
										</ul>
									</td>
									<td valign="top">
										<ul>
											<li>Gratuito</li>
											<li>Muestra información de contacto en el perfil (Teléfono, e-mail, etc...)</li>
											<li>Diseño de página más atractivo</li>
											<li>Oculta estadísticas, votos recibidos y preferencias</li>
											<li>Cambios ilimitados en las fotos y la información del perfil</li>
											<li>Aparece primero en las búsquedas, en la página inicial de Amandris y en los boletines</li>
											<li>Los demandantes registrados en Amandris le pueden pedir citas de forma gratuita</li>
										</ul>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr><td height="25"></td></tr>
					<tr>
						<td class="data3Text" align="center">
							<input type="button" value="Cerrar" class="form" onclick="window.close();"/>
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
