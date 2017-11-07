package com.amandris.clients.job;

import com.amandris.clients.service.dao.RecommendationDAO;

public class DeleteOldRecomendation extends AbstractJob {

	public int execute( ) throws Exception
	{
		RecommendationDAO recomendationDAO = new RecommendationDAO();
		
		recomendationDAO.deleteOldBuyerRecomendation();
		recomendationDAO.deleteOldSellerRecomendation();
		
		return 0;
	}
	
	public static void main(String[] args) {
		DeleteOldRecomendation instance = new DeleteOldRecomendation();
		
		try{
			instance.execute();
		}catch( Exception e) {
			e.printStackTrace();
		}
				
	}

}		
