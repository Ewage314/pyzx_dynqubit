OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
z q[5];
cx q[6], q[5];
cx q[7], q[3];
