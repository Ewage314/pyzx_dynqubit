OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[6];
z q[3];
cx q[1], q[3];
