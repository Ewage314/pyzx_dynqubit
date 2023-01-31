OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[6];
z q[4];
cx q[7], q[1];
cx q[1], q[6];
