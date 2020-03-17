#include <mega128.h>   
#include <delay.h>      
#include <stdio.h>        
#include "lcd.h"

#define ADC_VREF_TYPE 0x00  // A/D ������ ��� ���� ����,AREF ���� ���, ���� VREF ���� ���� 
#define ADC_AVCC_TYPE 0x40 // A/D ������ ��� ���� ����,AVcc���ڿ� ARRE�� ����� Ŀ�н��� ��� 
#define ADC_RES_TYPE  0x80  // A/D ������ ��� ���� ����,reserved 
#define ADC_2_56_TYPE 0xC0  // A/D ������ ��� ���� ����,���� 2.56V�� AREF�� ����� Ŀ�н��� ��� 

/*PIR������ LED define*/
#define PIR_sensor1 PINC.1  
#define LED1 PORTE.4
#define LED2 PORTE.5
#define LED3 PORTE.6
#define Motor1 PORTE.7
#define Motor2 PORTD.4
#define COUNT 10

/*Buzzer �κ�*/
#define Do 1908 // 262Hz (3817us) 1908us 
#define Re 1700 // 294Hz (3401us) 1701us 
#define Mi 1515 // 330Hz (3030us) 1515us 
#define Fa 1432 // 349Hz (2865us) 1433us 
#define Sol 1275 // 370Hz (2703us) 1351us 
#define La 1136 // 440Hz (2273us) 1136us 
#define Si 1012 // 494Hz (2024us) 1012us
#define HDo 956

int cnt1 = 0;
int cnt2 = 0;
int sh = 0;
int i = 0;
int j = 0;
int temp = 0;
int flag = 0;
int adcRaw = 0;
int adcRaw_b = 0;             // ADC ������ ����� 
float brightVal =0;    // ADC �����͸� �������� ��ȯ�� ������ �����
char Message[40] = {0,};  // LCD ǥ������ ���ڿ� ���� 
 

void myDelay_us(unsigned int delay) 
{ 
    int i; 
    for(i=0; i<delay; i++) 
    { 
        delay_us(1); 
    } 
}

void SSound(int time) 
{ 
    int i, tim; 
    tim = 50000/time; //���踶�� ���� �ð����� �︮���� tim ���� ��� 
    for(i=0; i<tim; i++) 
    { 
        PORTG |= 1<<4; //buzzer on, PORTG�� 4�� �� on(out 1) 
        myDelay_us(time); 
        PORTG &= ~(1<<4); //buzzer off, PORTG�� 4�� �� off(out 0) 
        myDelay_us(time); 
    } 
}

void Shadeon_buz()  // Shade On ���°� �� �� 
{
     SSound(Do);
     delay_ms(30);
    
     SSound(Mi);
     delay_ms(30);
     
     SSound(Sol);
     delay_ms(30);
}

void Shadeoff_buz()  // Shade Off ���°� �� �� 
{
     SSound(Sol);
     delay_ms(30);
    
     SSound(Mi);
     delay_ms(30);
     
     SSound(Do);
     delay_ms(30);
}  

void ADC_Init(void)                
{    
    ADCSRA  = 0x00;        // ADC ������ ���� ��Ȱ��ȭ
    ADMUX   = ADC_AVCC_TYPE | (0<ADLAR) | (0<<MUX0); 
    // REFS1��0='11', ADLAR=0, MUX=0(ADC0 ����) 
    ADCSRA = (1<<ADEN) | (3<<ADPS0)| (1<<ADFR);      
    // 1<<ADEN  : AD��ȯ Ȱ��ȭ 
    // 1<<ADFR  : Free Running ��� Ȱ��ȭ 
    // 3<<ADPS0 : AC��ȯ ���ֺ��� - 8����.
}

unsigned int Read_ADC_Data_Diff(unsigned char adc_mux)   
{
    unsigned int ADC_Data = 0;  
    // AD ��ȯ ä�� ���� 
    ADMUX    &= ~(0x1F);                
    ADMUX |= (adc_mux & 0x1F);   
    ADCSRA |= (1<<ADSC);             // AD ��ȯ ����
    while(!(ADCSRA & (1 << ADIF)));     // AD ��ȯ ���� ���
    ADC_Data  = ADCL; 
    ADC_Data  |= ADCH<<8;
    return ADC_Data;    
    flag ++;
}

