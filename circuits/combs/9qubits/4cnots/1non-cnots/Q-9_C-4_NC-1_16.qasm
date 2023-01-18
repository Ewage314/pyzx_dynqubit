OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[1];
cx q[7], q[0];
cx q[8], q[0];
x q[5];
cx q[0], q[8];
