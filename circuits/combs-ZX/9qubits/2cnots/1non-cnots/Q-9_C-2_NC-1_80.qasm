OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[0];
cx q[4], q[0];
cx q[4], q[6];
