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
							Tabla comparativa de los dos tipos de ofertantes que existen: <b>Normal</b> y <b>premium</b>.
						</td>
					</tr>
					<tr><td height="10"></td></tr>
					<tr><td height="1" background="pictures/pixel.gif"></td></tr>
					<tr><td height="50"></td></tr>
					<tr align="center">
						<td>
							<table cellpadding="3" cellspacing="2" border="0" class="data1Text" >
								<tr bgcolor="#AE377D">
									<td class="data2Text" bgcolor="#FFFFFF" style="color:#FFFFFF;">
									</td>
									<td class="data2Text" style="color:#FFFFFF;width:90px;" align="center">
										<b>Normal</b>
									</td>
									<td width="100" class="data2Text" style="color:#FFFFFF;width:90px;" align="center">
										<b>Profesional</b>
									</td>
									<td bgcolor="#FFFFFF"></td>
								</tr>
								<tr align="center">
									<td class="data2Text" align="right">
										Gratuito
									</td>
									<td>
										<img src="pictures/yesIcon.gif" alt="Sí"/>
									</td>
									<td>
										<img src="pictures/yesIcon.gif" alt="Sí"/>
									</td>
									<td></td>
								</tr>
								<tr align="center">
									<td class="data2Text" align="right">
										Posibilidad de pedir cita usando Amandris
									</td>
									<td>
										<img src="pictures/yesIcon.gif" alt="Sí"/>
									</td>
									<td>
										<img src="pictures/yesIcon.gif" alt="Sí"/>
									</td>
									<td></td>
								</tr>	
								<tr align="center">
									<td class="data2Text" align="right">
										Muestra fotos, servicios, precios por hora, y texto personal
									</td>
									<td>
										<img src="pictures/yesIcon.gif" alt="Sí"/>
									</td>
									<td>
										<img src="pictures/yesIcon.gif" alt="Sí"/>
									</td>
								</tr>
								<tr align="center">
									<td class="data2Text" align="right">
										Cambios ilimitados en textos,fotos,servicios,etc...
									</td>
									<td>
										<img src="pictures/yesIcon.gif" alt="Sí"/>
									</td>
									<td>
										<img src="pictures/yesIcon.gif" alt="Sí"/>
									</td>
								</tr>
								<tr align="center">
									<td class="data2Text" align="right">
										Los demandantes les piden citas de forma gratuita  
									</td>
									<td>
										<img src="pictures/yesIcon.gif" alt="Sí"/>
									</td>
									<td>
										<img src="pictures/yesIcon.gif" alt="Sí"/>
									</td>
									<td></td>
								</tr>
								<tr align="center">
									<td class="data2Text" align="right">
										Diseño atractivo
									</td>
									<td>
										<img src="pictures/noIcon.gif" alt="No"/>
									</td>
									<td>
										<img src="pictures/yesIcon.gif" alt="Sí"/>
									</td>
									<td><a href="showEscortExample.do" class="data1Link">Ver ejemplo</a></td>
								</tr>
								<tr align="center">
									<td class="data2Text" align="right">
										Oculta estadísticas, votos y preferencias
									</td>
									<td>
										<img src="pictures/noIcon.gif" alt="No"/>
									</td>
									<td>
										<img src="pictures/yesIcon.gif" alt="Sí"/>
									</td>
									<td></td>
								</tr>								
								<tr align="center">
									<td class="data2Text" align="right">
										Muestra información de contacto
									</td>
									<td>
										<img src="pictures/noIcon.gif" alt="No"/>
									</td>
									<td>
										<img src="pictures/yesIcon.gif" alt="Sí"/>
									</td>
									<td></td>
								</tr>
								<tr align="center">
									<td class="data2Text" align="right">
										Primero en búsquedas, página principal y boletines  
									</td>
									<td>
										<img src="pictures/noIcon.gif" alt="No"/>
									</td>
									<td>
										<img src="pictures/yesIcon.gif" alt="Sí"/>
									</td>
									<td></td>
								</tr>
								
												
							</table>
						</td>
					</tr>
					<tr><td height="100"></td></tr>
					<tr>
						<td class="data3Text" align="center">
							<input type="button" value="Cerrar" class="form" onclick="window.close();"/>
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
