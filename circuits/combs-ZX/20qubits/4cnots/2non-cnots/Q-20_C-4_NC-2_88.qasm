OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[8];
z q[17];
cx q[15], q[8];
cx q[10], q[3];
cx q[15], q[3];
cx q[4], q[15];
