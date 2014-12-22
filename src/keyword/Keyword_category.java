package keyword;

public class Keyword_category {

	/**
	 * @param args
	 */
	
	public int action;
	public int adventure;	
	public int comedy;
	public int crime;
	public int drama;
	public int historical;
	public int horror;
	public int musical;
	public int science;	
	public int war;
	public int romantic;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	public Keyword_category( int new_action,
		int new_adventure,
		int new_comedy,
		int new_crime,
		int new_drama,
		int new_historical,
		int new_horror,
		int new_musical,
		int new_science,	
		int new_war,
		int new_romantic) {
		action = new_action;
		adventure = new_adventure;
		comedy = new_comedy;
		crime = new_crime;
		drama = new_drama;
		historical = new_historical;
		horror = new_horror;
		musical = new_musical;
		science = new_science;
		war = new_war;
		romantic = new_romantic;
	}

}
