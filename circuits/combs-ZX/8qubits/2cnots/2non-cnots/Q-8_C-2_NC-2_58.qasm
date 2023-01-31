OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[0];
cx q[7], q[1];
z q[3];
cx q[2], q[7];
