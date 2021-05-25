Button[] btnList;  //<>// //<>// //<>// //<>//
ArrayList<String> operacion; //Contiene la operacion a realizar
int limit; //Limite de digitos para la operacion
String last; //Ultimo numero tecleado
String [] result; //= new String[]{"19","19","19","19"}; Resultado de la operacion realizada
PImage[] cifras; //Array de PImage para representar el resultado
PImage lastNum; //PImage para representar el ulitmo numero ingresado

void setup() {
  size(415, 770);
  surface.setTitle("Calculadora Tolteca/Maya");
  background(#555555);
  buttonsCreate();
  pimagesCreate();
  operacion = new ArrayList<String>();
}

void draw() {
  background(204);
  manageButtons();
  noStroke();
  fill(0);
  textSize(25);
  if (last != null) {
    lastNum = loadImage(last);
    image(lastNum, (width-lastNum.width)-50, (400/2-lastNum.height/2));
  }

  if (result != null) {
    displayNums();
  }
}

/**
 * Este método se encarga de detectar cual es el boton que se está presionando
 */
void manageButtons() {
  for (Button bt : btnList) {
    bt.update();
  }
  for (Button bt : btnList) {
    bt.display();
  }
}

/**
 * Este método se ejecuta cada vez que se realiza el evento de click 
 */
void mousePressed() {
  btnPressed();
}

/**
 * Este método se ejecuta cada vez que se deja de presionar el click
 */
void mouseReleased() {
  btnReleased();
}

/**
 * Este método se encarga de realizar la suma entre los numeros ingresado por el usuario
 * @param ninguno
 * @return Arreglo de string con los valores separados en vigesimal 
 */
void btnPressed() {
  for (Button btn : btnList) {
    String temp = btn.press(mouseX, mouseY, btnList);

    if (temp != null) {
      if (limit<2 || isOperador(temp) || isSymbol(temp)) {
        if (isSymbol(temp)) {
          systemWork(temp);
        } else if (isOperador(temp)) {
          try {
            if (isOperador(operacion.get(operacion.size()-1))) {
              operacion.set(operacion.size()-1, temp);
            } else {
              operacion.add(operacion.size(), temp);
            }
            limit=0;
          }
          catch(Exception e) {
          }
        } else {

          operacion.add(operacion.size(), temp);
          if (Integer.valueOf(temp) < 10) {
            temp = "0" + temp;
          }
          temp += ".png";
          last = temp;
          limit++;
        }
      }
    }
  }
}

/**
 * Este método se encarga de detectar cual es el boton que se dejo de presionar 
 */
void btnReleased() {
  for (Button btn : btnList) {
    btn.release();
  }
}

/**
 * Este método crea los objetos de PImage donde se mostraran los resultados
 */
void pimagesCreate() {
  cifras = new PImage[]{
    new PImage(), //UMillar
    new PImage(), //Centena
    new PImage(), //Decena
    new PImage()   //Unidad
  };
}

/**
 * Este método crea los botones con los que puede interactuar el usuario 
 */
void buttonsCreate() {
  btnList = new Button[]{
    //Primera fila
    new Button(0, 450, 100, 75, "07.png", #323232), 
    new Button(105, 450, 100, 75, "08.png", #323232), 
    new Button(210, 450, 100, 75, "09.png", #323232), 
    new Button(315, 450, 100, 75, "plus_math_48px.png", #323232), 
    //Segunda fila
    new Button(0, 530, 100, 75, "04.png", #323232), 
    new Button(105, 530, 100, 75, "05.png", #323232), 
    new Button(210, 530, 100, 75, "06.png", #323232), 
    new Button(315, 530, 100, 75, "minus_48px.png", #323232), 
    //Tercera fila
    new Button(0, 610, 100, 75, "01.png", #323232), 
    new Button(105, 610, 100, 75, "02.png", #323232), 
    new Button(210, 610, 100, 75, "03.png", #323232), 
    new Button(315, 610, 100, 75, "multiply_48px.png", #323232), 
    //Cuarta fila
    new Button(0, 690, 100, 75, "transfer_48px.png", #323232), 
    new Button(105, 690, 100, 75, "00.png", #323232), 
    new Button(210, 690, 100, 75, "equal_sign_48px.png", #323232), 
    new Button(315, 690, 100, 75, "divide_48px.png", #323232), 
    //
    //
    new Button(420, 690, 100, 75, "10.png", #323232), 
    new Button(525, 690, 100, 75, "11.png", #323232), 
    new Button(630, 690, 100, 75, "12.png", #323232), 

    new Button(420, 610, 100, 75, "13.png", #323232), 
    new Button(525, 610, 100, 75, "14.png", #323232), 
    new Button(630, 610, 100, 75, "15.png", #323232), 

    new Button(420, 530, 100, 75, "16.png", #323232), 
    new Button(525, 530, 100, 75, "17.png", #323232), 
    new Button(630, 530, 100, 75, "18.png", #323232), 

    new Button(420, 450, 310, 75, "19.png", #323232), 
    new Button(0, 400, width, 45, "clear_symbol_48px.png", #323232)
  };
}

/**
 * Este método detecta si la cadena mandada es un operador.
 * @param value Es la cadena a analizar.
 * @return True si es un operador, falso si no lo es. 
 */
public boolean isOperador(String value) {
  char[] symbols = new char[]{'+', '-', '*', '/'};
  for (char c : symbols) {
    if (value.charAt(0) == c) {
      return true;
    }
  }
  return false;
}

/**
 * Este método detecta si la cadena mandada es un simbolo especial.
 * @param value Es la cadena a analizar.
 * @return True si es un simbolo especial, false si no lo es.
 */
public boolean isSymbol(String value) {
  String[] symbols = new String[]{"clear", "equals", "show"};
  for (String s : symbols) {
    if (value.equals(s)) {
      return true;
    }
  }
  return false;
}

/**
 * Este método se encarga de modificar el tamaño de la ventana
 */
public void reSize() {
  if (this.width == 415) {
    surface.setSize(730, 770);
    btnList[26].width = width;
  } else {
    surface.setSize(415, 770);
    btnList[26].width = width;
  }
}

/**
 * Este método detecta si la cadena mandada es un simbolo especial.
 * @param value Es la cadena a analizar.
 */
public void systemWork(String s) {
  if (s.equals("clear")) {
    operacion = new ArrayList<String>();
    result = null;
    last = null;
    limit=0;
  } else if (s.equals("show")) {
    reSize();
  } else {
    displayResult();
  }
}

/**
 * Este método detecta si la cadena mandada es un simbolo especial.
 * @param value Es la cadena a analizar.
 */
public void displayResult() {
  for (String s : operacion) {
    if (isOperador(s)) {
      switch (s) {
      case "+":
        result = suma();
        last = null;
        break;
      case "-":
        result = resta();
        print("\n");
        //printArray(result);
        print("\n");
        break;
      case "*":
        result = multi();
        break;
      case "/":
        result = divi();
        break;
      }
    }
  }
}

/**
 * Este método se encarga de realizar la suma entre los numeros ingresado por el usuario
 * @return Arreglo de string con los valores separados en vigesimal 
 */
String[] suma() {
  print("Entra a suma\n");
  String[] resultSum;
  String tmp="";
  int sum1=0;
  for (int i=0; i<operacion.size(); i++) {  
    if (operacion.get(i).charAt(0)!='+') {
      if (i==operacion.size()-1) {
        sum1+=Integer.valueOf(operacion.get(i));
      } else {
        if (operacion.get(i+1).charAt(0)=='+') {
          sum1+=Integer.valueOf(operacion.get(i));
        } else {
          sum1+=Integer.valueOf(operacion.get(i))*20;
        }
      }
    }

    print("valor "+sum1+"\n");
  }
  while (sum1>19) {
    tmp=" "+sum1%20+tmp;
    sum1=sum1/20;
    print(tmp+"\n");
  }
  tmp=""+sum1+tmp;
  print(tmp+"\n");
  resultSum=split(tmp, ' ');
  printArray(resultSum);
  return resultSum;
}

/**
 * Este método se encarga de realizar la resta entre los numeros ingresado por el usuario
 * @return Arreglo de string con los valores separados en vigesimal 
 */
String[] resta() {
  ArrayList<Integer> valor1=new ArrayList();
  ArrayList<Integer> valor2=new ArrayList();
  boolean izq=true;

  for (int i=0; i<operacion.size(); i++) {
    if (operacion.get(i).charAt(0)=='-') {
      izq=false;
    }

    if (izq) {
      valor1.add(Integer.valueOf(operacion.get(i)));
    } else {
      if (operacion.get(i).charAt(0)!='-') {
        valor2.add(Integer.valueOf(operacion.get(i)));
      }
    }
  }

  int res1=0, res2=0;
  int multipX=(int)Math.pow(20,valor1.size()-1);
  int multipY=(int)Math.pow(20,valor2.size()-1);
  printArray(valor1);
  printArray(valor2);
  for (int i : valor1) {
    res1+=i*multipX;
    print(i+" ");
  }

  for (int i : valor2) {
    res2+=i*multipY;
    print(i+" ");
  }
  println();
  int resFinal=res1-res2;
  println("resta= "+resFinal);
  ArrayList<Integer> valores=new ArrayList();
  while (resFinal>19) {
    valores.add(resFinal%20);
    resFinal=resFinal/20;
  }
  if(resFinal<0){
    resFinal=0;
  }
  valores.add(resFinal);
  String[] arrAux =new String[valores.size()];
  for (int i=0; i<valores.size(); i++) {
    arrAux[i]=valores.get(valores.size()-i-1).toString();
  }
  printArray(arrAux);
  return arrAux;
}

/**
 * Este método se encarga de realizar la multiplicación entre dos
 * numeros ingresado por el usuario
 * @param ninguno
 * @return Arreglo de string con los valores del resultado separados en vigesimal 
 */
String[] multi() {
  print("Entra a multiplicación\n");
  boolean x=false;
  String[] result;
  String tmp="";
  int val1=0, val2=0, res=0;
  for (int i=0; i<operacion.size(); i++) { 
    if (operacion.get(i).charAt(0)!='*') {
      //print(operacion.get(i)+"\n");
      if (i==operacion.size()-1) {
        val2+=Integer.valueOf(operacion.get(i));
        print("V2="+val2);
      } else {
        if (operacion.get(i+1).charAt(0)=='*') {
          val1+=Integer.valueOf(operacion.get(i));
          print("V1="+val1);
        } else if (x==false) {
          val1+=Integer.valueOf(operacion.get(i))*20;
          print("V1="+val1);
        }
      }
    } else if (operacion.get(i).charAt(0)=='*') {
      if (i!=operacion.size()-2) {
        val2+=Integer.valueOf(operacion.get(i+1))*20;
        x=true;
        print("V2="+val2);
      }
    }
  }
  x=false;
  print("\nvalor 1 "+val1+"\n"+"valor 2 "+val2+"\n");
  res = val1*val2;
  while (res>19) {
    tmp=" "+res%20+tmp;
    res=res/20;
  }
  tmp=""+res+tmp;
  print(tmp+"\n");
  result=split(tmp, ' ');
  return result;
}

String[] divi() {
  return null;
}

/**
 * Este método muestra el resultado de la operacion en la parte izquierda de la pantalla
 */
public void displayNums() {
  int x = 15, y = 15;
  String namefile = "";

  for (int i = 0; i<=result.length-1; i++) {
    if (result[i] != null) {
      namefile = result[i];
      if (Integer.valueOf(namefile) < 10) {
        namefile = "0" + namefile;
      }
      namefile += ".png";

      cifras[i] = loadImage(namefile);
      image(cifras[i], x, y);
      y += (cifras[i].height)+15;
    } else {
      continue;
    }
  }
}
