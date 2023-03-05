OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[6];
cx q[18], q[3];
cx q[8], q[17];
z q[3];
z q[3];
cx q[15], q[8];
