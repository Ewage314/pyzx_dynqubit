OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[1];
cx q[2], q[7];
cx q[5], q[6];
cx q[5], q[7];
cx q[3], q[1];
