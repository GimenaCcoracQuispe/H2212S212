package Modelos;
	//aca se trabajara la tabla client(cliente) 
	
public class client {
	private Integer id;
	private String names;
	private	String lastname;
	private	String cellphone;
	private String email;
	private String type_document;
	private String number_document;
	private String status;
	
	public client(Integer id, String names, String lastname, String cellphone, String email, String type_document, String number_document, String status){
		super();
		this.id = id;
		this.names = names;
		this.lastname = lastname;
		this.cellphone = cellphone;
		this.email = email;
		this.type_document = type_document;
		this.number_document = number_document;
		this.status = status;
	}
	public client() {
		// TODO Auto-generated constructor stub
	}
	
	// Metodo Getters
    public Integer getId() {
        return id;
    }

    public String getNames() {
        return names;
    }

    public String getLastname() {
        return lastname;
    }

    public String getCellphone() {
        return cellphone;
    }

    public String getEmail() {
        return email;
    }

    public String getType_document() {
        return type_document;
    }

    public String getNumber_document() {
        return number_document;
    }

    public String getStatus() {
        return status;
    }

    // Metodo Setters
    public void setId(Integer id) {
        this.id = id;
    }

    public void setNames(String names) {
        this.names = names;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setType_document(String type_document) {
        this.type_document = type_document;
    }

    public void setNumber_document(String number_document) {
        this.number_document = number_document;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    
    @Override
    public String toString() {
        String data = "[id: " + this.id;
        data += ", names: " + this.names;
        data += ", lastname: " + this.lastname;
        data += ", cellphone: " + this.cellphone;
        data += ", email: " + this.email;
        data += ", type_document: " + this.type_document;
        data += ", number_document: " + this.number_document;
        data += ", status: " + this.status + "]";
        return data;
    }
}
