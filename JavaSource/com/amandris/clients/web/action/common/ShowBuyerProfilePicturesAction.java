package com.amandris.clients.web.action.common;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.service.facade.ContactFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.BuyerSession;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.BuyerView;
import com.amandris.clients.web.view.ProfilePicturesView;

public class ShowBuyerProfilePicturesAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		BuyerFacade				buyerFacade				= new BuyerFacade();
		Locale					locale					= getLocale( request);
		BuyerView				buyerView				= null;
		ProfilePicturesView		profilePicturesView		= new ProfilePicturesView();
		ContactFacade			contactFacade			= new ContactFacade();
		int						dataBasePicture			= 1;
		int						profilePicture			= 1;
		int						selectedPicture			= 0;
		SellerSession			sellerSession			= null;
		BuyerSession			buyerSession			= null;
		String					pictureValue			= "";
		boolean					fail 					= false;
		

		buyerView = buyerFacade.getBuyerById( DBUtils.parseInteger( request.getParameter( "id"), 0), null, locale);		
		
		if( buyerView == null) {
			return error( "error.buyerNotExist", request, mapping);
		}
		
		if( ! buyerView.getIsPublic().equals( "1")){
			sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
			buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
			
			if( sellerSession == null && buyerSession == null) {
				fail = true;
			} else if( buyerSession != null && buyerSession.getId().intValue() != DBUtils.parseInteger( buyerView.getId() ,0).intValue()) {
				fail = true;
			} else if( sellerSession != null && !contactFacade.existsSellerContactBySellerIdAndBuyerId( sellerSession.getId(), DBUtils.parseInteger( request.getParameter( "id"),0 ), locale)) {
				fail = true;
			}
		}
			
		if( fail == true)
			return error( "error.buyerIsNotPublic", request, mapping);
		
		selectedPicture = DBUtils.parseInteger( request.getParameter( "picture"), 0).intValue();
		
		if( selectedPicture == 0)
			selectedPicture = DBUtils.parseInteger( buyerView.getMainPicture(), 0).intValue();
		
		if( buyerView.getPictureCount().equals( "0"))
			return error( "error.pictureNotExist", request, mapping);
		
		profilePicturesView.setUserId( buyerView.getId());
		profilePicturesView.setPicturesCount( buyerView.getPictureCount());
		
		for( dataBasePicture = 1; dataBasePicture <= 5; dataBasePicture++){
			pictureValue = getDataBasePicture( buyerView, dataBasePicture);
			
			if( ! pictureValue.equals( "0")) {
				setProfilePicture( profilePicturesView, buyerView, profilePicture, dataBasePicture);
				
				if( selectedPicture == dataBasePicture)
					profilePicturesView.setBigPictureIndex( Integer.toString( profilePicture));
				
				profilePicture ++;
			}
		}
		
		profilePicturesView.setBigPictureFileName( "buyer_" + buyerView.getId() + "_" + selectedPicture + "_" + getDataBasePicture( buyerView, selectedPicture) + ".jpg");
		
		request.setAttribute( Constant.PROFILE_PICTURES_OBJECT_NAME, profilePicturesView);
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	}
	
	private String getDataBasePicture( BuyerView buyerView, int index)
	{
		switch( index){
			case 1: 
				if ( !buyerView.getPicture1Waiting().equals( "1"))
					return buyerView.getPicture1();
			break;
			
			case 2: 
				if ( !buyerView.getPicture2Waiting().equals( "1"))
					return buyerView.getPicture2();
			break;
			
			case 3: 
				if ( !buyerView.getPicture3Waiting().equals( "1"))
					return buyerView.getPicture3();
			break;
			
			case 4: 
				if ( !buyerView.getPicture4Waiting().equals( "1"))
					return buyerView.getPicture4();
			break;
			
			case 5: 
				if ( !buyerView.getPicture5Waiting().equals( "1"))
					return buyerView.getPicture5();
			break;
		}
		
		return "0";
	}
	
	private void setProfilePicture( ProfilePicturesView profilePicturesView, BuyerView buyerView, int profilePicture, int dataBasePicture)
	{
		switch( profilePicture){
			case 1: 
				profilePicturesView.setPicture1FileName( "buyer_" + buyerView.getId() + "_" + dataBasePicture + "_" + getDataBasePicture( buyerView, dataBasePicture) + ".jpg");
				profilePicturesView.setPicture1Index( Integer.toString( dataBasePicture));
			break;
			
			case 2: 
				profilePicturesView.setPicture2FileName( "buyer_" + buyerView.getId() + "_" + dataBasePicture + "_" + getDataBasePicture( buyerView, dataBasePicture) + ".jpg");
				profilePicturesView.setPicture2Index( Integer.toString( dataBasePicture));
			break;
			
			case 3: 
				profilePicturesView.setPicture3FileName( "buyer_" + buyerView.getId() + "_" + dataBasePicture + "_" + getDataBasePicture( buyerView, dataBasePicture) + ".jpg");
				profilePicturesView.setPicture3Index( Integer.toString( dataBasePicture));
			break;
			
			case 4: 
				profilePicturesView.setPicture4FileName( "buyer_" + buyerView.getId() + "_" + dataBasePicture + "_" + getDataBasePicture( buyerView, dataBasePicture) + ".jpg");
				profilePicturesView.setPicture4Index( Integer.toString( dataBasePicture));
			break;
			
			case 5: 
				profilePicturesView.setPicture5FileName( "buyer_" + buyerView.getId() + "_" + dataBasePicture + "_" + getDataBasePicture( buyerView, dataBasePicture) + ".jpg");
				profilePicturesView.setPicture5Index( Integer.toString( dataBasePicture));
			break;
		}
	}
}		
