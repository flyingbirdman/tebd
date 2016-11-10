
set terminal x11
set pm3d  
#set pm3d map
#set palette model RGB defined ( 0.0 'blue', 1.0 'white', 2.0 'red' )
#unset ztics 
#unset key
#set size square


	row=2+1
	file = '../n36/FH_L36N35Chi40U00.20dd0.00t00.00c00.00corf.dat'

	splot file ind row matrix w lp

pause -1