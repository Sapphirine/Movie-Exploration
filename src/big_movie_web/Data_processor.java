package big_movie_web;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.Vector;

import big_movie_web.State_constants;
import big_movie_web.User_manager;
import Recommender.Recommend_correlation;
import Recommender.Recommend_list;
import Recommender.Recommend_user;
import Recommender.Recommend_movie;

public class Data_processor {

	/**
	 * @param args
	 */
	public String data_in;
	public Vector<Recommend_correlation> user_recommend_list;
	public Vector<Recommend_movie> movie_results;
	public static Connection conn = null;
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
	}
	@Override
	protected void finalize() throws SQLException{
		/*if (conn != null)
			conn.close();*/
	}
	
	public Data_processor() throws ClassNotFoundException {
		user_recommend_list = new Vector<Recommend_correlation>();
		movie_results = new Vector<Recommend_movie>();
		System.out.println("in construct");
	}
	
	public void init_data_base_conn() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
			String dbName = "movie_db";
			String userName = "syz";
			String password = "19911126";
			String hostname = "i-9148fa9d.casre98azkeg.us-west-2.rds.amazonaws.com";
			String port = "3306";
			/*String dbName = "fire_loct";
			String hostname = "localhost";
			String userName = "root";
			String password = "19911126";*/ 

			String jdbcUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName
					+ "?user=" + userName + "&password=" + password;
			conn =
					DriverManager.getConnection(jdbcUrl);
		/*}catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		}*/
	}
	
	public float category_avg_rate(String category) throws SQLException, ClassNotFoundException {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		float avg_rate = 0;
		
		init_data_base_conn();
		
		if (conn == null)
			return State_constants.null_pointer;
		
		stmt = conn.createStatement();
		
		if (stmt == null)
			return State_constants.null_pointer;
		
		sql = "select avg(avgrate) as avg from movie_category where category = '" + category + "'";
		rs = stmt.executeQuery(sql);
		if (rs == null)
			return State_constants.null_pointer;
		
		while (rs.next()) {
			avg_rate = rs.getFloat("avg");
		}
		
		return avg_rate;
	}
	
	private void erase_dup(Vector<Recommend_correlation> original_vec)
	{
		user_recommend_list.removeAllElements();
		for (int i = 0; i < original_vec.size(); i++) {
			boolean is_dup = false;
			for (int j = 0; j < user_recommend_list.size(); j++) {
				if (original_vec.get(i).highest_mov.movId == 
						user_recommend_list.get(j).highest_mov.movId) {
					is_dup = true;
					break;
				}
			}
			if (!is_dup) {
				user_recommend_list.add(original_vec.get(i));
			}
		}
	}
	
	/*private void sort_user_movie()
	{
		Recommend_correlation tmp = new Recommend_correlation();
		for (int i = 0; i < user_recommend_list.size() - 1; i++) {
			for (int j = 0; j < user_recommend_list.size() - 1 - i; j++) {
				if (user_recommend_list.get(j).highest_mov.movRate
						< user_recommend_list.get(j + 1).highest_mov.movRate) {
					tmp = user_recommend_list.get(j + 1);
					user_recommend_list.setElementAt(user_recommend_list.get(j),j+1);
					user_recommend_list.setElementAt(tmp,j);
				}
			}
			movie_results.add(0, tmp.highest_mov);
		}
		movie_results.add(0, user_recommend_list.get(0).highest_mov);
	}*/
	
	public int recommend_key_word(Vector<String> get_category) throws SQLException, ClassNotFoundException {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		
		
		init_data_base_conn();
		if (conn == null)
			return State_constants.null_pointer;	
		
		stmt = conn.createStatement();
		if (stmt == null)
			return State_constants.null_pointer;
		System.out.println(get_category.size());
		for (int i = 0; i < get_category.size(); i++) {
			System.out.println(get_category.get(i));
			sql = "select movserial from movie_category where category = '" + get_category.get(i) + "'" +
					" order by avgrate desc limit 3";
			System.out.println("in key recommend");
			rs = stmt.executeQuery(sql);
			if (rs == null)
				return State_constants.null_pointer;
			System.out.println("oopo");
			while (rs.next()) {
				 String movSerial = rs.getString("movserial");
				 String Url = State_constants.aws_movie_url + movSerial;
				 Recommend_movie movie = new Recommend_movie();
				 movie.mvURL = Url;
				 movie_results.add(movie);
			}
		}
		return 0;
	}
	
	private int compose_movie_url(boolean is_User) throws ClassNotFoundException, SQLException
	{
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		String serial = null;
		
		try{
			init_data_base_conn();
		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			return -1;
		}
		
		if (conn == null)
			return State_constants.null_pointer;
		stmt = conn.createStatement();
		
		if (stmt == null)
			return State_constants.null_pointer;
		
		for (int i = 0; i < user_recommend_list.size(); i++) {
			if (is_User)
				sql = "select movserial from movie_log where movid ='"
						+ user_recommend_list.get(i).highest_mov.movId + "'";
			else
				sql = "select movserial from movie_log where movid ='"
						+ user_recommend_list.get(i).item_mov.movId + "'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				serial = rs.getString("movserial");
				user_recommend_list.get(i).highest_mov.mvURL = State_constants.aws_movie_url + serial;
				user_recommend_list.get(i).highest_mov.mvSerial = serial;
				user_recommend_list.get(i).item_mov.mvURL = State_constants.aws_movie_url + serial;
				user_recommend_list.get(i).item_mov.mvSerial = serial;
			}
			rs.close();
			if (is_User && user_recommend_list.get(i).highest_mov.movId > 0)
				movie_results.add(user_recommend_list.get(i).highest_mov);
			else if (!is_User && user_recommend_list.get(i).item_mov.movId > 0)
				movie_results.add(user_recommend_list.get(i).item_mov);
		}
		stmt.close();
		conn.close();
		return 0;
	}
		
	public int user_recommend(User_manager user) throws SQLException, ClassNotFoundException {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		
		if (user.get_name() == null)
			return State_constants.signup_error;
		
		try{
			init_data_base_conn();
		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			return -1;
		}
		
		if (conn == null)
			return -1;
		
		System.out.println(user.get_name());
		
		sql = "select id from user_reg where name = '" + user.get_name() + "'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		Recommend_user toUser= new Recommend_user();
		while (rs.next()) {
			toUser.userid = rs.getInt("id");
		}
		
		System.out.println(toUser.userid);
		rs.close();
		if (toUser.userid == 0)
			return State_constants.signup_error;
		
		sql = "select productid, rate from movie_refine where userid=" + toUser.userid;
		System.out.println(sql);
		rs = stmt.executeQuery(sql);
		if (rs == null)
			System.out.println("null rs!!");
		while (rs.next()) {
			Recommend_movie movie = new Recommend_movie();
			movie.movId = rs.getInt("productid");
			movie.movRate = rs.getInt("rate");
			System.out.println("" + movie.movId + " " + movie.movRate);
			toUser.movieList.add(movie);
		}
		rs.close();
		System.out.println(toUser.movieList.size());
		sql = "select * from movie_refine group by userid";
		System.out.println(sql);
		rs = stmt.executeQuery(sql);
		Recommend_user fromUser = new Recommend_user();		
		Recommend_list recommandList = new Recommend_list();
		while (rs.next()) {
			int userid = rs.getInt("userid");
			int movid = rs.getInt("productid");
			int rate = rs.getInt("rate");
			//System.out.println(""+userid);
			if (fromUser.userid == 0) {
				fromUser.userid = userid;
			} else if (fromUser.userid != userid) {
				Recommend_correlation correlation = new Recommend_correlation();
				correlation.get_correlation(fromUser, toUser);
				recommandList.add_recommendation(correlation);
				fromUser = new Recommend_user();
				fromUser.userid = userid;
				//System.out.println(recommandList.correlation_list.size());
			}
			
			Recommend_movie movie = new Recommend_movie();
			movie.movId = movid;
			movie.movRate = rate;
			fromUser.movieList.add(movie);
		}
		if (fromUser.userid > 0) {
			Recommend_correlation correlation = new Recommend_correlation();
			correlation.get_correlation(fromUser, toUser);
			recommandList.add_recommendation(correlation);
		}
		rs.close();
		if (conn != null)
			conn.close();
		System.out.println("before erase_dup");
		erase_dup(recommandList.correlation_list);
		//sort_user_movie();
		/*for (int i = 0; i < movie_results.size(); i++) {
			System.out.println(movie_results.get(i).movId);
		}*/
		
		compose_movie_url(true);
		
		for (int i = 0; i < user_recommend_list.size(); i++) {
			System.out.println(user_recommend_list.get(i).highest_mov.movId);
		}
		return 0;
	}
	
	public int user_id_of(User_manager user) throws SQLException {
		int id = 0;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		
		if (conn == null)
			return State_constants.null_pointer;
		
		stmt = conn.createStatement();
		
		if (stmt == null)
			return State_constants.null_pointer;
		
		sql = "select id from user_reg where name = '" + user.get_name() + "'";
		rs = stmt.executeQuery(sql);
		if (rs == null)
			return State_constants.null_pointer;
		
		while (rs.next()) {
			id = rs.getInt("id");
		}
		
		return id;
	}
	
	public int item_recommend(User_manager user) throws ClassNotFoundException, SQLException
	{
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		
		if (user.get_name() == null)
			return State_constants.signup_error;
		
		try {
				init_data_base_conn();
		} catch (SQLException ex) {
				// TODO Auto-generated catch block
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			return State_constants.null_pointer;
		}
		
		if (conn == null)
			return State_constants.null_pointer;
		
		stmt = conn.createStatement();
		
		if (stmt == null)
			return State_constants.null_pointer;
		
		sql = "select id from user_reg where name = '" + user.get_name() + "'";
		rs = stmt.executeQuery(sql);
		if (rs == null)
			return State_constants.null_pointer;
		Recommend_user toUser = new Recommend_user();
		while (rs.next()) {
			toUser.userid = rs.getInt("id");
		}
		if (rs != null)
			rs.close();
		if (toUser.userid == 0)
			return State_constants.signup_error;

		sql = "select productid, rate from movie_refine where userid=" + toUser.userid;
		System.out.println(sql);
		rs = stmt.executeQuery(sql);
		if (rs == null)
			return State_constants.null_pointer;
		while (rs.next()) {
			Recommend_movie movie = new Recommend_movie();
			movie.movId = rs.getInt("productid");
			movie.movRate = rs.getInt("rate");
			System.out.println("" + movie.movId + " " + movie.movRate);
			toUser.movieList.add(movie);
		}
		rs.close();

		for (int i = 0; i < toUser.movieList.size(); i++) {
			sql = "select avg(rate) as average from movie_refine where productid="
				+toUser.movieList.get(i).movId;
			rs = stmt.executeQuery(sql);
			if (rs == null)
				return State_constants.null_pointer;

			while (rs.next()) {
				toUser.movieList.get(i).avgRate = rs.getDouble("average");
			}
		}

		sql = "select productid, avg(rate) as average from movie_refine group by productid";
		
		rs = stmt.executeQuery(sql);
		if (rs == null)
			return State_constants.null_pointer;
		Recommend_list recommandList = new Recommend_list();
		while (rs.next()) {
			Recommend_movie movie = new Recommend_movie();
			movie.movId = rs.getInt("productid");
			movie.avgRate = rs.getDouble("average");
			Recommend_correlation correlation = new Recommend_correlation();
			correlation.get_item_correlation(toUser, movie);
			recommandList.add_item_recommendation(correlation);
		}
		rs.close();
		/*System.out.println(recommandList.correlation_list.size());
		for (int i = 0; i < recommandList.correlation_list.size(); i++) {
			System.out.println(recommandList.correlation_list.get(i).item_mov.movId);
		}*/
		
		System.out.println(recommandList.correlation_list.size());
		for (int i = 0; i < recommandList.correlation_list.size(); i++) {
			System.out.println(recommandList.correlation_list.get(i).item_mov.movId);
		}

		if (conn != null)
			conn.close();
		user_recommend_list = recommandList.correlation_list;
		compose_movie_url(false);
		return 0;
	}
	
	public int insert_movie_record(User_manager user, Recommend_movie movie) throws ClassNotFoundException, SQLException
	{
		Statement stmt = null;
		ResultSet rs = null;
		
		init_data_base_conn();
		if (conn == null)
			return State_constants.null_pointer;
		
		stmt = conn.createStatement();
		if (conn == null)
			return State_constants.null_pointer;
		
		int user_id = user_id_of(user);
		
		if (user_id == 0)
			return State_constants.null_pointer;
		
		String sql = "insert into movie_refine values('" + user_id
				+ "'," + movie.movId + "," + movie.movRate + ")";
		System.out.println(sql);
		if (stmt == null)
			return State_constants.null_pointer;
		stmt.executeUpdate(sql);
		
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
		return 0;
	}
	
	public int sign_up(User_manager user) throws SQLException, ClassNotFoundException {
		Statement stmt = null;
		ResultSet rs = null;
		int id = 0;
		
		System.out.println("in sign_up " + user.get_name());
		
		if (user.get_name() == null || user.get_password() == null)
			return State_constants.signup_error;	
		
		
		try {
			init_data_base_conn();
		} catch (SQLException ex) {
				// TODO Auto-generated catch block
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			return State_constants.null_pointer;
		}
		
		if (conn == null)
			return State_constants.null_pointer;
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery("SELECT * FROM user_reg");		
		
		while(rs.next()) {
			String username = rs.getString("name");
			id = rs.getInt("id");
			if (username.equals(user.get_name())) {
					System.out.println("match");
					return State_constants.user_exist;
			}
		}
		String insertSql = "insert into user_reg " + "values("
				+ (id + 1) + ",'" + user.get_name() + "','" + user.get_password() + "')";
		stmt.executeUpdate(insertSql);
		
		if (conn != null)
			conn.close();
		return State_constants.signed_up;
	}
	
	public int login(User_manager user) throws ClassNotFoundException, SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		System.out.println("in login" + user.get_name());
		try {
			init_data_base_conn();
		} catch (SQLException ex) {
			// TODO Auto-generated catch block
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
			return State_constants.null_pointer;
		}
		
		if(conn == null)
			return State_constants.null_pointer;
		
		System.out.println("null_pointer");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT password FROM user_reg where name = '" + user.get_name() + "'");
			boolean isfound = false;
			while(rs.next()) {
				isfound = true;
				String password = rs.getString("password");
				if (password.equals(user.get_password())) {
						System.out.println("match");
						return State_constants.user_match;
				}
			}
			if (isfound)
				return State_constants.wrong_passward;
			else
				return State_constants.user_not_exist;
		} catch (SQLException ex) {
			;
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException sqlEx) {}
				
				rs = null;
			}
			
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException sqlEx) {}
			}
		}
		if(conn != null)
			conn.close();
		return State_constants.user_not_exist;
	}
}
