OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[0], q[7];
z q[1];
z q[2];
cx q[6], q[3];
