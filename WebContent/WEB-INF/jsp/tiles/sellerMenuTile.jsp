<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-tiles.tld' prefix="tiles" %>


<logic:present name="sellerSession">
	<table width="720" cellpadding="0" cellspacing="0" border="0" >
		<tr>
			<td width="14" height="40" background="pictures/sellerLeftMenu.gif">
			</td>
			<td width="692" height="40" background="pictures/sellerCenterMenu.gif" >	
				<table width="692" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td align="center" valign="middle" class="menuText">
							<a href="showSellerStart.do" class="menu2Link"><bean:message key="sellerMenu.start"/></a>&nbsp;|
							<a href="showSellerBuyerSearch.do" class="menu2Link"><bean:message key="sellerMenu.search"/></a>&nbsp;|
							<a href="showSellerContact.do" class="menu2Link"><bean:message key="sellerMenu.contacts"/></a>&nbsp;|
							<a href="showSellerCalendar.do" class="menu2Link"><bean:message key="sellerMenu.configuration"/></a>&nbsp;|
							<logic:equal name="sellerSession" property="isEscort" value="0">							
								<a href="showSellerVote.do" class="menu2Link"><bean:message key="sellerMenu.votes"/></a>&nbsp;|
							</logic:equal>
							<a href="showSellerInvitation.do" class="menu2Link"><bean:message key="sellerMenu.invitations"/></a>&nbsp;|
							<a href="showSellerAccount.do" class="menu2Link"><bean:message key="sellerMenu.profile"/></a>&nbsp;|
							<a href="sellerLogoff.do" class="menu2Link"><bean:message key="sellerMenu.exit"/></a>
						</td>
					</tr>
				</table>
			</td>
			<td width="14" height="40" background="pictures/sellerRightMenu.gif">
			</td>
		</tr>
	</table>
</logic:present>