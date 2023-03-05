OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[6];
cx q[6], q[18];
cx q[19], q[2];
cx q[18], q[8];
z q[6];
cx q[11], q[9];
