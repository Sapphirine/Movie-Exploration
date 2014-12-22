package keyword;

import java.util.Vector;

import sun.tools.jar.resources.jar;

import com.amazonaws.services.support.model.CaseCreationLimitExceededException;

public class Keyword_score {

	/**
	 * @param args
	 */
	private Vector<Integer> categories;
	private float sum;
	private int count;
	private Vector<Float> key_vec;
	private Keyword_category key_word_sum;

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	public Keyword_score() {
		sum = 0;
		key_vec = new Vector<Float>();
		categories = new Vector<Integer>();
		count = 0;
		key_word_sum = new Keyword_category(0,0,0,0,0,0,0,0,0,0,0);
	}
	
	public void sum_key_word(Keyword_category key_word) {
		key_word_sum.action += key_word.action;
		key_word_sum.adventure += key_word.adventure;
		key_word_sum.comedy += key_word.comedy;
		key_word_sum.crime += key_word.crime;
		key_word_sum.drama +=key_word.drama;
		key_word_sum.historical += key_word.historical;	
		key_word_sum.horror += key_word.horror;
		key_word_sum.musical +=  key_word.musical;	
		key_word_sum.science += key_word.science;
		key_word_sum.war += key_word.war;
		key_word_sum.romantic += key_word.romantic;
		/*categories.add(key_word.action);
		categories.add(key_word.adventure);
		categories.add(key_word.comedy);
		categories.add(key_word.crime);
		categories.add(key_word.drama);
		categories.add(key_word.historical);	
		categories.add(key_word.horror);
		categories.add(key_word.musical);	
		categories.add(key_word.science);
		categories.add(key_word.war);
		categories.add(key_word.romantic);*/
	}


	public String get_category_str(int index) {
		String cate_str = new String();
		switch (index) {
		case 0:
			cate_str = "action";
			break;
		case 1:
			cate_str = "adventure";
			break;
		case 2:
			cate_str = "comedy";
			break;
		case 3:
			cate_str = "crime";
			break;
		case 4:
			cate_str = "drama";
			break;
		case 5:
			cate_str = "historical";
			break; 
		case 6:
			cate_str = "horror";
			break;
		case 7:
			cate_str = "musical/dance";
			break;
		case 8:
			cate_str = "science/fiction";
			break;
		case 9:
			cate_str = "war";
			break;
		case 10:
			cate_str = "romantic";
			break;
		default:
			cate_str = "crime";
		}
		return cate_str;
	} 
	
	public Vector<String> get_category() {
		
		categories.add(key_word_sum.action);
		categories.add(key_word_sum.adventure);
		categories.add(key_word_sum.comedy);
		categories.add(key_word_sum.crime);
		categories.add(key_word_sum.drama);
		categories.add(key_word_sum.historical);	
		categories.add(key_word_sum.horror);
		categories.add(key_word_sum.musical);	
		categories.add(key_word_sum.science);
		categories.add(key_word_sum.war);
		categories.add(key_word_sum.romantic);
		System.out.println(categories.size());
		Vector<String> categories_str = new Vector<String>();
		int last_max_i = -1;
		for (int i = 0; i < 3; i++) {
			int tmp_max = Integer.MIN_VALUE;
			int tmp_i = 0;
			for (int j = 0; j < categories.size(); j++) {
				if (categories.get(i) > tmp_max && i != last_max_i) {
					tmp_max = categories.get(i);
					tmp_i = i;
				}
			}
			last_max_i = tmp_i;
			String category_tmp = new String(get_category_str(tmp_i));
			categories_str.add(category_tmp);
		}
		for (int i = 0 ; i < 3 ; i++)
		System.out.println(categories_str.get(i));
		return categories_str;
	}
	
	public void add_key_word(Keyword_category key_word) {
		int denominator =
				+ key_word.action
				+ key_word.adventure
				+ key_word.comedy
				+ key_word.crime
				+ key_word.drama
				+ key_word.historical	
				+ key_word.horror
				+ key_word.musical	
				+ key_word.science
				+ key_word.war
				+ key_word.romantic;
		float numerator = 
				 key_word.action * Keyword_constants.action_avg
				+ key_word.adventure * Keyword_constants.adventure_avg
				+ key_word.comedy * Keyword_constants.comedy_avg
				+ key_word.crime * Keyword_constants.crime_avg
				+ key_word.drama * Keyword_constants.drama_avg
				+ key_word.historical * Keyword_constants.historical_avg	
				+ key_word.horror * Keyword_constants.horror_avg
				+ key_word.musical * Keyword_constants.musical_avg	
				+ key_word.science * Keyword_constants.science_avg
				+ key_word.war * Keyword_constants.war_avg
				+ key_word.romantic * Keyword_constants.romantic_avg;
		if (denominator != 0) {
			float temp = numerator/denominator;
			sum = sum + temp;
			count++;
			System.out.println(sum);
			System.out.println(numerator/denominator);
		}
		
		System.out.println(sum);
		System.out.println(count);
	}
	
	public float average_score() {
		return (sum/count);
	}
}

