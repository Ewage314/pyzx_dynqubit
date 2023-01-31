OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[8];
cx q[1], q[0];
cx q[1], q[3];
