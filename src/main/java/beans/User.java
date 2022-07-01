package beans;

public class User {
	private String nom;
	private String prenom;
	private int accNumber;
	private int balance;
	private String password;
	private int isadmin;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	

	public User(String nom, String prenom, int accNumber, int balance, String password, int isadmin) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.accNumber = accNumber;
		this.balance = balance;
		this.password = password;
		this.isadmin = isadmin;
	}





	public int getIsadmin() {
		return isadmin;
	}

	public void setIsadmin(int isadmin) {
		this.isadmin = isadmin;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public int getAccNumber() {
		return accNumber;
	}

	public void setAccNumber(int accNumber) {
		this.accNumber = accNumber;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
