import java.security.PublicKey;

public class Producto {
    private String productName;

    public Producto (String productName){
        this.productName = productName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }
}
