OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[1];
cx q[11], q[1];
cx q[8], q[4];
cx q[19], q[16];
z q[18];
cx q[7], q[8];
