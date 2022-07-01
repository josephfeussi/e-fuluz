package sms;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class Sms {

	public static final String ACCOUNT_SID = "AC99507d965d5d4944a05126dd6acd97ba";
    public static final String AUTH_TOKEN = "35364f0271cdc0d25e5f346eecb1bee0";
    
	public static void sendMessage(String id_sender , String id_receiver, String text ) {
		
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
		
		 Message message = Message
	                .creator(new PhoneNumber(id_receiver), 
	                         new PhoneNumber(id_sender), 
	                        text)
	                .create();
	        System.out.println(message.getSid());
	
	}
}
