OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[13];
cx q[15], q[4];
z q[15];
cx q[4], q[11];
cx q[11], q[0];
cx q[16], q[13];
