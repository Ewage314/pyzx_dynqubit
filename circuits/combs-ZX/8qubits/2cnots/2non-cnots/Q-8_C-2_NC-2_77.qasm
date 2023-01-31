OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[5];
z q[1];
cx q[0], q[7];
cx q[0], q[6];
