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

    public boolean confirmProductExistByCode(String codigoDeProducto){
        Inventario__c qrId = [SELECT Id, Name FROM Inventario__c WHERE Inventario__c.IdExterno__c = :codigoDeProducto];
        if (qrID != null) {
            return true;
        } else {
            return false;
        }
    }

    public double searchProductByCode(String codigoDeProducto){
        Inventario__c unidades = [SELECT Id, Cantidad_dis__c FROM Inventario__c WHERE Inventario__c.IdExterno__c = :codigoDeProducto];
        if (unidades.Cantidad_dis__c > 0) {
            return unidades.Cantidad_dis__c;
        } else {
            return 0;
        }
    }

    public static void actualizarCantidad(String productoId, Decimal cantidad){
        Inventario__c inv = [SELECT IdExterno__c, Cantidad_dis__c, Cantidad_apart__c FROM Inventario__c WHERE IdExterno__c = :productoId];

        if(inv.Cantidad_dis__c > cantidad){
            inv.Cantidad_apart__c = inv.Cantidad_apart__c + cantidad;
            inv.Cantidad_dis__c = inv.Cantidad_dis__c - cantidad;
            update inv;
        }

        System.Debug(cantidad);
        System.Debug(inv.Cantidad_apart__c);
        System.Debug(inv.Cantidad_dis__c);
    }

    @InvocableMethod(label='StockAlert')
    public static void StockEmptyAlert(){
        List<Inventario__c> lstInv = new List<Inventario__C>();
        QuotationHelper qt = new QuotationHelper();

        lstInv = qt.productsInventory();
        List<FeedItem> feed = new List<FeedItem>();
        for(Inventario__c inv : lstInv){
            if (inv.Cantidad_dis__c == 0) {
                FeedItem objPost = new FeedItem();
                objPost.ParentId = UserInfo.getUserId();
                objPost.Body = 'Producto sin inventario';
                feed.add(objPost);
            }
        }
    }


}


