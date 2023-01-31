OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[0];
z q[7];
x q[4];
cx q[7], q[0];
z q[3];
cx q[6], q[8];
