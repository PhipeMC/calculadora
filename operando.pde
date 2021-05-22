public class operando {
  int unidad;
  int decena;
  int centena;
  int unMillar;
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
    case 2:
      centena = Integer.valueOf(s);
      break;
    case 3:
      unMillar = Integer.valueOf(s);
      break;
    }
  }
  
  
}
