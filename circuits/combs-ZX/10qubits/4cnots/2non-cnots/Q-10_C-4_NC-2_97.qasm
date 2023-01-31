OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[6], q[9];
cx q[5], q[6];
z q[0];
z q[4];
cx q[1], q[7];
cx q[8], q[6];
