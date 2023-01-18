OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[2], q[0];
x q[5];
cx q[4], q[3];
