package com.amandris.clients.util;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.validator.Field;
import org.apache.commons.validator.GenericValidator;
import org.apache.commons.validator.ValidatorAction;
import org.apache.commons.validator.ValidatorUtil;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.validator.Resources;

import com.amandris.clients.web.form.PictureForm;

public class Validates implements Serializable{

	public static Boolean checkBankAccount( String value)
	{
		value.trim();
		
    	try{
     		if ( value.length( )> 23)
     		{
         		return Boolean.valueOf( false);
     		}
     		
		    String Entity 				= value.substring( 0, 4);
     		String Office 				= value.substring( 5, 9);
     		String ControlDigit 		= value.substring( 10, 12);
     		String AccountNumber 		= value.substring( 13, 23);
    	    String FirstControl 		= "00" + Entity + Office;
    		String FirstControlDigit 	= getControlDigit( FirstControl);
    		
    		if ( !FirstControlDigit.equals( ControlDigit.substring( 0, 1))) 
				return Boolean.valueOf(false)
			;
		    
		    String SecondControl		= AccountNumber;
    		String SecondControlDigit	= getControlDigit( SecondControl);
    
    		if ( !SecondControlDigit.equals( ControlDigit.substring( 1, 2)))
				return Boolean.valueOf(false)
			;
		    
		}catch ( Exception e){
			return( Boolean.valueOf( false));    
		}
		
		return(Boolean.valueOf(true));
	}

    public static String getControlDigit ( String cadena)
    {
        int[] 	Digits 	= { 1, 2, 4, 8, 5, 10, 9, 7, 3, 6};
		int 	Check 	= 0;
		
    	for ( int i = 0; i < Digits.length; i++){
			Check += Integer.parseInt( cadena.substring( i, i + 1)) * Digits[ i];
    	}
    	
    	Check = 11 - (Check % 11);
    	
    	if ( Check == 11) 
    		Check = 0
    	;
    	
    	if ( Check == 10)
    		Check = 1
    	;
    	
    	return String.valueOf( Check);
	}


    public static boolean validateBankAccount(Object bean,ValidatorAction va,Field field,ActionErrors errors,HttpServletRequest request){          
        String 	value		= null;
        Boolean Result 		= checkBankAccount(value);
        
        if ( field.getProperty() != null && field.getProperty().length() > 0) 
            value = ValidatorUtil.getValueAsString( bean, field.getProperty())
        ;
      
	    if ( Result != null){
        	boolean Resultb = Result.booleanValue();
        	
	        if (Resultb == false) 
	        	Result=null
	        ;
    	}
        if ( Result == null){
            errors.add( field.getKey(), Resources.getActionError( request, va, field));
        }
        
        return ( errors.isEmpty());       
    }

    public static boolean validateBankAccountNR( Object bean, ValidatorAction va, Field field, ActionErrors errors, HttpServletRequest request)
    {          
        String 	Value	= null;
        Boolean Result	= null;
        
        if ( field.getProperty() != null && field.getProperty().length() > 0)  
            Value = ValidatorUtil.getValueAsString( bean, field.getProperty())
        ;
        
        if ( field.getProperty() ==null || field.getProperty().length()==0)
			return (errors.isEmpty())
		;       
        
        Result = checkBankAccount( Value);
        
	    if ( Result != null) {
        	boolean Resultb = Result.booleanValue();
        	
        	if ( Resultb==false) 
        		Result = null
        	;
	    }

        if ( Result == null){
            errors.add( field.getKey(), Resources.getActionError( request, va,field));
        }
        
		return ( errors.isEmpty());       
      }

    public static boolean checkChars( String chars)
    {
    	char letter = 'a';
    	
    	if ( chars == null)
			return true
		; 

		try {
			for ( int i = 0; i < chars.length(); i ++) {
				letter = chars.charAt( i);  
				
				if( letter == '_')
					return true;
				
				switch( letter) {
					case 'á': case 'é':case 'í': case 'ó': case 'ú': case 'Á': case 'É': case 'Í': case 'Ó': case 'Ú': return false;
					case 'à': case 'è':case 'ì': case 'ò': case 'ù': case 'À': case 'È': case 'Ì': case 'Ò': case 'Ù': return false;
					case 'ä': case 'ë':case 'ï': case 'ö': case 'ü': case 'Ä': case 'Ë': case 'Ï': case 'Ö': case 'Ü': return false;
					case 'â': case 'ê':case 'î': case 'ô': case 'û': case 'Â': case 'Ê': case 'Î': case 'Ô': case 'Û': return false;
				}
				
		 		if ( ! Character.isLetterOrDigit( letter))
					return false
				;
			}
		}catch ( Exception e) {
			return false;
        }    
		
		return true;
	}
        
