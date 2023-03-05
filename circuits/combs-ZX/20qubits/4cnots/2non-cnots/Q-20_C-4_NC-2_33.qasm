OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[13];
cx q[16], q[8];
cx q[10], q[8];
x q[2];
x q[3];
cx q[4], q[7];
