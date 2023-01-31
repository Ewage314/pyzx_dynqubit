OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[3];
x q[4];
cx q[4], q[7];
cx q[6], q[5];
