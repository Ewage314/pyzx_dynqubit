OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[7];
z q[6];
cx q[8], q[7];
cx q[6], q[4];
