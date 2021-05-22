public class operando {
  int unidad; // *1
  int decena; // *20
  int centena; //*400
  int contador;

  public operando(String s) {
    this.unidad = Integer.valueOf(s);
    contador++;
  }

  public void llenar(String s) {
    switch(contador) {
    case 1:
      decena = Integer.valueOf(s);
      break;
    }
  }
}
