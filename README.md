[![DOI](https://zenodo.org/badge/61003231.svg)](https://zenodo.org/badge/latestdoi/61003231)

# tlmbht 0.3.0-beta (work in progress)
 TLMBHT - Transmission-line Modeling Method applied to BioHeat Transfer Problems.
  
 Copyright (C) 2015 to 2018 by Cornell University. All Rights Reserved.
  
 Written by Hugo Fernando Maia Milan. Contact: hugofernando@gmail.com

 Support from Brazilian National Counsel of Technological and Scientific Development (Proc. 203312/2014-7) for scholarship to HFMM.
  
 Free for educational, research and non-profit purposes.  Refer to the license file for details.
***

TLMBHT is an open-source solver of partial differential equations in space and time based on the Transmission-Line Modeling (TLM) theory.  Using TLMBHT you can solve:

1. Heat transfer in 1D, 2D, and 3D.

2. Bio-heat transfer in 1D, 2D, and 3D.

3. Diffusion in 1D, 2D, and 3D.

This README file provides instructions in how to obtain the software tlmbht and provides a brief description of tlmbht. If you want to know more about tlmbht and the theory behind it see [the website of this project](https://hugomilan.github.io/tlmbht/).

## Installation
### Option 1: Download

[Download here](https://github.com/hugomilan/tlmbht/releases). You will find binaries for Linux and Windows in 32 bits and 64 bits. However, compiling the code (Option 2) may yields better performance.
    
### Option 2: Compile
In simple terms (supposing you have Eigen library in your include path):
    
    git clone https://github.com/hugomilan/tlmbht.git
    cd tlmbht
    make
    
Then, go to the folder build/ and use the binary output (named tlmbht).

#### A more complete set of instructions to compile the code
        
1. Download this repository. Type in the terminal: `git clone https://github.com/hugomilan/tlmbht.git`. Alternatively, you can use the green button on the right side of this page that says "Clone or download". Remember to extract the zip if you download it as zip.

2. Getting Eigen library. Download it [in this page](http://eigen.tuxfamily.org/index.php?title=Main_Page). Extract the files, open the extracted folder, and copy the folder Eigen (this is the folder inside the extracted folder; it contains the Eigen library's codes) and past it in the include/ folder of this project. Alternatively, you may tell the compiler (using the -I flag) where the Eigen folder is.

3. Compiling the code. It should be as simple as typing `make` on the terminal. Use `make -jn` to compile faster (i.e., for 4 threads, type `make -j4`).

I prepared different makefile configurations. You may try to use the default (only do `make`). This default configuration was prepared for the gcc/g++ compiler. If you have a different compiler, you have to edit the file /nbproject/Makefile-release.mk and include the name (or the full path, if necessary) of your C compiler in the variable CC, your C++ compiler in the variables CCC and CXX, and you can delete the variables FC and AS if necessary.

If you get any problem during the compilation, you may clean (`make clean`) and try other options to compile the code. You might even try `make CONF=no_flags` to disable all the optimization flags. If you have any questions, do not hesitate to contact me.
 
## Description

This is powerful Open-Source scientific code used to solve partial differential equations (pde) using the transmission-line modeling numerical method (TLM; see [Wikipedia](https://en.wikipedia.org/wiki/Transmission-line_matrix_method), [this project's website](https://hugomilan.github.io/tlmbht/), and [references](https://github.com/hugomilan/tlmbht/blob/master/references.md) for more information).

The language is C/C++ and the [Eigen Library](http://www.eigen.tuxfamily.org) is used for matrix calculations. Older versions of the code and some analytical solutions, written in Octave/Matlab, are available in the folder src/octave/.

Binaries/executable files were tested in Ubuntu 16.10 and Windows 10. See Installation, Option 1 for information in how to get the binaries.

Not everything is documented yet. I'm currently working on new approaches in how to use the TLM and will provide more information on the theory in the website when my papers get published. Until then, you can see the [website](https://hugomilan.github.io/tlmbht/), the [references](https://github.com/hugomilan/tlmbht/blob/master/references.md), the [Wikipedia page](https://en.wikipedia.org/wiki/Transmission-line_matrix_method), and/or write me an e-mail if you need help.

I hope you will find this software useful for learning/using the TLM.

You can modify the code and your modifications can be (if you want to) included into this project.

## Usage

This software does not provide a graphical user interface (yet). Everything is controlled via script and the solver is called via terminal. To get start, you may want to go to [Tutorials, examples, and validations](https://hugomilan.github.io/tlmbht/vte/index.html) first. You will need [Octave](https://www.gnu.org/software/octave/) (free) or [Matlab](https://www.mathworks.com/products/matlab.html) (paid) to plot the results and see the comparison with the analytical results.

Refer to the case.tlm file or to the link [How to configure a case file](https://hugomilan.github.io/tlmbht/conf/case-file.html) to see instructions on how to configure the solver.

### Linux 
Run in the terminal `tlmbht`.

### Windows
You will need to open to use the command prompt or PowerShell (which depends on your windows version). Alternatively, you can use [MinGW](http://www.mingw.org/) or [CynGw](http://www.cygwin.com/).

Then, you will run `tlmbht` in the terminal.

[Click here if you need more help to run tlmbht on Windows.](https://hugomilan.github.io/tlmbht/conf/tlmbht-windows.html)

## Other TLM codes

Do you want to know what are the other TLM codes and software available on the internet? I compiled a list of what I found in the file [tlmcode.](https://github.com/hugomilan/tlmbht/blob/master/tlmcode.md)

## [References](https://github.com/hugomilan/tlmbht/blob/master/references.md) and [Acknowledgment](https://github.com/hugomilan/tlmbht/blob/master/acknowledgment.md):

Please, refer to these links provided.

