OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[2];
cx q[0], q[4];
z q[4];
cx q[7], q[1];
