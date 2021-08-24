#include <stdio.h>
// SOLUTION FILE

main()
{
  int var_int;                    // 2

  unsigned char uchar1, uchar2;   // 3
  signed char schar1, schar2;

  int x, y;                       // 4

  char i;                         // 5
  char shift_char;

  int a[10] = {0,10,20,30,40,50,60,70,80,90};    // 6

  int b[10], c[10];               // 7
  int *ip, *ip2;
  int j, k;

  char AString[] = "HAL";           // 8

  // 1 -- change "World" to your name
  printf("\n\n PART 1 ---------\n");

  printf("\n Hello Alex! \n");

  // 2 -- find sizes of the other C datatypes
  float f;
  long l;

  printf("\n\n PART 2 ----------\n");

  printf("\n size of data type int = %d ", sizeof(var_int));

  printf("\n size of data type unsigned char = %d ", sizeof(uchar1));

  printf("\n size of data type signed char = %d ", sizeof(schar1));

  printf("\n size of data type char = %d ", sizeof(i));

  printf("\n size of data type float = %d ", sizeof(f));

  printf("\n size of data type long = %d ", sizeof(l));

  // 3 -- explore signed versus unsigned datatypes and their interactions
  printf("\n\n PART 3 ----------\n");

  uchar1 = 0xFF;
  uchar2 = 0xFE;
  schar1 = 0xFF;
  schar2 = 0xFE;

  printf("\n uchar1 = %d ", uchar1);
  printf("\n schar1 = %d ", schar1);
  printf("\n uchar2 = %d ", uchar2);
  printf("\n schar2 = %d ", schar2);

  printf("\n\n Comparing uchar1 to uchar2:");
  if (uchar1 > uchar2) {
    printf("\n uchar1 is larger with value: %d", uchar1);
  } else {
    printf("\n uchar2 is larger with value: %d", uchar2);
  }

  printf("\n\n Comparing schar1 to schar2:");
  if (schar1 > schar2) {
    printf("\n schar1 is larger with value: %d", schar1);
  } else {
    printf("\n schar2 is larger with value: %d", schar2);
  }

  printf("\n\n Comparing schar1 to uchar1:");
  if (schar1 > uchar1) {
    printf("\n schar1 is larger with value: %d", schar1);
  } else {
    printf("\n uchar1 is larger with value: %d", schar2);
  }

  printf("\n\n schar1 + schar2 = %d", schar1 + schar2);

  printf("\n\n uchar1 + uchar2 = %d", uchar1 + uchar2);

  printf("\n\n schar1 + uchar1 = %d", schar1 + uchar1);

  // 4 -- Booleans
  printf("\n\n PART 4 ----------\n");

  x = 1; y = 2;

  printf("\n True: %d", x < y);

  printf("\n\n False: %d", x > y);

  printf("\n\n Size of boolean: %d", sizeof(x < y));

  printf("\n\n x & y = %d", x & y);

  printf("\n\n x && y = %d", x && y);

  printf("\n\n !x = %d", !x);

  printf("\n\n ~x = %d", ~x);

  // 5 -- shifts
  printf("\n\n PART 5 ----------\n");

  shift_char = 15;
  i = 9;

  char temp_shift = shift_char << i;
  printf("\n shift_char << %d = %d", i, temp_shift);

  temp_shift = shift_char >> i;
  printf("\n shift_char >> %d = %d", i, temp_shift);

  // 6 -- pointer basics
  printf("\n\n PART 6 ----------\n");

  ip = a;
  printf("\nstart %d %d %d %d %d %d %d \n",
	 a[1], *(ip+1), *(ip+2), *(ip+1), *(ip+2), *(ip+5), *(ip+1));

  printf("Size of ip is: %d", sizeof(ip));

  printf("\n ip = %x", ip);
  printf("\n ip+1 = %x", ip+1);


  // 7 -- programming with pointers
  printf("\n\n PART 7 ----------\n");

  printf("Reversing array a into array b using conventional array indexing: \n");
  int index = 0;
  for (int i = 9; i >= 0; i--) {
    b[index] = a[i];
    index++;
  }

  for (int i = 0; i < 10; i++) {
    printf("b[%d] = %d \n", i, b[i]);
  }

  printf("Reversing array a (ip) into array c (ip2) using pointers: \n");
  ip = a + 10;
  ip2 = c;
  for (int i = 9; i >= 0; i--) {
    ip--;
    *ip2 = *ip;
    ip2++;
  }

  for (int i = 0; i < 10; i++) {
    printf("c[%d] = %d \n", i, c[i]);
  }

  // 8 -- strings
  printf("\n\n PART 8 ----------\n");

  printf("\n %s \n", AString);

  printf("ASCII values: \n");
  for (int i = 0; i < 3; i++) {
    printf("ASCII value of %c = %d \n", AString[i], AString[i]);
  }

  printf("\n The value of the byte after the last character = %c (NULL) and has ASCII value %d \n", AString[3], AString[3]);
  printf("The following are values and ASCII values of each index + 1: \n");
  for (int i = 0; i < 3; i++) {
    printf("ASCII value of %c = %d \n", AString[i] + 1, AString[i] + 1);
  }

  printf("\n Adding 60 to the byte following the last character and printing the entire string: \n");
  AString[3] = AString[3] + 60;

  printf("\n %s \n", AString);

  // 9 -- address calculation
  printf("\n\n PART 9 ----------\n");
  ip = b;
  for (k = 0; k < 10; k++) {
    b[k] = a[k];         // direct reference to array element
    printf("The address of b[%d] is %x \n", k, ip);
    ip++;
  }

  printf("\n\n");

  ip = a;
  ip2 = b;
  for (k = 0; k < 10; k++) {
    printf("The address of b[%d] is %x \n", k, ip2);
    *ip2++ = *ip++;     // indirect reference to array element
  }

  // all done
  printf("\n\n ALL DONE\n");
}
