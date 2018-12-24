package common.test;

public class A {
	
	private B b;
	
	private A  a;
	
	public static void main(String[] args) {
		A a = new A();
		
		System.out.println(a);
	}

}


class B{
	
	private A a;
	
}
