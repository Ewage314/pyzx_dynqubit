OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[0];
z q[1];
cx q[8], q[6];
cx q[1], q[3];
