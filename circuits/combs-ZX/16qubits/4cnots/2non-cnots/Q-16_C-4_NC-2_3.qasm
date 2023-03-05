OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[15];
cx q[10], q[1];
z q[14];
cx q[10], q[3];
z q[9];
cx q[6], q[2];
