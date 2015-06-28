/**

******************************************************************************

* @file    LED Hello World

* @author  Lee Dyche - Tecsploit.com

* @version V1.0.0

* @date    11/11/2012

* @brief   LED Blinks on and off

******************************************************************************

* @attention

* This is program is provided as is with no warranty!!

******************************************************************************

*/

#include <stm32f4xx_gpio.h>
#include <stm32f4_discovery.h>

void Delay(__IO uint32_t nCount);

int main(void)
{

    STM_EVAL_LEDInit(LED5);
    while (1)
    {
//Turn on led
        STM_EVAL_LEDOn(LED5);
        Delay(2194303);
        STM_EVAL_LEDOff(LED5);
        Delay(2194303);
    }
}

void Delay(__IO uint32_t nCount)
{

    while(nCount--)
    {

    }

}
