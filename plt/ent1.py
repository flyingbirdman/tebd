import pylab, random
from math import *

delta = 0.25

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
def getLoopEntanglementSpectrum(dirPrefix, outfile, LL, NN, UU, dd=0.00, Nc0=16, Nt0=11):
    bar=0.5
    def getcurlen(pc0, pt0, c0, t0):
        return ((c0-pc0)**2+(t0-pt0)**2)**0.5
    
    def getfilename(c0, t0):
        return dirPrefix+'FH_L'+str(LL)+'N'+'%0.0f'%NN+'Chi40U0'+'%0.2f'%UU+'dd'+'%0.2f'%dd+'t0'+'%0.2f'%t0+'c0'+'%0.2f'%c0+'ent.dat'
    
    def getFiniteEntanglementSpectrum(filename, curlen, c0, t0):
        ES=getEntanglementSpectrum(filename)
        ES=ES[0:8]
        print >> outfile, c0, t0, curlen-0.5*bar, curlen+0.5*bar,
        for i in range(len(ES)):
            if abs(ES[i]) < 0.0000001:
                ES[i] = 1000
            else:
                ES[i] = -2.0 * log(ES[i])
        stk = []
        for i in range(0,8):
            if len(stk)==0:
                stk.append(ES[i])
            else:
                if abs(stk[0]-ES[i]) < 0.2:
                    stk.append(ES[i]) 
                else:
                    nstk=len(stk)
                    if nstk==1:
                        print >> outfile, curlen, stk[0],
                    elif nstk==2:
                        print >> outfile, curlen-0.167*bar, stk[0], curlen+0.167*bar, stk[1],
                    elif nstk==3:
                        print >> outfile, curlen-0.333*bar, stk[0], curlen, stk[1], curlen+0.333*bar, stk[2],
                    elif nstk==4:
                        print >> outfile, curlen-0.5*bar, stk[0], curlen-0.5*bar+0.333*bar, stk[1], curlen-0.5*bar+0.666*bar, stk[2], curlen-0.5*bar+bar, stk[3],
                        # for j in range(nstk):
                        #     print >> outfile, curlen-0.5*bar+(j)*bar/(nstk), stk[j], 
                    stk = [ES[i]]
        nstk=len(stk)
        if nstk==1:
            print >> outfile, curlen, stk[0],
        elif nstk==2:
            print >> outfile, curlen-0.167*bar, stk[0], curlen+0.167*bar, stk[1],
        elif nstk==3:
            print >> outfile, curlen-0.333*bar, stk[0], curlen, stk[1], curlen+0.333*bar, stk[2],
        elif nstk==4:
            print >> outfile, curlen-0.5*bar, stk[0], curlen-0.5*bar+0.333*bar, stk[1], curlen-0.5*bar+0.666*bar, stk[2], curlen-0.5*bar+bar, stk[3],
        print >> outfile

    curlen, pc0, pt0 = 0, 0, 0
    def logdata(curlen, c0, t0, pc0, pt0):
        curlen += 0.75
        filename = getfilename(c0, t0)
        getFiniteEntanglementSpectrum(filename, curlen, c0, t0)
        return curlen, c0, t0

    for c0 in [0.0, 0.5, 1.5]:
        t0=0.0
        curlen, pc0, pt0 = logdata(curlen, c0, t0, pc0, pt0)
    print >> outfile     

    curlen += 0.25
    pc0, pt0 = 0, 0
    for t0 in [0.0, 0.9]:
        c0 = 0.0
        curlen, pc0, pt0 = logdata(curlen, c0, t0, pc0, pt0)
    print >> outfile
    
    curlen += 0.25
    pc0, pt0 = 0, 0
    for c0, t0 in [(0.0,0.0), (0.5,0.5), (1.5,0.5)]:
        curlen, pc0, pt0 = logdata(curlen, c0, t0, pc0, pt0)    
    print >> outfile   

delta = 0.25
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

delta=0.0
outfile=open("./ent/L32N32U00dd0.00ent.dat","w")
print >> outfile, "# (LL, NN, U) = (32, 32, 0.0)"
getLoopEntanglementSpectrum('../n32/', outfile, 32, 32, 0.0, delta)
outfile.close()

outfile=open("./ent/L32N32U01dd0.00ent.dat","w")
print >> outfile, "# (LL, NN, U) = (32, 32, 1.0)"
getLoopEntanglementSpectrum('../n32/', outfile, 32, 32, 1.0, delta)
outfile.close()

outfile=open("./ent/L32N32U05dd0.00ent.dat","w")
print >> outfile, "# (LL, NN, U) = (32, 32, 5.0)"
getLoopEntanglementSpectrum('../n32/', outfile, 32, 32, 5.0, delta)
outfile.close()
