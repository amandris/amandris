package com.amandris.clients.job;

import java.util.ArrayList;
import java.util.Collection;
import java.util.GregorianCalendar;
import java.util.Iterator;

import com.amandris.clients.service.dao.CalendarDAO;
import com.amandris.clients.service.dao.SellerDAO;
import com.amandris.clients.service.vo.Calendar;
import com.amandris.clients.service.vo.Seller;
import com.amandris.clients.util.ConfigurationParameterManager;
import com.amandris.clients.util.Constant;

public class GenerateCalendar extends AbstractJob {

	public int execute( ) throws Exception
	{
		SellerDAO 			sellerDAO 				= new SellerDAO();
		CalendarDAO 		calendarDAO 			= new CalendarDAO();
		Seller 				seller 					= null;
		Calendar 			calendar 				= null;
		Collection 			sellerList 				= sellerDAO.getSellerToGenerateCalendar();
		Calendar[] 			calendarArray 			= null;
		Collection 			calendarList 			= null;
		Calendar 			lastCalendar 			= null;
		Iterator 			iterator 				= sellerList.iterator();
		java.util.Calendar 	today 					= java.util.Calendar.getInstance( );
		java.util.Calendar 	todayClean 				= new GregorianCalendar( today.get( java.util.Calendar.YEAR), today.get( java.util.Calendar.MONTH), today.get( java.util.Calendar.DATE));
		java.util.Calendar 	mainDate 				= null;
		java.util.Calendar 	lastCalendarCalendar 	= null;
		int 				calendarSize 			= ConfigurationParameterManager.getParameterInt( "calendarSize");
		int	 				pattern 				= 0;
		int	 				startHour 				= 0;
		int	 				endHour 				= 0;
		int	 				startDay 				= 0;
		int	 				endDay 					= 0; 
		Collection			calendarToDelete		= new ArrayList();
		ArrayList			calendarToAdd			= new ArrayList();
		
		while( iterator.hasNext()){
			seller = ( Seller) iterator.next();
			
			if( seller.getIsCalendarGenerated().intValue() != 1)
				break;
			
			pattern					= ( seller.getCalendarPattern() == null ? Constant.CALENDAR_PATTERN_1 : seller.getCalendarPattern().intValue());
			startHour 				= ( seller.getCalendarPatternStartHour() == null ? 0 : seller.getCalendarPatternStartHour().intValue());
			endHour 				= ( seller.getCalendarPatternEndHour() == null ? 0 : seller.getCalendarPatternEndHour().intValue());
			startDay 				= ( seller.getCalendarPatternStartDay() == null ? 0 : seller.getCalendarPatternStartDay().intValue());
			endDay 					= ( seller.getCalendarPatternEndDay() == null ? 0 : seller.getCalendarPatternEndDay().intValue());
			calendarList 			= calendarDAO.getCalendarBySellerId( seller.getId());
			
			if( calendarList.size() == 0){
				lastCalendarCalendar 	= new GregorianCalendar();
				
				lastCalendarCalendar.setTime( todayClean.getTime());
				mainDate = new GregorianCalendar( lastCalendarCalendar.get( java.util.Calendar.YEAR), lastCalendarCalendar.get( java.util.Calendar.MONTH), lastCalendarCalendar.get( java.util.Calendar.DATE));
			} else {
				lastCalendarCalendar 	= new GregorianCalendar();
				calendarArray 			= ( Calendar[]) calendarList.toArray( new Calendar[ calendarList.size()]);
				lastCalendar 			= ( Calendar) calendarArray[ calendarList.size() - 1 ];
				
				lastCalendarCalendar.setTime( lastCalendar.getDate());
				mainDate = new GregorianCalendar( lastCalendarCalendar.get( java.util.Calendar.YEAR), lastCalendarCalendar.get( java.util.Calendar.MONTH), lastCalendarCalendar.get( java.util.Calendar.DATE));
				mainDate.add( GregorianCalendar.DATE, 1);
			}
			
			
			
			long diference = (mainDate.getTime().getTime() - todayClean.getTime().getTime()) / 86400000; 	
			
			if( diference < calendarSize) {
				
				for( int i = 0; i < calendarSize - diference; i++) {
					for( int j = 0; j < 24; j++) {
						calendar 		= new Calendar();
						
						calendar.setSeller( seller);
						calendar.setSellerId( seller.getId());
						calendar.setDate( mainDate.getTime());
						
						if( calendar.getHourStatusConst() == null) {
						
							switch( pattern) {
								case Constant.CALENDAR_PATTERN_1:
									calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_FREE));
									break;
								
								case Constant.CALENDAR_PATTERN_2:									
									if( startHour <= endHour){
										if( ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) >= startHour) && ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) <= endHour))
											calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_FREE));
										else
											calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_NOT_FREE));
									} else {
										if( ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) >= startHour) || ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) <= endHour))
											calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_FREE));
										else
											calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_NOT_FREE));
									}
									
									seller.setCalendarPatternStartHour	( new Integer( startHour));
									seller.setCalendarPatternEndHour	( new Integer( endHour));
									break;
									
								case Constant.CALENDAR_PATTERN_3:
									if( ( mainDate.get( java.util.Calendar.DAY_OF_WEEK) >= java.util.Calendar.MONDAY) && ( mainDate.get( java.util.Calendar.DAY_OF_WEEK) <= java.util.Calendar.FRIDAY))
										calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_FREE));
									else
										calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_NOT_FREE));
									break;
								
								case Constant.CALENDAR_PATTERN_4:									
									if( startHour <= endHour){
										if( ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) >= startHour) && ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) <= endHour))
											calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_FREE));
										else
											calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_NOT_FREE));
									} else {
										if( ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) >= startHour) || ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) <= endHour))
											calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_FREE));
										else
											calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_NOT_FREE));
									}
									seller.setCalendarPatternStartHour	( new Integer( startHour));
									seller.setCalendarPatternEndHour	( new Integer( endHour));
									break;
									
								case Constant.CALENDAR_PATTERN_5:
									if( ( mainDate.get( java.util.Calendar.DAY_OF_WEEK) == java.util.Calendar.SATURDAY) || ( mainDate.get( java.util.Calendar.DAY_OF_WEEK) == java.util.Calendar.SUNDAY))
										calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_FREE));
									else
										calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_NOT_FREE));
									break;
									
								case Constant.CALENDAR_PATTERN_6:									
									if( ( mainDate.get( java.util.Calendar.DAY_OF_WEEK) == java.util.Calendar.SATURDAY) || ( mainDate.get( java.util.Calendar.DAY_OF_WEEK) == java.util.Calendar.SUNDAY)) {
										if( startHour <= endHour){
											if( ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) >= startHour) && ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) <= endHour))
												calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_FREE));
											else
												calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_NOT_FREE));
										} else {
											if( ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) >= startHour) || ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) <= endHour))
												calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_FREE));
											else
												calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_NOT_FREE));
										}
									} else
										calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_NOT_FREE));
									
									seller.setCalendarPatternStartHour	( new Integer( startHour));
									seller.setCalendarPatternEndHour	( new Integer( endHour));
									break;
								
								case Constant.CALENDAR_PATTERN_7:								
									if( startDay <= endDay) {
										if( ( mainDate.get( java.util.Calendar.DAY_OF_WEEK) >= startDay) && ( mainDate.get( java.util.Calendar.DAY_OF_WEEK) <= endDay))
											calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_FREE));
										else
											calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_NOT_FREE));
									} else {
										if( ( mainDate.get( java.util.Calendar.DAY_OF_WEEK) >= startDay) || ( mainDate.get( java.util.Calendar.DAY_OF_WEEK) <= endDay))
											calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_FREE));
										else
											calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_NOT_FREE));
									}
									
									seller.setCalendarPatternStartDay	( new Integer( startDay));
									seller.setCalendarPatternEndDay		( new Integer( endDay));
									break;
									
								case Constant.CALENDAR_PATTERN_8:
									if( startDay <= endDay) {
										if( ( mainDate.get( java.util.Calendar.DAY_OF_WEEK) >= startDay) && ( mainDate.get( java.util.Calendar.DAY_OF_WEEK) <= endDay)) {
											if( startHour <= endHour){
												if( ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) >= startHour) && ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) <= endHour)){
													calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_FREE));
												}else {
													calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_NOT_FREE));
												}
											} else {
												if( ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) >= startHour) || ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) <= endHour)){
													calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_FREE));
												} else {
													calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_NOT_FREE));
												}
											}
										} else
											calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_NOT_FREE));
									} else {
										if( ( mainDate.get( java.util.Calendar.DAY_OF_WEEK) >= startDay) || ( mainDate.get( java.util.Calendar.DAY_OF_WEEK) <= endDay)) {
											if( startHour <= endHour){
												if( ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) >= startHour) && ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) <= endHour)) {
													calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_FREE));
												} else {
													calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_NOT_FREE));
												}
											} else {
												if( ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) >= startHour) || ( mainDate.get( java.util.Calendar.HOUR_OF_DAY) <= endHour)) {
													calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_FREE));
												} else {
													calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_NOT_FREE));
												}
											}
										} else
											calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_NOT_FREE));
									}
									
									seller.setCalendarPatternStartHour	( new Integer( startHour));
									seller.setCalendarPatternEndHour	( new Integer( endHour));
									seller.setCalendarPatternStartDay	( new Integer( startDay));
									seller.setCalendarPatternEndDay		( new Integer( endDay));
									break;
								
								case Constant.CALENDAR_PATTERN_9:
									calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_NOT_FREE));
									break;
									
								default:
									calendar.setHourStatusConst( new Integer( Constant.HOUR_STATUS_FREE));
							}
						}
						
						calendarToAdd.add( calendar);
						
						mainDate.add( java.util.Calendar.HOUR, 1);
					}
				}
				
				calendarDAO.createCalendar( calendarToAdd, calendarToDelete);
			}
		}
		
		return 0;
	}
	
	public static void main(String[] args) {
		GenerateCalendar instance = new GenerateCalendar();
		
		try{
			instance.execute();
		}catch( Exception e) {
			e.printStackTrace();
		}
				
	}

}		
