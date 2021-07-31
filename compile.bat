@rem setupt windows var
call vcvars64.bat

@echo %1 --machine 64 or 32
@echo %2  -G 

set machine_num=%1%
set debug_opt=%2%

if "%machine_num%" == "" set machine_num=64

@echo Execute NVCC...

@echo nvcc -Xcompiler "/wd 4819" -I"./" -use_fast_math -ftz=true -prec-div=false -prec-sqrt=false -arch=compute_53 -O3 --machine %machine_num% %debug_opt% -ptx -o clguetzli.cu.ptx%machine_num%  clguetzli\clguetzli.cu
nvcc -Xcompiler "/wd 4819" -I"./" -use_fast_math -ftz=true -prec-div=false -prec-sqrt=false -arch=compute_53 -O3 --machine %machine_num% %debug_opt% -ptx -o clguetzli.cu.ptx%machine_num%  clguetzli\clguetzli.cu
