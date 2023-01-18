OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[2], q[0];
x q[3];
x q[3];
cx q[4], q[2];
