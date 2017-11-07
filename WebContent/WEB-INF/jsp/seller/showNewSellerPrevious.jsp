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
	<script type="text/javascript">
		function send(){
			if( document.getElementById("sellerType1").checked){
				document.location.href="showNewSellerOne.do"
			}
			
			if( document.getElementById("sellerType2").checked){
				document.location.href="showNewEscortOne.do"
			}
		}
		
	</script>
	
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
				<table width="90%" cellpadding="0" cellspacing="0" border="0">
					<tr><td height="5"></td></tr>
					<tr>
						<td class="data1Text" align="center">
							Elija el tipo de ofertante que desea ser. Puede elegir entre <b>Ofertante normal</b> u <b>Ofertante profesional</b>.
						</td>
					</tr>
					<tr><td height="10"></td></tr>
					<tr>
						<td class="data1Text" align="center">
							Dependiendo de que tipo de usuario sea usted y deberá escoger uno u otro. Lea más abajo las características de cada perfil para saber cual es el más adecuado para usted. <b>Ambos tipos de perfiles son totalmente gratuitos</b>
						</td>
					</tr>
					<tr><td height="20"></td></tr>
					<tr>
						<td class="data3Text" align="left">
							<b>Tipo de ofertante</b>
						</td>
					</tr>
					<tr><td height="5"></td></tr>
					<tr><td height="1" background="pictures/pixel.gif"></td></tr>
					<tr><td height="15"></td></tr>
					<tr>
						<td class="data3Text" align="center">
							<a href="showSellerTypeTable.do" class="data2Link" target="_blank">Ver tabla comparativa</a>
						</td>
					</tr>
					<tr>
						<form>
							<td>
								<table cellpadding="0" cellspacing="0" border="0" align="left">
									<tr height="200">
										<td class="data1Text" align="left">
											<input type="radio" name="sellerType" id="sellerType1" checked="true"/>
										</td>
										<td width="5"></td>
										<td class="data2Text" align="left">
											<b>Normal</b>
										</td>
										<td width="15"></td>
										<td class="data1Text" align="left" >
											Perfil recomendado para personas que simplemente quieren ofrecerse para tener citas con la intención de <b>conocer gente, hacer amigos, tener relaciones sexuales, etc...</b><p/>El ofertante podrá, si lo desea, cobrar a los demandantes por tener citas con ellos.<p/>En este perfil <b>no se pueden mostrar números de teléfono ni otros datos de contacto</b>. Su aspecto es sencillo y muestra datos del ofertante como sus estadísticas de contacto, votos recibidos, preferencias, etc...  
										</td>
									</tr>
									<tr height="200">
										<td class="data1Text" align="left">
											<input type="radio" name="sellerType" id="sellerType2"/>
										</td>
										<td width="5"></td>
										<td class="data2Text" align="left">
											<b>Profesional</b>
										</td>
										<td width="15"></td>
										<td class="data1Text" align="left" >
											Perfil recomendado para <b>escorts, agencias, clubes o personas que se dediquen de forma profesional a las citas</b> que se quieran publicitar de la mejor forma en Internet.<p/>Este perfil tiene un aspecto mucho más vistoso y atractivo. Además <b>no hay restricciones a la hora de mostrar números de teléfono ni direcciones de e-mail</b>.<p/>Se ocultarán las estadísticas de contacto, las preferencias y los votos recibidos ya que carecen de relevancia.<p/> 
										</td>
									</tr>
								</table>
							</td>
						</form>
					</tr>
					<tr>
						<td class="data3Text" align="right">
							<input type="button" value="Continuar..." class="form" onclick="send();"/>
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
