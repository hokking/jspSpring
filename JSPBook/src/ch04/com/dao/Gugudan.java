package ch04.com.dao;

public class Gugudan {
	public String process(int dan) {
		String res = "";
		for(int i = 1; i < 10; i++) {
			res += dan + " * " + i + " = " + (dan*i) + "<br>";
		}
		return res;
	}
	
	public int process1(int a, int b) {
		return a * b;
	}
}
