<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<%@ page import="java.util.Collection, java.util.Locale, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, javax.servlet.http.HttpSession, org.apache.struts.action.ActionForm, org.apache.struts.action.ActionForward, org.apache.struts.action.ActionMapping, com.amandris.clients.service.facade.PromotionFacade, com.amandris.clients.service.facade.UtilFacade, com.amandris.clients.util.Constant, com.amandris.clients.web.util.CountryState" %>


<%
		HttpSession 	session2 		= request.getSession();
		PromotionFacade	promotionFacade = new PromotionFacade();
		UtilFacade		utilFacade		= UtilFacade.getInstance();
		Locale			locale			= request.getLocale();
		CountryState 	countryState	= new CountryState();
		Collection		collection		= null;
		
		collection = promotionFacade.getShowInIndexSellerRandomSellection( locale);
		
		countryState = ( CountryState) session.getAttribute( Constant.COUNTRY_STATE_OBJECT_NAME);
		
		if( countryState == null) {
			countryState = utilFacade.getCountryState( false, locale);
			countryState.setLocale( locale);
			if( locale != null) {
				countryState.setSelectedCountry	( new Integer( 70));
				countryState.setSelectedState( new Integer( 0));
			}
		}
		
		session2.setAttribute( Constant.COUNTRY_STATE_OBJECT_NAME, countryState);
		request.setAttribute( Constant.SHOW_IN_INDEX_SELLER_OBJECT_NAME, collection);

%>

<tiles:insert template='../tiles/amandrisIndexTile.jsp'>
	<tiles:put name='logoTile' content='logoTile.jsp'/>
	<tiles:put name='indexBuyerLoginTile' content='indexBuyerLoginTile.jsp'/>
	<tiles:put name='indexSellerLoginTile' content='indexSellerLoginTile.jsp'/>
	<tiles:put name='indexBuyerTile' content='indexBuyerTile.jsp'/>
	<tiles:put name='indexSellerTile' content='indexSellerTile.jsp'/>
	<tiles:put name='indexMainUserTile' content='indexMainUserTile.jsp'/>
	<tiles:put name='footer1Tile' content='footer1Tile.jsp'/>
	<tiles:put name='footer2Tile' content='footer2Tile.jsp'/>
	<tiles:put name='footer3Tile' content='footer3Tile.jsp'/>
	<tiles:put name='body' type='string'>
  

	</tiles:put>
</tiles:insert>
