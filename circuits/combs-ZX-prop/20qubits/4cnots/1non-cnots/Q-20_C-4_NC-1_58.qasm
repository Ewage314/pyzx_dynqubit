OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[0], q[17];
cx q[14], q[6];
cx q[17], q[4];
z q[1];
cx q[8], q[10];
