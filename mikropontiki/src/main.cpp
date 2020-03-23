#include <Arduino.h>
#include <Adafruit_NeoPixel.h>
#include "mp_hardware.h"

#define LED_PIN 8
#define LED_COUNT 1

Adafruit_NeoPixel neoPixel(LED_COUNT, LED_PIN, NEO_RGB + NEO_KHZ800);
uint32_t colorRed = neoPixel.Color(255, 0, 0);
uint32_t colorBlue = neoPixel.Color(0, 0, 255);
uint32_t colorGreen = neoPixel.Color(0, 255, 0);

void mp_hardware_setup(void) {
  // Setup Digital Ports
  // IR LED Control (output)
  pinMode(IR_DG, OUTPUT);
  digitalWrite(IR_DG, LOW);
  pinMode(IR_FR, OUTPUT);
  digitalWrite(IR_FR, LOW);

  // Motor Control (output)
  pinMode(LEFT_DIR, OUTPUT);
  pinMode(LEFT_PWM, OUTPUT);
  pinMode(RIGHT_DIR, OUTPUT);
  pinMode(RIGHT_PWM, OUTPUT);

  // Encoders (input)
  pinMode(LEFT_CLK, INPUT_PULLUP);
  pinMode(RIGHT_CLK, INPUT_PULLUP);

  // Neo Pixel
  neoPixel.begin();
  neoPixel.show();

  // Internal ADC resolution -> change to 12bit
  analogReadResolution(12);
}


//-------------------------------------------
// GLOBAL VARIABLES
//-------------------------------------------
uint32_t updateTime;
uint32_t updateInterval = 100; // 100 miliseconds

// sensor readings vars
int sensorDark;
int sensorLit;
int sensorValue;

int readIRsensor(int channel) {
  // read dark value
  sensorDark = analogRead(channel);

  // turn emitter ON
  switch(channel) {
    case SENS_DL:
    case SENS_DR: digitalWrite(IR_DG, HIGH);
                  break;
    case SENS_FR:
    case SENS_FL: digitalWrite(IR_FR, HIGH);
                  break;               
  }

  // wait 
  delayMicroseconds(50);

  // read lit values
  sensorLit = analogRead(channel);

  // turn emitter OFF
  switch(channel) {
    case SENS_DL:
    case SENS_DR: digitalWrite(IR_DG, LOW);
                  break;
    case SENS_FR:
    case SENS_FL: digitalWrite(IR_FR, LOW);
                  break;               
  }

  // return lit-dark value
  sensorValue = sensorLit - sensorDark;
  return (sensorValue);
}


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial.println("MikroPontiki IR Sensors Test");

  // setup hardware
  mp_hardware_setup();

  // init time
  updateTime = millis() + updateInterval;
}

void loop() {
  // put your main code here, to run repeatedly:
  if(millis() > updateTime) {
    updateTime += updateInterval;
    readIRsensor(SENS_DL);
    Serial.print(sensorDark);
    Serial.print(F("  >  "));
    Serial.print(sensorLit);
    Serial.print(F("  >  "));
    Serial.print(sensorValue);
    Serial.println();

    neoPixel.Color(0, 0, 0, 255);
    neoPixel.show();
  }
}