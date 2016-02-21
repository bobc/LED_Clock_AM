/* 
   Contributors:
   Copyright (c) 2016 Bob Cousins bobcousins42@googlemail.com       
*/

/* All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:

   * Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
   * Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in
     the documentation and/or other materials provided with the
     distribution.
   * Neither the name of the copyright holders nor the names of
     contributors may be used to endorse or promote products derived
     from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  POSSIBILITY OF SUCH DAMAGE.
*/

// **************************************************************************
//
//    LED Clock "Tix(tm)" style
//    
//    with Arduino Pro Mini
//
// **************************************************************************


#include <inttypes.h>

#include <Wire.h>  
#include <Time.h>
#include <DS3232RTC.h>

#define NUM_COLS  9
#define NUM_ROWS  3

#define BLACK  0x0000
#define RED    0x1
#define GREEN  0x1
#define BLUE   0x1
#define YELLOW 0x1
#define PINK   0x1
#define ORANGE 0x1
#define WHITE  0x1

typedef enum {dm_clock, dm_temperature} tDisplayMode;
typedef enum {ds_domino, ds_random} tDisplayStyle;
typedef enum {btn_none, btn_mode=1, btn_select=2} tButtons;

//
/*
typedef struct  { 
  int  Second; 
  int  Minute; 
  int  Hour; 
  int  Wday;   // day of week, sunday is day 1
  int  Day;
  int  Month; 
  int  Year;   // offset from 1970; 
} tmElements_t;
*/
//

int led_col[NUM_COLS] = {2,3,4,5,6,7,8,9,10 };
int led_row[NUM_ROWS] = {11,12,13};

int row;
//int col_data [NUM_ROWS] = { 0x1FF,0x1ff,0x1ff};

int pixels [NUM_COLS*NUM_ROWS];

// run time options
tDisplayMode  display_mode    = dm_clock;
tDisplayStyle display_style   = ds_random;
int           update_interval = 3;

tmElements_t time_now;
unsigned long last_millis;

int timer1_val, timer1_base;
float cur_temp;

//
int pixels_9 [10] =
{
   0b000000000, 
   0b000010000, 
   0b001000100, 
   0b001010100, 
   0b101000101, 
   0b101010101, 
   0b101101101, 
   0b101111101, 
   0b111101111, 
   0b111111111
};

/*
    x x
    x x
    x x
*/    
int pixels_6 [6] =
{
   0b000000, 
   0b000100, 
   0b010001, 
   0b010101, 
   0b011101, 
   0b110111, 
};

int pixels_3 [4] =
{
   0b000, 
   0b010, 
   0b101, 
   0b111, 
};

void SetColumns (int row)
{
  int j;
  
  for (j = 0; j < NUM_COLS; j++)
  {
    if (get_pixel (j, row) != 0)
      digitalWrite (led_col[j], 1);
    else    
      digitalWrite (led_col[j], 0);
  }
}

int adjust_brightness (int color)
{
  // a stub
  return color;
}  

/***************************************************************************
 pixels are wired as follows
                        col (X)
             0   1  2  3   4  5   6  7  8
        0    O   O  O  O   O  O   O  O  O
row(Y)  1    O   O  O  O   O  O   O  O  O
        2    O   O  O  O   O  O   O  O  O
             |   |  |  |   |  |   ^  ^  ^ minute, units 0-9
             |   |  |  |   ^  ^ minute, tens 0-5    
             |   ^  ^  ^ hour, units 0-9
             ^ hour, tens 0-2
****************************************************************************/


void set_pixel (int x, int y, int color)
{
  pixels [(y*NUM_COLS) + x] = color;
}

int get_pixel (int x, int y)
{
  return pixels [(y*NUM_COLS) + x];
}

int get_random_bits (int total_width, int num_bits)
{
  int bits;
  int new_bit;
  
  bits = 0;
  while (num_bits)
  {
    new_bit = 1 << random (total_width);
    if ((new_bit & bits) == 0)
    {
      bits |= new_bit;
      num_bits--;
    }
  }  
  return bits;
}

void set_digit_x9 (int col, int val, int color)
{
  int x, y;
  int bits;
 
  if (display_style == ds_domino)
    bits = pixels_9 [val];
  else
    bits = get_random_bits (9, val);
  
  color = adjust_brightness(color); 
  
  for (y = NUM_ROWS-1; y>=0; y--)
  {
    for (x = col+2; x >= col; x--)
    {
      if ((bits & 1) != 0)
        set_pixel (x,y, color);
      bits = bits >> 1;  
    }
  }
}

