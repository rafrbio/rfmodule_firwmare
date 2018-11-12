#include <Wire.h>

void setup() {
  Wire.begin();        // join i2c bus (address optional for master)
  Serial.begin(9600);  // start serial for output
}

void loop() {
  Wire.beginTransmission(0x01);
  Wire.write(0x01);
  Wire.endTransmission();

  
  Wire.requestFrom(0x01, 3);  
  while (Wire.available()) 
  { 
    char c = Wire.read();
    Serial.print(c, HEX);       
  }
  Serial.print(' ');
  
  delay(500);     
}
