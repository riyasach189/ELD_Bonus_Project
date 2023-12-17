#include <stdio.h>
#include "ap_int.h"

#define N 11

typedef int coef_t;
typedef int data_t;
typedef int acc_t;

void fir(data_t *output, data_t input);
void fir_sw(data_t *output, data_t input);

int main()
{
	//Input initialization
	data_t input = 5;
	data_t output_sw, output_hw;

	//Call to hardware function
	fir(&output_hw, input);

	//Call to software function
	fir_sw(&output_sw, input);

	if (output_hw == output_sw)
	{
		printf("Output: %d\n", output_hw);
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

void fir_sw(data_t *output, data_t input)
{
	coef_t c[N] = {53, 0, -91, 0, 313, 500, 313, 0, -91, 0, 53};
	static data_t shift_reg[N];
	acc_t acc = 0;

	Shift_Accum_Loop:
	for (int i = N - 1; i >= 0; i--)
	{
		if (i == 0)
		{
			acc += input * c[0];
			shift_reg[0] = input;
		}

		else
		{
			shift_reg[i] = shift_reg[i - 1];
			acc += shift_reg[i] * c[i];
		}
	}

	*output = acc;
}

