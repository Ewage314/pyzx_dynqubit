OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[3];
cx q[4], q[9];
z q[4];
cx q[2], q[1];
cx q[9], q[3];
cx q[4], q[0];
