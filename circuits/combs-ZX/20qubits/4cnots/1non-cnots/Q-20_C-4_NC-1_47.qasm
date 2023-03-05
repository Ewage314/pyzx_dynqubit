OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[0];
cx q[15], q[0];
cx q[10], q[11];
cx q[18], q[10];
cx q[19], q[15];
