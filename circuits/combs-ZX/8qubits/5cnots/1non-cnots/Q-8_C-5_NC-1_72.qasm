OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[2], q[1];
cx q[4], q[0];
cx q[1], q[7];
z q[0];
cx q[6], q[1];
cx q[0], q[3];
