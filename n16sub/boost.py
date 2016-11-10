def readFile(fileName):
    dataFile = open(fileName, 'r')
    nameList = []
    
    for line in dataFile:
        if "ent" in line:
            nameList.append(line[0:-1])
    dataFile.close()
    return nameList

fileNameList = readFile('cur.txt')

def getFileName(LL, NN, U0, c0, t0):
    return 'FH_L'+str(LL)+'N'+'%0.0f'%NN+'Chi40U0'+'%0.2f'%U0+'dd0.00t0'+'%0.2f'%t0+'c0'+'%0.2f'%c0+'ent.dat'

def genInput(LL, NN, U0, c0, t0):
    print "../input_gen/out -L "+ str(LL)+ " -N "+str(NN)+ " -U0 "+ str(U0) + " -t0 "+ str(t0)+ " -omega0 "+ str(c0)

def genBoostInput(LL, NN, U0, c0, t0):
    fileName = getFileName(LL, NN, U0, c0, t0)
    if fileName not in fileNameList:
        genInput(LL, NN, U0, c0, t0)

def scanboost(LL, NN, U0, Nt0=16, Nc0=16):
    for c0 in range(0,Nc0,1):
        c0/= 10.0
        for t0 in range(0,Nt0,1):
            t0/= 10.0
            genBoostInput(LL, NN, U0, c0, t0)

def loopboost(LL, NN, U0, Nt0=16, Nc0=16):
    for c0 in range(0,Nc0,1):
        c0 , t0 = c0/10.0, 0.0
        genBoostInput(LL, NN, U0, c0, t0)

    for t0 in range(0,Nc0,1):
        c0, t0 = 1.5, t0/10.0
        genBoostInput(LL, NN, U0, c0, t0)

    for t0 in range(Nc0-1,-1,-1):
        c0, t0 = t0/10.0, t0/10.0
        genBoostInput(LL, NN, U0, c0, t0)

    for t0 in range(0, Nc0, 1):
        c0, t0 = 0.0, t0/10.0
        genBoostInput(LL, NN, U0, c0, t0)

    for c0 in range(0,Nc0,1):
        c0 , t0 = c0/10.0, 1.5
        genBoostInput(LL, NN, U0, c0, t0)

loopboost(16, 15, 0.0)
loopboost(16, 15, 1.0)
loopboost(16, 15, 5.0)

def boostInput(fileName):
    dataFile = open(fileName, 'r')
    nameList = []
    
    for line in dataFile:
        nameList.append(line[0:-1])
    dataFile.close()
    return nameList

boostFileList = None
def genBoostQsub(LL,NN,thread=10):
    for i in range(0,thread):
        outfile=open("./n"+str(NN)+"boost_"+str(1+i)+".qsub","w")
        for j in range(0, len(boostFileList)/thread+1):
            if j*thread+i < len(boostFileList):
                print >> outfile, "./Execute_ITP -f ./n"+str(LL)+"sub/"+boostFileList[j*thread+i]
        outfile.close()

boostFileList = boostInput('./n16in.txt')
print len(boostFileList)
genBoostQsub(16,15)
