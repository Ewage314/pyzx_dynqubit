OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[10];
cx q[19], q[0];
cx q[4], q[9];
cx q[11], q[0];
