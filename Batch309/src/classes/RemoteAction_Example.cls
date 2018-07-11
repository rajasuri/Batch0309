global class RemoteAction_Example {
	@RemoteAction
    global static String callMe(String name){
        String result ='Your Name :'+name;
        return result;
    }
}