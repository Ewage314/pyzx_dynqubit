OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[0], q[2];
z q[8];
cx q[6], q[7];
cx q[7], q[8];
cx q[9], q[7];
