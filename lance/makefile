SRC=main.asm
PRG=$(SRC:.asm=.tos)
LST=$(SRC:.asm=.lst)
.PHONY:	all
all:	$(SRC) 
	vasmm68k_mot $(SRC) -Ftos -nosym -o $(PRG) -I ~/Seafile/work/atariwork/include
#	vasm $(SRC) -no-opt -nosym -Ftos -o $(PRG) -I ~/Seafile/work/atariwork/include

.PHONY:	final
final:
	upx --best --nrv2e --small --small $(PRG) 

.PHONY:	run
run:	
	hatari $(PRG)

.PHONY:	send
send:	
	#-upx -3 --nrv2e --small --small $(PRG)
	-parrun $(PRG)

.PHONY:	backup
backup:
	find . -maxdepth 1 -type f ! -name \*.mod -print0 | tar cfz `date +old/v%Y%m%d%H%M.tar.gz` --null -T -