	public static boolean validateUserName( Object bean, ValidatorAction va, Field field, ActionErrors errors, HttpServletRequest request)
	{          
        String 	Value= null;
        
        if ( field.getProperty() != null && field.getProperty().length()>0)
            Value = ValidatorUtil.getValueAsString( bean, field.getProperty())
        ;

        if ( checkChars( Value) == false){
            errors.add( field.getKey(), Resources.getActionError( request, va, field));
        }
        
		return ( errors.isEmpty());       
    }
	
	public static boolean validateHour( Object bean, ValidatorAction va, Field field, ActionErrors errors, HttpServletRequest request)
	{          
        String 	Value	= null;
        int		Hour 	= -1;
        int 	Minute 	= -1;
        
        if ( field.getProperty() != null && field.getProperty().length()>0)
            Value = ValidatorUtil.getValueAsString( bean, field.getProperty())
        ;

        try {
        	Hour 	= DBUtils.parseInteger( Value.substring( 0 , 2), -1).intValue();
        	Minute 	= DBUtils.parseInteger( Value.substring( 3 , 5), -1).intValue();
        } catch (Exception e) {
        	errors.add( field.getKey(), Resources.getActionError( request, va, field));
        	
        	return false;
        }
        
        if( ( Hour < 0) || ( Hour > 23) || ( Minute < 0) || ( Minute > 59))
            errors.add( field.getKey(), Resources.getActionError( request, va, field));
	
    	return ( errors.isEmpty());
    }
    
    
	public static boolean validateTwoFields( Object bean, ValidatorAction va, Field field, ActionErrors errors, HttpServletRequest request) 
	{
		String Value 			= ValidatorUtil.getValueAsString( bean, field.getProperty());
		String SecondProperty 	= field.getVarValue( "secondProperty");
		String SecondValue 		= ValidatorUtil.getValueAsString( bean, SecondProperty);

		if ( ! GenericValidator.isBlankOrNull( Value)) {
			try {
				if ( ! Value.equals( SecondValue)) {
					errors.add( field.getKey(), Resources.getActionError( request, va, field));

					return false;
				}
			} catch ( Exception e) {
				errors.add(field.getKey(), Resources.getActionError( request, va, field));

				return false;
			}
		}

		return true;
	}

	public static boolean validateImageFileType(Object bean,ValidatorAction va,Field field,ActionErrors errors,HttpServletRequest request){          

		
		PictureForm pictureForm = null;
		boolean 	result 		= true;
		
		pictureForm = ( PictureForm) bean;
		
		if ( pictureForm != null) {
			if ( pictureForm.getPictureFile() != null) {
				if ( ! pictureForm.getPictureFile().getFileName().equals("")){
					if (( ! pictureForm.getPictureFile().getContentType().equals("image/gif")) &&
						( ! pictureForm.getPictureFile().getContentType().equals("image/pjpeg")) &&
						( ! pictureForm.getPictureFile().getContentType().equals("image/jpeg"))
						) {
							result = false;
						}
				}
			}
		}

		if ( result == false){
			errors.add( field.getKey(), Resources.getActionError( request, va, field));
			pictureForm.setPictureFile( null);
		}

		return ( errors.isEmpty());       
	}
	
	public static boolean validateImageFileSize( Object bean, ValidatorAction va, Field field, ActionErrors errors, HttpServletRequest request){          

		
		PictureForm pictureForm = null;
		boolean 	tooBig 		= false;
		
		pictureForm = ( PictureForm)bean;
	
		if ( pictureForm != null){
			if ( pictureForm.getPictureFile() != null) {
				if ( ! pictureForm.getPictureFile().getFileName().equals( "")) {
					if ( pictureForm.getPictureFile().getFileSize() >= 1048576) {
						tooBig =true;
					}
				}
			}
		}
		

		if ( tooBig == true){
			errors.add( field.getKey(), Resources.getActionError( request, va, field));
			pictureForm.setPictureFile( null);
		}

		return ( errors.isEmpty());       
	}
}
       
