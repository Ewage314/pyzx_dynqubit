OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[4];
cx q[8], q[2];
z q[8];
cx q[0], q[4];
cx q[5], q[1];
cx q[6], q[2];
