OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[6];
cx q[3], q[1];
x q[4];
cx q[9], q[8];
