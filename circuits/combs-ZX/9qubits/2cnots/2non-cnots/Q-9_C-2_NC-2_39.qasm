OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[6];
z q[1];
x q[0];
cx q[3], q[6];
