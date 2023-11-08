#include <iostream>
using namespace std;

int a1[12],
    a2[12],
    a3[12];
char einStr[]    = "Enter integer #";
char moStr[]     = "Max of ";
char ieStr[]     = " ints entered...";
char emiStr[]    = "Enter more ints? (n or N = no, others = yes) ";
char begA1Str[]  = "beginning a1: ";
char am1dA1Str[] = "a1 (dups<=1): ";
char procA1Str[] = "processed a1: ";
char procA2Str[] = "          a2: ";
char procA3Str[] = "          a3: ";
char dacStr[]    = "Do another case? (n or N = no, others = yes) ";
char dlStr[]     = "================================";
char byeStr[]    = "bye...";

int main()
{
            char reply;
            int used1,
                used2,
                used3,
                truncAvg,
                found,
                sum,
                *hopPtr1,
                *hopPtr11,
                *hopPtr2,
                *hopPtr3,
                *endPtr1,
                *endPtr11,
                *endPtr2,
                *endPtr3;

            reply = 'y';
            goto W1Test;
//while (reply != 'n' && reply != 'N')
W1Test:     //{
            if(reply != 'n' && reply != 'N') goto beginW1;
            goto endW1;
beginW1:    //{
            used1 = 0;
            hopPtr1 = a1;
            goto W2Test;

//while (reply != 'n' && reply != 'N')
W2Test:     if(reply != 'n' && reply != 'N') goto beginW2;
            goto endW2;

beginW2:    //{
            cout << einStr;
            cout << (used1 + 1);
            cout << ':' << ' ';
            cin >> *hopPtr1;
            ++used1;
            ++hopPtr1;
            goto I1;
                
///I1 = if (used1 < 12)
I1:         //{
            if(used1 >= 12) goto I1else;

            cout << emiStr;
            cin >> reply;
            goto endI1;
            //}
//I1 else
I1else:     //{
            cout << moStr << 12 << ieStr << endl;
            reply = 'n';
            //}
            goto endI1;
            //}
             
endI1:
            goto W2Test;
             
endW2:
            cout << begA1Str;
            goto I2;
//I2 = if (used1 > 0)
I2:         //{
            if(used1 <= 0) goto endI2;
            hopPtr1 = a1;
            endPtr1 = a1 + used1;
            goto beginDW1;
//DW1 do
beginDW1:   //{
            cout << *hopPtr1 << ' ' << ' ';
            ++hopPtr1;
            goto DW1Test;
            //{
//DW1Test = while (hopPtr1 < endPtr1);
DW1Test:
            if(hopPtr1 < endPtr1) goto beginDW1;
            goto endDW1;
endDW1:
            goto endI2;
            //{
endI2:
            cout << endl;
            goto I3;


             
//I3 = if (used1 > 1)
I3:         //{
            if(used1 <= 1) goto I3else;
            hopPtr1 = a1;
            endPtr1 = a1 + used1 - 1;
            goto W3Test;
//W3 = while (hopPtr1 < endPtr1)
W3Test:
            if(hopPtr1 < endPtr1) goto beginW3;
            goto endW3;
    
beginW3:    //{
            found = 0;
            endPtr2 = a1 + used1;
            
//F1 = for (hopPtr2 = hopPtr1 + 1; hopPtr2 < endPtr2; ++hopPtr2)
            hopPtr2 = hopPtr1 + 1;
            goto F1Test;
F1Test:
            if(hopPtr2 < endPtr2) goto beginF1;
            goto endF1;
beginF1:
            goto I4;
            //{
//I4 = if (*hopPtr2 == *hopPtr1)
I4:         //{
            if (*hopPtr2 != *hopPtr1) goto endI4;
            goto I5;
            //{
//I5 = if (found == 1)
    
I5:         //{
            if (found != 1) goto I5else;
            endPtr3 = a1 + used1;
                
//F2 = for (hopPtr3 = hopPtr2 + 1; hopPtr3 < endPtr3; ++hopPtr3)
            hopPtr3 = hopPtr2 + 1;
            goto F2Test;
F2Test:
            if(hopPtr3 < endPtr3) goto beginF2;
            goto endF2;
beginF2:    //{
            *(hopPtr3 - 1) = *hopPtr3;
            ++hopPtr3;
            goto F2Test;
            //}
endF2:
            --used1;
            --endPtr1;
            --endPtr2;
            --endPtr3;
            --hopPtr2;
            goto endI5;
            //}
//I5 else
I5else:     //{
            ++found;
            goto endI5;
            //}
            //}
endI5:
            goto endI4;
endI4:
            ++hopPtr2;
            goto F1Test;
            //}
endF1:
            ++hopPtr1;
            goto W3Test;
            //}
endW3:
            cout << am1dA1Str;
            goto I6;
                
//I6 = if (used1 > 0)
I6:         //{
            if (used1 <= 0) goto endI6;
            hopPtr1 = a1;
            endPtr1 = a1 + used1;
            goto beginDW2;
//DW2 do
beginDW2:   //{
            cout << *hopPtr1 << ' ' << ' ';
            ++hopPtr1;
            goto DW2Test;
            //}
//DW2 = while (hopPtr1 < endPtr1);
DW2Test:
            if(hopPtr2 < endPtr1) goto beginDW2;
            goto endDW2;
            //}
endDW2:
            goto endI6;
endI6:
            cout << endl;
            goto I7;

//I7 = if (used1 > 0)
I7:         //{
            if (used1 <= 0) goto endI7;
            sum = 0;
            hopPtr1 = a1 + used1 - 1;
            endPtr1 = a1;

            goto beginDW3;
//DW3 do
beginDW3:   //{
            sum += *hopPtr1;
            --hopPtr1;
            goto DW3Test;
            //}
//DW3 = while (hopPtr1 >= endPtr1);
DW3Test:
            if(hopPtr1 >= endPtr1) goto beginDW3;
            goto endDW3;
endDW3:
            truncAvg = sum / used1;
            used2 = 0;
            used3 = 0;
            hopPtr2 = a2;
            hopPtr3 = a3;
            endPtr1 = a1 + used1;

//F3 = for (hopPtr1 = a1; hopPtr1 < endPtr1; ++hopPtr1)
            hopPtr1 = a1;
            goto F3Test;
F3Test:
            if(hopPtr1 < endPtr1) goto beginF3;
            goto endF3;
beginF3:    //{
            goto I8;
            //I8 = if (*hopPtr1 != truncAvg)
I8:
            if (*hopPtr1 == truncAvg) goto endI8;
            goto I9;
            //{
//I9 = if (*hopPtr1 < truncAvg)
I9:         //{
            if (*hopPtr1 >= truncAvg) goto elseI9;
            *hopPtr2 = *hopPtr1;
            ++used2;
            ++hopPtr2;
            goto endI9;
            //}
//I9 else
elseI9:     //{
            *hopPtr3 = *hopPtr1;
            ++used3;
            ++hopPtr3;
            goto endI9;
            //}
endI9:
            endPtr11 = a1 + used1;

//F4 = for (hopPtr11 = hopPtr1 + 1; hopPtr11 < endPtr11; ++hopPtr11)
            hopPtr11 = hopPtr1 + 1;
            goto F4Test;
F4Test:
            if(hopPtr11 < endPtr11) goto beginF4;
            goto endF4;
beginF4:    //{
            *(hopPtr11 - 1) = *hopPtr11;
            ++hopPtr11;
            goto F4Test;
            //}
endF4:
            --used1;
            --endPtr1;
            --hopPtr1;
            goto endI8;
            //}
endI8:
            ++hopPtr1;
            goto F3Test;
            //}

endF3:
            goto I10;
                
                
//I10 = if (used1 == 0)
I10:        //{
            if (used1 != 0) goto endI10;
            *(a1+ 0) = truncAvg;
            ++used1;
            goto endI10;
            //}
endI10:
            goto endI7;
endI7:
            goto I3else;
                     //}
                  //}
//I3else
I3else:     //{
            hopPtr1 = a1;
            cout << am1dA1Str;
            cout << *hopPtr1;
            cout << endl;
            used2 = 0;
            used3 = 0;
            goto endI3;
            //}
endI3:
            cout << procA1Str;
            goto I11;
//I11 = if (used1 > 0)
I11:        //{
            if (used1 <= 0) goto endI11;
            hopPtr1 = a1;
            endPtr1 = a1 + used1;
            goto beginDW4;

//DW4 do
beginDW4:   //{
            cout << *hopPtr1 << ' ' << ' ';
            ++hopPtr1;
            goto DW4Test;
            //}
//DW4 = while (hopPtr1 < endPtr1);
DW4Test:
            if(hopPtr1 < endPtr1) goto beginDW4;
            goto endDW4;
endDW4:
            goto endI11;
            //}
endI11:
            cout << endl;
            cout << procA2Str;
            goto I12;

//I12 = if (used2 > 0)
I12:        //{
            if (used2 <= 0) goto endI12;
            hopPtr2 = a2;
            endPtr2 = a2 + used2;
            goto beginDW5;
//DW5 do
beginDW5:   //{
            cout << *hopPtr2 << ' ' << ' ';
            ++hopPtr2;
            goto DW5Test;
            //}
//DW5 = while (hopPtr2 < endPtr2);
DW5Test:
            if(hopPtr2 < endPtr2) goto beginDW5;
            goto endDw5;
            //}
endDw5:
                goto endI12;
endI12:
            cout << endl;
            cout << procA3Str;
            goto I13;
            
                
                
//I13 = if (used3 > 0)
I13:        //{
            if (used3 <= 0) goto endI13;
            hopPtr3 = a3;
            endPtr3 = a3 + used3;
            goto beginDW6;

//DW6 do
beginDW6:   //{
            cout << *hopPtr3 << ' ' << ' ';
            ++hopPtr3;
            goto DW6Test;
            //}
//DW6 = while (hopPtr3 < endPtr3);
DW6Test:
            if (hopPtr3 < endPtr3) goto beginDW6;
            goto endDW6;
endDW6:
            goto endI13;
            //}
endI13:
            cout << endl;

            cout << dacStr;
            cin >> reply;

            goto W1Test;
            //}
endW1:
            cout << dlStr << '\n';
            cout << byeStr << '\n';
            cout << dlStr << '\n';

            return 0;
}
