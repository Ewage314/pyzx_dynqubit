OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[7];
cx q[3], q[8];
z q[6];
cx q[6], q[4];
cx q[8], q[5];
cx q[6], q[3];
