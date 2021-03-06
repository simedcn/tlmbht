// This file is part of TLMBHT.
// Copyright (C) 2016 Hugo Fernando Maia Milan
// 
// Acknowledgment: Brazilian National Counsel of Technological and Scientific
// Development (Proc. 203312/2014-7) for scholarship to HFMM
//
// Gmsh project created on Wed Feb 21 17:04:49 2017

// points at z = 0
Point(1) = {0, 0, 0, 0.1};
Point(2) = {0.75, 0, 0, 0.1};
Point(3) = {0, 1, 0, 0.1};
Point(4) = {0.75, 1, 0, 0.1};

// points at z = 0.375
Point(5) = {0, 0, 0.375, 0.1};
Point(6) = {0.75, 0, 0.375, 0.1};
Point(7) = {0, 1, 0.375, 0.1};
Point(8) = {0.75, 1, 0.375, 0.1};

// lines at z = 0
Line(1) = {1, 2};
Line(2) = {4, 2};
Line(3) = {4, 3};
Line(4) = {3, 1};

// lines at z = 0.375
Line(5) = {5, 6};
Line(6) = {8, 6};
Line(7) = {8, 7};
Line(8) = {7, 5};

// lines connection z = 0 and z = 0.375
Line(9) = {1, 5};
Line(10) = {2, 6};
Line(11) = {3, 7};
Line(12) = {4, 8};

// plane at z = 0
Line Loop(13) = {3, 4, 1, -2};
Plane Surface(14) = {13};
Physical Surface(15) = {14};

// plane at z = 0.375
Line Loop(16) = {7, 8, 5, -6};
Plane Surface(17) = {16};
Physical Surface(18) = {17};

// plane at x = 0
Line Loop(19) = {-4, 11, 8, -9};
Plane Surface(20) = {19};
Physical Surface(21) = {20};

// plane at x = 0.75
Line Loop(22) = {-2, 12, 6, -10};
Plane Surface(23) = {22};
Physical Surface(24) = {23};

// plane at y = 0
Line Loop(25) = {1, 10, -5, -9};
Plane Surface(26) = {25};
Physical Surface(27) = {26};

// plane at y = 1
Line Loop(28) = {-3, 12, 7, -11};
Plane Surface(29) = {28};
Physical Surface(30) = {29};

// Volume
Surface Loop(31) = {20, 14, 29, 23, 17, 26};
Volume(32) = {31};
Physical Volume(33) = {32};

// Defining that we want hexahedrons
// in x
Transfinite Line{7,3,-5,-1} = 15 Using Progression 1.1;
// in y
Transfinite Line{6,2,8,4} = 20 Using Progression 1.1;
// in z
Transfinite Line{-10,-12,-11,-9} = 10 Using Progression 1.1;
Transfinite Surface "*";
Transfinite Volume "*";
Recombine Surface "*";
// Apply an elliptic smoother to the grid
Mesh.Smoothing = 1000;
