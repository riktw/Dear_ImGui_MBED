#include "mbed.h"
#include "MODSERIAL.h"
#define MESSAGE_BUFFER_SIZE 32
MODSERIAL pc(USBTX, USBRX); // tx, rx
DigitalOut led1(p22);
DigitalOut led2(p23);
DigitalOut led3(p24);
DigitalOut led4(p25);
DigitalOut led5(p26);
DigitalOut led6(p27);
DigitalOut led7(p28);
DigitalOut led8(p29);
DigitalIn  dips1(p5);
DigitalIn  dips2(p6);
DigitalIn  dips3(p7);
DigitalIn  dips4(p8);
DigitalIn  dips5(p11);
DigitalIn  dips6(p12);
DigitalIn  dips7(p13);
DigitalIn  dips8(p14);
AnalogOut aout(p18);
AnalogIn   ain1(p16);
AnalogIn   ain2(p17);
Ticker adctimer;
Ticker iotimer;

volatile bool messageReceived = false;
char messageBufferIncoming[MESSAGE_BUFFER_SIZE];
char messageBufferOutgoing[MESSAGE_BUFFER_SIZE];

void messageReceive(MODSERIAL_IRQ_INFO *q) 
{
    MODSERIAL *sys = q->serial;
    sys->move(messageBufferIncoming, MESSAGE_BUFFER_SIZE);
    messageReceived = true;
}

void adcread()
{
    uint16_t adc1, adc2;
    adc1 = ain1.read_u16();
    adc2 = ain2.read_u16();
    sprintf(messageBufferOutgoing,"A%02u%02u\n",adc1/656,adc2/656);
    pc.puts(messageBufferOutgoing);
}

void ioread()
{
    messageBufferOutgoing[0] = 'I';
    messageBufferOutgoing[1] = dips1 + 48;
    messageBufferOutgoing[2] = dips2 + 48;
    messageBufferOutgoing[3] = dips3 + 48;
    messageBufferOutgoing[4] = dips4 + 48;
    messageBufferOutgoing[5] = dips5 + 48;
    messageBufferOutgoing[6] = dips6 + 48;
    messageBufferOutgoing[7] = dips7 + 48;
    messageBufferOutgoing[8] = dips8 + 48;
    messageBufferOutgoing[9] = '\n';
    messageBufferOutgoing[10] = NULL;
    pc.puts(messageBufferOutgoing);

}

int main() 
{
    pc.baud(115200);
    pc.attach(&messageReceive, MODSERIAL::RxAutoDetect);
    pc.autoDetectChar('\n');
    
    dips1.mode(PullUp);
    dips2.mode(PullUp);
    dips3.mode(PullUp);
    dips4.mode(PullUp);
    dips5.mode(PullUp);
    dips6.mode(PullUp);
    dips7.mode(PullUp);
    dips8.mode(PullUp);
    
    adctimer.attach(&adcread, 0.025);
    iotimer.attach(&ioread, 0.25);
     
    while(1) 
    {
        while(messageReceived)
        {
            if(messageBufferIncoming[0] == 'L')
            {
                led1 = messageBufferIncoming[1] - 48;
                led2 = messageBufferIncoming[2] - 48;
                led3 = messageBufferIncoming[3] - 48;
                led4 = messageBufferIncoming[4] - 48;
                led5 = messageBufferIncoming[5] - 48;
                led6 = messageBufferIncoming[6] - 48;
                led7 = messageBufferIncoming[7] - 48;
                led8 = messageBufferIncoming[8] - 48;
            }
            else if(messageBufferIncoming[0] == 'D')
            {
                float dacval = (float)(messageBufferIncoming[3] - 48)/10.0;
                dacval += (float)(messageBufferIncoming[4] - 48)/100.0;
                aout = dacval;
            }
            messageReceived = false;
        }    
    }
}
 
