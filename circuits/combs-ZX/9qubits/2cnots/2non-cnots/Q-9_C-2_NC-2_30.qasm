OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[5];
z q[8];
z q[4];
cx q[7], q[6];
