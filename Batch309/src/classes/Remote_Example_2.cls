global class Remote_Example_2 {
	@RemoteAction
    global static Id create(String name,String phone){
        	Account acc=new Account();
        	acc.Name=name;
        	acc.Phone=phone;
        	insert acc;
        	return acc.Id;
    }
}