import pylab, random
from math import *

delta = 0.25

outfile=None
filename=None
    
def getDensity(dirPrefix, outfile, LL, NN_i, UU, dd=0.00, Nc0=16, Nt0=16):
    def getfilename(NN, c0, t0):
        return dirPrefix+'FH_L'+str(LL)+'N'+'%0.0f'%NN+'Chi40U0'+'%0.2f'%UU+'dd'+'%0.2f'%dd+'t0'+'%0.2f'%t0+'c0'+'%0.2f'%c0+'locm.dat'    

    def read(filename):
        dataFile = open(filename, 'r')
        for line in range(0,2):
            dataFile.next()
        density=dataFile.next().strip().split()
        for i in range(len(density)):
            density[i] = float(density[i])
        dataFile.close()
        return density    

    def logdata(outfile, c0, t0):
        print >> outfile, "# (c0, t0, U0, delta)=(", c0, t0, UU, dd, ")"
        d1 = read(getfilename(NN_i, c0, t0))
        d2 = read(getfilename(NN_i-1, c0, t0))
        for i in range(LL):
            print >> outfile, i, d1[i], d2[i]
        
    
    for c0 in [0.0, 0.5, 1.5]:
        t0 = 0
        print "c0, t0=", c0, t0
        logdata(outfile, c0, t0)
        print >> outfile
        print >> outfile

    for t0 in [0.0, 0.5, 0.9]:
        c0 = 0
        print "c0, t0=", c0, t0
        logdata(outfile, c0, t0)
        print >> outfile
        print >> outfile        

delta=0.0
outfile=open("./density/N32U0locn.dat","w")
getDensity('../n32/', outfile, 32, 32, 0.0, delta)
outfile.close()

delta=0.0
outfile=open("./density/N32U1locn.dat","w")
getDensity('../n32/', outfile, 32, 32, 1.0, delta)
outfile.close()
