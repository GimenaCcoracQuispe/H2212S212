	package Modelos;

public class product {
    private String code;
    private String description;
    private Integer stock;
    private double points;
    private String name;
    private String type;
    private String brand;
    private String state;
    
    public product(String code, String description, Integer stock, double points, String name, String type, String brand,String state) {
        super();
        this.code = code; 	 	
        this.description = description;
        this.stock = stock;
        this.points = points;
        this.name = name;
        this.type = type;
        this.brand = brand;
        this.state = state;
    }
    
    public product() {
        // Constructor vacío
    }

    // Getters
    public String getCode() {
        return code ;
    }

    public String getDescription () {
        return description ;
    }

    public Integer getStock() {
        return stock ;
    }

    public double getPoitns() {
        return points;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type ;
    }

    public String getBrand() {
        return brand;
    }
    
    public String getState() {
        return state ;
    }

  
    
    public void setCode(String code) {
		this.code  = code;
	}
    
    public void setDescription(String description ) {
        this.description  = description ;
    }

    public void setStock(Integer stock) {
        this.stock  = stock;
    }

    public void setPoints(double points ) {
        this.points = points;
    }

    public void setName(String name ) {
        this.name  = name ;
    }

    public void setType(String type ) {
        this.type  = type;
    }

    public void setBrand(String brand) {
        this.brand  = brand ;
    }
    public void setState(String state) {
        this.state  = state ;
    }

    @Override
    public String toString() {
        String data = "[code : " + this.code;
        data += ", description: " + this.description;
        data += ", stock: " + this.stock;
        data += ", points: " + this .points;
        data += ", name: " + this.name;
        data += ", type : " + this.type ;
        data += ", brand : " + this.brand ;
        data += ", state : " + this.state  + "]";
        return data;
    }

	public void setStock(String stock2) {
		// TODO Auto-generated method stub
		
	}

	public void setCost(String cost2) {
		// TODO Auto-generated method stub
		
	}
}
