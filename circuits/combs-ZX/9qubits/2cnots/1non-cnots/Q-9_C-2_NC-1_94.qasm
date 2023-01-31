OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[4];
cx q[8], q[2];
cx q[7], q[8];
