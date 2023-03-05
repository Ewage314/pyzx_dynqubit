OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[3];
cx q[14], q[0];
x q[3];
cx q[15], q[0];
cx q[14], q[1];
