OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
x q[4];
z q[4];
cx q[0], q[5];
cx q[6], q[1];
