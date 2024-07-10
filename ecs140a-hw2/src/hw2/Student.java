package hw2;

public abstract class Student {
  protected int id;
  protected String firstName;
  protected String lastName;
  protected int age;
  protected int credits;

  /**
   * Initialize a student based on student attributes
   * @param id The student id
   * @param firstName The student's first name
   * @param lastName The student's last name
   * @param age The student's age
   * @param credits The amount of credits the student is taking
   */
  public Student(int id, String firstName, String lastName, int age, int credits) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
    this.credits = credits;
  }
  
  /**
   * Gets the fee based on student attributes
   * @return The calculated fee
   */
  public abstract double calculateFee();

  /**
   * Prints the student attributes
   */
  public void printData() {
    System.out.printf("ID Number: %d\n", id);
    System.out.printf("Name: %s %s\n", firstName, lastName);
    System.out.printf("Age: %d\n\n", age);
  }
  
  /**
   * Gets the full name of the student
   * @return The full name of the student
   */
  public String getName() {
    return firstName + " " + lastName;
  }
}
