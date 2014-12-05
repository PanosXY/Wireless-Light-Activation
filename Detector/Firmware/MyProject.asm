
_Port_Init:

;MyProject.c,22 :: 		Port_Init(){
;MyProject.c,23 :: 		TRISA=0b00001100;
	MOVLW      12
	MOVWF      TRISA+0
;MyProject.c,24 :: 		ANSELA=0b00001100;
	MOVLW      12
	MOVWF      ANSELA+0
;MyProject.c,25 :: 		TRISB=0b00010100;
	MOVLW      20
	MOVWF      TRISB+0
;MyProject.c,26 :: 		ANSELB=0x00;
	CLRF       ANSELB+0
;MyProject.c,27 :: 		TRISC=0b01000001;
	MOVLW      65
	MOVWF      TRISC+0
;MyProject.c,28 :: 		ANSELC = 0x00;
	CLRF       ANSELC+0
;MyProject.c,29 :: 		ADCON1.F1=0;
	BCF        ADCON1+0, 1
;MyProject.c,30 :: 		ADCON1.F0=0;
	BCF        ADCON1+0, 0
;MyProject.c,31 :: 		SPI1_Init();
	CALL       _SPI1_Init+0
;MyProject.c,33 :: 		PORTB=0b00101000;
	MOVLW      40
	MOVWF      PORTB+0
;MyProject.c,34 :: 		Delay_ms(3000);
	MOVLW      31
	MOVWF      R11
	MOVLW      113
	MOVWF      R12
	MOVLW      30
	MOVWF      R13
L_Port_Init0:
	DECFSZ     R13, 1
	GOTO       L_Port_Init0
	DECFSZ     R12, 1
	GOTO       L_Port_Init0
	DECFSZ     R11, 1
	GOTO       L_Port_Init0
	NOP
;MyProject.c,35 :: 		PORTB=0b00000000;
	CLRF       PORTB+0
;MyProject.c,37 :: 		TX_EN = 0;  // Rx mode
	BCF        PORTB+0, 0
;MyProject.c,38 :: 		TRX_CE = 0; // Standby mode
	BCF        PORTC+0, 7
;MyProject.c,39 :: 		PWR_UP = 0; // Power down
	BCF        PORTB+0, 1
;MyProject.c,40 :: 		CSN = 0;    // Chip Select Not = enabled
	BCF        PORTC+0, 2
;MyProject.c,41 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_Port_Init1:
	DECFSZ     R13, 1
	GOTO       L_Port_Init1
	DECFSZ     R12, 1
	GOTO       L_Port_Init1
	NOP
;MyProject.c,42 :: 		}
L_end_Port_Init:
	RETURN
; end of _Port_Init

_InitNRF:

