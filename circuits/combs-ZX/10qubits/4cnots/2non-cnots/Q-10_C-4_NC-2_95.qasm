OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[5], q[6];
z q[1];
cx q[2], q[3];
cx q[3], q[2];
z q[0];
cx q[9], q[5];
