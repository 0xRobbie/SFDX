public class QuotationHelper implements QuotationSync {
// public class QuotationHelper implements QuotationSync {
    public static void initialConfig() {
        Account acc1 = new Account(Name='Compumundo');
        Account acc2 = new Account(Name='Compuworld');
        insert acc1;
        insert acc2;
        // SELECT id, name FROM Account WHERE Account.Name LIKE 'Compu%'
    }

    public List<Inventario__c> productsInventory(){
        List<Inventario__c> inv = [SELECT Id, IdExterno__c, Name, Cantidad_dis__c, Cantidad_apart__c, CodigoProd__c FROM Inventario__c ];
        return inv;
    }

    public boolean confirmProductExistByCode(String p_code){
        Product__c qrId = [SELECT id FROM Product__c WHERE Product__c.ProductCode__c = :p_code];
        if (qrID != null) {
            return true;
        } else {
            return false;
        }
    }

    public double searchProductByCode(String p_code){
        Inventario__c unidades = [SELECT Id, Cantidad_dis__c FROM Inventario__c WHERE Inventario__c.CodigoProd__c = :p_code];
        if (unidades.Cantidad_dis__c > 0) {
            return unidades.Cantidad_dis__c;
        } else {
            return 0;
        }
    }

}

