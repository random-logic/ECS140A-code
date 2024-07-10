package hw2;

public class SeniorCitizen extends Student {
  public static final int BASE_CREDITS = 6;
  public static final double BASE_FEE = 100;
  public static final double ADDITIONAL_FEE_PER_CREDIT = 50;
  
  public static final int MIN_AGE = 65;
  public static final String ILLEGAL_AGE_MSG = "Student does not meet min age requirement to qualify as senior citizen";

  /**
   * Initialize a student based on student attributes
   * @param id The student id
   * @param firstName The student's first name
   * @param lastName The student's last name
   * @param age The student's age
   * @param credits The amount of credits the student is taking
   * @throws IllegalArgumentException if the student does not meet the MIN_AGE requirement
   */
  public SeniorCitizen(int id, String firstName, String lastName, int age, int credits) {
    super(id, firstName, lastName, age, credits);

    // Must meet min age
    if (age < MIN_AGE) {
      throw new IllegalArgumentException(ILLEGAL_AGE_MSG);
    }
  }

  @Override
  public double calculateFee() {
    int additionalCredits = Math.max(credits - BASE_CREDITS, 0);
    double additionalFee = additionalCredits * ADDITIONAL_FEE_PER_CREDIT;
    return BASE_FEE + additionalFee;
  }

  @Override
  public void printData() {
    System.out.printf("%s is a senior citizen above the age of %d\n\n", firstName, MIN_AGE);
  }
}
