OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[14];
cx q[12], q[13];
x q[1];
cx q[10], q[15];
cx q[12], q[11];
cx q[1], q[15];
