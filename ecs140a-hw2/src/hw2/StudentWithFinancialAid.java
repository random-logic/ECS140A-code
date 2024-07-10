package hw2;

public class StudentWithFinancialAid extends DegreeSeekingStudent {
  protected double financialAid;

  /**
   * Initialize a student based on student attributes
   * @param id The student id
   * @param firstName The student's first name
   * @param lastName The student's last name
   * @param age The student's age
   * @param credits The amount of credits the student is taking
   * @param major The student's major
   * @param academicStanding Whether the student is in good academic standing
   * @param financialAid How much financial aid the student receives
   */
  public StudentWithFinancialAid(int id, String firstName, String lastName, int age, int credits, Study major, AcademicStanding academicStanding, double financialAid) {
    super(id, firstName, lastName, age, credits, major, academicStanding);
    this.financialAid = financialAid;
  }
  
  @Override
  public double calculateFee() {
    double feeBeforeFinanicalAid = super.calculateFee();
    return Math.max(feeBeforeFinanicalAid - financialAid, 0);
  }

  @Override
  public void printData() {
    super.printData();
    System.out.printf("%s has financial aid of $%,d per term\n\n", firstName, (int)financialAid);
  }
}
