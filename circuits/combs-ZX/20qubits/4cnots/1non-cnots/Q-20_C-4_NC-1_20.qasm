OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[14];
cx q[0], q[16];
cx q[7], q[10];
x q[13];
cx q[19], q[7];
