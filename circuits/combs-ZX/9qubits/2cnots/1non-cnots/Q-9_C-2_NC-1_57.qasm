OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[2];
z q[0];
cx q[5], q[8];
