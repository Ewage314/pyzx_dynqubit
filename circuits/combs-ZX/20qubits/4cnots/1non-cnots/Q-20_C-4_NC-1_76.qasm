OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[5];
x q[5];
cx q[19], q[6];
cx q[11], q[14];
cx q[17], q[5];
