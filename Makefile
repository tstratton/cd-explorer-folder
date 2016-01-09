
CSC_DIR=c:/WINDOWS/Microsoft.NET/Framework/v2.0.50727

AX_DIR=c:/programs/dotNet/SDK/v2.0/Bin

EXE_FILENAME=list-explorer-folders.exe

all: run

build:
	$(CSC_DIR)/csc.exe /r:SHDocVw.dll,AxSHDocVw.dll  /out:$(EXE_FILENAME) Program.cs 

lib:
	$(AX_DIR)/AxImp.exe c:/WINDOWS/system32/shdocvw.dll

run:
	./$(EXE_FILENAME)
