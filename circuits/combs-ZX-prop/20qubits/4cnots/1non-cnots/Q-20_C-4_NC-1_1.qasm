OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[2];
cx q[0], q[3];
z q[14];
cx q[11], q[12];
cx q[2], q[9];
