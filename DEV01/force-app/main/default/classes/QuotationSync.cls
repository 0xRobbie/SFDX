public interface QuotationSync {
    boolean confirmProductExistByCode(String codigoDeProducto);
    double searchProductByCode(String codigoDeProducto);
}