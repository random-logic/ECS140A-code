package hw2;

public enum AcademicStanding {
  GOOD("good", "G"),
  WARNING("warning", "W"),
  PROBATION("probation", "P");

  public static final String ILLEGAL_INPUT_MSG = "The input does not represent an academic standing";

  public final String symbol;
  public final String name;

  private AcademicStanding(String name, String symbol) {
    this.symbol = symbol;
    this.name = name;
  }

  @Override
  public String toString() {
    return name;
  }

  /**
   * Interprets a character input as an academic standing
   * @param input The input
   * @return The corresponding academic standing
   * @throws IllegalArgumentException if the input does not represent an academic standing
   */
  public static AcademicStanding interpretInput(String input) {
    for (AcademicStanding standing : AcademicStanding.values()) {
      if (standing.symbol.equals(input)) {
        return standing;
      }
    }

    throw new IllegalArgumentException(ILLEGAL_INPUT_MSG);
  }
}
