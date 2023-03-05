OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[9];
z q[6];
cx q[3], q[11];
cx q[9], q[7];
cx q[8], q[2];
cx q[11], q[2];
