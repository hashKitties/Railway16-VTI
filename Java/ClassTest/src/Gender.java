
public enum Gender {
	MALE(0), FEMALE(1), UNKNOW(2);
	
	int sex;
	
	Gender(int i) {
		this.sex = i;
	}
	
	public int getGender() {
		return this.sex;
	}
}