;MyProject.c,44 :: 		void InitNRF(short nRFAddress0, short nRFAddress1, short nRFAddress2, short nRFAddress3){
;MyProject.c,47 :: 		nRFAddress[0]=nRFAddress0;
	MOVF       FARG_InitNRF_nRFAddress0+0, 0
	MOVWF      InitNRF_nRFAddress_L0+0
;MyProject.c,48 :: 		nRFAddress[1]=nRFAddress1;
	MOVF       FARG_InitNRF_nRFAddress1+0, 0
	MOVWF      InitNRF_nRFAddress_L0+1
;MyProject.c,49 :: 		nRFAddress[2]=nRFAddress2;
	MOVF       FARG_InitNRF_nRFAddress2+0, 0
	MOVWF      InitNRF_nRFAddress_L0+2
;MyProject.c,50 :: 		nRFAddress[3]=nRFAddress3;
	MOVF       FARG_InitNRF_nRFAddress3+0, 0
	MOVWF      InitNRF_nRFAddress_L0+3
;MyProject.c,52 :: 		nRFConfig[0] = 0b01011111;
	MOVLW      95
	MOVWF      InitNRF_nRFConfig_L0+0
;MyProject.c,53 :: 		nRFConfig[1] = 0b00001101;
	MOVLW      13
	MOVWF      InitNRF_nRFConfig_L0+1
;MyProject.c,54 :: 		nRFConfig[2] = 0b01000100;
	MOVLW      68
	MOVWF      InitNRF_nRFConfig_L0+2
;MyProject.c,55 :: 		nRFConfig[3] = 0b00000001;
	MOVLW      1
	MOVWF      InitNRF_nRFConfig_L0+3
;MyProject.c,56 :: 		nRFConfig[4] = 0b00000001;
	MOVLW      1
	MOVWF      InitNRF_nRFConfig_L0+4
;MyProject.c,57 :: 		nRFConfig[5] = nRFAddress[0];
	MOVF       InitNRF_nRFAddress_L0+0, 0
	MOVWF      InitNRF_nRFConfig_L0+5
;MyProject.c,58 :: 		nRFConfig[6] = nRFAddress[1];
	MOVF       FARG_InitNRF_nRFAddress1+0, 0
	MOVWF      InitNRF_nRFConfig_L0+6
;MyProject.c,59 :: 		nRFConfig[7] = nRFAddress[2];
	MOVF       FARG_InitNRF_nRFAddress2+0, 0
	MOVWF      InitNRF_nRFConfig_L0+7
;MyProject.c,60 :: 		nRFConfig[8] = nRFAddress[3];
	MOVF       FARG_InitNRF_nRFAddress3+0, 0
	MOVWF      InitNRF_nRFConfig_L0+8
;MyProject.c,61 :: 		nRFConfig[9] = 0b11011011;
	MOVLW      219
	MOVWF      InitNRF_nRFConfig_L0+9
;MyProject.c,63 :: 		PWR_UP = 1;
	BSF        PORTB+0, 1
;MyProject.c,64 :: 		CSN = 1;
	BSF        PORTC+0, 2
;MyProject.c,65 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_InitNRF2:
	DECFSZ     R13, 1
	GOTO       L_InitNRF2
	DECFSZ     R12, 1
	GOTO       L_InitNRF2
	NOP
;MyProject.c,66 :: 		CSN = 0;
	BCF        PORTC+0, 2
;MyProject.c,67 :: 		SPI1_Write(WC); //Write nRF configuration
	CLRF       FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,68 :: 		for(i=0;i<10;i++){
	CLRF       InitNRF_i_L0+0
L_InitNRF3:
	MOVLW      128
	XORWF      InitNRF_i_L0+0, 0
	MOVWF      R0
	MOVLW      128
	XORLW      10
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_InitNRF4
;MyProject.c,69 :: 		SPI1_Write(nRFConfig[i]);
	MOVLW      InitNRF_nRFConfig_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(InitNRF_nRFConfig_L0+0)
	MOVWF      FSR0H
	MOVF       InitNRF_i_L0+0, 0
	ADDWF      FSR0L, 1
	MOVLW      0
	BTFSC      InitNRF_i_L0+0, 7
	MOVLW      255
	ADDWFC     FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,68 :: 		for(i=0;i<10;i++){
	INCF       InitNRF_i_L0+0, 1
;MyProject.c,70 :: 		}
	GOTO       L_InitNRF3
L_InitNRF4:
;MyProject.c,71 :: 		CSN = 1;
	BSF        PORTC+0, 2
;MyProject.c,72 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_InitNRF6:
	DECFSZ     R13, 1
	GOTO       L_InitNRF6
	DECFSZ     R12, 1
	GOTO       L_InitNRF6
	NOP
;MyProject.c,73 :: 		CSN = 0;
	BCF        PORTC+0, 2
;MyProject.c,74 :: 		SPI1_Write(WTA); //Write TX Address
	MOVLW      34
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,75 :: 		for(i=0;i<4;i++){
	CLRF       InitNRF_i_L0+0
L_InitNRF7:
	MOVLW      128
	XORWF      InitNRF_i_L0+0, 0
	MOVWF      R0
	MOVLW      128
	XORLW      4
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_InitNRF8
;MyProject.c,76 :: 		SPI1_Write(nRFAddress[i]);
	MOVLW      InitNRF_nRFAddress_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(InitNRF_nRFAddress_L0+0)
	MOVWF      FSR0H
	MOVF       InitNRF_i_L0+0, 0
	ADDWF      FSR0L, 1
	MOVLW      0
	BTFSC      InitNRF_i_L0+0, 7
	MOVLW      255
	ADDWFC     FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,75 :: 		for(i=0;i<4;i++){
	INCF       InitNRF_i_L0+0, 1
;MyProject.c,77 :: 		}
	GOTO       L_InitNRF7
L_InitNRF8:
;MyProject.c,78 :: 		CSN = 1;
	BSF        PORTC+0, 2
;MyProject.c,79 :: 		}
L_end_InitNRF:
	RETURN
; end of _InitNRF

_Detection:

;MyProject.c,81 :: 		void Detection(){
;MyProject.c,82 :: 		luminosity1=ADC_Read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0, 0
	MOVWF      _luminosity1+0
	MOVF       R1, 0
	MOVWF      _luminosity1+1
;MyProject.c,83 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_Detection10:
	DECFSZ     R13, 1
	GOTO       L_Detection10
	DECFSZ     R12, 1
	GOTO       L_Detection10
	NOP
;MyProject.c,84 :: 		luminosity2=ADC_Read(3);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0, 0
	MOVWF      _luminosity2+0
	MOVF       R1, 0
	MOVWF      _luminosity2+1
;MyProject.c,85 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_Detection11:
	DECFSZ     R13, 1
	GOTO       L_Detection11
	DECFSZ     R12, 1
	GOTO       L_Detection11
	NOP
;MyProject.c,86 :: 		luminosity=(luminosity1+luminosity2)/2;
	MOVF       _luminosity2+0, 0
	ADDWF      _luminosity1+0, 0
	MOVWF      R3
	MOVF       _luminosity2+1, 0
	ADDWFC     _luminosity1+1, 0
	MOVWF      R4
	MOVF       R3, 0
	MOVWF      R1
	MOVF       R4, 0
	MOVWF      R2
	ASRF       R2, 1
	RRF        R1, 1
	MOVF       R1, 0
	MOVWF      _luminosity+0
	MOVF       R2, 0
	MOVWF      _luminosity+1
;MyProject.c,88 :: 		if(luminosity>850 && Motion_Sensor==1){
	MOVLW      128
	XORLW      3
	MOVWF      R0
	MOVLW      128
	XORWF      R2, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Detection28
	MOVF       R1, 0
	SUBLW      82
L__Detection28:
	BTFSC      STATUS+0, 0
	GOTO       L_Detection14
	BTFSS      PORTB+0, 4
	GOTO       L_Detection14
L__Detection24:
;MyProject.c,89 :: 		flag=1;
	MOVLW      1
	MOVWF      _flag+0
	MOVLW      0
	MOVWF      _flag+1
;MyProject.c,90 :: 		}
L_Detection14:
;MyProject.c,91 :: 		}
L_end_Detection:
	RETURN
; end of _Detection

_TXPacket:

;MyProject.c,93 :: 		void TXPacket(short Packet){
;MyProject.c,94 :: 		PWR_UP = 1;
	BSF        PORTB+0, 1
;MyProject.c,95 :: 		TRX_CE = 0;
	BCF        PORTC+0, 7
;MyProject.c,96 :: 		TX_EN = 1;
	BSF        PORTB+0, 0
;MyProject.c,97 :: 		CSN = 0;
	BCF        PORTC+0, 2
;MyProject.c,98 :: 		SPI1_Write(WTP); //Write TX Payload
	MOVLW      32
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,99 :: 		SPI1_Write(Packet);
	MOVF       FARG_TXPacket_Packet+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,100 :: 		CSN = 1;
	BSF        PORTC+0, 2
;MyProject.c,101 :: 		TRX_CE = 1; // Start transmitting
	BSF        PORTC+0, 7
;MyProject.c,102 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11
	MOVLW      4
	MOVWF      R12
	MOVLW      186
	MOVWF      R13
L_TXPacket15:
	DECFSZ     R13, 1
	GOTO       L_TXPacket15
	DECFSZ     R12, 1
	GOTO       L_TXPacket15
	DECFSZ     R11, 1
	GOTO       L_TXPacket15
	NOP
;MyProject.c,103 :: 		if(DR==1){
	BTFSS      PORTC+0, 0
	GOTO       L_TXPacket16
;MyProject.c,104 :: 		TRX_CE=0;
	BCF        PORTC+0, 7
;MyProject.c,105 :: 		}
L_TXPacket16:
;MyProject.c,106 :: 		}
L_end_TXPacket:
	RETURN
; end of _TXPacket

_main:

;MyProject.c,109 :: 		void main() {
;MyProject.c,110 :: 		Port_Init();
	CALL       _Port_Init+0
;MyProject.c,111 :: 		InitNRF(0x83, 0x5f, 0x9a, 0x12);
	MOVLW      131
	MOVWF      FARG_InitNRF_nRFAddress0+0
	MOVLW      95
	MOVWF      FARG_InitNRF_nRFAddress1+0
	MOVLW      154
	MOVWF      FARG_InitNRF_nRFAddress2+0
	MOVLW      18
	MOVWF      FARG_InitNRF_nRFAddress3+0
	CALL       _InitNRF+0
;MyProject.c,112 :: 		while(1){
L_main17:
;MyProject.c,113 :: 		Detection();
	CALL       _Detection+0
;MyProject.c,114 :: 		if(flag==1){
	MOVLW      0
	XORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main31
	MOVLW      1
	XORWF      _flag+0, 0
L__main31:
	BTFSS      STATUS+0, 2
	GOTO       L_main19
;MyProject.c,115 :: 		TXPacket(0x7e);
	MOVLW      126
	MOVWF      FARG_TXPacket_Packet+0
	CALL       _TXPacket+0
;MyProject.c,116 :: 		LED1=1;
	BSF        PORTB+0, 3
;MyProject.c,117 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_main20:
	DECFSZ     R13, 1
	GOTO       L_main20
	DECFSZ     R12, 1
	GOTO       L_main20
	DECFSZ     R11, 1
	GOTO       L_main20
	NOP
	NOP
;MyProject.c,118 :: 		LED1=0;
	BCF        PORTB+0, 3
;MyProject.c,119 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_main21:
	DECFSZ     R13, 1
	GOTO       L_main21
	DECFSZ     R12, 1
	GOTO       L_main21
	DECFSZ     R11, 1
	GOTO       L_main21
	NOP
	NOP
;MyProject.c,120 :: 		TXPacket(0x7e);
	MOVLW      126
	MOVWF      FARG_TXPacket_Packet+0
	CALL       _TXPacket+0
;MyProject.c,121 :: 		LED1=1;
	BSF        PORTB+0, 3
;MyProject.c,122 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_main22:
	DECFSZ     R13, 1
	GOTO       L_main22
	DECFSZ     R12, 1
	GOTO       L_main22
	DECFSZ     R11, 1
	GOTO       L_main22
	NOP
	NOP
;MyProject.c,123 :: 		LED1=0;
	BCF        PORTB+0, 3
;MyProject.c,124 :: 		Delay_ms(3500);
	MOVLW      36
	MOVWF      R11
	MOVLW      131
	MOVWF      R12
	MOVLW      207
	MOVWF      R13
L_main23:
	DECFSZ     R13, 1
	GOTO       L_main23
	DECFSZ     R12, 1
	GOTO       L_main23
	DECFSZ     R11, 1
	GOTO       L_main23
;MyProject.c,125 :: 		}
L_main19:
;MyProject.c,126 :: 		flag=0;
	CLRF       _flag+0
	CLRF       _flag+1
;MyProject.c,127 :: 		}
	GOTO       L_main17
;MyProject.c,128 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
