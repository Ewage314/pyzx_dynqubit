OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[2];
cx q[7], q[3];
cx q[3], q[2];
cx q[1], q[7];
cx q[1], q[2];
