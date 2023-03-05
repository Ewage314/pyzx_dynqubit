OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[1];
cx q[19], q[3];
cx q[15], q[1];
cx q[5], q[4];
cx q[1], q[18];
