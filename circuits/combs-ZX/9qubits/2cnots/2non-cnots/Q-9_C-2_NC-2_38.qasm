OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[0];
cx q[6], q[2];
z q[7];
cx q[1], q[4];
