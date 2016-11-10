import pylab, random
from math import *

def getEntanglementSpectrum(fileName):
    dataFile = open(fileName, 'r')
    entanglementSpectrum=[]
    for line in range(0,9):
        dataFile.next()
    for line in range(0,40):
        entanglementSpectrum.append(float(dataFile.next()))
    dataFile.close()
    return entanglementSpectrum

def getDegenerateNumber(entanglementSpectrum):
    eps=0.01
    if(abs(entanglementSpectrum[3]-entanglementSpectrum[0])<eps):
        return 4
    elif(abs(entanglementSpectrum[1]-entanglementSpectrum[0])<eps):
        return 2
    else:
        return 1
        

# ent1=getEntanglementSpectrum('FH_L36N35Chi40U01.00dd0.00t00.10c00.30ent.dat')
# print getDegenerateNumber(ent1)
# ent2=getEntanglementSpectrum('FH_L36N36Chi40U00.20dd0.00t00.10c00.10ent.dat')
# print getDegenerateNumber(ent2)

outfile=None
def getDegenerateNumberMesh(dirPrefix, LL, NN, UU, dd=0.00):
    for i in range(0,16):
        c0=i/10.0
        for j in range(0,16):
            t0 = j/10.0
            mesh = []
            filename=dirPrefix+'FH_L'+str(LL)+'N'+'%0.0f'%NN+'Chi40U0'+'%0.2f'%UU+'dd'+'%0.2f'%dd+'t0'+'%0.2f'%t0+'c0'+'%0.2f'%c0+'ent.dat'
            print >> outfile, c0, t0, getDegenerateNumber(getEntanglementSpectrum(filename))
        print >> outfile


# outfile=open("./ent/n16_degent.dat","w")
# print >> outfile, "#(LL,NN,U)=(16,16,0.0)"
# getDegenerateNumberMesh('../n16/', 16, 16, 0.0)
# print >> outfile
# print >> outfile, "#(LL,NN,U)=(16,16,1.0)"
# getDegenerateNumberMesh('../n16/', 16, 16, 1.0)
# print >> outfile
# print >> outfile, "#(LL,NN,U)=(16,16,5.0)"
# getDegenerateNumberMesh('../n16/', 16, 16, 5.0)
# print >> outfile
# outfile.close()

delta = 0.25
# outfile=open("./ent/n32_degent.dat","w")
# print >> outfile, "#(LL,NN,U)=(32,32,0.0)"
# getDegenerateNumberMesh('../n32/', 32, 32, 0.0, delta)
# print >> outfile
# print >> outfile, "#(LL,NN,U)=(32,32,1.0)"
# getDegenerateNumberMesh('../n32/', 32, 32, 1.0, delta)
# print >> outfile
# print >> outfile, "#(LL,NN,U)=(32,32,5.0)"
# getDegenerateNumberMesh('../n32/', 32, 32, 5.0, delta)
# print >> outfile
# outfile.close()

outfile=None
filename=None
def getLoopEntanglementSpectrum(dirPrefix, outfile, LL, NN, UU, dd=0.00, Nc0=16, Nt0=16):
    def getcurlen(pc0, pt0, c0, t0):
        return ((c0-pc0)**2+(t0-pt0)**2)**0.5
    
    def getfilename(c0, t0):
        return dirPrefix+'FH_L'+str(LL)+'N'+'%0.0f'%NN+'Chi40U0'+'%0.2f'%UU+'dd'+'%0.2f'%dd+'t0'+'%0.2f'%t0+'c0'+'%0.2f'%c0+'ent.dat'
    
    def getFiniteEntanglementSpectrum(filename, curlen, c0, t0):
        ES=getEntanglementSpectrum(filename)
        ES=ES[0:8]
        print >> outfile, curlen, c0, t0,
        for i in range(0,8):
            print >> outfile, ES[i],
        print >> outfile

    curlen, pc0, pt0 = 0, 0, 0
    def logdata(curlen, c0, t0, pc0, pt0):
        curlen += getcurlen(pc0, pt0, c0, t0)
        filename = getfilename(c0, t0)
        getFiniteEntanglementSpectrum(filename, curlen, c0, t0)
        return curlen, c0, t0

    for c0 in range(0,Nc0,1):
        c0, t0 = c0/10.0, 0
        curlen, pc0, pt0 = logdata(curlen, c0, t0, pc0, pt0)
    print >> outfile

    for t0 in range(0,Nt0,1):
        c0, t0= 1.5, t0/10.0
        curlen, pc0, pt0 = logdata(curlen, c0, t0, pc0, pt0)    
    print >> outfile        

    for t0 in range(Nt0-1,-1,-1):
        c0, t0 = t0/10.0, t0/10.0
        curlen, pc0, pt0 = logdata(curlen, c0, t0, pc0, pt0)    
    print >> outfile        

    for t0 in range(0,Nt0,1):
        c0, t0 = 0.0, t0/10.0
        curlen, pc0, pt0 = logdata(curlen, c0, t0, pc0, pt0)
    print >> outfile        

    for c0 in range(0,Nc0,1):
        c0, t0 = c0/10.0, 1.5
        curlen, pc0, pt0 = logdata(curlen, c0, t0, pc0, pt0)
    print >> outfile

