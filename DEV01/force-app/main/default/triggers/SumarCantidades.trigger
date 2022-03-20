trigger SumarCantidades on QuoteLineItem (before insert) {
    for (QuoteLineItem prod : Trigger.New) {
        if (Trigger.isUpdate) {
           QuotationHelper.actualizarCantidad(prod.Inventario__r.IdExterno__c, prod.Quantity); 
        }
   }
}