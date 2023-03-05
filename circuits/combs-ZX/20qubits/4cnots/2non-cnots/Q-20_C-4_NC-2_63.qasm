OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[2];
cx q[10], q[15];
x q[3];
cx q[10], q[6];
cx q[13], q[17];
cx q[12], q[4];
