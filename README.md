# cd-explorer-folder
simple cygwin command line utility to list / change to the folder of an open file explorer window.

### Setup:

You need `AxImp.exe` from Microsoft to generate `SHDocVw.dll` and `AxSHDocVw.dll` from `shdocvw.dll`

- modify `CSC_DIR` and `AX_DIR` values in the Makefile as necessary
- run `make lib` to generate the dlls
- run `make build` to generate the exe file
- copy the dll files, the exe file, and the shell script to a folder such as `~/bin/`
- source the `define_cdx.sh` shell script in your `.bashrc` or copy the function into your `.bashrc`

### Running:

- enter `cdx` to list open folders
- enter `cdx x` to go to folder at x (x being a number in the output from cdx)