void set_digit_x6 (int col, int val, int color)
{
  int x, y;
  int bits;
 
  if (display_style == ds_domino)
    bits = pixels_6 [val];
  else
    bits = get_random_bits (6, val);
  
  color = adjust_brightness(color); 
  
  for (y = 0; y < NUM_ROWS; y++)
  {
    for (x = col+1; x >= col; x--)
    {
      if ((bits & 1) != 0)
        set_pixel (x,y, color);
      bits = bits >> 1;  
    }
  }
}

void set_digit_x3 (int col, int val, int color)
{
  int y;
  int bits;
 
  if (display_style == ds_domino)
    bits = pixels_3 [val];
  else
    bits = get_random_bits (3, val);
  
  color = adjust_brightness(color); 
  
  for (y = 0; y < NUM_ROWS; y++)
  {
    if ((bits & 1) != 0)
      set_pixel (col, y, color);
    bits = bits >> 1;  
  }
}

void update_display (void)
{
  memset (pixels, 0, sizeof(pixels));

  if (display_mode == dm_clock)  
  {
//#define TEST
#ifdef TEST
    set_digit_x3 (0, time_now.Minute / 10, YELLOW);
    set_digit_x9 (1, time_now.Minute % 10, BLUE);

    set_digit_x6 (4, time_now.Second / 10, GREEN);
    set_digit_x9 (6, time_now.Second % 10, RED);
#else
    set_digit_x3 (0, time_now.Hour / 10, YELLOW);
    set_digit_x9 (1, time_now.Hour % 10, BLUE);

    set_digit_x6 (4, time_now.Minute / 10, GREEN);
    set_digit_x9 (6, time_now.Minute % 10, RED);
#endif
  }
}

ISR(TIMER1_OVF_vect)        // interrupt service routine 
{
  digitalWrite (led_row[row], 0);
  row++;
  if (row==NUM_ROWS)
    row = 0;

  SetColumns (row);
  digitalWrite (led_row[row], 1);
 
  TCNT1 = 65536-timer1_val;   // preload timer
}

void init_timer (void)
{
  // initialize timer1 
  noInterrupts();           // disable all interrupts
  TCCR1A = 0;
  TCCR1B = 0;

  // Set timer1_counter to the correct value for our interrupt interval
  // CPU freq=16MHz
  // use prescaler = 8, 
  timer1_base = 16000000 / 8 / 200;
  
  timer1_val = timer1_base;
  
  TCNT1 = 65536-timer1_val;   // preload timer
  TCCR1B |= (1 << CS11);    // prescaler = 8
  TIMSK1 |= (1 << TOIE1);   // enable timer overflow interrupt
  interrupts();             // enable all interrupts
}

// CLI
void show_help(void)
{
  Serial.print ("> ");
}

char cmd_buf [32];
byte cmd_len;

#define CR 13
#define LF 10


char *get_int (uint8_t *pValue, char *pNext)
{
  // skip white space
  while (*pNext && (*pNext == ' ') )
  {
    pNext ++;
  }
  
  //
  if (*pNext == 0)
    // reached end of string
    return NULL;
  else
  {  
    *pValue = 0;

    if (isdigit (*pNext))
    {
      *pValue = (*pValue * 10) + (*pNext - '0');
      pNext ++;
      while (*pNext && isdigit (*pNext) )
      {
        *pValue = (*pValue * 10) + (*pNext - '0');
        pNext ++;
      }
    }
    else
    {
       // junk?
      while (*pNext && (*pNext != ' ') )
      {
        pNext ++;
      }
    }
  }
  
  return pNext;
}

void set_time (char *pBuf)
{
  Serial.print("set time ");
  pBuf = get_int (&time_now.Hour, pBuf);
  pBuf = get_int (&time_now.Minute, pBuf);
  pBuf = get_int (&time_now.Second, pBuf);
  
  RTC.writeTime(time_now);
  print_time();
}

void set_date (char *pBuf)
{
  Serial.print("set date ");
  pBuf = get_int (&time_now.Year, pBuf);
  pBuf = get_int (&time_now.Month, pBuf);
  pBuf = get_int (&time_now.Day, pBuf);
  
//!  RTC.writeDate(time_now);
  print_date();
}

