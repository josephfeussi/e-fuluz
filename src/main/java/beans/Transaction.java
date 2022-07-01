package beans;

public class Transaction {

	private int transId;
	private int accNumber;
	private int amount; 
	private String tranType;
	
	public Transaction(int transId, int accNumber, int amount, String tranType ) {
		super();
		this.transId = transId;
		this.accNumber = accNumber;
		this.amount = amount;
		this.tranType = tranType;
	}
	
	

	public Transaction() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getTransId() {
		return transId;
	}

	public void setTransId(int transId) {
		this.transId = transId;
	}

	public int getAccNumber() {
		return accNumber;
	}

	public void setAccNumber(int accNumber) {
		this.accNumber = accNumber;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getTranType() {
		return tranType;
	}

	public void setTranType(String tranType) {
		this.tranType = tranType;
	}
	
	
}
