<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-tiles.tld' prefix="tiles" %>


<logic:present name="buyerSession">
	<table width="720" cellpadding="0" cellspacing="0" border="0" >
		<tr>
			<td width="14" height="46" background="pictures/buyerLeftMenu.gif">
			</td>
			<td width="692" height="46" background="pictures/buyerCenterMenu.gif" >	
				<table width="692" cellpadding="0" cellspacing="0" border="0">
					<tr>
						<td align="center" valign="middle" class="menuText">
							<a href="showBuyerStart.do" class="menuLink"><bean:message key="buyerMenu.start"/></a>&nbsp;|
							<a href="showBuyerSellerSearch.do" class="menuLink"><bean:message key="buyerMenu.search"/></a>&nbsp;|
							<a href="showBuyerContact.do" class="menuLink"><bean:message key="buyerMenu.contacts"/></a>&nbsp;|
							<a href="showBuyerVote.do" class="menuLink"><bean:message key="buyerMenu.votes"/></a>&nbsp;|
							<a href="showBuyerInvitation.do" class="menuLink"><bean:message key="buyerMenu.invitations"/></a>&nbsp;|
							<a href="showBuyerAccount.do" class="menuLink"><bean:message key="buyerMenu.profile"/></a>&nbsp;|
							<a href="buyerLogoff.do" class="menuLink"><bean:message key="buyerMenu.exit"/></a>
						</td>
					</tr>
				</table>
			</td>
			<td width="14" height="46" background="pictures/buyerRightMenu.gif">
			</td>
		</tr>
	</table>
</logic:present>