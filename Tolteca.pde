public class Tolteca {
  operando[] operandos = new operando[2];
  String operador;
  int resultado;

  public Tolteca() {
  }

  public void getValue(String value) {
    if (isOperador(value)) {
      operador = value;
      print(value);
    } else {
      
    }
  }

  public boolean isOperador(String value) {
    char[] symbols = new char[]{'+', '-', '*', '/'};
    for (char c : symbols) {
      if (value.charAt(0) == c) {
        return true;
      }
    }
    return false;
  }
}
