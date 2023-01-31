OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];
cx q[4], q[5];
z q[5];
z q[2];
cx q[4], q[3];
