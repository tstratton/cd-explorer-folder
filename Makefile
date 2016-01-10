
CSC_DIR=c:/WINDOWS/Microsoft.NET/Framework/v2.0.50727

AX_DIR=c:/programs/dotNet/SDK/v2.0/Bin

EXE_FILENAME=list-explorer-paths.exe

all: run

build: $(EXE_FILENAME)

$(EXE_FILENAME):
	$(CSC_DIR)/csc.exe /r:SHDocVw.dll,AxSHDocVw.dll /out:$(EXE_FILENAME) Program.cs 

lib:
	$(AX_DIR)/AxImp.exe c:/WINDOWS/system32/shdocvw.dll

run: build
	./$(EXE_FILENAME)

clean:
	rm $(EXE_FILENAME)
