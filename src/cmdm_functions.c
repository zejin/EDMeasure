#include <string.h>
#include <math.h>

////////////////////////////////////////////////////////////////////////////////////////////////////
///// declarations
////////////////////////////////////////////////////////////////////////////////////////////////////

void UCenter_X(int n, int p, double *X, double *XX);
void DCenter_X(int n, int p, double *X, double *XX);
void UCenter_Y(int n, int q, double *Y, double *YY);
void DCenter_Y(int n, int q, double *Y, double *YY);
double inner_UCenter(int n, double *XX, double *YY);
double inner_DCenter(int n, double *XX, double *YY);
double inner_UCenter_boot(int n, double *W, double *M);
double inner_DCenter_boot(int n, double *W, double *M);

////////////////////////////////////////////////////////////////////////////////////////////////////
///// functions
////////////////////////////////////////////////////////////////////////////////////////////////////

void UCenter_X(int n, int p, double *X, double *XX) {
  double row_sum[n];
  memset(row_sum, 0, n * sizeof(double));

  double col_sum[n];
  memset(col_sum, 0, n * sizeof(double));

  double total_sum = 0;
  double a;
  double temp;

  int i;
  int j;
  int k;

  for (j = 0; j < n; ++j) {
    for (i = 0; i < n; ++i) {
      if (i != j) {
        a = 0;

        // XX[i, j] = |X[i, ] - X[j, ]|
        for (k = 0; k < p; ++k) {
          temp = X[i + k * n] - X[j + k * n];
          a += temp * temp;
        }

        a = sqrt(a);

        XX[i + j * n] = a;
        row_sum[i] += a;
        col_sum[j] += a;
        total_sum += a;
      }
    }
  }

  for (j = 0; j < n; ++j) {
    for (i = 0; i < n; ++i) {
      // diag(XX) = 0
      if (i != j) {
        XX[i + j * n] = XX[i + j * n] - row_sum[i] / (n - 2) - col_sum[j] / (n - 2) + total_sum / (n - 1) / (n - 2);
      }
    }
  }

}

void DCenter_X(int n, int p, double *X, double *XX) {
  double row_sum[n];
  memset(row_sum, 0, n * sizeof(double));

  double col_sum[n];
  memset(col_sum, 0, n * sizeof(double));

  double total_sum = 0;
  double a;
  double temp;

  int i;
  int j;
  int k;

  for (j = 0; j < n; ++j) {
    for (i = 0; i < n; ++i) {
      if (i != j) {
        a = 0;

        // XX[i, j] = |X[i, ] - X[j, ]|
        for (k = 0; k < p; ++k) {
          temp = X[i + k * n] - X[j + k * n];
          a += temp * temp;
        }

        a = sqrt(a);

        XX[i + j * n] = a;
        row_sum[i] += a;
        col_sum[j] += a;
        total_sum += a;
      }
    }
  }

  for (j = 0; j < n; ++j) {
    for (i = 0; i < n; ++i) {
      XX[i + j * n] = XX[i + j * n] - row_sum[i] / n - col_sum[j] / n + total_sum / n / n;
    }
  }

}

void UCenter_Y(int n, int q, double *Y, double *YY) {
  double row_sum[n];
  memset(row_sum, 0, n * sizeof(double));

  double col_sum[n];
  memset(col_sum, 0, n * sizeof(double));

  double total_sum = 0;
  double b;
  double temp;

  int i;
  int j;
  int k;

  for (j = 0; j < n; ++j) {
    for (i = 0; i < n; ++i) {
      if (i != j) {
        b = 0;

        // YY[i, j] = 0.5 * |Y[i, ] - Y[j, ]|^2 or YY[i, j] = -Y[i, ]^T * Y[j, ]
        for (k = 0; k < q; ++k) {
          temp = Y[i + k * n] - Y[j + k * n];
          b += temp * temp;
        }

        b = 0.5 * b;

        YY[i + j * n] = b;
        row_sum[i] += b;
        col_sum[j] += b;
        total_sum += b;
      }
    }
  }

  for (j = 0; j < n; ++j) {
    for (i = 0; i < n; ++i) {
      // diag(YY) = 0
      if (i != j) {
        YY[i + j * n] = YY[i + j * n] - row_sum[i] / (n - 2) - col_sum[j] / (n - 2) + total_sum / (n - 1) / (n - 2);
      }
    }
  }

}

