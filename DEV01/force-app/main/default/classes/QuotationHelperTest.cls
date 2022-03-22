@isTest
private class QuotationHelperTest {
    
    // PASS
    @isTest static void initialConfig(){
        QuotationHelper.initialConfig();
    }

    // PASS
    @isTest static void productsInventory(){
        QuotationHelper var = new QuotationHelper(); 
        var.productsInventory();
    }

    @isTest static void confirmProductExistByCode(){
        QuotationHelper var = new QuotationHelper();
        boolean idTest = var.confirmProductExistByCode('Prod-00001');
        System.assertEquals(true, idTest);
    }
    
    @isTest static void confirmProductExistByCodeTrue(){
        QuotationHelper var = new QuotationHelper(); 
        boolean idTest = var.confirmProductExistByCode('36987-1333');
        System.assertEquals(false, idTest);
    }
    
    @isTest static void searchProductByCodeTrue(){
        QuotationHelper var = new QuotationHelper(); 
        decimal idTest = var.searchProductByCode('Prod-00001');
        System.assertEquals(20, idTest);
    }
    
    @isTest static void searchProductByCodeFalse(){
        QuotationHelper var = new QuotationHelper(); 
        decimal idTest = var.searchProductByCode('');
        System.assertEquals(0, idTest);
    }
    
    @isTest static void actualizarCantidad(){
        QuotationHelper.actualizarCantidad('Prod-00001', 50);
    }

    // PASS
    @isTest static void alertaDeStock(){
        QuotationHelper.StockEmptyAlert();
    }

}
