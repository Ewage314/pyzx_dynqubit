OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[1], q[7];
x q[1];
cx q[6], q[1];
x q[3];
cx q[5], q[3];
cx q[0], q[3];
