package message;

public class math {
	
	public static String radom(int num) {
		String r="";
		int n=0;
		for (int i = 0; i < num; i++) {
			n=(int) (Math.random()*10);
			if (n==0){
				n=8;
			}
			r+=String.valueOf(n);
		}
		return r;
	}

}
