OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[5];
z q[3];
cx q[8], q[3];
cx q[13], q[18];
cx q[18], q[6];
