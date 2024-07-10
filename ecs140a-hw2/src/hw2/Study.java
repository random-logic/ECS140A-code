package hw2;

public enum Study {
  GAMING_SCIENCE("Gaming Science", "S"),
  HOTEL_MANAGEMENT("Hotel Management", "M"),
  LOUNGE_ARTS("Lounge Arts", "A"),
  BEVERAGE_ENGINEERING("Beverage Engineering", "E");

  public static final String ILLEGAL_INPUT_MSG = "The input does not represent a major";

  public final String name;
  public final String symbol;

  private Study(String name, String symbol) {
    this.name = name;
    this.symbol = symbol;
  }

  @Override
  public String toString() {
    return name;
  }

  /**
   * Interprets a character input as a major
   * @param input The input
   * @return The corresponding major
   * @throws IllegalArgumentException if the input does not represent a major
   */
  public static Study interpretInput(String input) {
    for (Study major : Study.values()) {
      if (major.symbol.equals(input)) {
        return major;
      }
    }

    throw new IllegalArgumentException(ILLEGAL_INPUT_MSG);
  }
}