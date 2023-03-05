OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[4];
cx q[19], q[1];
z q[0];
cx q[16], q[0];
cx q[12], q[4];
