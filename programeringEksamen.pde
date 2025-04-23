int questionnumber;
Answer[]Answr;
Question[]questions;
int correctanswers;
int counter;
boolean showsanswer;
int selectedanswer;
void setup() {
  size(800, 600);
  textSize(20);
  fill(0);
  questions=new Question[]{
    new Question("Hvad bruges setup() funktionen til i Processing?", "At tegne figurer", "At initialisere variabler og sætte skærmstørrelse", "At afslutte programmet", "At afspille lyd", 1),
    new Question("Hvad gør size(800, 600) i en sketch?", "Sætter farven på baggrunden", "Bestemmer tykkelsen på linjer", "Sætter vinduets bredde og højde til 800 x 600 pixels", "Zoomer ind på skærmen", 2),
    new Question(" Hvad er forskellen på fill() og stroke() i Processing", "fill() farver baggrunden, stroke() slukker programmet", "fill() fjerner tekst, stroke() fjerner billeder", "fill() bruges til figurers inderside, stroke() til kanten", "De gør det samme", 2),
    new Question("Hvad gør background(255)", "Tegner en sort baggrund", "Sætter baggrunden til hvid", "Starter et loop", "Gør figurer gennemsigtige", 1),
    new Question("Hvordan tegner man en cirkel i Processing?", "drawCircle(100, 100, 50)", "circle(100, 100, 50)", "ellipse(100, 100, 50, 50)", "oval(100, 100, 50)", 2),
    new Question("Hvad er koordinatsystemets udgangspunkt i Processing?", "Midten af skærmen", "Nederste højre hjørne", "Øverste venstre hjørne", "Øverste midtpunkt", 2),
    new Question("Hvad gør line(0, 0, 100, 100)?", "Tegner en firkant", "Tegner en linje fra (0,0) til (100,100)", "Sletter en linje", "Tegner en cirkel", 1),
    new Question("Hvilken datatype bruges til decimaler i Processing?", "int", "boolean", "char", "float", 3),
    new Question("Hvad gør noLoop()?", "Starter et nyt loop", "Stopper draw() fra at køre kontinuerligt ", "Stopper hele programmet", "Tegner en loopet form", 1),
    new Question("Hvordan kan man vise tekst på skærmen i Processing?", "text(hej, 100, 100)", "write(hej, 100, 100)", "print(Hej)", "label(Hej, 100, 100)", 0),
    new Question("Hvad bruges draw() funktionen til i Processing?", "At sætte skærmstørrelsen", "At initialisere variabler", "At tegne figurer én gang", "At opdatere og tegne indhold kontinuerligt", 3),
    new Question("Hvordan laver man en cirkel, der følger musen?", "ellipse(mouseX, mouseY, 50, 50)", "circle(mouseY, mouseX, 50)", "mouse(ellipse, 50, 50)", "drawCircle(mouse.move, 50)", 0),
    new Question("Hvad gør mousePressed() funktionen?", "Den tegner en figur ved klik", "Den ændrer skærmstørrelsen", " Den kaldes automatisk, når musen klikkes", "Den kører kun, når draw() stoppes", 2),
    new Question("Hvad sker der, hvis man bruger frameRate(60)", "Programmet opdaterer 60 gange i minuttet", " Programmet crasher", "Skærmen vises i sort/hvid, når musen klikkes", " Programmet opdaterer 60 gange i sekundet", 3),
    new Question(".Hvordan laver man en farve med RGB i Processing?", "color(255, 0, 0)", "rgb(255, 0, 0)", "fillColor(255, 0, 0)", "colorRGB(255, 0, 0)", 0),
    new Question("Hvordan gemmer man værdier i en array i Processing?", "int myArray = [1, 2, 3]", "array myArray = (1, 2, 3)", "int[] myArray = {1, 2, 3}", "newArray = 1,2,3", 2),
    new Question("Hvordan laver man en funktion i Processing?", "create function()", "function myFunc() {}", "void myFunc() {}", "def myFunc()", 2),
    new Question("Hvad bruges keyPressed() til?", "Til at trykke på musen", "Til at tegne med farver", "Til at fange tastaturinput", " Til at afslutte programmet", 2),
    new Question("Hvordan tegner man en rektangel uden kant?", "noBorder()", "noStroke()", "noEdge()", "stroke(0)", 1),
    new Question("Hvordan kan man få en figur til at bevæge sig over tid?", "Ved at placere den i setup()", "Ved at bruge delay()", "Ved at ændre dens position i draw()", "Ved at tegne den med print()", 2),

  };
  Answr=new Answer[]{
    new Answer(width/2-75/2-50, 180, 75, 25),
    new Answer(width/2-75/2+50, 180, 75, 25),
    new Answer(width/2-75/2-50, 280, 75, 25),
    new Answer(width/2-75/2+50, 280, 75, 25),
  };
}
void draw() {
  background(0, 162, 232);
  if (questionnumber<questions.length) {
    textAlign(CENTER, CENTER);
    text( questions[questionnumber].getQuest(), width/2, 100);
    displayAnswers();
    if (counter>0) {
      counter-=1;
      if (counter==0) {
        questionnumber+=1;
        showsanswer=false;
      }
    }
  } else {
    background(0, 162, 255);
    textAlign(CENTER, CENTER);
    text( "quiz slut", width/2, height/2);
    text( "antal rigtige"+correctanswers+"/"+questions.length, width/2, height/2+50);
  }
}
//funktion
void displayAnswers() {
  //String[] answers=question.getAnswers();
  int i=0;
  for (Answer answer : Answr) {
    fill(255);
    if (answer.isPointInside(mouseX, mouseY)) {
      fill(227);
    }
    if (showsanswer==true) {
      if (selectedanswer==i) {
        if (selectedanswer==questions [questionnumber]. getCorrectAnswer()) {
          fill (0, 155, 0);
        } else {
          fill(255, 0, 0);
        }
      }
    }
    rect(answer.x, answer.y, answer.w, answer.h);
    fill(0);
    text(questions[questionnumber].getAnswers()[i], answer.x+answer.w/2, answer.y+answer.h/2);
    i++;
  }
}
void mousePressed() {
  for (int i = 0; i < Answr.length; i++) {
    if (Answr[i].isPointInside(mouseX, mouseY)) {
      println(i);
      if (questionnumber+1<questions.length+1) {
        counter=30;
        selectedanswer=i;
        showsanswer=true;
        if (questions[questionnumber].getCorrectAnswer()==i) {
          correctanswers+=1;
        }
      }
    }
  }
}
