#define led1 13
#define led2 12
#define led3 11
#define led4 10
#define touchSensor A0
#define off LOW
#define on HIGH

int meter;
int delimeter;


void setup(){
  meter = 0;
  delimeter = 6;
  Serial.begin(9600);
  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(led3, OUTPUT);
  pinMode(led4, OUTPUT);
}

void loop(){
  meter = analogRead(touchSensor);
  if(meter == 0){
    //do nothing
  }else{
    if(delimeter == 6){
      delimeter = 0;
    }
    delimeter = delimeter + 1;
  }
  light(delimeter);
  printStatements(meter, delimeter);
  delay(1000);  
}

void printStatements(int meterReading,int delimeterReading){
  Serial.println("-");
  Serial.print("Meter: ");
  Serial.println(meterReading);
  Serial.print("Delimeter: ");
  Serial.println(delimeterReading);
}

void light(int sensorRead){
  switch(sensorRead){
    case 1:
      digitalWrite(led1, on);
      break;
    case 2:
      digitalWrite(led2, on);
      break;
    case 3:
      digitalWrite(led3, on);
      break;
    case 4:
      digitalWrite(led4, on);
      break;
    case 5:
      digitalWrite(led1, off);
      digitalWrite(led2, off);
      digitalWrite(led3, off);
      digitalWrite(led4, off);
      break;
  }
}
    
      

