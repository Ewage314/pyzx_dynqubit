OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[3];
x q[0];
cx q[0], q[7];
cx q[0], q[7];
