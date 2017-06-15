#include <stdio.h>
int divs(int a,int b){
	int c;
	if(b!=0){
		c = a/b;
		return c;
	}else{
		printf("Não é possivel realizar operação, divisão por 0\n");
		return 0;
	}
}
