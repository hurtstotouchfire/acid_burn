#include <stdio.h>
int main(void) {

//int mystical_number = 13;
//int *ptr = &mystical_number;

//*ptr = 19;

//char series_name[] = "The Dark Tower";

//printf("The fiction's mystical number is %i, in the series %s", *ptr, series_name);

//char *string = "Hello, world!";
// or string = "H..." afterwards
//printf("Herp derp string is %s", string);

//if (printf("1234") == 4) {
//printf("Great lulz have been located"); 
// }

char date[] = "20100220",*ptr = &date[0];
char year[5] = "YYYY";
char month[3] = "MM";
char day[3] = "DD"; // index can be thought of as "offest"

int i = 0;
//year[0] = *ptr;
//year[1] = *(ptr+1);

for (i=0; i < 4; i++) {
year[i] = *(ptr + i);
}

for(i=0; i < 2; i++) {
month[i] = *(ptr+5+i);
day[i]= *(ptr+7+i);
}

printf("The year is %s, the month is %s, the day is %s.", year, month, day);

char bewbz[7] = "abcdef", *ptr2 =&bewbz[0];
int j = 0;
for (j=0; j<8; j+=2) {
bewbz[j]=*(ptr+j);
}
printf("%s", bewbz);


return 0;

}
