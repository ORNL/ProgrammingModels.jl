

#include <math.h>
#include <stdio.h>

int main() {

  const int n = 1000000000;
  double total = 0.;
  int i;

#pragma acc parallel loop copy(total) copyin(n) reduction(+ : total)
  for (i = 0; i < n; ++i) {
    total += exp(sin(M_PI * (double)i / 12345.6789));
  }
  printf("Total is: %f\n", total);
}