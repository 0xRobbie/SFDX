public with sharing class QuotationHelper {
    public static void initialConfig() {
        Account acc1 = new Account(Name='Compumundo');
        Account acc2 = new Account(Name='Compuworld');
        insert acc1;
        insert acc2;
        // SELECT id, name FROM Account WHERE Account.Name LIKE 'Compu%'
    }
}