#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <limits.h>

int m;
int t;
int n;
int k;
int d_min;


FILE *fp = NULL;


char * int2bin(int i)
{
    size_t bits = sizeof(int) * CHAR_BIT;

    char * str = malloc(bits + 1);
    if(!str) return NULL;
    str[bits] = 0;

    // type punning because signed shift is implementation-defined
    unsigned u = *(unsigned *)&i;
    for(; bits--; u >>= 1)
    	str[bits] = u & 1 ? '1' : '0';

    return str;
}


int calculate_n_k(void)
{
	printf("m = %i\n",m);
	printf("t = %i\n",t);
	n = (int) pow(2,(double)m)-1;
	printf("n = %i\n",n);
	k = n-(m*t);
	printf("k = %i\n",k);
	d_min = 2*t+1;
	printf("d_min = %i\n",d_min);
}

int error_creation(void)
{

	int isone[t];
	int i;
	int j;
	int l;
	char n_array[n+2];
	char filename[] = "error.txt";
	fp = fopen(filename, "w"); /* open file for reading */

	if(fp == NULL) /* ALWAYS CHECK RETURN VALUE !!! */
	{
		printf("Failed to open file for writing\n");
		return -1;
	}
	

	
	for(i = 1;i<100000; i++)
	{
		for (l = 0;l<n;l++)
		{
			n_array[l] = '0';
		}

		n_array[n] = '\n';
		n_array[n+1] = '\0';
		
		for(j = 1;j<=t;j++)

		{
			while(1){
				isone[j] = rand() % n;
				if (j == 1) {
					break;
				}
			}
			n_array[isone[j]] = '1';
			
		}
		fputs(n_array, fp); /* write a string to file */
	}
	fclose(fp); /* close file */
}

int in_creation(void)
{

	int random_value;
	int i;
	int l;
	char random_char[n+2];
	char filename[] = "in.txt";
	fp = fopen(filename, "w"); /* open file for reading */

	if(fp == NULL) /* ALWAYS CHECK RETURN VALUE !!! */
	{
		printf("Failed to open file for writing\n");
		return -1;
	}
	

	
	for(i = 1;i<100000; i++)
	{
		
		for (l = 0;l<n;l++)
		{
			random_value = rand() %2;
			if(random_value == 0)
			{
				random_char[l] = '0';
			}
			else
			{
				random_char[l] = '1';
			}
		}
		
		random_char[n] = '\n';
		random_char[n+1] = '\0';
		fputs(random_char, fp); /* write a string to file */
	}
	fclose(fp); /* close file */
}

int main(int argc, char *argv[])
{

	if(argc < 3)
    	{ 
        	printf("Enter two valid integers. (t m)\n"); 
        	return 0;
    	}
	m = atoi(argv[1]);
	t = atoi(argv[2]);
	





	
	calculate_n_k();
	error_creation();
	in_creation();
//	puts(test);




	return 0;
}
