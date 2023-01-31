OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[6];
x q[6];
z q[3];
z q[4];
cx q[7], q[1];
cx q[4], q[7];
