OPENQASM 2.0;
include "qelib1.inc";
qreg q[4];
cx q[0], q[2];
z q[0];
cx q[0], q[3];
