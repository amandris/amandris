package com.amandris.clients.job;

import com.amandris.clients.service.dao.CalendarDAO;

public class DeleteOldCalendar extends AbstractJob {

	public int execute( ) throws Exception
	{
		CalendarDAO calendarDAO = new CalendarDAO();
		
		calendarDAO.deleteOldCalendar();
		
		return 0;
	}
	
	public static void main(String[] args) {
		DeleteOldCalendar instance = new DeleteOldCalendar();
		
		try{
			instance.execute();
		}catch( Exception e) {
			e.printStackTrace();
		}
				
	}

}		
