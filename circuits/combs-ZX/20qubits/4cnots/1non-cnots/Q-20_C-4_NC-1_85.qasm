OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[15];
z q[2];
cx q[19], q[7];
cx q[19], q[18];
cx q[1], q[17];
