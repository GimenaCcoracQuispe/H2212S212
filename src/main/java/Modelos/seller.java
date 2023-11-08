package Modelos;
	
	// aca se trabajara la tabla seller(vendedor) 

public class seller {
	
	private Integer id;
	private String names;
	private	String lastname;
	private	String email;
	private String cellphone;
	private String seller_user;
	private String password_user;
	private String document_type;
	private String number_document;
	private String status;
	
		public seller() {
			// Constructor sin argumentos
		}
		
		public seller(Integer id, String names, String lastname, String email, String cellphone, String seller_user, String password_user, String document_type, String number_document ,String status){
			super();
			this.id = id;
			this.names = names;
			this.lastname = lastname;
			this.email = email;
			this.cellphone = cellphone;
			this.seller_user = seller_user;
			this.password_user = password_user;
			this.document_type = document_type;
			this.number_document = number_document;
			this.status = status;
			
		}
		 //Metodo Getterrs
	    public Integer getId() {
	        return id;
	    }

	    public String getNames() {
	        return names;
	    }

	    public String getLastnames() {
	        return lastname;
	    }

	    public String getEmail() {
	        return email;
	    }

	    public String getCellphone() {
	        return cellphone;
	    }

	    public String getSeller_user() {
	        return seller_user;
	    }

	    public String getPassword_user() {
	        return password_user;
	    }

	    public String getDocument_type() {
	        return document_type;
	    }

	    public String getNumber_document() {
	        return number_document;
	    }

	    public String getStatus() {
	        return status;
	    }

	    // Metodo setters
	    public void setId(Integer id) {
	        this.id = id;
	    }

	    public void setNames(String names) {
	        this.names = names;
	    }

	    public void setLastnames(String lastname) {
	        this.lastname = lastname;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }

	    public void setCellphone(String cellphone) {
	        this.cellphone = cellphone;
	    }

	    public void setSeller_user(String seller_user) {
	        this.seller_user = seller_user;
	    }

	    public void setPassword_user(String password_user) {
	        this.password_user = password_user;
	    }

	    public void setDocument_type(String document_type) {
	        this.document_type = document_type;
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
	        data += ", email: " + this.email;
	        data += ", cellphone: " + this.cellphone;
	        data += ", seller_user: " + this.seller_user;
	        data += ", password_user: " + this.password_user;
	        data += ", document_type: " + this.document_type;
	        data += ", number_document: " + this.number_document;
	        data += ", status: " + this.status + "]";
	        return data;
	    }
}
	

