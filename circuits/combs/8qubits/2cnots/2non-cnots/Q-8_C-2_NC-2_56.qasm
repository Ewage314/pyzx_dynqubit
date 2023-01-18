OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[3];
cx q[2], q[7];
x q[0];
cx q[0], q[3];
