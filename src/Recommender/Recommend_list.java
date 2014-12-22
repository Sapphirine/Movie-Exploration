package Recommender;

import big_movie_web.State_constants;
import java.util.Vector;

public class Recommend_list {

	public Vector<Recommend_correlation> correlation_list;
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	public Recommend_list() {
		correlation_list = new Vector<Recommend_correlation>();
	}
	
	public void add_recommendation(Recommend_correlation new_correlation) {
		correlation_list.add(new_correlation);
		if (correlation_list.size() > State_constants.Max_Recommend_Num) {
			Recommend_correlation lowest_correlation = new Recommend_correlation();
			lowest_correlation.correlation = 1.0;
			for (int i = 0; i < correlation_list.size(); i++) {
				if (correlation_list.get(i).correlation <= lowest_correlation.correlation)
					lowest_correlation = correlation_list.get(i);
			}
			//correlation_list.remove(0);
			correlation_list.remove(lowest_correlation);
		}
	}
	
	public void add_item_recommendation(Recommend_correlation new_correlation) {
		correlation_list.add(new_correlation);
		if (correlation_list.size() > State_constants.Max_Recommend_Num) {
			Recommend_correlation lowest_correlation = new Recommend_correlation();
			lowest_correlation.lowest_item_diff = 0.0;
			
			for (int i = 0; i < correlation_list.size(); i++) {
				if (correlation_list.get(i).lowest_item_diff >= lowest_correlation.lowest_item_diff)
					lowest_correlation = correlation_list.get(i);
			}
			//correlation_list.remove(0);
			correlation_list.remove(lowest_correlation);
		}
	}
}
