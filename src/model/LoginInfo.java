package model;

public class LoginInfo {
	
	private String email, password;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean validate(String mdp) {
		if (password.equals(mdp)) {
			return true;
		} else {
			return false;
		}
	}
}