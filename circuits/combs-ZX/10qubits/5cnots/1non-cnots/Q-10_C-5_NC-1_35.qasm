OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[1], q[2];
z q[9];
cx q[8], q[0];
cx q[7], q[0];
cx q[0], q[1];
cx q[3], q[0];
