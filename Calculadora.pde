Button[] btnList;
String operation = "";
String separator = "";
Tolteca operations;

void setup() {
  size(415, 470);
  surface.setTitle("Calculadora Tolteca");
  surface.setResizable(true);
  background(#555555);
  buttonsCreate();
  operations = new Tolteca();
}

void draw() {
  background(204);
  manageButtons();
  noStroke();
  fill(0);
  textSize(25);
  text(operation, 0, 50);
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

void btnPressed() {
  for (Button btn : btnList) {
    String temp = btn.press(mouseX, mouseY, btnList);
    //print(temp+"\n");
    if (temp != null) {
      if (temp.equals("show")) {
        if (this.width == 415) {
          frame.setSize(730, 470);
          break;
        } else {
          frame.setSize(415, 470);
          break;
        }
      }else{
        operations.getValue(temp);
        break;
      }
    }
  }
}

void btnReleased() {
  for (Button btn : btnList) {
    btn.release();
  }
}

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
