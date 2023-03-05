OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[10];
cx q[9], q[17];
cx q[14], q[18];
z q[2];
cx q[13], q[18];
