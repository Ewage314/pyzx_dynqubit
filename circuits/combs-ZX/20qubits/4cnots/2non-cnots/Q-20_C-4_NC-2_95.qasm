OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[6];
cx q[10], q[14];
z q[2];
cx q[10], q[7];
cx q[0], q[13];
cx q[1], q[11];
