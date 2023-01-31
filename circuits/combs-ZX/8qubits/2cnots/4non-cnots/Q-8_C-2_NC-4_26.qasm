OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[3];
cx q[7], q[3];
z q[4];
z q[4];
z q[0];
cx q[1], q[5];
