OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[4];
x q[7];
z q[6];
z q[6];
cx q[5], q[4];
cx q[3], q[1];
