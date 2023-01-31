OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[3];
z q[5];
cx q[1], q[8];
