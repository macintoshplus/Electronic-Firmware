/*
 * File:   main.c
 * Author: jbnahan
 *
 * Created on July 27, 2011, 5:56 PM
 */


#include <pic18.h>
#include <htc.h>
#include <stdio.h>
//#include <stdlib.h>
#include <string.h>
//#include <math.h>
#include "delay.h"
#include "i2c.h"

__CONFIG(1, INT_USBHS & PLLDIV12 & FCMDIS & IESODIS);  //INT CLOCK
__CONFIG(2,PWRTEN & BOREN & BORV20 & VREGDIS & WDTDIS & WDTPS1);      // BO 2.00V USB V regulator OFF WDT off
__CONFIG(3,CCP2RB3 & PBDIGITAL & LPT1DIS & MCLREN);        // RE3 enabled
__CONFIG(4,XINSTDIS & STVREN & LVPDIS);                      // LVP enabled stack underflow reset
__CONFIG(5,UNPROTECT);          // no code protect
__CONFIG(6,UNPROTECT & WPC);    // no write protect, configuration protected
__CONFIG(7,UNPROTECT);          // no table write protect 

//Valeur attribué au port B pour afficher correctement chaque chiffre
#define  UN         0x88
#define  DEUX       0xD6
#define  TROIS      0xDC
#define  QUATRE     0x99
#define  CINQ       0x5D
#define  SIX        0x5F
#define  SEPT       0xC8
#define  HUIT       0xDF
#define  NEUF       0xDD
#define  ZERO       0xCF
#define  ERR        0x57

//Adresse I2C du composant TEMP101
#define  TMP101     0x4A /* Temp 101 */

#define  TMP101_VALUE   0x00 /* Valeur */
#define  TMP101_CONFIG  0x01 /* CONFIG */
#define  TMP101_TLOW    0x02 /* Temp low */
#define  TMP101_THI     0x03 /* Temp high */

#define LED_ERROR RB5 //PIN d'une LED permetant de signaler les erreurs
#define UNITE RD3 //PIN permetant d'afficher la valeur sur le chiffre des unités

#define DIZAINE RD2 //PIN permetant d'afficher la valeur sur le chiffre des dizaine
#define DIZAINE_POINT RA0 //PIN permetant d'allumer le point des dizaines

#define BOUTON RD0 //Pin du bouton

unsigned char val=0;//Valeur unité
unsigned char vald=0;//Valeur dizaine

//Tableau dans lequel la température sera stocké
unsigned char temperature[1];
unsigned char * tempString;

void delay(unsigned int count){
    unsigned int i;
    for(i=0;i<count;i++){
    }
}


void showNumber(unsigned char valN){
        if(valN==0)      PORTB=ZERO;
        else if(valN==1) PORTB=UN;
        else if(valN==2) PORTB=DEUX;
        else if(valN==3) PORTB=TROIS;
        else if(valN==4) PORTB=QUATRE;
        else if(valN==5) PORTB=CINQ;
        else if(valN==6) PORTB=SIX;
        else if(valN==7) PORTB=SEPT;
        else if(valN==8) PORTB=HUIT;
        else if(valN==9) PORTB=NEUF;
        else             PORTB=ERR;
}

void showUnite(unsigned char valU){
    showNumber(valU);
    UNITE=1;
    delay(20);
    UNITE=0;
}

void showDizaine(unsigned char valD){
    showNumber(valD);
    DIZAINE=1;
    delay(20);
    DIZAINE=0;
}

void cercle(){
    //Cercle
    PORTB=0x40;
    delay(1000);
    PORTB=0x80;
    delay(1000);
    PORTB=0x08;
    delay(1000);
    PORTB=0x04;
    delay(1000);
    PORTB=0x02;
    delay(1000);
    PORTB=0x01;
    delay(1000);
    PORTB=0x00;

}

void compter(){
    unsigned int count = 2000;
    PORTB=ZERO;
    delay(count);
    PORTB=UN;
    delay(count);
    PORTB=DEUX;
    delay(count);
    PORTB=TROIS;
    delay(count);
    PORTB=QUATRE;
    delay(count);
    PORTB=CINQ;
    delay(count);
    PORTB=SIX;
    delay(count);
    PORTB=SEPT;
    delay(count);
    PORTB=HUIT;
    delay(count);
    PORTB=NEUF;
    delay(count);
    PORTB=0x00;
}

void i2c_LectureTemperature(){
    extern unsigned char temperature[1]; //récupération de la variable extern
    extern unsigned char * tempString;
    extern unsigned char val;
    extern unsigned char vald;

    i2c_WriteTo(TMP101);
    /* demande lecture capteur */
    if(i2c_SendAddress(TMP101_VALUE, 0)==TRUE){
        val=1;
        LED_ERROR=1;
    }
    /* lecture */
    temperature[0]=0x00;
    temperature[1]=0x00;
    
    i2c_ReadFrom(TMP101);
    int retour = i2c_GetString(tempString,2);
    if(retour==I2C_ERROR){
        vald=1;
        LED_ERROR=1;
    }
    //charge le premier octet
    temperature[0]=(unsigned char)tempString;
    tempString++;//Décale
    //charge le second octet
    temperature[1]=(unsigned char)tempString;

    /*int retour = i2c_ReadByte();
    if(retour==I2C_ERROR){
        vald=1;
        LED_ERROR=1;
    }else temperature[0]=retour;

    retour = i2c_ReadByte();
    if(retour==I2C_ERROR){
        vald=2;
        LED_ERROR=1;
    }else temperature[1]=retour;*/

}

