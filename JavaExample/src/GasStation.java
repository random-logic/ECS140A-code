public class GasStation {
  private int litres;

  public GasStation() {
    litres = 10000;
  }
  
  public void dispenseGas() {
    if (litres >= 100) {
      litres -= 100;
    }
    else {
      System.out.println("No more gas");
    }
  }

  public int getAvailableGas() {
    return litres;
  }
}