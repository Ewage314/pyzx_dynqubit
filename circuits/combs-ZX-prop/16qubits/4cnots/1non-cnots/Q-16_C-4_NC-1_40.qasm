OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[7];
z q[15];
cx q[3], q[6];
cx q[12], q[11];
cx q[11], q[15];
