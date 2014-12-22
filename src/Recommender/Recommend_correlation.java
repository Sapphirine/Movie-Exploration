package Recommender;

public class Recommend_correlation {

	public double correlation;
	private Recommend_user fromUser;
	private Recommend_user toUser;
	public Recommend_movie highest_mov;
	public Recommend_movie item_mov;
	public double lowest_item_diff;
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub		
	}
	
	public Recommend_correlation() {
		highest_mov = new Recommend_movie();
		item_mov = new Recommend_movie();
		lowest_item_diff = Double.MAX_VALUE;
	}
	
	private double calculate_correlation() {
		double sum = 0;
		for (int i = 0; i < fromUser.movieList.size(); i++) {
			for (int j = 0; j < toUser.movieList.size(); j++) {
				int fromMov = fromUser.movieList.get(i).movId;
				int toMov = toUser.movieList.get(j).movId;
				if (fromMov == toMov) {
					int diff = Math.abs(fromUser.movieList.get(i).movRate
							- toUser.movieList.get(j).movRate);
					sum = sum + diff * diff;
					//if (fromUser.movieList.get(i).movRate >= highest_mov.movRate)
					//	highest_mov = fromUser.movieList.get(i);
				}
				else {
					//System.out.println("in not equal");
					sum = sum + toUser.movieList.get(j).movRate * toUser.movieList.get(j).movRate * 0.1;
					if (fromUser.movieList.get(0).movRate >= highest_mov.movRate) {
						highest_mov = fromUser.movieList.get(i);
					}
				}
			}
		}
		double distance = Math.sqrt(sum);
		correlation = 1/(1 + distance);
		//if (sum != 15)
			//System.out.println(correlation + " " + distance + " " + sum + " " + highest_mov.movId);
		return correlation;
	}
	
	public double get_correlation(Recommend_user new_from,
			Recommend_user new_to) {
		if (new_from.userid == new_to.userid) {
			correlation = -1;
			return correlation;
		}			
		fromUser = new_from;
		toUser = new_to;
		calculate_correlation();
		return correlation;
	}
	
	public double get_item_correlation(Recommend_user user,
			Recommend_movie movie) {
		item_mov = movie;
		double diff = 0;
		for (int i = 0; i < user.movieList.size(); i++) {
			if (user.movieList.get(i).movId == movie.movId)
				continue;
			
			diff = Math.abs(item_mov.avgRate - user.movieList.get(i).avgRate);
			if (diff <= Double.MAX_VALUE) {
				lowest_item_diff = diff;
			}
		}
		return 0;
	}
}
