OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[15], q[14];
cx q[14], q[2];
cx q[9], q[1];
x q[3];
cx q[10], q[11];
