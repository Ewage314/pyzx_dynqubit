OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[4];
z q[9];
z q[5];
cx q[19], q[11];
cx q[4], q[13];
cx q[18], q[2];
