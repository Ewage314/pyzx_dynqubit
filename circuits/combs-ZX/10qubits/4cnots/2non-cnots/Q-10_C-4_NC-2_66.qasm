OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[9], q[0];
cx q[1], q[3];
z q[7];
z q[7];
cx q[3], q[6];
cx q[8], q[0];
