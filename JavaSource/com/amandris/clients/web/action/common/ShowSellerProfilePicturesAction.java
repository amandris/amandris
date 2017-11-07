package com.amandris.clients.web.action.common;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.view.ProfilePicturesView;
import com.amandris.clients.web.view.SellerView;

public class ShowSellerProfilePicturesAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		SellerFacade			sellerFacade			= new SellerFacade();
		Locale					locale					= getLocale( request);
		SellerView				sellerView				= null;
		ProfilePicturesView		profilePicturesView		= new ProfilePicturesView();
		int						dataBasePicture			= 1;
		int						profilePicture			= 1;
		int						selectedPicture			= 0;
		String					pictureValue			= "";
		

		sellerView = sellerFacade.getSellerById( DBUtils.parseInteger( request.getParameter( "id"), 0), locale);		
		
		if( sellerView == null) {
			return error( "error.sellerNotExist", request, mapping);
		}
		
		selectedPicture = DBUtils.parseInteger( request.getParameter( "picture"), 0).intValue();
		
		if( selectedPicture == 0)
			selectedPicture = DBUtils.parseInteger( sellerView.getMainPicture(), 0).intValue();
		
		if( sellerView.getPictureCount().equals( "0"))
			return error( "error.pictureNotExist", request, mapping);
		
		profilePicturesView.setUserId( sellerView.getId());
		profilePicturesView.setPicturesCount( sellerView.getPictureCount());
		
		for( dataBasePicture = 1; dataBasePicture <= 5; dataBasePicture++){
			pictureValue = getDataBasePicture( sellerView, dataBasePicture);
			
			if( ! pictureValue.equals( "0")) {
				setProfilePicture( profilePicturesView, sellerView, profilePicture, dataBasePicture);
				
				if( selectedPicture == dataBasePicture)
					profilePicturesView.setBigPictureIndex( Integer.toString( profilePicture));
				
				profilePicture ++;
			}
		}
		
		profilePicturesView.setBigPictureFileName( "seller_" + sellerView.getId() + "_" + selectedPicture + "_" + getDataBasePicture( sellerView, selectedPicture) + ".jpg");
		
		request.setAttribute( Constant.PROFILE_PICTURES_OBJECT_NAME, profilePicturesView);
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	}
	
	private String getDataBasePicture( SellerView sellerView, int index)
	{
		switch( index){
			case 1: 
				if ( !sellerView.getPicture1Waiting().equals( "1"))
					return sellerView.getPicture1();
			break;
			
			case 2: 
				if ( !sellerView.getPicture2Waiting().equals( "1"))
					return sellerView.getPicture2();
			break;
			
			case 3: 
				if ( !sellerView.getPicture3Waiting().equals( "1"))
					return sellerView.getPicture3();
			break;
			
			case 4: 
				if ( !sellerView.getPicture4Waiting().equals( "1"))
					return sellerView.getPicture4();
			break;
			
			case 5: 
				if ( !sellerView.getPicture5Waiting().equals( "1"))
					return sellerView.getPicture5();
			break;
		}
		
		return "0";
	}
	
	private void setProfilePicture( ProfilePicturesView profilePicturesView, SellerView sellerView, int profilePicture, int dataBasePicture)
	{
		switch( profilePicture){
			case 1: 
				profilePicturesView.setPicture1FileName( "seller_" + sellerView.getId() + "_" + dataBasePicture + "_" + getDataBasePicture( sellerView, dataBasePicture) + ".jpg");
				profilePicturesView.setPicture1Index( Integer.toString( dataBasePicture));
			break;
			
			case 2: 
				profilePicturesView.setPicture2FileName( "seller_" + sellerView.getId() + "_" + dataBasePicture + "_" + getDataBasePicture( sellerView, dataBasePicture) + ".jpg");
				profilePicturesView.setPicture2Index( Integer.toString( dataBasePicture));
			break;
			
			case 3: 
				profilePicturesView.setPicture3FileName( "seller_" + sellerView.getId() + "_" + dataBasePicture + "_" + getDataBasePicture( sellerView, dataBasePicture) + ".jpg");
				profilePicturesView.setPicture3Index( Integer.toString( dataBasePicture));
			break;
			
			case 4: 
				profilePicturesView.setPicture4FileName( "seller_" + sellerView.getId() + "_" + dataBasePicture + "_" + getDataBasePicture( sellerView, dataBasePicture) + ".jpg");
				profilePicturesView.setPicture4Index( Integer.toString( dataBasePicture));
			break;
			
			case 5: 
				profilePicturesView.setPicture5FileName( "seller_" + sellerView.getId() + "_" + dataBasePicture + "_" + getDataBasePicture( sellerView, dataBasePicture) + ".jpg");
				profilePicturesView.setPicture5Index( Integer.toString( dataBasePicture));
			break;
			
			
		}
	}
}		
