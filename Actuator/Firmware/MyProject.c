#define WC          0x00                                                //Write Configuration Register Command
#define WTP         0x20                                                //Write TX Payload Command
#define WTA         0x22                                                //Write TX Address Command
#define RRP         0x24                                            //Read  RX Payload Command

sbit TX_EN at PORTB.B0;  //OUT
sbit TRX_CE at PORTC.B7; //OUT
sbit PWR_UP at PORTB.B1; //OUT
sbit CD at PORTB.B2;     //IN
sbit AM at PORTC.B6;     //IN
sbit DR at PORTC.B0;     //IN
sbit CSN at PORTC.B2;    //OUT

sbit LCD_RS at RA5_bit;
sbit LCD_EN at RA4_bit;
sbit LCD_D4 at RA3_bit;
sbit LCD_D5 at RA2_bit;
sbit LCD_D6 at RA1_bit;
sbit LCD_D7 at RA0_bit;
sbit LCD_RS_Direction at TRISA5_bit;
sbit LCD_EN_Direction at TRISA4_bit;
sbit LCD_D4_Direction at TRISA3_bit;
sbit LCD_D5_Direction at TRISA2_bit;
sbit LCD_D6_Direction at TRISA1_bit;
sbit LCD_D7_Direction at TRISA0_bit;

sbit IncreaseButton at PORTB.B5;
sbit DecreaseButton at PORTB.B4;
sbit LED1 at PORTB.B3;
sbit LED2 at PORTB.B2;
sbit LAMP at PORTC.B1;

short data0=0x00;
char *text;
short time=10,flag=0;
unsigned int timeout=0;

Port_Init(){
     INTCON = 0;
     TRISB=0b00110000;
     ANSELB=0x00;
     ANSELA=0x00;
     TRISC=0b01000001;
     ANSELC = 0x00;
     SPI1_Init();
     PORTB=0b00001100;
     Delay_ms(3000);
     Lcd_Init();
     Delay_ms(100);
     Lcd_Cmd(_LCD_CURSOR_OFF);
     Lcd_Cmd(_LCD_CLEAR);
     text = "Skiadas";
     Lcd_Out(1,1,text);
     delay_ms(2500);
     text = "Chatzisavvas";
     Lcd_Out(1,1,text);
     delay_ms(2500);
     PORTB=0b00000000;
     Lcd_Cmd(_LCD_CLEAR);
     text = "Insert TimeOut: ";
     Lcd_Out(1,1,text);
     text = "seconds";
     Lcd_Out(2,6,text);
     ShortToStr(time, text);
     Lcd_Out(2,1,text);

     TX_EN = 0;  // Rx mode
     TRX_CE = 0; // Standby mode
     PWR_UP = 0; // Power down
     Delay_ms(10);
}

void InitNRF(short nRFAddress0, short nRFAddress1, short nRFAddress2, short nRFAddress3){
        short i;
        short nRFConfig[10],nRFAddress[4];
        nRFAddress[0]=nRFAddress0;
        nRFAddress[1]=nRFAddress1;
        nRFAddress[2]=nRFAddress2;
        nRFAddress[3]=nRFAddress3;

        nRFConfig[0] = 0b01011111;
        nRFConfig[1] = 0b00001101;
        nRFConfig[2] = 0b01000100;
        nRFConfig[3] = 0b00000001;
        nRFConfig[4] = 0b00000001;
        nRFConfig[5] = nRFAddress[0];
        nRFConfig[6] = nRFAddress[1];
        nRFConfig[7] = nRFAddress[2];
        nRFConfig[8] = nRFAddress[3];
        nRFConfig[9] = 0b11011011;

        PWR_UP = 1;
        CSN = 0;
        SPI1_Write(WC); //Write nRF configuration
        for(i=0;i<10;i++){
                SPI1_Write(nRFConfig[i]);
        }
        CSN = 1;
        Delay_ms(10);
        CSN = 0;
        SPI1_Write(WTA); //Write TX Address
        for(i=0;i<4;i++){
                SPI1_Write(nRFAddress[i]);
        }
        CSN = 1;
}

void Add_Sub_TimeOut(){

    if(IncreaseButton==1){
                          time++;
                          if(time>45){
                                   time=45;
                          }
                          ShortToStr(time, text);
                          Lcd_Out(2,1,text);
                          delay_ms(300);
    }

    if(DecreaseButton==1){
                          time--;
                          if(time<5){
                                  time=5;
                          }
                          ShortToStr(time, text);
                          Lcd_Out(2,1,text);
                          delay_ms(300);
    }
}

void RXPacket(){
        short SpiBuf;
        TX_EN = 0;
        PWR_UP=1;
        TRX_CE=1;

        if(AM==1 && DR==1){
                 CSN = 0;
                 SPI1_Write(RRP); //Read RX Payload
                 data0 = SPI1_Read(SpiBuf);
                 CSN = 1;
                 flag++;
                 if(flag==1){
                             LED2=1;
                             Delay_ms(500);
                             LED2=0;
                 }
        }
}


void main() {
     Port_Init();
     InitNRF(0x83, 0x5f, 0x9a, 0x12);
     while(1){
              Add_Sub_TimeOut();
              RXPacket();
              if(data0==0x7e && flag==1){
                              Lcd_Cmd(_LCD_CLEAR);
                              text = "Lamp Is On";
                              Lcd_Out(1,1,text);
                              LED1=1;
                              LAMP=1;
                              timeout=time*1000;
                              Vdelay_ms(timeout);
                              LED1=0;
                              LAMP=0;
                              Lcd_Cmd(_LCD_CLEAR);
                              text = "Lamp Is Off";
                              Lcd_Out(1,1,text);
                              Delay_ms(5000);
                              Lcd_Cmd(_LCD_CLEAR);
                              text = "Insert TimeOut: ";
                              Lcd_Out(1,1,text);
                              text = "seconds";
                              Lcd_Out(2,6,text);
                              ShortToStr(time, text);
                              Lcd_Out(2,1,text);
              }
              data0=0x00;
              if(flag==2){
                           flag=0;
              }
     }
}