void DCenter_Y(int n, int q, double *Y, double *YY) {
  double row_sum[n];
  memset(row_sum, 0, n * sizeof(double));

  double col_sum[n];
  memset(col_sum, 0, n * sizeof(double));

  double total_sum = 0;
  double b;
  double temp;

  int i;
  int j;
  int k;

  for (j = 0; j < n; ++j) {
    for (i = 0; i < n; ++i) {
      if (i != j) {
        b = 0;

        // YY[i, j] = 0.5 * |Y[i, ] - Y[j, ]|^2 or YY[i, j] = -Y[i, ]^T * Y[j, ]
        for (k = 0; k < q; ++k) {
          temp = Y[i + k * n] - Y[j + k * n];
          b += temp * temp;
        }

        b = 0.5 * b;

        YY[i + j * n] = b;
        row_sum[i] += b;
        col_sum[j] += b;
        total_sum += b;
      }
    }
  }

  for (j = 0; j < n; ++j) {
    for (i = 0; i < n; ++i) {
      YY[i + j * n] = YY[i + j * n] - row_sum[i] / n - col_sum[j] / n + total_sum / n / n;
    }
  }

}

/*double inner_UCenter(int n, double *XX, double *YY, double *M) {
  double sum = 0;
  double temp;

  int i;
  int j;

  for (j = 0; j < n; ++j) {
    for (i = 0; i < n; ++i) {
      // diag(M) = 0
      if (i != j) {
        // M[i, j] = XX[i, j] * YY[i, j]
        temp = XX[i + j * n] * YY[i + j * n];
        M[i + j * n] = temp;
        sum += temp;
      }
    }
  }

  return sum / n / (n - 3);
}*/

double inner_UCenter(int n, double *XX, double *YY) {
  double sum = 0;
  double temp;

  int i;
  int j;

  for (j = 0; j < n; ++j) {
    for (i = 0; i < n; ++i) {
      // diag(M) = 0
      if (i != j) {
        // M[i, j] = XX[i, j] * YY[i, j]
        temp = XX[i + j * n] * YY[i + j * n];
        // M[i + j * n] = temp;
        sum += temp;
      }
    }
  }

  return sum / n / (n - 3);
}

double inner_DCenter(int n, double *XX, double *YY) {
  double sum = 0;
  double temp;

  int i;
  int j;

  for (j = 0; j < n; ++j) {
    for (i = 0; i < n; ++i) {
      // M[i, j] = XX[i, j] * YY[i, j]
      temp = XX[i + j * n] * YY[i + j * n];
      // M[i + j * n] = temp;
      sum += temp;
    }
  }

  return sum / n / n;
}

double inner_UCenter_boot(int n, double *W, double *M) {
  double sum = 0;

  int i;
  int j;

  for (j = 0; j < n; ++j) {
    for (i = 0; i < n; ++i) {
      // diag(M) = 0
      if (i != j) {
        // W[i] * M[i, j] * W[j]
        sum += W[i] * M[i + j * n] * W[j];
      }
    }
  }

  return sum / n / (n - 3);
}

double inner_DCenter_boot(int n, double *W, double *M) {
  double sum = 0;

  int i;
  int j;

  for (j = 0; j < n; ++j) {
    for (i = 0; i < n; ++i) {
      // W[i] * M[i, j] * W[j]
      sum += W[i] * M[i + j * n] * W[j];
    }
  }

  return sum / n / n;
}
