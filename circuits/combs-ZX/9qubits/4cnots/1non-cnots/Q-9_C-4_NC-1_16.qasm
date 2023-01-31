OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[5], q[8];
z q[0];
cx q[5], q[3];
cx q[5], q[1];
