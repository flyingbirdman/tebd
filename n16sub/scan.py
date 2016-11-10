

def scan(LL, NN, U0, Nt0, Nc0):
    for c0 in range(0,Nc0,1):
        c0/= 10.0
        for t0 in range(0,Nt0,1):
            t0/= 10.0
            print "../input_gen/out -L ", LL, " -N ", NN , "-U0 ", U0 ," -t0 ", t0, " -omega0 ", c0

scan(16, 16, 0.0, 16, 16)
scan(16, 16, 1.0, 16, 16)
scan(16, 16, 5.0, 16, 16)

scan(16, 15, 0.0, 16, 16)
scan(16, 15, 1.0, 16, 16)
scan(16, 15, 5.0, 16, 16)
