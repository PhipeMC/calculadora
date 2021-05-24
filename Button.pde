class Button {
  PImage icon;
  int x, y; // Las coordenadas del boton
  int width, height; // Tamaño del boton
  color backcolor; // Color de fondo para el boton
  boolean pressed = false; // Detecta si el boton esta presionado
  boolean over = false;
  String fileName = "";

  Button(int px, int py, int pwidth, int pheight, color pcolor) {
    x = px;
    y = py;
    width = pwidth;
    height = pheight;
    backcolor = pcolor;
  }

  Button(int px, int py, int pwidth, int pheight, String pimg, color pcolor) {
    x = px;
    y = py;
    width = pwidth;
    height = pheight;
    backcolor = pcolor;
    icon = loadImage(pimg);
    fileName = pimg;
  }

  void update() {
    if ((mouseX >= x) && (mouseX <= x+width) && (mouseY >= y) && (mouseY <= y+height)) {
      over = true;
    } else {
      over = false;
    }
  }
  
    void display() {
    if (over == true) {
      fill(#424242);
      stroke(#888888);
      rect(x, y, width, height);
      image(icon, x+(width/2-icon.width/2), y+(height/2-icon.height/2));
    } else {
      fill(backcolor);
      stroke(#313131);
      rect(x, y, width, height);
      noStroke();
      image(icon, x+(width/2-icon.width/2), y+(height/2-icon.height/2));
    }
  }

  String press(float mx, float my, Button[] btnList) {
    if ((mx >= x) && (mx <= x+width) && (my >= y) && (my <= y+height)) {
      for (Button btn : btnList) {
        if (btn == this) {
          return getValue(fileName);
        }
      }
    }
    return null;
  }

  // Respond to mouseReleased() event
  void release() {
    pressed = false;
  }


  public String getValue(String file) {
    switch(file) {
    case "00.png": 
      return "0";
    case "01.png": 
      return "1";
    case "02.png": 
      return "2";
    case "03.png": 
      return "3";
    case "04.png": 
      return "4";
    case "05.png": 
      return "5";
    case "06.png": 
      return "6";
    case "07.png": 
      return "7";
    case "08.png": 
      return "8";
    case "09.png": 
      return "9";
    case "10.png": 
      return "10";
    case "11.png": 
      return "11";
    case "12.png": 
      return "12";
    case "13.png": 
      return "13";
    case "14.png": 
      return "14";
    case "15.png": 
      return "15";
    case "16.png": 
      return "16";
    case "17.png": 
      return "17";
    case "18.png": 
      return "18";
    case "19.png": 
      return "19";
    case "plus_math_48px.png": 
      return "+";
    case "minus_48px.png": 
      return "-";
    case "multiply_48px.png": 
      return "*";
    case "divide_48px.png": 
      return "/";
    case "transfer_48px.png": 
      return "show";
    case "equal_sign_48px.png": 
      return "=";
    }
    return null;
  }
}
