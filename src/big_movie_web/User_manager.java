package big_movie_web;

public class User_manager {

	/**
	 * @param args
	 */
	private String username;
	private String password;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	public User_manager() {
		username = new String();
		password = new String();
	}
	
	public void set_user_attr(String newName, String newPass) {
		username = newName;
		password = newPass;
	}
	
	public String get_name() {
		return username;
	}
	
	public String get_password() {
		return password;
	}

}
