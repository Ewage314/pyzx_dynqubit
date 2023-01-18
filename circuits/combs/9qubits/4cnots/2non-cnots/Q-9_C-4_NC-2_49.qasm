OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[3], q[0];
cx q[6], q[8];
x q[6];
x q[0];
cx q[6], q[2];
