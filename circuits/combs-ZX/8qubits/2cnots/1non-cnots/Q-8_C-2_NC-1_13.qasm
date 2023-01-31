OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[7], q[3];
z q[3];
cx q[0], q[1];
