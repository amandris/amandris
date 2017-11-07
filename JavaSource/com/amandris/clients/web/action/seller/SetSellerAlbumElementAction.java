package com.amandris.clients.web.action.seller;

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

import com.amandris.clients.service.facade.AlbumElementFacade;
import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.web.form.PictureForm;
import com.amandris.clients.web.util.SellerSession;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.amandris.clients.web.action.common.AbstractAction;

public class SetSellerAlbumElementAction extends AbstractAction {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 		session 			= request.getSession();
		Locale				locale				= getRequestLocale( request);
		SellerFacade		sellerFacade		= new SellerFacade();
		AlbumElementFacade	albumElementFacade	= new AlbumElementFacade();
		PictureForm			pictureForm			= null;
		int					randomNumber		= 0;
		
		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		if( ( form == null) || ( form.getClass() != PictureForm.class))
			return error( "error.couldNotSetPicture", request, mapping);
		
		pictureForm = ( PictureForm) form;
		
		randomNumber = getRandomNumber();
		
		if( albumElementFacade.getAlbumElementCount( sellerSession.getId()) >= 60)
			return error( "error.tooManyPictures", request, mapping);
		
		if( ! pictureForm.getPictureFile().getFileName().trim().equals( "")) {
			try {
				resampleImage( pictureForm.getPictureFile().getFileData(), "/album/smaller/seller_" + sellerSession.getId() + "_" + randomNumber + ".jpg", 100, 100, true);
				resampleImage( pictureForm.getPictureFile().getFileData(), "/album/original/seller_" + sellerSession.getId() + "_" + randomNumber + ".jpg", 1024, 1024, false);
			} catch ( Exception e) {
				return error( "error.couldNotSetPicture", request, mapping);
			}
			
			if( albumElementFacade.setAlbumElement( sellerSession, randomNumber) == false)
				return error( "error.couldNotSetPicture", request, mapping);
			
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
