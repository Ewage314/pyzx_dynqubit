OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[8];
cx q[6], q[7];
cx q[1], q[8];
