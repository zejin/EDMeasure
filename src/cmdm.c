#include <R.h>
#include <Rmath.h>
#include <string.h>

////////////////////////////////////////////////////////////////////////////////////////////////////
///// declarations
////////////////////////////////////////////////////////////////////////////////////////////////////

/* cmdm_functions.c */
extern void UCenter_X(int n, int p, double *X, double *XX);
extern void DCenter_X(int n, int p, double *X, double *XX);
extern void UCenter_Y(int n, int q, double *Y, double *YY);
extern void DCenter_Y(int n, int q, double *Y, double *YY);
extern double inner_UCenter(int n, double *XX, double *YY);
extern double inner_DCenter(int n, double *XX, double *YY);
extern double inner_UCenter_boot(int n, double *W, double *M);
extern double inner_DCenter_boot(int n, double *W, double *M);

/* MDD */
void MDD_UCenter(int *N, int *P, int *Q, double *X, double *Y, double *V);
void MDD_DCenter(int *N, int *P, int *Q, double *X, double *Y, double *V);

void MDD_UCenter_boot(int *N, double *W, double *M, double *V);
void MDD_DCenter_boot(int *N, double *W, double *M, double *V);

////////////////////////////////////////////////////////////////////////////////////////////////////
///// conditional mean dependence measures
////////////////////////////////////////////////////////////////////////////////////////////////////

void MDD_UCenter(int *N, int *P, int *Q, double *X, double *Y, double *V) {
  int n = N[0];
  int p = P[0];
  int q = Q[0];

  double XX[n * n];
  memset(XX, 0, n * n * sizeof(double));

  double YY[n * n];
  memset(YY, 0, n * n * sizeof(double));

  UCenter_X(n, p, X, XX);
  UCenter_Y(n, q, Y, YY);

  V[0] = inner_UCenter(n, XX, YY);
}

void MDD_DCenter(int *N, int *P, int *Q, double *X, double *Y, double *V) {
  int n = N[0];
  int p = P[0];
  int q = Q[0];

  double XX[n * n];
  memset(XX, 0, n * n * sizeof(double));

  double YY[n * n];
  memset(YY, 0, n * n * sizeof(double));

  DCenter_X(n, p, X, XX);
  DCenter_Y(n, q, Y, YY);

  V[0] = inner_DCenter(n, XX, YY);
}

void MDD_UCenter_boot(int *N, double *W, double *M, double *V) {
  int n = N[0];

  V[0] = inner_UCenter_boot(n, W, M);
}

void MDD_DCenter_boot(int *N, double *W, double *M, double *V) {
  int n = N[0];
  
  V[0] = inner_DCenter_boot(n, W, M);
}




