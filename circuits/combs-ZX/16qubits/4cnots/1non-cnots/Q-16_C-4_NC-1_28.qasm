OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[3];
z q[7];
cx q[12], q[3];
cx q[9], q[8];
cx q[15], q[12];
