public class CotizacionController {
    
    private final sObject parent;
    public List<Inventario__c> resultados {get; set;}
    public string cod_prod { get; set; }
    public string cantidad { get; set; }

    public CotizacionController(ApexPages.StandardController controller){
        parent = controller.getRecord();
    }
        
    public PageReference buscarProducto(){
        resultados = [SELECT Id, IdExterno__c, Name, Cantidad_dis__c, Cantidad_apart__c, CodigoProd__c FROM Inventario__c WHERE IdExterno__c = :cod_prod];

        if (resultados.isEmpty()){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'El campo de cantidad debe ser mayor de 0 o tener un valor'));
        } 
        return null;
    }
    
    public PageReference ingresarCantidad(){
        resultados = [SELECT Id, IdExterno__c, Name, Cantidad_dis__c, Cantidad_apart__c, CodigoProd__c FROM Inventario__c WHERE IdExterno__c = :cod_prod];
        
        for (Inventario__c inv : resultados){
            if (inv.Cantidad_apart__c < 0 || String.valueOf(inv.Cantidad_apart__c) == '' ) {
            	ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'El campo de cantidad debe ser mayor de 0 o tener un valor'));
        	}
            
            if (inv.Cantidad_apart__c > inv.Cantidad_dis__c) {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'El campo de cantidad debe ser menor o igual a la disponibilidad'));
            }
        }
 
        return null;
    }

    public void cancelar(){
        if (!resultados.isEmpty()) {
            resultados.clear();
        }
    }
    
    public void atras(){
        if (!resultados.isEmpty()) {
            resultados.clear();
            cantidad = '';
        }
    }
}