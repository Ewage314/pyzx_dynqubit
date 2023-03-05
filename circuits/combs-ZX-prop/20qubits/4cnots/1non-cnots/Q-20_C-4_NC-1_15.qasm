OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[8];
cx q[10], q[12];
cx q[10], q[6];
cx q[18], q[9];
cx q[19], q[5];
