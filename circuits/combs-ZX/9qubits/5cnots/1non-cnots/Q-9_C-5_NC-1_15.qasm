OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[8];
cx q[8], q[7];
z q[2];
cx q[1], q[8];
cx q[7], q[8];
cx q[4], q[1];
