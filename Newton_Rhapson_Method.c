#include<stdio.h>
#include<math.h>
#define eps 0.0000001

double f(double x) { 
    return 3*x*x*x*x*x-3*x*x*x*x+5*x*x*x-9*x*x+x+1;
}                                 //function
double df(double x) {
    return 15*x*x*x*x-12*x*x*x+15*x*x-18*x+1;
}                                //derivative of the function

double solve(double *x1)        
{
    double x0;
    double f1;
    int i = 0;
    for(i=0; i<100000; i++) {
        x0 = *x1;
        *x1 = x0 - f(x0)/df(x0);            //approximation (formula taken from Newton-Raphson method)
        f1 = f(*x1); 
    }
    while(fabs(x0-(*x1))>eps && i<100000);   // until the ephsilon point is not reached

    return i;
}
int main()
{
    printf("Real root of the polynomial 3x^5-3x^4+5x^3-9x^2+x+1 are: -0.2637626158, 1.26376261582597, 0.4533976515164038\n");   //indicating roots 
    printf("\n");
    double x;
    int a, b;
    int Itr;
     // should indicate random intervals and make loops
    // interval 1 = [-20, 0]
    a = -20;
    b = 0;
    printf("Root in the interval [%d,%d] equals -0.2637626158\n\n", a, b);
    for (int i=1; i<=10; i++) {
    x = rand() % (b - a + 1) + a;
    printf("Initial guess = %-10lf   ", x);
    Itr = solve(&x);
    printf("iteration = %2d   ", Itr);
    printf("root = %2lf\n", x);
    printf("\n");
    }

    printf("\n\n");
     
    
    // interval 2 = [0, 1]
    a = 0;
    b = 1;
    printf("Root in the interval [%d,%d] equals 1.26376261582597\n\n", a, b);
    for (int i=1; i<=10; i++)
    {
    x = (rand() % (10*b-10*a+1) + 10*a)*0.1;
    printf("Initial guess = %-10lf   ", x);
    Itr = solve(&x);
    printf("iteration = %2d   ", Itr);
    printf("root = %2lf\n", x);
    printf("\n");
    }
     printf("\n\n");  
    
    // interval 3 = [1, 20]
    a = 1;
    b = 20;
    printf("Root in the interval [%d,%d] equals 0.4533976515164038\n\n", a, b);
    for (int i=1; i<=10; i++)
    {
    x = rand() % (b - a + 1) + a;
    printf("Initial guess = %-10lf   ", x);
    Itr = solve(&x);
    printf("iteration = %2d   ", Itr);
    printf("root = %lf\n", x);
    printf("\n");
    }
    return 0;
} 
