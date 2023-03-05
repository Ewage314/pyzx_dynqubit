OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[14];
z q[7];
cx q[7], q[3];
cx q[6], q[11];
x q[6];
cx q[0], q[8];
