OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[8];
cx q[0], q[7];
cx q[4], q[6];
