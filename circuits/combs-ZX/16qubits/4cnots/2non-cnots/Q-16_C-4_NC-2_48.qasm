OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[7];
cx q[11], q[2];
x q[1];
x q[1];
cx q[5], q[11];
cx q[3], q[0];
