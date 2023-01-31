OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[1];
z q[1];
z q[6];
cx q[6], q[4];
x q[3];
cx q[5], q[6];
