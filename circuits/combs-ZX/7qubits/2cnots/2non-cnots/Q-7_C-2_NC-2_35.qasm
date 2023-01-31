OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[6];
cx q[6], q[5];
z q[0];
cx q[1], q[0];
