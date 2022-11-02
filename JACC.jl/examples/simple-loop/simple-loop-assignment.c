

#include <math.h>
#include <stdio.h>
#include <stdlib.h>

int main() {

  const int n = 10;
  double *vec = (double *)malloc(sizeof(double) * n);
  int i;

#pragma acc parallel loop copy(vec [0:n])
  for (i = 0; i < n; ++i) {
    vec[i] = (double)i;
  }

  printf("Assignment done\n");
  for (i = 0; i < n; ++i) {
    printf("%f ", vec[i]);
  }
  printf("\n");
  free(vec);
}