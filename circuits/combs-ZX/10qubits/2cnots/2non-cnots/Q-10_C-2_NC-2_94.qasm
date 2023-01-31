OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[1], q[3];
z q[6];
z q[4];
cx q[6], q[8];
