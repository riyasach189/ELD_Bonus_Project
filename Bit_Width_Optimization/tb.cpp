#include <stdio.h>
#include "ap_int.h"
#define N 11

typedef int coef_t;
typedef int data_t;
typedef int acc_t;
typedef int iterator;

void fir(acc_t *output, data_t input);
void fir_sw(acc_t *output, data_t input);

int main()
{
	//Input initialization
	data_t input = 5;
	acc_t output_sw, output_hw;

	//Call to hardware function
	fir(&output_hw, input);

	//Call to software function
	fir_sw(&output_sw, input);

	if (output_hw == output_sw)
	{
		printf("Output: %d\n", (int)output_hw);
	}

	else
	{
		printf("Data mismatch!\n");
		printf("HW: %d\n", output_hw);
		printf("SW: %d\n", output_sw);
		return 1;
	}

	return 0;
}

void fir_sw(acc_t *output, data_t input)
{
    coef_t c[N/2 + 1] = {53, 0, -91, 0, 313, 500}; // Symmetric coefficients

    static data_t shift_reg[N/2 + 1];
    acc_t acc = 0;

    for (iterator i = (iterator)N/2; i > 0; i--)
    {
		shift_reg[i] = shift_reg[i - 1];
		acc += shift_reg[i] * c[i];
    }

    acc += input * c[0];
    shift_reg[0] = input;

    *output = acc;
}

