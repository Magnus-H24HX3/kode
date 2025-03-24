Question question=new Question ();
Answer[]Answr;
void setup() {
  size(400, 400);
  textSize(20);
  fill(0);
  Answr=new Answer[]{
    new Answer(90, 180, 75, 25),
    new Answer(190, 180, 75, 25),
    new Answer(90, 280, 75, 25),
    new Answer(190, 280, 75, 25),
  };
}
void draw() {
  background(0, 162, 232);

  text( question.getQuest(), 100, 100);
  displayAnswers();
}
//funktion
void displayAnswers() {
  String[] answers=question.getAnswers();
  textAlign(CENTER, CENTER);
  for (Answer answer : Answr) {
    fill(255);
    if (answer.isPointInside(mouseX, mouseY)) {
      fill(227);
    }
    rect(answer.x, answer.y, answer.w, answer.h);
    fill(0);
    text("tekst", answer.x+answer.w/2, answer.y+answer.h/2);
  }
}
void mousePressed() {
  for (int i = 0; i < Answr.length; i++) {
    if (Answr[i].isPointInside(mouseX, mouseY)) {
      println(i);
    }
  }
}