# outfile=open("./ent/L16N15U00ent.dat","w")
# print >> outfile, "# (LL, NN, U) = (16, 15, 0.0)"
# getLoopEntanglementSpectrum('../n16/', outfile, 16, 15, 0.0)
# outfile.close()

# outfile=open("./ent/L16N15U01ent.dat","w")
# print >> outfile, "# (LL, NN, U) = (16, 15, 1.0)"
# getLoopEntanglementSpectrum('../n16/', outfile, 16, 15, 1.0)
# outfile.close()

# outfile=open("./ent/L16N15U05ent.dat","w")
# print >> outfile, "# (LL, NN, U) = (16, 15, 5.0)"
# getLoopEntanglementSpectrum('../n16/', outfile, 16, 15, 5.0)
# outfile.close()


# outfile=open("./ent/L16N16U00ent.dat","w")
# print >> outfile, "# (LL, NN, U) = (16, 16, 0.0)"
# getLoopEntanglementSpectrum('../n16/', outfile, 16, 16, 0.0)
# outfile.close()

# outfile=open("./ent/L16N16U01ent.dat","w")
# print >> outfile, "# (LL, NN, U) = (16, 16, 1.0)"
# getLoopEntanglementSpectrum('../n16/', outfile, 16, 16, 1.0)
# outfile.close()

# outfile=open("./ent/L16N16U05ent.dat","w")
# print >> outfile, "# (LL, NN, U) = (16, 16, 5.0)"
# getLoopEntanglementSpectrum('../n16/', outfile, 16, 16, 5.0)
# outfile.close()

# outfile=open("./ent/L32N31U00ent.dat","w")
# print >> outfile, "# (LL, NN, U) = (32, 31, 0.0)"
# getLoopEntanglementSpectrum('../n32/', outfile, 32, 31, 0.0)
# outfile.close()

# outfile=open("./ent/L32N31U01ent.dat","w")
# print >> outfile, "# (LL, NN, U) = (32, 31, 1.0)"
# getLoopEntanglementSpectrum('../n32/', outfile, 32, 31, 1.0)
# outfile.close()

# outfile=open("./ent/L32N31U05ent.dat","w")
# print >> outfile, "# (LL, NN, U) = (32, 31, 5.0)"
# getLoopEntanglementSpectrum('../n32/', outfile, 32, 31, 5.0)
# outfile.close()

outfile=open("./ent/L32N32U00dd0.25ent.dat","w")
print >> outfile, "# (LL, NN, U) = (32, 32, 0.0)"
getLoopEntanglementSpectrum('../n32/', outfile, 32, 32, 0.0, delta)
outfile.close()

outfile=open("./ent/L32N32U01dd0.25ent.dat","w")
print >> outfile, "# (LL, NN, U) = (32, 32, 1.0)"
getLoopEntanglementSpectrum('../n32/', outfile, 32, 32, 1.0, delta)
outfile.close()

outfile=open("./ent/L32N32U05dd0.25ent.dat","w")
print >> outfile, "# (LL, NN, U) = (32, 32, 5.0)"
getLoopEntanglementSpectrum('../n32/', outfile, 32, 32, 5.0, delta)
outfile.close()

# outfile=open("./ent/L64N64U00ent.dat","w")
# print >> outfile, "# (LL, NN, U) = (64, 64, 0.0)"
# getLoopEntanglementSpectrum('../n64/', outfile, 64, 64, 0.0)
# outfile.close()

# outfile=open("./ent/L64N64U01ent.dat","w")
# print >> outfile, "# (LL, NN, U) = (64, 64, 1.0)"
# getLoopEntanglementSpectrum('../n64/', outfile, 64, 64, 1.0)
# outfile.close()

# outfile=open("./ent/L64N64U05ent.dat","w")
# print >> outfile, "# (LL, NN, U) = (64, 64, 5.0)"
# getLoopEntanglementSpectrum('../n64/', outfile, 64, 64, 5.0)
# outfile.close()


