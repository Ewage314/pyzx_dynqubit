OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[1], q[3];
cx q[7], q[3];
cx q[7], q[3];
cx q[0], q[9];
z q[9];
cx q[0], q[1];
