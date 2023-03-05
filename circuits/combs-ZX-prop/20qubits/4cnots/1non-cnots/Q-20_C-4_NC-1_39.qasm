OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[13];
cx q[19], q[18];
z q[9];
cx q[0], q[18];
cx q[10], q[8];
