OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
z q[4];
cx q[1], q[0];
z q[2];
cx q[1], q[3];
