package Recommender;
import java.util.Vector;
import Recommender.Recommend_movie;

public class Recommend_user {

	/**
	 * @param args
	 */
	public int userid;
	public Vector<Recommend_movie> movieList;
	
	public Recommend_user() {
		movieList = new Vector<Recommend_movie>();
		userid = 0;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
