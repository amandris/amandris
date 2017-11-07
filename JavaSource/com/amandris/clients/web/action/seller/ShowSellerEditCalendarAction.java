package com.amandris.clients.web.action.seller;

import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.amandris.clients.service.facade.CalendarFacade;
import com.amandris.clients.service.facade.SellerFacade;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;
import com.amandris.clients.util.DBUtils;
import com.amandris.clients.web.util.SellerSession;
import com.amandris.clients.web.view.EditCalendarView;
import com.amandris.clients.web.action.common.AbstractAction;

public class ShowSellerEditCalendarAction extends AbstractAction {

	public ActionForward execute( ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception 
	{
		HttpSession 			session 				= request.getSession();
		SellerFacade 			sellerFacade 			= new SellerFacade();
		CalendarFacade 			calendarFacade 			= new CalendarFacade();
		EditCalendarView 		editCalendarView		= null;
		Locale					locale					= null;
		String					startDate				= null;
		String					previousDate			= null;
		Date					startJavaDate			= null;
		Date					endJavaDate				= null;
		long					editCalendarDayNumber	= 0;

		SellerSession sellerSession = ( SellerSession)session.getAttribute( Constant.SELLER_SESSION_OBJECT_NAME);
		
		locale = getLocale( request);
		
		if( sellerSession == null)
			return ( mapping.findForward( Constant.SESSION));
		
		startDate = request.getParameter( "startDate");
		
		if( DBUtils.parseDate( startDate) != null) {
			startJavaDate = DBUtils.parseDate( startDate);
		} else {
			startJavaDate = DBUtils.parseDate( DBUtils.getDate( Calendar.getInstance( locale).getTime(), 1));
		}
		
		editCalendarDayNumber 	= ( long) ( ConfigurationParameterManager.getParameterInt( "editCalendarDayNumber") + 1) * 24 * 60 * 60 * 1000;
		endJavaDate 			= new Date( startJavaDate.getTime() + editCalendarDayNumber);
		editCalendarView 		= calendarFacade.getCalendarCollectionBySellerId( sellerSession.getId(), startJavaDate, endJavaDate, locale);
		previousDate 			= DBUtils.getDate( new Date( startJavaDate.getTime() - editCalendarDayNumber + 86400000), 1);

		if( editCalendarView == null)
			return error( "error.couldNotEditCalendar", request, mapping);
		
		editCalendarView.setNextDate	( DBUtils.getDate( new Date( endJavaDate.getTime() - 86400000), 1));
		editCalendarView.setPreviousDate( previousDate);
		editCalendarView.setStartDate	( startDate);
		
		request.setAttribute( Constant.EDIT_CALENDAR_OBJECT_NAME, editCalendarView);
		
		saveToken(request);

		return ( mapping.findForward( Constant.SUCCESS));
	  }
}		
