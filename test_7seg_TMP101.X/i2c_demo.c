/* I2C test program that writes & reads data to an I2C EEPROM device. */

#include <pic18.h>
#include "delay.h"
#include "i2c.h"

#define ROM 0xA0        /* I2C EEPROM */

void flashled(void) {           /* flash a led on RB0 */
	while(1) {
            RB0 = 1;
            DelayMs(200);
            RB0 = 0;
            DelayMs(200);
	}
}


void WriteByte(unsigned char addr, unsigned char byte) {
	i2c_WriteTo(ROM);
	if (i2c_PutByte(addr)==I2C_ERROR)
            flashled();
	if (i2c_PutByte(byte)==I2C_ERROR)
            flashled();
}

int ReadByte(unsigned char addr) {
	i2c_WriteTo(ROM);
	if (i2c_PutByte(addr)==I2C_ERROR)
            flashled();
        i2c_ReadFrom(ROM);
	return i2c_GetByte(I2C_LAST);
}

void main(void) {
unsigned char count,val;

TRISB=0;        /* use a led on RB0 - set as output */
PORTB=0;
RB0=0;

/* initialize i2c */
#ifdef I2C_MODULE
    SSPMode(MASTER_MODE);
    SSPEN = 1;
    CKP = 1;
#else
    SCL_DIR = I2C_OUTPUT;
    SDA_DIR = I2C_OUTPUT;
    SDA = 0;
    SCL = 0;
#endif


while(1) {
    for(count=0; count < 10; ++count) {
        WriteByte(count,count);           /* write to I2C EEPROM */
        val = ReadByte(count);            /* read back value */
        if (val != count)                 /* verify */
            flashled();
    }
    DelayMs(200);
}
}


