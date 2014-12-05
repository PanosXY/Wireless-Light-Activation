#define WC          0x00                                                //Write Configuration Register Command
#define WTP         0x20                                                //Write TX Payload Command
#define WTA         0x22                                                //Write TX Address Command

sbit TX_EN at PORTB.B0;  //OUT
sbit TRX_CE at PORTC.B7; //OUT
sbit PWR_UP at PORTB.B1; //OUT
sbit CD at PORTB.B2;     //IN
sbit AM at PORTC.B6;     //IN
sbit DR at PORTC.B0;     //IN
sbit CSN at PORTC.B2;    //OUT

sbit Motion_Sensor at PORTB.B4;
sbit LED1 at PORTB.B3;
sbit LED2 at PORTB.B5;

int luminosity1=0;
int luminosity2=0;
int luminosity=0;
int flag=0;

Port_Init(){
     TRISA=0b00001100;
     ANSELA=0b00001100;
     TRISB=0b00010100;
     ANSELB=0x00;
     TRISC=0b01000001;
     ANSELC = 0x00;
     ADCON1.F1=0;
     ADCON1.F0=0;
     SPI1_Init();

     PORTB=0b00101000;
     Delay_ms(3000);
     PORTB=0b00000000;

     TX_EN = 0;  // Rx mode
     TRX_CE = 0; // Standby mode
     PWR_UP = 0; // Power down
     CSN = 0;    // Chip Select Not = enabled
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
        CSN = 1;
        Delay_ms(10);
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

void Detection(){
     luminosity1=ADC_Read(2);
     Delay_ms(10);
     luminosity2=ADC_Read(3);
     Delay_ms(10);
     luminosity=(luminosity1+luminosity2)/2;

     if(luminosity>850 && Motion_Sensor==1){
                       flag=1;
     }
}

void TXPacket(short Packet){
        PWR_UP = 1;
        TRX_CE = 0;
        TX_EN = 1;
        CSN = 0;
        SPI1_Write(WTP); //Write TX Payload
        SPI1_Write(Packet);
        CSN = 1;
        TRX_CE = 1; // Start transmitting
        Delay_ms(100);
        if(DR==1){
                  TRX_CE=0;
        }
}


void main() {
     Port_Init();
     InitNRF(0x83, 0x5f, 0x9a, 0x12);
     while(1){
              Detection();
              if(flag==1){
                            TXPacket(0x7e);
                            LED1=1;
                            Delay_ms(500);
                            LED1=0;
                            Delay_ms(500);
                            TXPacket(0x7e);
                            LED1=1;
                            Delay_ms(500);
                            LED1=0;
                            Delay_ms(3500);
              }
              flag=0;
     }
}