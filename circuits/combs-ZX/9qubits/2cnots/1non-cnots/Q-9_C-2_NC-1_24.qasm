OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[1];
cx q[2], q[5];
cx q[4], q[7];
