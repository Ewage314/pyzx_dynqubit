OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[8];
cx q[3], q[1];
z q[11];
cx q[11], q[0];
cx q[6], q[10];
