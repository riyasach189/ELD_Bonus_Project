#include "ap_int.h"
#include "fir_symmetry_optim.h"

typedef int coef_t;
typedef int data_t;
typedef int acc_t;

void fir(data_t *output, data_t input)
{
    coef_t c[N/2 + 1] = {53, 0, -91, 0, 313, 500}; // Symmetric coefficients

    static data_t shift_reg[N/2 + 1];
    acc_t acc = 0;

    Shift_Accum_Loop:
	for (int i = N/2; i >= 0; i--)
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
