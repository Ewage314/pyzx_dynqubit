OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[4], q[1];
z q[2];
z q[6];
z q[0];
z q[2];
cx q[1], q[0];
