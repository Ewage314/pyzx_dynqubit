OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[12];
x q[11];
cx q[14], q[3];
cx q[9], q[3];
cx q[15], q[0];
