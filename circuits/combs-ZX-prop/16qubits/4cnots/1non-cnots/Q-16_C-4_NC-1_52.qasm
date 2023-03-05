OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[3];
cx q[15], q[3];
z q[11];
cx q[14], q[6];
cx q[8], q[2];
