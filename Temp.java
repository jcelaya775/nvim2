import java.sql.Array;
import java.util.ArrayList;

public class Temp {
  public static void main(String[] args) {
    for (int i = 0; i < 10; i++) {
      System.out.println("hello world " + i);
      System.out.println();

      sayHi();
    }
  }

  public static void sayHi() {
    System.out.println();
    StringBuilder sb = new StringBuilder();
    sb.append("sayHi");
  }
}
