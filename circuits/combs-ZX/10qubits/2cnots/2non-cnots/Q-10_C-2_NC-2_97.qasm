OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[4], q[5];
z q[6];
z q[7];
cx q[7], q[4];
