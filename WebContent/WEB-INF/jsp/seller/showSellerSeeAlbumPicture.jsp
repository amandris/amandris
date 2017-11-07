<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/amandris.tld" prefix="amandris" %>

<tiles:insert template='../tiles/amandrisAlbumPictureTile.jsp'>
	<tiles:put name='logoTile' content='logoTile.jsp'/>
	<tiles:put name='sellerMenuTile' content='sellerMenuTile.jsp'/>
	<tiles:put name='footer2Tile' content='footer2Tile.jsp'/>
	<tiles:put name='footer3Tile' content='footer3Tile.jsp'/>
	<tiles:put name='body' type='string'>
	  <table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr valign="top">
			<td>	
				<table cellpadding="0" cellspacing="0" boder="0">
					<tr>
						<td align="center">
							<button class="form" onclick="document.location.href='showSellerAlbum.do'"><bean:message key="showSellerSeeAlbumPicture.back"/></button>
						</td>
					</tr>
					<tr><td height="15"></td></tr>
					<tr>
						<td>
							<img src="<bean:write name="pictureFileName"/>" border="0"/>
						</td>
					</tr>
					<tr><td height="15"></td></tr>
					<tr>
						<td align="center">
							<button class="form" onclick="document.location.href='showSellerAlbum.do'"><bean:message key="showSellerSeeAlbumPicture.back"/></button>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
	</table>


	</tiles:put>
</tiles:insert>
