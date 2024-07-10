package hw2;

public class DegreeSeekingStudent extends Student {
  protected Study major;
  protected AcademicStanding academicStanding;

  public static final double REC_AND_ATHLETICS_FEE = 100;
  public static final double STUDENT_UNION_FEE = 50;
  public static final double FEE_PER_CREDIT = 275;
  public static final int MAX_CREDITS_ASSESSED = 12;

  public final double MAX_FEE = MAX_CREDITS_ASSESSED * FEE_PER_CREDIT;

  /**
   * Initialize a student based on student attributes
   * @param id The student id
   * @param firstName The student's first name
   * @param lastName The student's last name
   * @param age The student's age
   * @param credits The amount of credits the student is taking
   * @param major The student's major
   * @param academicStanding Whether the student is in good academic standing
   */
  public DegreeSeekingStudent(int id, String firstName, String lastName, int age, int credits, Study major, AcademicStanding academicStanding) {
    super(id, firstName, lastName, age, credits);
    this.major = major;
    this.academicStanding = academicStanding;
  }

  @Override
  public double calculateFee() {
    double creditFee = Math.min(credits * FEE_PER_CREDIT, MAX_FEE);
    return REC_AND_ATHLETICS_FEE + STUDENT_UNION_FEE + creditFee;
  }

  @Override
  public void printData() {
    super.printData();
    System.out.printf("%s is a degree-seeking student enrolled in %d credits\n", firstName, credits);
    System.out.printf("%s's major is %s\n", firstName, major.toString());
    System.out.printf("%s's academic standing is %s\n\n", firstName, academicStanding.toString());
  }
}