void main()
{
    char data[COUNT];
    
    DDRD = 0xff;
    /*PIR���ܼ�����  �κ� ����*/
    DDRB = 0xff;
    //PORTB = 0xff;
    DDRC = 0x00;   
    
    /*LED�κ� ����*/
    DDRE = 0xff;
                           
    /*Cds�������� �κ� ����*/
    ADC_Init();             // ADC �ʱ�ȭ     
    LCD_Init();             // LCD �ʱ�ȭ
            
    LCD_Clear();
        
    while(1)
    {   
        if(flag!=-1)
        {       
            adcRaw_b  = Read_ADC_Data_Diff(0b00001);    // MUX : 00011 ��ȯ ��û 
            // AD ��ȯ ������ ���
            if(flag==0)
            {
                data[0] = adcRaw_b;
            }
            if(flag==1)
            {
                data[1] = adcRaw_b;
            }
            if(flag==2)
            {
                data[2] = adcRaw_b;
            }
            if(flag==3)
            {
                data[3] = adcRaw_b;
            }
            if(flag==4)
            {
                data[4] = adcRaw_b;
            }
            if(flag==5)
            {
                data[5] = adcRaw_b;
            }   
            if(flag==6)
            {
                data[6] = adcRaw_b;
            }
            if(flag==7)
            {
                data[7] = adcRaw_b;
            }
            if(flag==8)
            {
                data[8] = adcRaw_b;
            }         
            if(flag==9)
            {
                data[9] = adcRaw_b;
            }
        }   
        
        for (i = 0; i < COUNT - 1; i++)
        {
            for (j = 0; j < COUNT - 1 - i; j++)
            {
                if (data[j] < data[j + 1])
                {
                temp        = data[j];
                data[j]     = data[j + 1];
                data[j + 1] = temp;
                }
            }
        }
        
        if(flag>10)
        {    
            adcRaw_b = data[COUNT/2];  
            flag = 0;
        }               
        
        sprintf(Message,"Bright:    %d ",adcRaw_b);   
        LCD_Pos(0,0);
        LCD_Str(Message);  
        //delay_ms(500); 
        
        if((PIR_sensor1 == 1)&&(adcRaw_b<350))   // PIR������ ��ü �ν����� �� OUT���ڸ� ���� 0�� ������
         {
            LCD_Pos(1,0);
            LCD_Str("LED OFF");      
            //delay_ms(100); 
            LED1 = 0;
            LED2 = 0;               
            LED3 = 0; 
                   
         } 
        else if((PIR_sensor1 == 1)&&((adcRaw_b>=350)&&(adcRaw_b<500))) 
         {  
            LCD_Pos(1,0);       
            LCD_Str("LED 1st");      
            //delay_ms(100); 
            LED1 = 0;
            LED2 = 1;
            LED3 = 0;   
         }
        else if((PIR_sensor1 == 1)&&((adcRaw_b>=550)&&(adcRaw_b<800))) 
         {
            LCD_Pos(1,0);
            LCD_Str("LED 2nd");      
            //delay_ms(100); 
            LED1 = 1;
            LED2 = 0;
            LED3 = 1;   
         }
        else if((PIR_sensor1==1)&&((adcRaw_b>=800)&&(adcRaw_b<1023))) 
         {  
            LCD_Pos(1,0);
            LCD_Str("LED 3rd");      
            //delay_ms(100);  
            LED1 = 1;
            LED2 = 1;
            LED3 = 1;
         }              
        else if((PIR_sensor1 == 0)&&(adcRaw_b>=350))
         {         
            LCD_Pos(1,0);
            LCD_Str("LED 1st");
            //delay_ms(100);
            LED1 = 0;
            LED2 = 1;
            LED3 = 0;   
         } 
        else if((PIR_sensor1 == 0)&&(adcRaw_b<350)) 
         {
            LCD_Pos(1,0);
            LCD_Str("LED OFF");      
            //delay_ms(100);
            LED1 = 0;
            LED2 = 0;               
            LED3 = 0;
         }   
         //delay_ms(500); 
         if(adcRaw_b < 100)
         {       
                cnt2 = 0;
                if(cnt1==0)
                {
                    Shadeon_buz();
                    cnt1++;
                }               
                
                for(sh=0;sh<25;sh++)
                {   
                    Motor1=1;
                    Motor2=1;   
                    delay_us(1500); 
                    Motor1=0;
                    Motor2=0; 
                    delay_ms(20); 
                } // 0�� 
         } 
         else if(adcRaw_b>=100)
         {      
                cnt1 = 0;
                if(cnt2==0)
                {
                    Shadeoff_buz();
                    cnt2++;
                }  
                
                for(sh=0;sh<25;sh++)
                {   
                    Motor1=1; 
                    delay_us(600); 
                    Motor1=0; 
                    delay_ms(20);
                    Motor2=1; 
                    delay_us(2400); 
                    Motor2=0; 
                    delay_ms(20); 
                } // -90��   
         }  
     }
}
