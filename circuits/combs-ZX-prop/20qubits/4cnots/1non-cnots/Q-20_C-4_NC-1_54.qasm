OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[17];
cx q[4], q[5];
cx q[9], q[7];
x q[9];
cx q[5], q[4];
