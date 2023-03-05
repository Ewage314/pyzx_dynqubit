OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[12];
z q[9];
cx q[14], q[11];
cx q[10], q[6];
cx q[2], q[7];
