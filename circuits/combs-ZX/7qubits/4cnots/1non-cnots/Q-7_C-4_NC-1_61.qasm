OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[1], q[3];
cx q[4], q[6];
x q[1];
cx q[6], q[5];
cx q[0], q[5];
