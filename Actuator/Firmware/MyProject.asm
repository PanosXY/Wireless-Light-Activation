
_Port_Init:

;MyProject.c,38 :: 		Port_Init(){
;MyProject.c,39 :: 		INTCON = 0;
	CLRF       INTCON+0
;MyProject.c,40 :: 		TRISB=0b00110000;
	MOVLW      48
	MOVWF      TRISB+0
;MyProject.c,41 :: 		ANSELB=0x00;
	CLRF       ANSELB+0
;MyProject.c,42 :: 		ANSELA=0x00;
	CLRF       ANSELA+0
;MyProject.c,43 :: 		TRISC=0b01000001;
	MOVLW      65
	MOVWF      TRISC+0
;MyProject.c,44 :: 		ANSELC = 0x00;
	CLRF       ANSELC+0
;MyProject.c,45 :: 		SPI1_Init();
	CALL       _SPI1_Init+0
;MyProject.c,46 :: 		PORTB=0b00001100;
	MOVLW      12
	MOVWF      PORTB+0
;MyProject.c,47 :: 		Delay_ms(3000);
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
;MyProject.c,48 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,49 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11
	MOVLW      4
	MOVWF      R12
	MOVLW      186
	MOVWF      R13
L_Port_Init1:
	DECFSZ     R13, 1
	GOTO       L_Port_Init1
	DECFSZ     R12, 1
	GOTO       L_Port_Init1
	DECFSZ     R11, 1
	GOTO       L_Port_Init1
	NOP
;MyProject.c,50 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,51 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,52 :: 		text = "Skiadas";
	MOVLW      ?lstr1_MyProject+0
	MOVWF      _text+0
	MOVLW      hi_addr(?lstr1_MyProject+0)
	MOVWF      _text+1
;MyProject.c,53 :: 		Lcd_Out(1,1,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVF       _text+1, 0
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,54 :: 		delay_ms(2500);
	MOVLW      26
	MOVWF      R11
	MOVLW      94
	MOVWF      R12
	MOVLW      110
	MOVWF      R13
L_Port_Init2:
	DECFSZ     R13, 1
	GOTO       L_Port_Init2
	DECFSZ     R12, 1
	GOTO       L_Port_Init2
	DECFSZ     R11, 1
	GOTO       L_Port_Init2
	NOP
;MyProject.c,55 :: 		text = "Chatzisavvas";
	MOVLW      ?lstr2_MyProject+0
	MOVWF      _text+0
	MOVLW      hi_addr(?lstr2_MyProject+0)
	MOVWF      _text+1
;MyProject.c,56 :: 		Lcd_Out(1,1,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVF       _text+1, 0
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,57 :: 		delay_ms(2500);
	MOVLW      26
	MOVWF      R11
	MOVLW      94
	MOVWF      R12
	MOVLW      110
	MOVWF      R13
L_Port_Init3:
	DECFSZ     R13, 1
	GOTO       L_Port_Init3
	DECFSZ     R12, 1
	GOTO       L_Port_Init3
	DECFSZ     R11, 1
	GOTO       L_Port_Init3
	NOP
;MyProject.c,58 :: 		PORTB=0b00000000;
	CLRF       PORTB+0
;MyProject.c,59 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,60 :: 		text = "Insert TimeOut: ";
	MOVLW      ?lstr3_MyProject+0
	MOVWF      _text+0
	MOVLW      hi_addr(?lstr3_MyProject+0)
	MOVWF      _text+1
;MyProject.c,61 :: 		Lcd_Out(1,1,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVF       _text+1, 0
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,62 :: 		text = "seconds";
	MOVLW      ?lstr4_MyProject+0
	MOVWF      _text+0
	MOVLW      hi_addr(?lstr4_MyProject+0)
	MOVWF      _text+1
;MyProject.c,63 :: 		Lcd_Out(2,6,text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVF       _text+1, 0
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,64 :: 		ShortToStr(time, text);
	MOVF       _time+0, 0
	MOVWF      FARG_ShortToStr_input+0
	MOVF       _text+0, 0
	MOVWF      FARG_ShortToStr_output+0
	MOVF       _text+1, 0
	MOVWF      FARG_ShortToStr_output+1
	CALL       _ShortToStr+0
;MyProject.c,65 :: 		Lcd_Out(2,1,text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVF       _text+1, 0
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,67 :: 		TX_EN = 0;  // Rx mode
	BCF        PORTB+0, 0
;MyProject.c,68 :: 		TRX_CE = 0; // Standby mode
	BCF        PORTC+0, 7
;MyProject.c,69 :: 		PWR_UP = 0; // Power down
	BCF        PORTB+0, 1
;MyProject.c,70 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_Port_Init4:
	DECFSZ     R13, 1
	GOTO       L_Port_Init4
	DECFSZ     R12, 1
	GOTO       L_Port_Init4
	NOP
;MyProject.c,71 :: 		}
L_end_Port_Init:
	RETURN
; end of _Port_Init

_InitNRF:

;MyProject.c,73 :: 		void InitNRF(short nRFAddress0, short nRFAddress1, short nRFAddress2, short nRFAddress3){
;MyProject.c,76 :: 		nRFAddress[0]=nRFAddress0;
	MOVF       FARG_InitNRF_nRFAddress0+0, 0
	MOVWF      InitNRF_nRFAddress_L0+0
;MyProject.c,77 :: 		nRFAddress[1]=nRFAddress1;
	MOVF       FARG_InitNRF_nRFAddress1+0, 0
	MOVWF      InitNRF_nRFAddress_L0+1
;MyProject.c,78 :: 		nRFAddress[2]=nRFAddress2;
	MOVF       FARG_InitNRF_nRFAddress2+0, 0
	MOVWF      InitNRF_nRFAddress_L0+2
;MyProject.c,79 :: 		nRFAddress[3]=nRFAddress3;
	MOVF       FARG_InitNRF_nRFAddress3+0, 0
	MOVWF      InitNRF_nRFAddress_L0+3
;MyProject.c,81 :: 		nRFConfig[0] = 0b01011111;
	MOVLW      95
	MOVWF      InitNRF_nRFConfig_L0+0
;MyProject.c,82 :: 		nRFConfig[1] = 0b00001101;
	MOVLW      13
	MOVWF      InitNRF_nRFConfig_L0+1
;MyProject.c,83 :: 		nRFConfig[2] = 0b01000100;
	MOVLW      68
	MOVWF      InitNRF_nRFConfig_L0+2
;MyProject.c,84 :: 		nRFConfig[3] = 0b00000001;
	MOVLW      1
	MOVWF      InitNRF_nRFConfig_L0+3
;MyProject.c,85 :: 		nRFConfig[4] = 0b00000001;
	MOVLW      1
	MOVWF      InitNRF_nRFConfig_L0+4
;MyProject.c,86 :: 		nRFConfig[5] = nRFAddress[0];
	MOVF       InitNRF_nRFAddress_L0+0, 0
	MOVWF      InitNRF_nRFConfig_L0+5
;MyProject.c,87 :: 		nRFConfig[6] = nRFAddress[1];
	MOVF       InitNRF_nRFAddress_L0+1, 0
	MOVWF      InitNRF_nRFConfig_L0+6
;MyProject.c,88 :: 		nRFConfig[7] = nRFAddress[2];
	MOVF       InitNRF_nRFAddress_L0+2, 0
	MOVWF      InitNRF_nRFConfig_L0+7
;MyProject.c,89 :: 		nRFConfig[8] = nRFAddress[3];
	MOVF       FARG_InitNRF_nRFAddress3+0, 0
	MOVWF      InitNRF_nRFConfig_L0+8
;MyProject.c,90 :: 		nRFConfig[9] = 0b11011011;
	MOVLW      219
	MOVWF      InitNRF_nRFConfig_L0+9
;MyProject.c,92 :: 		PWR_UP = 1;
	BSF        PORTB+0, 1
;MyProject.c,93 :: 		CSN = 0;
	BCF        PORTC+0, 2
;MyProject.c,94 :: 		SPI1_Write(WC); //Write nRF configuration
	CLRF       FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,95 :: 		for(i=0;i<10;i++){
	CLRF       InitNRF_i_L0+0
L_InitNRF5:
	MOVLW      128
	XORWF      InitNRF_i_L0+0, 0
	MOVWF      R0
	MOVLW      128
	XORLW      10
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_InitNRF6
;MyProject.c,96 :: 		SPI1_Write(nRFConfig[i]);
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
;MyProject.c,95 :: 		for(i=0;i<10;i++){
	INCF       InitNRF_i_L0+0, 1
;MyProject.c,97 :: 		}
	GOTO       L_InitNRF5
L_InitNRF6:
;MyProject.c,98 :: 		CSN = 1;
	BSF        PORTC+0, 2
;MyProject.c,99 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12
	MOVLW      248
	MOVWF      R13
L_InitNRF8:
	DECFSZ     R13, 1
	GOTO       L_InitNRF8
	DECFSZ     R12, 1
	GOTO       L_InitNRF8
	NOP
;MyProject.c,100 :: 		CSN = 0;
	BCF        PORTC+0, 2
;MyProject.c,101 :: 		SPI1_Write(WTA); //Write TX Address
	MOVLW      34
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,102 :: 		for(i=0;i<4;i++){
	CLRF       InitNRF_i_L0+0
L_InitNRF9:
	MOVLW      128
	XORWF      InitNRF_i_L0+0, 0
	MOVWF      R0
	MOVLW      128
	XORLW      4
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_InitNRF10
;MyProject.c,103 :: 		SPI1_Write(nRFAddress[i]);
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
;MyProject.c,102 :: 		for(i=0;i<4;i++){
	INCF       InitNRF_i_L0+0, 1
;MyProject.c,104 :: 		}
	GOTO       L_InitNRF9
L_InitNRF10:
;MyProject.c,105 :: 		CSN = 1;
	BSF        PORTC+0, 2
;MyProject.c,106 :: 		}
L_end_InitNRF:
	RETURN
; end of _InitNRF

_Add_Sub_TimeOut:

;MyProject.c,108 :: 		void Add_Sub_TimeOut(){
;MyProject.c,110 :: 		if(IncreaseButton==1){
	BTFSS      PORTB+0, 5
	GOTO       L_Add_Sub_TimeOut12
;MyProject.c,111 :: 		time++;
	INCF       _time+0, 1
;MyProject.c,112 :: 		if(time>45){
	MOVLW      128
	XORLW      45
	MOVWF      R0
	MOVLW      128
	XORWF      _time+0, 0
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Add_Sub_TimeOut13
;MyProject.c,113 :: 		time=45;
	MOVLW      45
	MOVWF      _time+0
;MyProject.c,114 :: 		}
L_Add_Sub_TimeOut13:
;MyProject.c,115 :: 		ShortToStr(time, text);
	MOVF       _time+0, 0
	MOVWF      FARG_ShortToStr_input+0
	MOVF       _text+0, 0
	MOVWF      FARG_ShortToStr_output+0
	MOVF       _text+1, 0
	MOVWF      FARG_ShortToStr_output+1
	CALL       _ShortToStr+0
;MyProject.c,116 :: 		Lcd_Out(2,1,text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVF       _text+1, 0
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,117 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11
	MOVLW      12
	MOVWF      R12
	MOVLW      51
	MOVWF      R13
L_Add_Sub_TimeOut14:
	DECFSZ     R13, 1
	GOTO       L_Add_Sub_TimeOut14
	DECFSZ     R12, 1
	GOTO       L_Add_Sub_TimeOut14
	DECFSZ     R11, 1
	GOTO       L_Add_Sub_TimeOut14
	NOP
	NOP
;MyProject.c,118 :: 		}
L_Add_Sub_TimeOut12:
;MyProject.c,120 :: 		if(DecreaseButton==1){
	BTFSS      PORTB+0, 4
	GOTO       L_Add_Sub_TimeOut15
;MyProject.c,121 :: 		time--;
	DECF       _time+0, 1
;MyProject.c,122 :: 		if(time<5){
	MOVLW      128
	XORWF      _time+0, 0
	MOVWF      R0
	MOVLW      128
	XORLW      5
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Add_Sub_TimeOut16
;MyProject.c,123 :: 		time=5;
	MOVLW      5
	MOVWF      _time+0
;MyProject.c,124 :: 		}
L_Add_Sub_TimeOut16:
;MyProject.c,125 :: 		ShortToStr(time, text);
	MOVF       _time+0, 0
	MOVWF      FARG_ShortToStr_input+0
	MOVF       _text+0, 0
	MOVWF      FARG_ShortToStr_output+0
	MOVF       _text+1, 0
	MOVWF      FARG_ShortToStr_output+1
	CALL       _ShortToStr+0
;MyProject.c,126 :: 		Lcd_Out(2,1,text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVF       _text+1, 0
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,127 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11
	MOVLW      12
	MOVWF      R12
	MOVLW      51
	MOVWF      R13
L_Add_Sub_TimeOut17:
	DECFSZ     R13, 1
	GOTO       L_Add_Sub_TimeOut17
	DECFSZ     R12, 1
	GOTO       L_Add_Sub_TimeOut17
	DECFSZ     R11, 1
	GOTO       L_Add_Sub_TimeOut17
	NOP
	NOP
;MyProject.c,128 :: 		}
L_Add_Sub_TimeOut15:
;MyProject.c,129 :: 		}
L_end_Add_Sub_TimeOut:
	RETURN
; end of _Add_Sub_TimeOut

_RXPacket:

;MyProject.c,131 :: 		void RXPacket(){
;MyProject.c,133 :: 		TX_EN = 0;
	BCF        PORTB+0, 0
;MyProject.c,134 :: 		PWR_UP=1;
	BSF        PORTB+0, 1
;MyProject.c,135 :: 		TRX_CE=1;
	BSF        PORTC+0, 7
;MyProject.c,137 :: 		if(AM==1 && DR==1){
	BTFSS      PORTC+0, 6
	GOTO       L_RXPacket20
	BTFSS      PORTC+0, 0
	GOTO       L_RXPacket20
L__RXPacket30:
;MyProject.c,138 :: 		CSN = 0;
	BCF        PORTC+0, 2
;MyProject.c,139 :: 		SPI1_Write(RRP); //Read RX Payload
	MOVLW      36
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;MyProject.c,140 :: 		data0 = SPI1_Read(SpiBuf);
	MOVF       RXPacket_SpiBuf_L0+0, 0
	MOVWF      FARG_SPI1_Read_buffer+0
	CALL       _SPI1_Read+0
	MOVF       R0, 0
	MOVWF      _data0+0
;MyProject.c,141 :: 		CSN = 1;
	BSF        PORTC+0, 2
;MyProject.c,142 :: 		flag++;
	INCF       _flag+0, 1
;MyProject.c,143 :: 		if(flag==1){
	MOVF       _flag+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_RXPacket21
;MyProject.c,144 :: 		LED2=1;
	BSF        PORTB+0, 2
;MyProject.c,145 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_RXPacket22:
	DECFSZ     R13, 1
	GOTO       L_RXPacket22
	DECFSZ     R12, 1
	GOTO       L_RXPacket22
	DECFSZ     R11, 1
	GOTO       L_RXPacket22
	NOP
	NOP
;MyProject.c,146 :: 		LED2=0;
	BCF        PORTB+0, 2
;MyProject.c,147 :: 		}
L_RXPacket21:
;MyProject.c,148 :: 		}
L_RXPacket20:
;MyProject.c,149 :: 		}
L_end_RXPacket:
	RETURN
; end of _RXPacket

_main:

;MyProject.c,152 :: 		void main() {
;MyProject.c,153 :: 		Port_Init();
	CALL       _Port_Init+0
;MyProject.c,154 :: 		InitNRF(0x83, 0x5f, 0x9a, 0x12);
	MOVLW      131
	MOVWF      FARG_InitNRF_nRFAddress0+0
	MOVLW      95
	MOVWF      FARG_InitNRF_nRFAddress1+0
	MOVLW      154
	MOVWF      FARG_InitNRF_nRFAddress2+0
	MOVLW      18
	MOVWF      FARG_InitNRF_nRFAddress3+0
	CALL       _InitNRF+0
;MyProject.c,155 :: 		while(1){
L_main23:
;MyProject.c,156 :: 		Add_Sub_TimeOut();
	CALL       _Add_Sub_TimeOut+0
;MyProject.c,157 :: 		RXPacket();
	CALL       _RXPacket+0
;MyProject.c,158 :: 		if(data0==0x7e && flag==1){
	MOVF       _data0+0, 0
	XORLW      126
	BTFSS      STATUS+0, 2
	GOTO       L_main27
	MOVF       _flag+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main27
L__main31:
;MyProject.c,159 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,160 :: 		text = "Lamp Is On";
	MOVLW      ?lstr5_MyProject+0
	MOVWF      _text+0
	MOVLW      hi_addr(?lstr5_MyProject+0)
	MOVWF      _text+1
;MyProject.c,161 :: 		Lcd_Out(1,1,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVF       _text+1, 0
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,162 :: 		LED1=1;
	BSF        PORTB+0, 3
;MyProject.c,163 :: 		LAMP=1;
	BSF        PORTC+0, 1
;MyProject.c,164 :: 		timeout=time*1000;
	MOVF       _time+0, 0
	MOVWF      R0
	MOVLW      0
	BTFSC      R0, 7
	MOVLW      255
	MOVWF      R1
	MOVLW      232
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVF       R0, 0
	MOVWF      _timeout+0
	MOVF       R1, 0
	MOVWF      _timeout+1
;MyProject.c,165 :: 		Vdelay_ms(timeout);
	MOVF       R0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       R1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;MyProject.c,166 :: 		LED1=0;
	BCF        PORTB+0, 3
;MyProject.c,167 :: 		LAMP=0;
	BCF        PORTC+0, 1
;MyProject.c,168 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,169 :: 		text = "Lamp Is Off";
	MOVLW      ?lstr6_MyProject+0
	MOVWF      _text+0
	MOVLW      hi_addr(?lstr6_MyProject+0)
	MOVWF      _text+1
;MyProject.c,170 :: 		Lcd_Out(1,1,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVF       _text+1, 0
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,171 :: 		Delay_ms(5000);
	MOVLW      51
	MOVWF      R11
	MOVLW      187
	MOVWF      R12
	MOVLW      223
	MOVWF      R13
L_main28:
	DECFSZ     R13, 1
	GOTO       L_main28
	DECFSZ     R12, 1
	GOTO       L_main28
	DECFSZ     R11, 1
	GOTO       L_main28
	NOP
	NOP
;MyProject.c,172 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,173 :: 		text = "Insert TimeOut: ";
	MOVLW      ?lstr7_MyProject+0
	MOVWF      _text+0
	MOVLW      hi_addr(?lstr7_MyProject+0)
	MOVWF      _text+1
;MyProject.c,174 :: 		Lcd_Out(1,1,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVF       _text+1, 0
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,175 :: 		text = "seconds";
	MOVLW      ?lstr8_MyProject+0
	MOVWF      _text+0
	MOVLW      hi_addr(?lstr8_MyProject+0)
	MOVWF      _text+1
;MyProject.c,176 :: 		Lcd_Out(2,6,text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVF       _text+1, 0
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,177 :: 		ShortToStr(time, text);
	MOVF       _time+0, 0
	MOVWF      FARG_ShortToStr_input+0
	MOVF       _text+0, 0
	MOVWF      FARG_ShortToStr_output+0
	MOVF       _text+1, 0
	MOVWF      FARG_ShortToStr_output+1
	CALL       _ShortToStr+0
;MyProject.c,178 :: 		Lcd_Out(2,1,text);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVF       _text+1, 0
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;MyProject.c,179 :: 		}
L_main27:
;MyProject.c,180 :: 		data0=0x00;
	CLRF       _data0+0
;MyProject.c,181 :: 		if(flag==2){
	MOVF       _flag+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main29
;MyProject.c,182 :: 		flag=0;
	CLRF       _flag+0
;MyProject.c,183 :: 		}
L_main29:
;MyProject.c,184 :: 		}
	GOTO       L_main23
;MyProject.c,185 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
