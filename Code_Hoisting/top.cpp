#include "ap_int.h"
#include "top.h"
#define N 11

typedef int coef_t;
typedef int data_t;
typedef int acc_t;

void fir(data_t *output, data_t input)
{
    coef_t c[N/2 + 1] = {53, 0, -91, 0, 313, 500}; // Symmetric coefficients

    static data_t shift_reg[N/2 + 1];
    acc_t acc = 0;

    for (int i = N/2; i > 0; i--)
    {
		shift_reg[i] = shift_reg[i - 1];
		acc += shift_reg[i] * c[i];
    }

    acc += input * c[0];
    shift_reg[0] = input;

    *output = acc;
}
