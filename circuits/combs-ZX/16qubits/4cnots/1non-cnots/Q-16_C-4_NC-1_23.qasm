OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[0];
x q[5];
cx q[13], q[14];
cx q[15], q[11];
cx q[14], q[5];
