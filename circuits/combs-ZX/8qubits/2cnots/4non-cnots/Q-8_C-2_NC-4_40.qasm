OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[4], q[6];
x q[3];
z q[7];
z q[6];
x q[4];
cx q[3], q[0];
