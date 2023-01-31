OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[3];
cx q[6], q[1];
cx q[2], q[6];