void check_input (void)
{
  int ch = Serial.read();
  
  if (ch!=-1)
  {
     if ( (ch==CR)|| (ch==LF))
     {
       if (cmd_len>0)
       {
         cmd_buf[cmd_len] = '\0';
         Serial.println (cmd_buf);
         
         if (strncmp (cmd_buf, "time", 4)==0)
         {
           if (cmd_len == 4)
             print_time();
           else
             set_time (&cmd_buf[4]);
         }
         else if (strncmp (cmd_buf, "date", 4)==0)
         {
           if (cmd_len == 4)
             print_date();
           else
             set_date (&cmd_buf[4]);
         }
         else if (strncmp (cmd_buf, "temp", 4)==0)
         {
             print_temperature();
         }         
         else if (strncmp (cmd_buf, "?", 1)==0)
         {
           Serial.println ("Commands:");
           Serial.println ("date            show current date");
           Serial.println ("date yy mm dd   set date");
           Serial.println ("time            show current time");
           Serial.println ("time hh mm ss   set time");
           Serial.println ("temp            show current IC temperature");
         }
       }
       else
         Serial.println();
       Serial.print ("> ");
       
       cmd_len = 0;
     }
     else
     {
       if (cmd_len < sizeof(cmd_buf))
       {
         cmd_buf[cmd_len++] = ch;
       }
     }
  }
}

void setup() {

  int j;

  Serial.begin(115200);
  
  for (j = 0; j < NUM_COLS; j++)
  {
    pinMode (led_col[j], OUTPUT);
    if (j < NUM_ROWS)
    {
      pinMode (led_row[j], OUTPUT);
      digitalWrite (led_row[j], 0);
    }
  }

  //
  get_time();

  //
  SetColumns (0);
  row = 0;
  
  init_timer();
  
  Serial.println ("Type ? for help\n");
}


//
void get_time (void)
{
    // Read the current time
    RTC.read(time_now);
}

void print_time (void)
{
  char buf [12];
  sprintf (buf, "%02d:%02d:%02d", time_now.Hour, time_now.Minute, time_now.Second);
  Serial.println (buf);
}

void print_date (void)
{
  char buf [16];
  sprintf (buf, "%04d-%02d-%02d", tmYearToCalendar(time_now.Year), time_now.Month, time_now.Day);
  Serial.println (buf);
}

void print_temperature (void)
{
  tpElements_t tp;

  RTC.readTemperature(tp);
  if (tp.Temp != NO_TEMPERATURE) 
  {
      float temp = tp.Temp + (tp.Decimal / 100);
      Serial.print(temp);
      Serial.println("'C");
  } else {
      Serial.println("Temperature is not available");
  }
}

// Some code from RepRap
//
// BETA is the B value
// RS is the value of the series resistor in ohms
// R_INF is R0.exp(-BETA/T0), where R0 is the thermistor resistance at T0 (T0 is in kelvin)
// Normally T0 is 298.15K (25 C).  If you write that expression in brackets in the #define the compiler 
// should compute it for you (i.e. it won't need to be calculated at run time).

// If the A->D converter has a range of 0..16383 and the measured voltage is V (between 0 and 16383)
// then the thermistor resistance, R = V.RS/(16383 - V)
// and the temperature, T = BETA/ln(R/R_INF)
// To get degrees celsius (instead of kelvin) add -273.15 to T

#define ABS_ZERO -273.15
#define AD_RANGE 1023

// AVK 10k NB12K00103KBB
// RS  697-4610
#define E_BETA 3630.0
#define E_RS 4700.0
#define E_R_INF ( 10000.0*exp(-E_BETA/298.15) )

float analog_to_temp (int raw, float beta, float rs, float r_inf)
{
   return ABS_ZERO + beta / log( (raw*rs/(AD_RANGE - raw) )/r_inf );
}
void read_thermistor (void)
{
  cur_temp = analog_to_temp (analogRead (0), E_BETA, E_RS, E_R_INF);
}

void loop() 
{
  check_input();
  
//  read_thermistor();
  
  if (millis() - last_millis > 1000)
  {
      // print_time();

      // Serial.print(cur_temp); Serial.println("'C");

      //      
      last_millis = millis();
    
      // increment time
      time_now.Second++;
      if (time_now.Second == 60)
      {  
        time_now.Second = 0;
        time_now.Minute ++;
        if (time_now.Minute == 60)
        {
          time_now.Minute = 0;
          time_now.Hour++;
          if (time_now.Hour == 24)
            time_now.Hour = 0;
            
          get_time();
        }
      }
      
      if ((time_now.Second % update_interval) == 0)
      {
        update_display();
      }
  }
}
