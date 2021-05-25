Button[] btnList;
ArrayList<String> operacion; // 1 | 15 | 4
int limit;
//String[] resultSum;

void setup() {
  size(415, 470);
  surface.setTitle("Calculadora Tolteca");
  surface.setResizable(true);
  background(#555555);
  buttonsCreate();
  operacion = new ArrayList<String>();
  //7resultSum=new String[10];
}

void draw() {
  background(204);
  manageButtons();
  noStroke();
  fill(0);
  textSize(25);
  if (operacion.size()>0) {
    if (operacion.get(operacion.size()-1) != null) {
      //text(operacion.get(operacion.size()-1), 0, 50);
      int pos = 0;
      for (int i=0; i<operacion.size(); i++) {
        text(operacion.get(i), pos, 50);
        pos+=20;
      }
    }
  }
}

void manageButtons() {
  for (Button bt : btnList) {
    bt.update();
  }
  for (Button bt : btnList) {
    bt.display();
  }
}

void mousePressed() {
  btnPressed();
}

void mouseReleased() {
  btnReleased();
}

/// 
void btnPressed() {
  for (Button btn : btnList) {
    String temp = btn.press(mouseX, mouseY, btnList);

    if (limit<=2 || isOperador(temp)) {

      if (temp != null) {
        print(temp+" boton presionado \n");
        if (temp.equals("show")) {
          if (this.width == 415) {
            frame.setSize(730, 470);
            break;
          } else {
            frame.setSize(415, 470);
            break;
          }
        } else if(temp.equals("=")){
          //suma();
          resta();
          //multi();
        } else {
          print(operacion.size()+" "+temp+" "+limit+"\n");

          operacion.add(operacion.size(), temp);
          if (limit==2) {
            limit =0;
          } else {
            limit++;
          }
        }
      }
    }
  }
}

///CUANDO SE SUELTA UN BOTON
void btnReleased() {
  for (Button btn : btnList) {
    btn.release();
  }
}


///SE CREAN LOS BOTONES
void buttonsCreate() {
  btnList = new Button[]{
    //Primera fila
    new Button(0, 150, 100, 75, "07.png", #323232), 
    new Button(105, 150, 100, 75, "08.png", #323232), 
    new Button(210, 150, 100, 75, "09.png", #323232), 
    new Button(315, 150, 100, 75, "plus_math_48px.png", #323232), 
    //Segunda fila
    new Button(0, 230, 100, 75, "04.png", #323232), 
    new Button(105, 230, 100, 75, "05.png", #323232), 
    new Button(210, 230, 100, 75, "06.png", #323232), 
    new Button(315, 230, 100, 75, "minus_48px.png", #323232), 
    //Tercera fila
    new Button(0, 310, 100, 75, "01.png", #323232), 
    new Button(105, 310, 100, 75, "02.png", #323232), 
    new Button(210, 310, 100, 75, "03.png", #323232), 
    new Button(315, 310, 100, 75, "multiply_48px.png", #323232), 
    //Cuarta fila
    new Button(0, 390, 100, 75, "transfer_48px.png", #323232), 
    new Button(105, 390, 100, 75, "00.png", #323232), 
    new Button(210, 390, 100, 75, "equal_sign_48px.png", #323232), 
    new Button(315, 390, 100, 75, "divide_48px.png", #323232), 
    //
    //
    new Button(420, 390, 100, 75, "10.png", #323232), 
    new Button(525, 390, 100, 75, "11.png", #323232), 
    new Button(630, 390, 100, 75, "12.png", #323232), 

    new Button(420, 310, 100, 75, "13.png", #323232), 
    new Button(525, 310, 100, 75, "14.png", #323232), 
    new Button(630, 310, 100, 75, "15.png", #323232), 

    new Button(420, 230, 100, 75, "16.png", #323232), 
    new Button(525, 230, 100, 75, "17.png", #323232), 
    new Button(630, 230, 100, 75, "18.png", #323232), 

    new Button(525, 150, 100, 75, "19.png", #323232)
  };
}


///DETECTA SI ES UN OPERADOR
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
 * Este método se encarga de realizar la suma entre los numeros ingresado por el usuario
 * @param ninguno
 * @return Arreglo de string con los valores separados en vigesimal 
*/
String[] suma() {
  print("Entra a suma\n");
  String[] resultSum;
  String tmp="";
  int sum1=0;
  for (int i=0; i<operacion.size(); i++) {  
    if (operacion.get(i).charAt(0)!='+') {
       //print(operacion.get(i)+"\n");
       if(i==operacion.size()-1){
         sum1+=Integer.valueOf(operacion.get(i));
       }else{
         if(operacion.get(i+1).charAt(0)=='+'){
           sum1+=Integer.valueOf(operacion.get(i));
         }else{
           sum1+=Integer.valueOf(operacion.get(i))*20;
         }
       }
    }
    
    print("valor "+sum1+"\n");
  }
  while(sum1>19){
    tmp=" "+sum1%20+tmp;
    sum1=sum1/20;
    //print(tmp+"\n");
  }
  tmp=""+sum1+tmp;
  print(tmp+"\n");
  //resultSum[0]=""+sum1/20;
  //resultSum[pos]=""+sum1%20;
  resultSum=split(tmp,' ');
  //printArray(resultSum);
  return resultSum;
}


/*
    Método encargado de realizar la resta de los valores ingresados en
    la calculadora, se guarda en una lista los valores de la izquierda 
    del signo - en otra lista se guardan los valores a la derecha del 
    signo -. Se realiza la resta y se retorna en un arreglo, los valores
    correspondientes a unidades|decenas|centenas|millares en el sistema
    vigesimal.
*/
String[] resta(){
  
  ArrayList<Integer> valor1=new ArrayList();
  ArrayList<Integer> valor2=new ArrayList();
  boolean izq=true;
  
  for(int i=0; i<operacion.size();i++){
    if(operacion.get(i).charAt(0)=='-'){
      izq=false;
    }
    
    if(izq){
      valor1.add(Integer.valueOf(operacion.get(i)));
      
    }else{
      if(operacion.get(i).charAt(0)!='-'){
        valor2.add(Integer.valueOf(operacion.get(i)));
        
      }
    }
  }
  
  int res1=0,res2=0;
  
  printArray(valor1);
  printArray(valor2);
  
  int multipX=(int)Math.pow(20,valor1.size()-1);
  int multipY=(int)Math.pow(20,valor2.size()-1);
  
  for(int i:valor1){
    res1+=i*multipX;
    multipX=multipX/20;
    print(i+" ");
  }
 
  for(int i:valor2){
    res2+=i*multipY;
    multipY=multipY/20;
    print(i+" ");
  }
  println();
  int resFinal=res1-res2;
  ArrayList<Integer> valores=new ArrayList();
  while(resFinal>19){
    valores.add(resFinal%20);
    resFinal=resFinal/20;
  }
  valores.add(resFinal);
  String[] arrAux ={0+"",0+"",0+"",0+""};
  for(int i=0;i<valores.size();i++){
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
       if(i==operacion.size()-1){
         val2+=Integer.valueOf(operacion.get(i));
         print("V2="+val2);
       }else{
         if(operacion.get(i+1).charAt(0)=='*'){
           val1+=Integer.valueOf(operacion.get(i));
           print("V1="+val1);
         }else if(x==false){
           val1+=Integer.valueOf(operacion.get(i))*20;
           print("V1="+val1);
         }
       }
    }else if(operacion.get(i).charAt(0)=='*'){
      if(i!=operacion.size()-2){
           val2+=Integer.valueOf(operacion.get(i+1))*20;
           x=true;
           print("V2="+val2);
      }
    }
    
    
  }
  x=false;
  print("\nvalor 1 "+val1+"\n"+"valor 2 "+val2+"\n");
  res = val1*val2;
  while(res>19){
    tmp=" "+res%20+tmp;
    res=res/20;
  }
  tmp=""+res+tmp;
  print(tmp+"\n");
  result=split(tmp,' ');
  return result;
}
