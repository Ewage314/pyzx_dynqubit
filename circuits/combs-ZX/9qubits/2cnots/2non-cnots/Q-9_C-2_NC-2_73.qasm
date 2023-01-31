OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[7];
cx q[6], q[3];
z q[8];
cx q[7], q[3];
