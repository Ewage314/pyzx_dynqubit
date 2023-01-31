OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[7];
z q[5];
cx q[6], q[7];
cx q[8], q[3];
z q[1];
cx q[0], q[8];
