OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[4];
x q[3];
z q[7];
z q[0];
cx q[5], q[1];
cx q[5], q[7];
