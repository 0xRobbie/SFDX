public interface QuotationSync {
    boolean confirmProductExistByCode(String p_code);
    double searchProductByCode(String p_code);
}