int main(void) {
    //LATA = 0;
    LATB = 0x00;
    TRISA0 = 0b0; // port A0 en sortie
    TRISD = 0xFF; //port D en entrée
    TRISD2 = 0x0; //chiffre dizaine
    TRISD3 = 0x0; //chiffre unité

    TRISB = 0x00; //post B en sortie
    //OSCCON = 0x72; //8MHZ
    DIZAINE_POINT=0;
    
    //PORTA = 0x00; //port A éteind
    //PORTB7 = 0;
    ADON=0x0;
    ADCON1=7;

    //INIT I2C
    SCL_DIR = I2C_OUTPUT;
    SDA_DIR = I2C_OUTPUT;
    SDA = 0;
    SCL = 0;

    i2c_WriteTo(TMP101);
    /* conf du capteur */
    i2c_SendAddress(TMP101_CONFIG, 1);
    i2c_SendByte(0x64);


    /*unsigned char UN        = 0x88;
    unsigned char DEUX      = 0xD6;
    unsigned char TROIS     = 0xDC;
    unsigned char QUATRE    = 0x99;
    unsigned char CINQ      = 0x5D;
    unsigned char SIX       = 0x5F;
    unsigned char SEPT      = 0xC8;
    unsigned char HUIT      = 0xDF;
    unsigned char NEUF      = 0xDD;
    unsigned char ZERO      = 0xCF;*/

    LED_ERROR=1;
    //PORTB=0xFF;
    DIZAINE_POINT=1;
    delay(10000);
    PORTB=0x00;
    DIZAINE_POINT=0;

    DIZAINE=1;//active la dizaine et fait le cercle
    cercle();
    DIZAINE=0;
    
    UNITE=1;//active la dizaine et fait le cercle
    cercle();
    UNITE=0;
/*    
    RA0=1;
    lcd_init(EIGHTBIT_MODE);
    //RA0=0;
    lcd_data('H');
    lcd_data('e');
    lcd_data('l');
    lcd_data('l');
    lcd_data('o');
    lcd_data(' ');
    lcd_data('J');
    lcd_data('B');*/
    //RA0=0;
    LED_ERROR=1;
    DIZAINE=1; //active le chiffre des dizaines
    UNITE=1; //active le chiffre des unités
    compter();
    DIZAINE=0;
    UNITE=0;
    LED_ERROR=0;

    unsigned int i=0;
    unsigned int count = 2000;
    unsigned char VALLED=0;
    //importe les valeurs globale dans la fonction
    extern unsigned char val;
    extern unsigned char vald;
    extern unsigned char temperature[1];
    unsigned int temp=100;
    unsigned char tempH;
    unsigned char tempL;
    unsigned int dix;

    unsigned int bitShow=0;
    count = 1000;
    tempH=0xAA;
    for( ; ; ){

        //Unite
        showUnite(val);
        showDizaine(vald);
        
        
        if(i==count){
            i=0;
            if(VALLED==0){
                VALLED=1;
            }else{
                VALLED=0;
            }
            DIZAINE_POINT = VALLED;
            i2c_LectureTemperature();
            if(LED_ERROR==0){
                tempH=temperature[1];
                tempL=temperature[0];
                //temp<<8;
                //temp+=temperature[1];
                dix=0;
                if(tempH & 1<<7){ //Negatif (bit 7 = 1)
                    tempL = tempL ^ 0b11110000;
                    tempL += 16;
                    tempH = tempH ^ 0b11111111;
                    if(tempH==0) tempH++;
                }
                if(tempH>99) tempH=99;
                if(tempH>9){
                    dix=tempH/10;
                    tempH-=(dix*10);
                }

                //vald=dix;
                //val=tempH;

                //vald=temperature[0];
                //val=temperature[1];
            }
        }else{
            i++;
        }

        if(temp==100){
            val = (tempH & 1<<bitShow)? 1:0;
            vald= bitShow;

            if(bitShow==7) bitShow=0;
            else bitShow++;
            temp=0;
        }else temp++;

        if(BOUTON==0){
            //delay(1500);
            unsigned int j;
            for(j=0;j<15;j++){
                showUnite(val);
                showDizaine(vald);

                showUnite(val);
                showDizaine(vald);
            }
            if(val==9){
                val=0;
                if(vald==9){
                    val=0;
                    vald=0;
                }else
                vald++;

            }else
            val++;
        }
    }
    
    return 0;
}
