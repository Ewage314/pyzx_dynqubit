OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[16];
cx q[15], q[3];
z q[12];
cx q[9], q[5];
cx q[18], q[2];
