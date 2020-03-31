import numpy as np
from numpy import array
import scipy.optimize
import matplotlib
import matplotlib.pyplot as plt
import sympy
from sympy import Symbol


class Zfun:
    def __init__(self):
        """initial parameters"""
        self.x = sympy.symbols('x')
        self.Fu = self.x * self.x * self.x + 1.0

    def fa(self):
        """return the function"""
        return self.Fu

    def IntF(self):
        """return the integral"""
        return sympy.integrate(self.Fu, self.x)

    def DifF(self):
        """return the differential equation of fctn"""
        return sympy.diff(self.Fu, self.x)

    def PltF2(self, x):
        """Matlab-like plot of fctn"""
        self.va = x
        self.vb = self.va * self.va
        fig, ax = plt.subplots()
        ax.plot(self.va, self.vb)

        ax.set(xlabel='time (s)', ylabel='Amplitude',
               title='Your Plot Title')
        ax.grid()

        fig.savefig("test.png")
        plt.show()


    def PltF(self, a, b, deltF):
        """
        run the Newton Iteration for finding roots
        of the polynomial s.t. for convergence to the
        zeros of the polynomial, the value x_n yields
        f(x_n) = 0. We succeed in convergence if f(x_n) is
        sufficiently close to the solution
        (e.g. x_n - x_(n-1) < eps). The value eps
        is a user defined small value defining solution
        closeness. The method sets self.success to 'True'
        if the closeness measure is met. Otherwise
        self.success is 'False'
        """
        self.va = a
        self.vb = b
        self.deltF = deltF
        N=round((self.vb-self.va)/self.deltF)
        xval = np.linspace(self.va, self.vb, N)
        self.y = np.zeros(len(xval), dtype=np.float)

        for NL in list(range(len(xval))):
            y0 = self.Fu.subs(self.x, xval[NL])
            print(f"IterationA {NL}")
            self.y[NL] = y0
            print(f"IterationB {NL}, Y0={y0}")



        fig, ax = plt.subplots()
        ax.plot(xval, self.y)

        ax.set(xlabel='time (s)', ylabel='Amplitude',
               title='Your Plot Title')
        ax.grid()

        fig.savefig("swp2.png")
        plt.show()


class NewtMeth(Zfun):

    def __init__(self):
        """
        Initialize attributes of the parent class.
        Then initialize attributes specific to the Zfun class.
        """
        super().__init__()

    def ZNewtCalc(self, x0, NumIt, epsval):
        sumv = complex(0.0, 0.0)


        xn = complex(x0.real, x0.imag)
        self.success = 'False'
        ff=self.Fu
        fprime = NewtMeth().DifF()

        for x in range(NumIt):
            sumv = sumv - (ff.subs(self.x, xn)).evalf()/(fprime.subs(self.x,xn)).evalf()
            sumv = sumv.evalf()

            xold = xn
            xn =sumv
            if abs(xn-xold) < epsval:
                self.success = 'True'

        return xn



a0 = -2
b0 =  2
ca = complex(a0, a0)
cb = complex(b0, b0)

Q2 = NewtMeth()
Q2.PltF(-2 , 2 , 0.1)
startpt = 'C'
if startpt == 'A':
    aaa= Q2.ZNewtCalc(0.1, 3, 0.00000000001)
elif startpt == 'B':
    aaa= Q2.ZNewtCalc(4, 4, 0.0001)
elif startpt == 'C':
    aaa= Q2.ZNewtCalc(ca, 7, 0.01)

print(aaa)
print(Q2.success)
if Q2.success == 'True':
    print(f"The root calculator convergence to {aaa} was a success!!")
elif Q2.success == 'False':
    print(f"No Way man: the root calculator convergence to {aaa} is innacurate")

#help('SWEngP3NewB')