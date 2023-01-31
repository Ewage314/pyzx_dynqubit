OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[0], q[5];
cx q[0], q[8];
z q[2];
cx q[0], q[3];
z q[2];
cx q[5], q[0];
