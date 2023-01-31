OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[2];
cx q[4], q[1];
cx q[2], q[7];
cx q[7], q[6];
z q[4];
cx q[6], q[1];
