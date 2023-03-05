OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[11];
cx q[1], q[7];
x q[0];
cx q[4], q[15];
z q[14];
cx q[15], q[11];
