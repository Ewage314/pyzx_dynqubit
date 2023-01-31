OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[4];
x q[6];
x q[3];
cx q[0], q[7];
z q[3];
cx q[7], q[0];
