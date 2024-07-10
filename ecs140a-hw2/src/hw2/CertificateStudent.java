package hw2;

public class CertificateStudent extends Student {
  public static final double FIXED_FEE = 700;
  public static final double FEE_PER_CREDIT = 300;

  protected Study ceritficate;

  /**
   * Initialize a student based on student attributes
   * @param id The student id
   * @param firstName The student's first name
   * @param lastName The student's last name
   * @param age The student's age
   * @param credits The amount of credits the student is taking
   * @param certificate The type of certificate the student is pursuiting
   */
  public CertificateStudent(int id, String firstName, String lastName, int age, int credits, Study certificate) {
    super(id, firstName, lastName, age, credits);
    this.ceritficate = certificate;
  }

  @Override
  public double calculateFee() {
    double creditFee = credits * FEE_PER_CREDIT;
    return FIXED_FEE + creditFee;
  }

  @Override
  public void printData() {
    System.out.printf("%s is pursuiting a certificate in %s\n\n", firstName, ceritficate.toString());
  }
}
