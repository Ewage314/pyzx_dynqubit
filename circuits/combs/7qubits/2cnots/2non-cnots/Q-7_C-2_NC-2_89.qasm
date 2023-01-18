OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[6];
x q[3];
cx q[5], q[3];
cx q[2], q[1];
