OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[2];
cx q[14], q[18];
cx q[18], q[12];
z q[16];
cx q[13], q[5];
