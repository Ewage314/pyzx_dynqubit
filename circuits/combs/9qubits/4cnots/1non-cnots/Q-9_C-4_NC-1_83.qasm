OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[7];
cx q[8], q[3];
cx q[4], q[5];
x q[1];
cx q[5], q[1];
