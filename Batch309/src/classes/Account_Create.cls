global class Account_Create {
    webservice static String create(String accName,String industry,String phone){
        String result;
        try{
        	Account acc= new Account();
        	acc.Name=accName;
        	acc.Industry=industry;
        	acc.Phone=phone;
        	insert acc;
            result='Record Created successfully';
            System.debug('This is checkpoint');
        }catch(Exception e){
            result='Insertion Failed :'+e.getMessage();
        }
        return result;
    }
}
