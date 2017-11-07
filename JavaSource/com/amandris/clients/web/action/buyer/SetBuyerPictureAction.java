package com.amandris.clients.web.action.buyer;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.ImageIcon;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.BuyerFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.form.PictureForm;
import com.amandris.clients.web.util.BuyerSession;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetBuyerPictureAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 			= request.getSession();
		Locale				locale				= getRequestLocale( request);
		BuyerFacade			buyerFacade			= new BuyerFacade();
		PictureForm			pictureForm			= null;
		int					randomNumber		= 0;
		
		BuyerSession buyerSession = ( BuyerSession)session.getAttribute( Constant.BUYER_SESSION_OBJECT_NAME);
		
		if( buyerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ( form == null) || ( form.getClass() != PictureForm.class))
			return error( "error.couldNotSetPicture", request, mapping);
		
		pictureForm = ( PictureForm) form;
		
		randomNumber = getRandomNumber();
		
		if( ! pictureForm.getPictureFile().getFileName().trim().equals( "")) {
			try {
				resampleImage( pictureForm.getPictureFile().getFileData(), "/pictures/smaller/buyer_" + buyerSession.getId() + "_" + pictureForm.getIndex() + "_" + randomNumber + ".jpg", 55, 67, true);
				resampleImage( pictureForm.getPictureFile().getFileData(), "/pictures/original/buyer_" + buyerSession.getId() + "_" + pictureForm.getIndex() + "_" + randomNumber + ".jpg", 640, 800, false);
			} catch ( Exception e) {
				return error( "error.couldNotSetPicture", request, mapping);
			}
			
			if( buyerFacade.setBuyerPicture( pictureForm, buyerSession, randomNumber) == false)
				return error( "error.couldNotSetPicture", request, mapping);
			
			buyerSession = buyerFacade.getBuyerSessionByLoginAndPassword( buyerSession.getLogin(), buyerSession.getPassword(), true, locale);
			
			if( buyerSession == null)
				return error( "error.couldNotSetPicture", request, mapping);
			
			session.setAttribute( Constant.BUYER_SESSION_OBJECT_NAME, buyerSession);
			
			saveToken(request);
		}

		return ( mapping.findForward( Constant.SUCCESS));
	  }
	
	private int getRandomNumber()
	{
		return ( int) Math.round( ( Math.random() * ( Integer.MAX_VALUE - 100))) + 2;
	}
	
	private void resampleImage( byte[] data, String fileName, int maxWidth, int maxHeight, boolean reduceWidthAndHeight) throws Exception
	{
		Image 			picture 		= null;
		BufferedImage 	finalPicture 	= null;
		AffineTransform transform 		= null;
		Graphics2D 		graphics2d		= null;
		double 			scale1 			= 1;
		double 			scale2 			= 1;
		int 			widthScale 		= 1;
		int				heightScale 	= 1;
		
		picture = new ImageIcon( data).getImage();
		
		if( reduceWidthAndHeight == true) {
			scale1 	= ( double) maxHeight / ( double) picture.getHeight( null);
			
			if( picture.getWidth( null) > picture.getHeight( null)) 
				scale1 = ( double) maxWidth / ( double) picture.getWidth( null);
			
			widthScale 	= ( int) ( scale1 * picture.getWidth( null));
			heightScale	= ( int) ( scale1 * picture.getHeight( null));
					
			finalPicture = new BufferedImage( widthScale, heightScale, BufferedImage.SCALE_SMOOTH);
		
			transform = new AffineTransform();
			
			if( scale1 < 1.0d) 
				transform.scale( scale1, scale1);
		} else {
			if( picture.getWidth( null) > maxWidth)
				scale1 	= ( double) maxWidth / ( double) picture.getWidth( null);
			
			if( picture.getHeight( null) > maxHeight)
				scale2 	= ( double) maxHeight / ( double) picture.getHeight( null);
			
			if( scale1 > scale2)
				scale1 = scale2;
			
			widthScale 	= ( int) ( scale1 * picture.getWidth( null));
			heightScale	= ( int) ( scale1 * picture.getHeight( null));
					
			finalPicture = new BufferedImage( widthScale, heightScale, BufferedImage.SCALE_SMOOTH);
		
			transform = new AffineTransform();
			
			if( scale1 < 1.0d) 
				transform.scale( scale1, scale1);
			
		}
		
		graphics2d = finalPicture.createGraphics();
		
		graphics2d.drawImage( picture, transform, null);
		graphics2d.dispose();
				
		savePicture( finalPicture, fileName);
	}
	
	private void savePicture( BufferedImage finalPicture, String fileName) throws Exception 
	{
		OutputStream output = null;

		output = new FileOutputStream( ConfigurationParameterManager.getParameterString( "mediaPath") + fileName);
		
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder( output);
		
		encoder.encode( finalPicture);
		
		output.close();
	}
}		
