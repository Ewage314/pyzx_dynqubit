OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[7];
cx q[3], q[8];
cx q[6], q[7];
cx q[3], q[4];
cx q[6], q[4];
cx q[5], q[8];
