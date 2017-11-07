<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-tiles.tld' prefix="tiles" %>


<table width="100%" cellpadding="0" cellspacing="0" border="0" >
	<tr>
		<td  bgcolor="#FFFFFF" >	
			<script type="text/javascript" src="javascript/milonic_src.js"></script>	
			<div class=milonic><a href="http://www.milonic.com/">JavaScript Menu, DHTML Menu Powered By Milonic</a></div>
			<script	type="text/javascript">
				if(ns4)_d.write("<scr"+"ipt type=text/javascript src=javascript/mmenuns4.js><\/scr"+"ipt>");		
				  else _d.write("<scr"+"ipt type=text/javascript src=javascript/mmenudom.js><\/scr"+"ipt>"); 
			</script>
			<script type="text/javascript" src="javascript/menu_data.js"></script>	
			<script type="text/javascript">
				with(milonic=new menuname("Main Menu")){
					alwaysvisible=1;
					orientation="horizontal";
					style=menuStyle;
					top=0;
					aI("showmenu=Censura;text=Censura;url=showAdminCensorBuyer.do;");
					aI("showmenu=Mensajes;text=Mensajes;url=showAdminReceivedMessage.do;");
					aI("showmenu=Demandante;text=Demandante;url=showAdminSendMessageToBuyer.do");
					aI("showmenu=Ofertante;text=Ofertante;url=showAdminSendMessageToSeller.do;");
					aI("showmenu=Estadisticas;text=Estadísticas;url=showAdminStatistics.do;");
					aI("showmenu=Salir;text=Salir;url=adminLogoff.do;");
				}
				
				with(milonic=new menuname("Censura")){
					style=subMenuStyle;
					aI("text=Demandantes;url=showAdminCensorBuyer.do;");
					aI("text=Ofertantes;url=showAdminCensorSeller.do;");
					aI("text=Votos a Demandantes;url=showAdminCensorVoteToBuyer.do;");
					aI("text=Votos a Ofertantes;url=showAdminCensorVoteToSeller.do;");
					aI("text=Fotos de Demandantes;url=showAdminCensorBuyerPicture.do;");
					aI("text=Fotos de Ofertantes;url=showAdminCensorSellerPicture.do;");
					aI("text=Fotos de Álbum;url=showAdminCensorAlbumElement.do;");
				}
				
				with(milonic=new menuname("Mensajes")){
					style=subMenuStyle;
					aI("text=Mensajes recibidos;url=showAdminReceivedMessage.do;");
				}
				
				with(milonic=new menuname("Demandante")){
					style=subMenuStyle;
					aI("text=Enviar mensaje;url=showAdminSendMessageToBuyer.do;");
					aI("text=Borrar;url=showAdminDeleteBuyer.do;");
					aI("text=Editar;url=showAdminEditBuyer.do;");
				}
				
				with(milonic=new menuname("Ofertante")){
					style=subMenuStyle;
					aI("text=Enviar mensaje;url=showAdminSendMessageToSeller.do;");
					aI("text=Borrar;url=showAdminDeleteSeller.do;");
					aI("text=Editar;url=showAdminEditSeller.do;");
				}
				
				with(milonic=new menuname("Estadisticas")){
					style=subMenuStyle;
					aI("text=Contactos;url=showAdminStatisticsContact.do;");
					aI("text=Compra cresditos;url=showAdminStatisticsBuyCredits.do;");
					aI("text=Promociones;url=showAdminStatisticsPromotion.do;");
				}
				
				
				drawMenus();
			</script>	
		</td>
		<td width="2500" height="24" bgcolor="#0C77BD" >
		</td>
	</tr>
</table>