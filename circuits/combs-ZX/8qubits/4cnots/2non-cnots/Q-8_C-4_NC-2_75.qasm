OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[0], q[6];
cx q[1], q[7];
cx q[1], q[3];
z q[7];
z q[0];
cx q[0], q[1];
