package com.amandris.clients.util.translator;

import java.util.Locale;

import com.amandris.clients.service.vo.AlbumElement;
import com.amandris.clients.service.vo.AmandrisMessage;
import com.amandris.clients.service.vo.Buyer;
import com.amandris.clients.service.vo.BuyerMessage;
import com.amandris.clients.service.vo.BuyerSavedSearch;
import com.amandris.clients.service.vo.Contact;
import com.amandris.clients.service.vo.ContactMessage;
import com.amandris.clients.service.vo.Country;
import com.amandris.clients.service.vo.Invitation;
import com.amandris.clients.service.vo.Seller;
import com.amandris.clients.service.vo.SellerMessage;
import com.amandris.clients.service.vo.SellerPromotion;
import com.amandris.clients.service.vo.SellerService;
import com.amandris.clients.service.vo.State;
import com.amandris.clients.service.vo.VoteToBuyer;
import com.amandris.clients.service.vo.VoteToSeller;
import com.amandris.clients.web.form.BuyerSellerSearchForm;

public class TranslatorFactory {
	

	public static Translator getTranslator( Object object, Locale locale) {

		
		if ( object.getClass() == Buyer.class) {
			BuyerToBuyerViewTranslator translator = new BuyerToBuyerViewTranslator();
			translator.setObject( object);
			translator.setLocale( locale);
			return translator;
		} else if ( object.getClass() == Contact.class) {
			ContactToBuyerContactViewTranslator translator = new ContactToBuyerContactViewTranslator();
			translator.setObject( object);
			translator.setLocale( locale);
			return translator;
		} else if ( object.getClass() == AmandrisMessage.class) {
			AmandrisMessageToAmandrisMessageViewTranslator translator = new AmandrisMessageToAmandrisMessageViewTranslator();
			translator.setObject( object);
			translator.setLocale( locale);
			return translator;
		} else if ( object.getClass() == ContactMessage.class) {
			ContactMessageToContactMessageViewTranslator translator = new ContactMessageToContactMessageViewTranslator();
			translator.setObject( object);
			translator.setLocale( locale);
			return translator;
		} else if ( object.getClass() == Country.class) {
			CountryToCountryViewTranslator translator = new CountryToCountryViewTranslator();
			translator.setObject( object);
			translator.setLocale( locale);
			return translator;
		}  else if ( object.getClass() == State.class) {
			StateToStateViewTranslator translator = new StateToStateViewTranslator();
			translator.setObject( object);
			translator.setLocale( locale);
			return translator;
		} else if ( object.getClass() == Seller.class) {
			SellerToSellerViewTranslator translator = new SellerToSellerViewTranslator();
			translator.setObject( object);
			translator.setLocale( locale);
			return translator;
		} else if ( object.getClass() == AlbumElement.class) {
			AlbumElementToAlbumElementViewTranslator translator = new AlbumElementToAlbumElementViewTranslator();
			translator.setObject( object);
			translator.setLocale( locale);
			return translator;
		} else if ( object.getClass() == VoteToSeller.class) {
			VoteToSellerToVoteViewTranslator translator = new VoteToSellerToVoteViewTranslator();
			translator.setObject( object);
			translator.setLocale( locale);
			return translator;
		} else if ( object.getClass() == VoteToBuyer.class) {
			VoteToBuyerToVoteViewTranslator translator = new VoteToBuyerToVoteViewTranslator();
			translator.setObject( object);
			translator.setLocale( locale);
			return translator;
		} else if ( object.getClass() == BuyerMessage.class) {
			BuyerMessageToMessageViewTranslator translator = new BuyerMessageToMessageViewTranslator();
			translator.setObject( object);
			translator.setLocale( locale);
			return translator;
		} else if ( object.getClass() == SellerMessage.class) {
			SellerMessageToMessageViewTranslator translator = new SellerMessageToMessageViewTranslator();
			translator.setObject( object);
			translator.setLocale( locale);
			return translator;
		} else if ( object.getClass() == SellerPromotion.class) {
			SellerPromotionToPromotionViewTranslator translator = new SellerPromotionToPromotionViewTranslator();
			translator.setObject( object);
			translator.setLocale( locale);
			return translator;
		} else if ( object.getClass() == SellerService.class) {
			SellerServiceToServiceViewTranslator translator = new SellerServiceToServiceViewTranslator();
			translator.setObject( object);
			translator.setLocale( locale);
			return translator;
		} else if ( object.getClass() == Invitation.class) {
			InvitationToInvitationViewTranslator translator = new InvitationToInvitationViewTranslator();
			translator.setObject( object);
			translator.setLocale( locale);
			return translator;
		} else if ( object.getClass() == BuyerSellerSearchForm.class) {
			BuyerSellerSearchFormToSavedSearchTranslator translator = new BuyerSellerSearchFormToSavedSearchTranslator();
			translator.setObject( object);
			translator.setLocale( locale);
			return translator;
		} else if ( object.getClass() == BuyerSavedSearch.class) {
			SaveSearchToBuyerSellerSearchFormTranslator translator = new SaveSearchToBuyerSellerSearchFormTranslator();
			translator.setObject( object);
			translator.setLocale( locale);
			return translator;
		} else {
			DefaultTranslator translator = new DefaultTranslator();
			translator.setObject( object);
			return translator;
		}

	}

}
	

